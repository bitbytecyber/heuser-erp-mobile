part of 'auth_repository_impl.dart';

/// Flows that run on an existing (or pending) session: verification codes,
/// second factor, password reset/change, profile refresh. No transition lock
/// is needed: none of them replace the credential from scratch.
mixin _AccountFlows on _AuthTransitions implements AuthRepository {
  SessionSnapshotStore get _snapshots;
  String? get _pendingEmail;
  AuthUser? get _user;
  set _user(AuthUser? value);
  Map<String, dynamic>? get _abilitiesJson;
  @override
  Future<void> handleSessionRejected();

  @override
  Future<Result<AuthOutcome>> verifyEmail(String code) => _guard(
    () async => await _handleAuthResponse(
      await _allauth.verifyEmail(code.trim().toUpperCase()),
      email: _pendingEmail,
    ),
  );

  @override
  Future<Result<void>> resendVerification() => _guard(() async {
    final r = await _allauth.resendVerification();
    if (r.isOk || r.hasPendingFlow) return ok(null);
    return fail(_failureFrom(r));
  });

  @override
  Future<Result<AuthOutcome>> mfaAuthenticate(String code) => _guard(
    () async => await _handleAuthResponse(
      await _allauth.mfaAuthenticate(code.trim()),
      email: _pendingEmail,
    ),
  );

  @override
  Future<Result<AuthOutcome>> requestLoginCode(String email) =>
      _signInTransition(() => _allauth.requestLoginCode(email), email: email);

  @override
  Future<Result<AuthOutcome>> confirmLoginCode(String code) => _guard(
    () async => await _handleAuthResponse(
      await _allauth.confirmLoginCode(code.trim().toUpperCase()),
      email: _pendingEmail,
    ),
  );

  @override
  Future<Result<void>> requestPasswordReset(String email) => _guard(() async {
    final r = await _allauth.requestPasswordReset(email);
    return r.isOk ? ok(null) : fail(_failureFrom(r));
  });

  @override
  Future<Result<void>> resetPassword({
    required String key,
    required String password,
  }) => _guard(() async {
    final r = await _allauth.resetPassword(key: key, password: password);
    // 401 is success: login-on-reset is off, the user now signs in.
    if (r.isOk || r.isUnauthenticated) {
      if (_user != null) await handleSessionRejected();
      return ok(null);
    }
    return fail(_failureFrom(r));
  });

  @override
  Future<Result<void>> changePassword({
    required String newPassword,
    String? currentPassword,
  }) => _guard(() async {
    final r = await _allauth.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
    if (r.isOk) {
      final u = _user;
      if (u != null && !u.hasUsablePassword) {
        _user = u.copyWith(hasUsablePassword: true);
        await _snapshots.write(user: _user!, abilities: _abilitiesJson);
      }
      return ok(null);
    }
    if (r.isUnauthenticated) {
      await handleSessionRejected();
      return fail(const Failure.unauthenticated());
    }
    return fail(_failureFrom(r));
  });

  @override
  Future<Result<AuthUser>> refreshUser() => _guard(() async {
    final r = await _allauth.getSession();
    if (r.isOk && r.user != null) {
      _user = r.user;
      await _snapshots.write(user: _user!, abilities: _abilitiesJson);
      return ok(_user!);
    }
    if (r.isUnauthenticated || r.sessionGone) {
      await handleSessionRejected();
      return fail(const Failure.unauthenticated());
    }
    return fail(_failureFrom(r));
  });
}
