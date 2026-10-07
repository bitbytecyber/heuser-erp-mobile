import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart' hide Timeout, fail;
import 'package:heuser_erp_mobile/core/connectivity/connectivity_service.dart';
import 'package:heuser_erp_mobile/core/geo/country_order.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/core/network/safe_call.dart';
import 'package:heuser_erp_mobile/core/storage/json_file_cache.dart';
import 'package:heuser_erp_mobile/features/me/domain/abilities.dart';

void main() {
  group('safeCall', () {
    test('wraps values, Dio errors, failures and parse errors', () async {
      expect((await safeCall(() async => 1)).valueOrNull, 1);

      final opts = RequestOptions(path: '/x/');
      final dio = await safeCall<int>(
        () => throw DioException(
          requestOptions: opts,
          response: Response(requestOptions: opts, statusCode: 404),
          type: DioExceptionType.badResponse,
        ),
      );
      expect(dio.failureOrNull, isA<NotFound>());

      final failure = await safeCall<int>(
        // A repository may throw a Failure; safeCall must pass it through.
        // ignore: only_throw_errors
        () => throw const Failure.rateLimited(),
      );
      expect(failure.failureOrNull, isA<RateLimited>());

      final parse = await safeCall<int>(() => throw const FormatException());
      expect(parse.failureOrNull, isA<Unknown>());
    });

    test('Result helpers', () async {
      final r = ok(2).mapOk((v) => v * 3);
      expect(r.valueOrNull, 6);
      expect(r.isOk, isTrue);
      Failure? seen;
      fail<int>(const Failure.cancelled()).when(onFail: (f) => seen = f);
      expect(seen, isA<Cancelled>());
    });
  });

  group('JsonFileCache', () {
    late Directory dir;
    late JsonFileCache cache;

    setUp(() {
      dir = Directory.systemTemp.createTempSync('cache_test');
      cache = JsonFileCache('drafts', root: () async => dir);
    });
    tearDown(() => dir.deleteSync(recursive: true));

    test('round-trips, removes and clears', () async {
      expect(await cache.read('a'), isNull);
      await cache.write('a', {'x': 1});
      await cache.write('b', {'y': 2});
      expect(await cache.read('a'), {'x': 1});
      await cache.remove('a');
      expect(await cache.read('a'), isNull);
      await cache.clearAll();
      expect(await cache.read('b'), isNull);
    });

    test('keys are sanitised and corrupt files read as null', () async {
      await cache.write('user:1/app 2', {'ok': true});
      expect(await cache.read('user:1/app 2'), {'ok': true});
      File('${dir.path}/drafts/bad.json').writeAsStringSync('{not json');
      expect(await cache.read('bad'), isNull);
    });
  });

  group('Abilities', () {
    test('parses capability objects and picks the portal', () {
      final a = Abilities.fromJson({
        'capabilities': [
          {'key': 'adm_apply.use'},
          'device_token.manage',
          42,
        ],
        'portals': {'default_portal_code': 'student'},
      });
      expect(a.capabilities, {'adm_apply.use', 'device_token.manage'});
      expect(a.portal, Portal.apply);
      expect(a.canRegisterDevice, isTrue);
    });

    test('falls back to the default portal, then none', () {
      expect(
        Abilities.fromJson({
          'portals': {'default_portal_code': 'student'},
        }).portal,
        Portal.student,
      );
      expect(Abilities.fromJson({'capabilities': 'junk'}).portal, Portal.none);
      expect(const Abilities(isSuperuser: true).has('anything'), isTrue);
    });

    test('survives a JSON round trip (session snapshot)', () {
      const a = Abilities(
        capabilities: {'adm_apply.use'},
        defaultPortalCode: 'apply',
      );
      expect(Abilities.fromJson(a.toJson()), a);
    });
  });

  test('CountryOrder puts popular countries first, then A-Z', () {
    final sorted = CountryOrder.sort(
      ['zw', 'GB', 'af', 'pk', 'US'],
      (c) => c,
      (c) => c,
    );
    expect(sorted, ['pk', 'US', 'GB', 'af', 'zw']);
  });

  group('ConnectivityService', () {
    late StreamController<List<ConnectivityResult>> transport;
    late List<ConnectivityResult> now;
    late ConnectivityService service;

    setUp(() async {
      transport = StreamController<List<ConnectivityResult>>();
      now = [ConnectivityResult.wifi];
      service = ConnectivityService(
        onChanged: transport.stream,
        probe: () async => now,
      );
      await service.initialize();
    });
    tearDown(() async {
      await service.dispose();
      await transport.close();
    });

    test(
      'transport loss is offline; regaining it resets reachability',
      () async {
        service.reportApiUnreachable();
        expect(service.status, NetworkStatus.apiUnreachable);
        transport.add([ConnectivityResult.none]);
        await Future<void>.delayed(Duration.zero);
        expect(service.status, NetworkStatus.offline);
        expect(service.deviceOffline, isTrue);
        transport.add([ConnectivityResult.mobile]);
        await Future<void>.delayed(Duration.zero);
        expect(service.status, NetworkStatus.online);
      },
    );

    test('an API answer proves reachability; retry re-probes', () async {
      final seen = <NetworkStatus>[];
      final sub = service.statusStream.listen(seen.add);
      service
        ..reportApiUnreachable()
        ..reportApiSuccess();
      now = [ConnectivityResult.none];
      await service.retryNow();
      await Future<void>.delayed(Duration.zero);
      expect(seen, [
        NetworkStatus.apiUnreachable,
        NetworkStatus.online,
        NetworkStatus.offline,
      ]);
      await sub.cancel();
    });
  });
}
