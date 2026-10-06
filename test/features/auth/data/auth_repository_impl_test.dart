import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_erp_mobile/core/auth/auth_signals.dart';
import 'package:heuser_erp_mobile/core/auth/session_token_store.dart';
import 'package:heuser_erp_mobile/core/env/app_env.dart';
import 'package:heuser_erp_mobile/core/env/flavor.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/auth/data/datasources/allauth_api.dart';
import 'package:heuser_erp_mobile/features/auth/data/datasources/social_auth_api.dart';
import 'package:heuser_erp_mobile/features/auth/data/models/allauth_response.dart';
import 'package:heuser_erp_mobile/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:heuser_erp_mobile/features/auth/data/repositories/session_snapshot_store.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_outcome.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_user.dart';
import 'package:heuser_erp_mobile/features/auth/domain/pending_flow.dart';
import 'package:heuser_erp_mobile/features/me/data/me_api.dart';
import 'package:heuser_erp_mobile/features/me/domain/abilities.dart';
import 'package:mocktail/mocktail.dart';

class _Allauth extends Mock implements AllauthApi;

class _Social extends Mock implements SocialAuthApi;

class _Me extends Mock implements MeApi;

class _Storage extends Mock implements FlutterSecureStorage;

class _Snapshots extends Mock implements SessionSnapshotStore;

AllauthResponse _r(int code, Map<String, dynamic> json) =>
    AllauthResponse(code, json);

const Map<String, Object> _userJson = {
  'id': 1,
  'email': 'a@b.c',
  'first_name': 'Ayesha',
};

void main() {
  setUpAll(() => registerFallbackValue(const AuthUser(id: 0, email: 'x@y.z')));
  late _Allauth allauth;
  late _Social social;
  late _Me me;
  late _Storage storage;
  late SessionTokenStore tokens;
  late _Snapshots snapshots;
  late AuthRepositoryImpl repo;

  setUp(() {
    allauth = _Allauth();
    social = _Social();
    me = _Me();
    storage = _Storage();
    when(() => storage.read(key: any(named: 'key')))
        .thenAnswer((_) async => null);
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
    when(me.fetchAbilities).thenAnswer(
      (_) async => ok((
        const Abilities(capabilities: {'adm_apply.use'}),
        <String, dynamic>{},
      )),
    );
    repo = AuthRepositoryImpl(
      allauth: allauth,
      social: social,
      me: me,
      tokens: tokens,
      snapshots: snapshots,
      signals: AuthSignals(),
      env: AppEnv.custom(
        flavor: Flavor.dev,
        appName: 't',
        apiBaseUrl: 'http://localhost:8090',
        wsBaseUrl: 'ws://localhost:8091',
        googleWebClientId: 'web-client',
        appleClientId: 'com.x',
        appStoreId: '',
      ),
    );
  });

  test('restoreSession without a token → signedOut(none)', () async {
    final r = await repo.restoreSession();
    expect(r.valueOrNull, const AuthOutcome.signedOut(SignOutReason.none));
    verifyNever(allauth.getSession);
  });

  test('login 200 → authenticated, token stored, abilities fetched', () async {
    when(() => allauth.login(email: 'a@b.c', password: 'pw')).thenAnswer(
      (_) async => _r(200, {
        'data': {'user': _userJson},
        'meta': {'is_authenticated': true, 'session_token': 'tok'},
      }),
    );
    final events = <SessionEvent>[];
    repo.events.listen(events.add);
    final r = await repo.login(email: 'a@b.c', password: 'pw');
    expect(r.valueOrNull, isA<Authenticated>());
    expect((r.valueOrNull! as Authenticated).abilities.portal, Portal.apply);
    expect(tokens.cachedToken, 'tok');
    await Future<void>.delayed(Duration.zero);
    expect(events.single, isA<SessionSignedIn>());
    verify(
      () => storage.write(
        key: any(named: 'key'),
        value: 'tok',
      ),
    ).called(1);
  });

  test('login 401 with verify_email → pending, token kept', () async {
    when(() => allauth.login(email: 'a@b.c', password: 'pw')).thenAnswer(
      (_) async => _r(401, {
        'data': {
          'flows': [
            {'id': 'verify_email', 'is_pending': true},
          ],
        },
        'meta': {'is_authenticated': false, 'session_token': 'pend'},
      }),
    );
    final r = await repo.login(email: 'a@b.c', password: 'pw');
    expect(
      r.valueOrNull,
      const AuthOutcome.pending(
        flow: PendingFlow.verifyEmail(),
        email: 'a@b.c',
      ),
    );
    expect(tokens.cachedToken, 'pend');
  });

  test('login 401 without flows → validation(invalid_credentials)', () async {
    when(() => allauth.login(email: 'a@b.c', password: 'bad')).thenAnswer(
      (_) async => _r(401, {
        'errors': [
          {'message': 'Wrong', 'code': 'email_password_mismatch'},
        ],
        'meta': {'is_authenticated': false},
      }),
    );
    final r = await repo.login(email: 'a@b.c', password: 'bad');
    final f = r.failureOrNull;
    expect(f, isA<Validation>());
    expect((f! as Validation).code, 'email_password_mismatch');
  });

  test('login 409 adopts the live session', () async {
    when(
      () => allauth.login(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async => _r(409, {}));
    when(allauth.getSession).thenAnswer(
      (_) async => _r(200, {
        'data': {'user': _userJson},
        'meta': {'is_authenticated': true},
      }),
    );
    final r = await repo.login(email: 'a@b.c', password: 'pw');
    expect(r.valueOrNull, isA<Authenticated>());
  });

  test('login 429 → rateLimited', () async {
    when(
      () => allauth.login(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async => _r(429, {}));
    final r = await repo.login(email: 'a@b.c', password: 'pw');
    expect(r.failureOrNull, const Failure.rateLimited());
  });

  test(
    'signOut wipes locally first and calls logout with the captured token',
    () async {
      await tokens.write('tok');
      when(() => allauth.logout(sessionToken: any(named: 'sessionToken')))
          .thenAnswer((_) async {});
      final events = <SessionEvent>[];
      repo.events.listen(events.add);
      await repo.signOut();
      expect(tokens.cachedToken, isNull);
      verify(() => allauth.logout(sessionToken: 'tok')).called(1);
      await Future<void>.delayed(Duration.zero);
      expect(
        events.single,
        const SessionEvent.signedOut(SignOutReason.userSignedOut),
      );
    },
  );

  test('restoreSession 410 → wiped + expired', () async {
    await tokens.write('old');
    when(allauth.getSession).thenAnswer((_) async => _r(410, {}));
    final r = await repo.restoreSession();
    expect(r.valueOrNull, const AuthOutcome.signedOut(SignOutReason.expired));
    expect(tokens.cachedToken, isNull);
  });
}
