import 'package:freezed_annotation/freezed_annotation.dart';

part 'pending_flow.freezed.dart';

/// A step allauth requires before the session is authenticated. Comes from
/// `data.flows[].is_pending` on a 401 login/signup response.
@freezed
sealed class PendingFlow with _$PendingFlow {
  const PendingFlow._();

  /// Email verification by code (`POST auth/email/verify {key}`).
  const factory PendingFlow.verifyEmail() = VerifyEmail;

  /// Second factor (`POST auth/2fa/authenticate {code}`); [types] lists what
  /// the account has, e.g. `totp`, `recovery_codes`, `webauthn`.
  const factory PendingFlow.mfaAuthenticate({
    @Default(<String>[]) List<String> types,
  }) = MfaAuthenticate;

  /// Emailed login code was sent (`POST auth/code/confirm {code}`).
  const factory PendingFlow.loginByCode() = LoginByCode;

  /// Social identity needs more signup data (not expected: precheck prevents it).
  const factory PendingFlow.providerSignup() = ProviderSignup;

  /// Something this app cannot complete (`reauthenticate`, `verify_phone`…).
  const factory PendingFlow.unsupported({required String id}) = UnsupportedFlow;

  /// Parses allauth's flow id.
  factory PendingFlow.fromId(String id, {List<String> types = const []}) =>
      switch (id) {
        'verify_email' => const PendingFlow.verifyEmail(),
        'mfa_authenticate' ||
        'mfa' => PendingFlow.mfaAuthenticate(types: types),
        'login_by_code' => const PendingFlow.loginByCode(),
        'provider_signup' => const PendingFlow.providerSignup(),
        _ => PendingFlow.unsupported(id: id),
      };

  /// allauth's id.
  String get id => switch (this) {
    VerifyEmail() => 'verify_email',
    MfaAuthenticate() => 'mfa_authenticate',
    LoginByCode() => 'login_by_code',
    ProviderSignup() => 'provider_signup',
    UnsupportedFlow(:final id) => id,
  };
}
