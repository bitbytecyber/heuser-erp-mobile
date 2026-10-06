import 'package:heuser_erp_mobile/features/auth/domain/pending_flow.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:heuser_erp_mobile/features/me/domain/abilities.dart';

/// Route paths (kept here so the redirect and the typed routes agree).
abstract final class RoutePaths {
  static const splash = '/';
  static const welcome = '/welcome';
  static const login = '/login';
  static const signup = '/signup';
  static const verifyEmail = '/verify-email';
  static const mfa = '/mfa';
  static const loginCode = '/login-code';
  static const forgotPassword = '/forgot-password';
  static const resetPassword = '/reset-password';
  static const socialChoice = '/social-choice';
  static const noPortal = '/no-portal';
  static const apply = '/apply';
  static const applyNotifications = '/apply/notifications';
  static const applyProfile = '/apply/profile';
  static const student = '/student';

  /// Routes reachable without a session.
  static const Set<String> public = {
    welcome,
    login,
    signup,
    forgotPassword,
    resetPassword,
    loginCode,
    socialChoice,
  };

  /// Routes that belong to a pending step.
  static const Set<String> pending = {verifyEmail, mfa, loginCode};
}

/// Pure routing policy: where [location] must go given [state]. `null` means
/// "stay". Unit-tested; the GoRouter `redirect` just calls this.
String? authRedirect({required AuthState state, required String location}) {
  final path = Uri.parse(location).path;
  bool at(String p) => path == p || path.startsWith('$p/');
  bool atAny(Set<String> ps) => ps.any(at);

  switch (state) {
    case AuthUnknown():
      return path == RoutePaths.splash ? null : RoutePaths.splash;
    case AuthUnauthenticated():
      if (atAny(RoutePaths.public)) return null;
      return RoutePaths.welcome;
    case AuthPending(:final flow):
      final target = switch (flow) {
        VerifyEmail() => RoutePaths.verifyEmail,
        MfaAuthenticate() => RoutePaths.mfa,
        LoginByCode() => '${RoutePaths.loginCode}/confirm',
        ProviderSignup() || UnsupportedFlow() => RoutePaths.welcome,
      };
      return path == target ? null : target;
    case AuthAuthenticated(:final portal):
      final home = switch (portal) {
        Portal.apply => RoutePaths.apply,
        Portal.student => RoutePaths.student,
        Portal.none => RoutePaths.noPortal,
      };
      if (path == RoutePaths.splash ||
          atAny(RoutePaths.public) ||
          atAny(RoutePaths.pending)) {
        return home;
      }
      if (portal == Portal.none && !at(RoutePaths.noPortal)) return home;
      if (portal != Portal.none && at(RoutePaths.noPortal)) return home;
      return null;
  }
}
