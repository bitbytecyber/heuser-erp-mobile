import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart' hide Timeout;
import 'package:heuser_erp_mobile/core/auth/session_token_store.dart';
import 'package:heuser_erp_mobile/core/connectivity/connectivity_service.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/core/network/headers.dart';
import 'package:heuser_erp_mobile/core/network/interceptors/network_error_interceptor.dart';
import 'package:heuser_erp_mobile/core/network/interceptors/session_token_interceptor.dart';
import 'package:heuser_erp_mobile/core/network/interceptors/transient_retry_interceptor.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/stub_adapter.dart';

class _Storage extends Mock implements FlutterSecureStorage;

/// The production chain (minus logging) over a [StubAdapter].
class _Harness {
  _Harness(List<StubReply> replies, {String? token}) {
    when(() => storage.read(key: any(named: 'key')))
        .thenAnswer((_) async => token);
    when(
      () => storage.write(
        key: any(named: 'key'),
        value: any(named: 'value'),
      ),
    ).thenAnswer((_) async {});
    adapter = StubAdapter(replies);
    dio = Dio(BaseOptions(baseUrl: 'https://api.test'))
      ..httpClientAdapter = adapter;
    dio.interceptors.addAll([
      SessionTokenInterceptor(
        store,
        onSessionRejected: (_, code) => rejected.add(code),
        credentialSwap: () => swap,
      ),
      TransientRetryInterceptor(
        dio,
        connectivity: connectivity,
        backoff: const [Duration.zero, Duration.zero],
      ),
      NetworkErrorInterceptor(connectivity),
    ]);
  }

  final storage = _Storage();
  late final store = SessionTokenStore(storage: storage);
  final transport = StreamController<List<ConnectivityResult>>();
  List<ConnectivityResult> transportNow = [ConnectivityResult.wifi];
  late final connectivity = ConnectivityService(
    onChanged: transport.stream,
    probe: () async => transportNow,
  );
  late final StubAdapter adapter;
  late final Dio dio;
  final rejected = <int>[];
  Future<void>? swap;

  Future<Object?> get(String path) async {
    try {
      return (await dio.get<dynamic>(path)).data;
    } on DioException catch (e) {
      return e;
    }
  }
}

void main() {
  group('SessionTokenInterceptor', () {
    test('attaches the stored token', () async {
      final h = _Harness([const StubReply(200)], token: 'tok-1');
      await h.get('/api/v1/me/');
      expect(h.adapter.requests.single.headers[HHeaders.sessionToken], 'tok-1');
    });

    test('harvests a rotated token from any body, even an error', () async {
      final h = _Harness([
        const StubReply(401, {
          'meta': {'session_token': ' tok-2 '},
        }),
        const StubReply(200),
      ], token: 'tok-1');
      await h.get('/_allauth/app/v1/auth/login');
      expect(h.store.cachedToken, 'tok-2');
      await h.get('/api/v1/me/');
      expect(h.adapter.requests.last.headers[HHeaders.sessionToken], 'tok-2');
    });

    test('a 401 on the token we hold is reported', () async {
      final h = _Harness([const StubReply(401)], token: 'tok-1');
      await h.get('/api/v1/me/');
      expect(h.rejected, [401]);
    });

    test('a stale 401 from a previous token is inert', () async {
      final h = _Harness([const StubReply(401)], token: 'old');
      final inFlight = Completer<void>();
      h.adapter.gate = inFlight.future;
      final pending = h.get('/api/v1/me/');
      while (h.adapter.requests.isEmpty) {
        await Future<void>.delayed(Duration.zero);
      }
      // The session changes while the request is out.
      await h.store.write('new');
      inFlight.complete();
      await pending;
      expect(h.rejected, isEmpty);
    });

    test('403 counts only with an UNAUTHENTICATED body', () async {
      final denied = _Harness([
        const StubReply(403, {'detail': 'You do not have permission.'}),
      ], token: 't');
      await denied.get('/api/v1/x/');
      expect(denied.rejected, isEmpty);

      final dead = _Harness([
        const StubReply(403, {'code': 'UNAUTHENTICATED'}),
      ], token: 't');
      await dead.get('/api/v1/x/');
      expect(dead.rejected, [403]);
    });

    test('allauth endpoints are never reported', () async {
      final h = _Harness([const StubReply(401)], token: 't');
      await h.get('/_allauth/app/v1/auth/session');
      expect(h.rejected, isEmpty);
    });

    test('waits for an open credential swap before sending', () async {
      final h = _Harness([const StubReply(200)], token: 'old');
      final swap = Completer<void>();
      h.swap = swap.future;
      final pending = h.get('/api/v1/me/');
      await Future<void>.delayed(Duration.zero);
      expect(h.adapter.requests, isEmpty);
      await h.store.write('new');
      swap.complete();
      await pending;
      expect(h.adapter.requests.single.headers[HHeaders.sessionToken], 'new');
    });
  });

  group('TransientRetryInterceptor', () {
    test('retries a GET after a transport failure', () async {
      final h = _Harness([
        const StubReply.fail(DioExceptionType.connectionError),
        const StubReply(200, {'ok': true}),
      ]);
      expect(await h.get('/api/v1/x/'), {'ok': true});
      expect(h.adapter.requests, hasLength(2));
    });

    test('gives up after the backoff list', () async {
      final h = _Harness([
        const StubReply.fail(DioExceptionType.connectionTimeout),
      ]);
      final result = await h.get('/api/v1/x/');
      expect(result, isA<DioException>());
      expect(h.adapter.requests, hasLength(3));
    });

    test('never retries writes, 4xx/5xx, or opted-out requests', () async {
      final post = _Harness([
        const StubReply.fail(DioExceptionType.connectionError),
      ]);
      await expectLater(
        post.dio.post<dynamic>('/api/v1/x/'),
        throwsA(isA<DioException>()),
      );
      expect(post.adapter.requests, hasLength(1));

      final server = _Harness([const StubReply(503)]);
      await server.get('/api/v1/x/');
      expect(server.adapter.requests, hasLength(1));

      final optOut = _Harness([
        const StubReply.fail(DioExceptionType.connectionError),
      ]);
      await expectLater(
        optOut.dio.get<dynamic>(
          '/api/v1/x/',
          options: Options(extra: {HExtra.noRetry: true}),
        ),
        throwsA(isA<DioException>()),
      );
      expect(optOut.adapter.requests, hasLength(1));
    });

    test('does not retry while the device is offline', () async {
      final h = _Harness([
        const StubReply.fail(DioExceptionType.connectionError),
      ])..transportNow = [ConnectivityResult.none];
      await h.connectivity.refresh();
      await h.get('/api/v1/x/');
      expect(h.adapter.requests, hasLength(1));
    });
  });

  group('NetworkErrorInterceptor', () {
    test('attaches a Failure and marks the API unreachable', () async {
      final h = _Harness([
        const StubReply.fail(DioExceptionType.connectionError),
      ]);
      final e = (await h.get('/api/v1/x/'))! as DioException;
      expect(e.error, isA<Unreachable>());
      expect(h.connectivity.status, NetworkStatus.apiUnreachable);
    });

    test('any status code proves the backend is reachable', () async {
      final h = _Harness([
        const StubReply.fail(DioExceptionType.connectionError),
        const StubReply.fail(DioExceptionType.connectionError),
        const StubReply.fail(DioExceptionType.connectionError),
        const StubReply(404, {'detail': 'Not found.'}),
      ]);
      await h.get('/api/v1/x/');
      expect(h.connectivity.status, NetworkStatus.apiUnreachable);
      final e = (await h.get('/api/v1/y/'))! as DioException;
      expect(e.error, isA<NotFound>());
      expect(h.connectivity.status, NetworkStatus.online);
    });
  });

  group('SessionTokenStore', () {
    test('a write during the first disk read is not overwritten', () async {
      final storage = _Storage();
      final disk = Completer<String?>();
      when(() => storage.read(key: any(named: 'key')))
          .thenAnswer((_) => disk.future);
      when(
        () => storage.write(
          key: any(named: 'key'),
          value: any(named: 'value'),
        ),
      ).thenAnswer((_) async {});
      final store = SessionTokenStore(storage: storage);
      final reading = store.read();
      await store.write('fresh');
      disk.complete('stale');
      expect(await reading, 'fresh');
      expect(store.cachedToken, 'fresh');
    });
  });
}
