import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_erp_mobile/app/router/auth_redirect.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_outcome.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_user.dart';
import 'package:heuser_erp_mobile/features/auth/domain/pending_flow.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:heuser_erp_mobile/features/me/domain/abilities.dart';

void main() {
  const user = AuthUser(id: 1, email: 'a@b.c');
  const applicant = Abilities(capabilities: {'adm_apply.use'});

  String? go(AuthState s, String loc) => authRedirect(state: s, location: loc);

  test('unknown holds at splash', () {
    expect(go(const AuthState.unknown(), '/apply'), '/');
    expect(go(const AuthState.unknown(), '/'), isNull);
  });

  test('unauthenticated allows public routes, otherwise welcome', () {
    const s = AuthState.unauthenticated();
    expect(go(s, '/login'), isNull);
    expect(go(s, '/reset-password?key=x'), isNull);
    expect(go(s, '/apply'), '/welcome');
    expect(go(s, '/'), '/welcome');
  });

  test('pending flows go to their step', () {
    expect(
      go(
        const AuthState.pending(flow: PendingFlow.verifyEmail(), email: 'a'),
        '/login',
      ),
      '/verify-email',
    );
    expect(
      go(
        const AuthState.pending(flow: PendingFlow.verifyEmail(), email: 'a'),
        '/verify-email',
      ),
      isNull,
    );
    expect(
      go(
        const AuthState.pending(
          flow: PendingFlow.mfaAuthenticate(),
          email: 'a',
        ),
        '/',
      ),
      '/mfa',
    );
    expect(
      go(
        const AuthState.pending(flow: PendingFlow.loginByCode(), email: 'a'),
        '/login-code',
      ),
      '/login-code/confirm',
    );
    expect(
      go(
        const AuthState.pending(
          flow: PendingFlow.unsupported(id: 'x'),
          email: 'a',
        ),
        '/',
      ),
      '/welcome',
    );
  });

  test('authenticated applicant lands on /apply and stays inside', () {
    const s = AuthState.authenticated(
      user: user,
      abilities: applicant,
      portal: Portal.apply,
    );
    expect(go(s, '/'), '/apply');
    expect(go(s, '/login'), '/apply');
    expect(go(s, '/verify-email'), '/apply');
    expect(go(s, '/apply/profile/appearance'), isNull);
    expect(go(s, '/no-portal'), '/apply');
  });

  test('no portal is pinned to /no-portal', () {
    const s = AuthState.authenticated(
      user: user,
      abilities: Abilities.none,
      portal: Portal.none,
    );
    expect(go(s, '/apply'), '/no-portal');
    expect(go(s, '/no-portal'), isNull);
  });

  test('sign-out reasons are carried', () {
    expect(
      const AuthState.unauthenticated(reason: SignOutReason.expired),
      isA<AuthUnauthenticated>(),
    );
  });
}
