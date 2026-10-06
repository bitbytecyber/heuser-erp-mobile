/// Header names shared by the interceptors and the auth datasource.
abstract final class HHeaders {
  /// django-allauth app-client session token.
  static const String sessionToken = 'X-Session-Token';

  /// allauth password reset key (GET `auth/password/reset`).
  static const String passwordResetKey = 'X-Password-Reset-Key';

  /// Card-scan onboarding claim (not used by the applicant app, kept for parity).
  static const String onboardingClaim = 'X-Onboarding-Claim';
}

/// `RequestOptions.extra` keys.
abstract final class HExtra {
  /// Set to `true` on a request that must never be auto-retried.
  static const String noRetry = 'h_no_retry';

  /// Retry attempt counter (internal to the retry interceptor).
  static const String retryAttempt = 'h_retry_attempt';
}
