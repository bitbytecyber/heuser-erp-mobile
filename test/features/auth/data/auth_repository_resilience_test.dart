import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart' hide Timeout, fail;
import 'package:heuser_erp_mobile/core/auth/auth_signals.dart';
import 'package:heuser_erp_mobile/core/auth/session_token_store.dart';
import 'package:heuser_erp_mobile/core/env/app_env.dart';
import 'package:heuser_erp_mobile/core/env/flavor.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/auth/data/datasources/allauth_api.dart';
import 'package:heuser_erp_mobile/features/auth/data/datasources/google_auth_service.dart';
import 'package:heuser_erp_mobile/features/auth/data/datasources/social_auth_api.dart';
import 'package:heuser_erp_mobile/features/auth/data/models/allauth_response.dart';
import 'package:heuser_erp_mobile/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:heuser_erp_mobile/features/auth/data/repositories/session_snapshot_store.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_outcome.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_user.dart';
import 'package:heuser_erp_mobile/features/auth/domain/social_precheck.dart';
import 'package:heuser_erp_mobile/features/me/data/me_api.dart';
import 'package:heuser_erp_mobile/features/me/domain/abilities.dart';
import 'package:mocktail/mocktail.dart';

class _Allauth extends Mock implements AllauthApi;

class _Social extends Mock implements SocialAuthApi;

class _Me extends Mock implements MeApi;

class _Storage extends Mock implements FlutterSecureStorage;

class _Snapshots extends Mock implements SessionSnapshotStore;

class _Google extends Mock implements GoogleAuthService;

const _user = AuthUser(id: 1, email: 'a@b.c');
const Map<String, Object> _userJson = {'id': 1, 'email': 'a@b.c'};
const _apply = <String, dynamic>{
  'capabilities': [
    {'key': 'adm_apply.use'},
  ],
};

void main() {
  setUpAll(() {
    registerFallbackValue(_user);
    registerFallbackValue(SocialProvider.google);
  });

  late _Allauth allauth;
  late _Social social;
  late _Me me;
  late _Storage storage;
  late SessionTokenStore tokens;
  late _Snapshots snapshots;
  late AuthSignals signals;
  late _Google google;
  late List<SessionEvent> events;
  late int draftWipes;
  late AuthRepositoryImpl repo;

  setUp(() {
    allauth = _Allauth();
    social = _Social();
    me = _Me();
    storage = _Storage();
    google = _Google();
    signals = AuthSignals();
    draftWipes = 0;
    when(() => storage.read(key: any(named: 'key')))
        .thenAnswer((_) async => 'tok');
    when(
      () => storage.write(
        key: any(named: 'key'),
        value: any(named: 'value'),
      ),
    ).thenAnswer((_) async {});
    when(() => storage.delete(key: any(named: 'key'))).thenAnswer((_) async {});
    tokens = SessionTokenStore(storage: storage);
    snapshots = _Snapshots();
    when(snapshots.read).thenAnswer((_) async => null);
    when(
      () => snapshots.write(
        user: any(named: 'user'),
        abilities: any(named: 'abilities'),
      ),
    ).thenAnswer((_) async {});
    when(snapshots.clear).thenAnswer((_) async {});
    when(me.fetchAbilities)
        .thenAnswer((_) async => ok((Abilities.fromJson(_apply), _apply)));
    repo = AuthRepositoryImpl(
      allauth: allauth,
      social: social,
      me: me,
      tokens: tokens,
      snapshots: snapshots,
      signals: signals,
      google: google,
      env: AppEnv.custom(
        flavor: Flavor.dev,
        appName: 't',
        apiBaseUrl: 'http://localhost:8090',
        wsBaseUrl: 'ws://localhost:8091',
        googleWebClientId: 'web-client',
        appleClientId: 'com.x',
        appStoreId: '',
      ),
      onUserSignOut: [() async => draftWipes++],
    );
    events = [];
    repo.events.listen(events.add);
  });

  void snapshotOf(Map<String, dynamic>? abilities, {AuthUser user = _user}) =>
      when(snapshots.read).thenAnswer(
        (_) async => SessionSnapshot(
          user: user,
          abilities: abilities,
          savedAt: DateTime(2026),
        ),
      );

  group('restoreSession without a verdict keeps the session', () {
    test('a 5xx uses the snapshot and keeps the token', () async {
      snapshotOf(_apply);
      when(allauth.getSession).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
          response: Response(requestOptions: RequestOptions(), statusCode: 502),
          type: DioExceptionType.badResponse,
        ),
      );
      final r = await repo.restoreSession();
      expect(r.valueOrNull, isA<Authenticated>());
      expect((r.valueOrNull! as Authenticated).fromSnapshot, isTrue);
      verifyNever(() => storage.delete(key: any(named: 'key')));
      verifyNever(snapshots.clear);
    });

    test('a hung server gives up after the budget', () {
      fakeAsync((async) {
        snapshotOf(_apply);
        when(allauth.getSession)
            .thenAnswer((_) => Completer<AllauthResponse>().future);
        Result<AuthOutcome>? r;
        unawaited(repo.restoreSession().then((v) => r = v));
        async.elapse(const Duration(seconds: 7));
        expect(r?.valueOrNull, isA<Authenticated>());
      });
    });

    test('no snapshot → signed out (offline), token kept', () async {
      when(allauth.getSession).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
          type: DioExceptionType.connectionError,
        ),
      );
      final r = await repo.restoreSession();
      expect(r.valueOrNull, const AuthOutcome.signedOut(SignOutReason.offline));
      verifyNever(() => storage.delete(key: any(named: 'key')));
    });
  });

  group('abilities after sign-in', () {
    setUp(() {
      when(() => allauth.login(email: 'a@b.c', password: 'pw')).thenAnswer(
        (_) async => AllauthResponse(200, {
          'data': {'user': _userJson},
          'meta': {'is_authenticated': true, 'session_token': 'new'},
        }),
      );
      when(me.fetchAbilities)
          .thenAnswer((_) async => fail(const Failure.server(status: 500)));
    });

    test("a failure falls back to this user's snapshot", () async {
      snapshotOf(_apply);
      final r = await repo.login(email: 'a@b.c', password: 'pw');
      expect((r.valueOrNull! as Authenticated).abilities.portal, Portal.apply);
    });

    test(
      'without any abilities the sign-in fails instead of no-portal',
      () async {
        snapshotOf(_apply, user: const AuthUser(id: 2, email: 'x@y.z'));
        final r = await repo.login(email: 'a@b.c', password: 'pw');
        expect(r.failureOrNull, isA<Server>());
        await Future<void>.delayed(Duration.zero);
        expect(
          events.last,
          const SessionEvent.signedOut(SignOutReason.offline),
        );
        verifyNever(
          () => snapshots.write(
            user: any(named: 'user'),
            abilities: any(named: 'abilities'),
          ),
        );
      },
    );
  });

  test(
    'verified without a login → signed out so the code page closes',
    () async {
      when(() => allauth.verifyEmail('ABCD-EFGH'))
          .thenAnswer((_) async => AllauthResponse(401, {'status': 401}));
      final r = await repo.verifyEmail('abcd-efgh');
      expect(r.valueOrNull, const AuthOutcome.signedOut(SignOutReason.none));
      await Future<void>.delayed(Duration.zero);
      expect(events.last, const SessionEvent.signedOut(SignOutReason.none));
    },
  );

  test('the social precheck runs outside the credential-swap window', () async {
    when(google.signIn).thenAnswer(
      (_) async => const GoogleTokens(idToken: 'id', email: 'a@b.c'),
    );
    Future<void>? swapDuringPrecheck;
    when(
      () => social.precheckIdentity(
        provider: any(named: 'provider'),
        token: any(named: 'token'),
      ),
    ).thenAnswer((_) async {
      swapDuringPrecheck = signals.credentialSwap;
      return ok(const SocialPrecheck(known: false));
    });
    final r = await repo.loginWithGoogle();
    expect(r.valueOrNull, isA<SocialChoiceRequired>());
    expect(swapDuringPrecheck, isNull);
  });

  test('sign-out wipes drafts; an expired session does not', () async {
    when(() => allauth.logout(sessionToken: any(named: 'sessionToken')))
        .thenAnswer((_) async {});
    when(google.signOut).thenAnswer((_) async {});
    await repo.handleSessionRejected();
    expect(draftWipes, 0);
    await repo.signOut();
    expect(draftWipes, 1);
  });

  test('a sign-out queued behind two sign-ins waits for both', () async {
    final first = Completer<AllauthResponse>();
    final second = Completer<AllauthResponse>();
    final calls = [first, second];
    when(
      () => allauth.login(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) => calls.removeAt(0).future);
    when(() => allauth.logout(sessionToken: any(named: 'sessionToken')))
        .thenAnswer((_) async {});
    when(google.signOut).thenAnswer((_) async {});

    unawaited(repo.login(email: 'a@b.c', password: 'pw'));
    unawaited(repo.login(email: 'a@b.c', password: 'pw'));
    var signedOut = false;
    unawaited(repo.signOut().then((_) => signedOut = true));

    first.complete(AllauthResponse(400, {'status': 400}));
    await Future<void>.delayed(Duration.zero);
    await Future<void>.delayed(Duration.zero);
    expect(signedOut, isFalse);
    second.complete(AllauthResponse(400, {'status': 400}));
    await pumpEventQueue();
    expect(signedOut, isTrue);
  });
}
