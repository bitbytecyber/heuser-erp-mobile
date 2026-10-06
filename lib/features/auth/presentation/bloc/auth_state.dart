part of 'auth_bloc.dart';

/// States of [AuthBloc].
@freezed
sealed class AuthState with _$AuthState {
  const AuthState._();

  /// Before the stored session has been checked (splash stays up).
  const factory AuthState.unknown() = AuthUnknown;

  /// No session.
  const factory AuthState.unauthenticated({
    @Default(SignOutReason.none) SignOutReason reason,
  }) = AuthUnauthenticated;

  /// A token is held but a step is required (verify email, MFA, code).
  const factory AuthState.pending({
    required PendingFlow flow,
    required String email,
  }) = AuthPending;

  /// Signed in. [portal] decides the shell; [fromSnapshot] when restored
  /// offline (the shell shows the offline banner and retries abilities).
  const factory AuthState.authenticated({
    required AuthUser user,
    required Abilities abilities,
    required Portal portal,
    @Default(false) bool fromSnapshot,
  }) = AuthAuthenticated;

  /// Convenience.
  bool get isAuthenticated => this is AuthAuthenticated;

  /// The user when signed in.
  AuthUser? get userOrNull => switch (this) {
    AuthAuthenticated(:final user) => user,
    _ => null,
  };
}
