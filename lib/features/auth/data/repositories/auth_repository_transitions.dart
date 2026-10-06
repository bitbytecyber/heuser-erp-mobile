part of 'auth_repository_impl.dart';

/// Which kind of credential-mutating operation is running.
enum _Transition { signIn, signOut }

/// The serialisation of sign-in/sign-out and the response → outcome mapping.
///
/// Both mutate the same credential, so they must never overlap. Two real
/// failures drove this design in sms-flutter: a double-tapped login whose
/// second attempt cleared the token the first just stored, and a sign-out
/// whose trailing wipe landed in the middle of the next sign-in. A UI guard
/// cannot close either window, so the lock lives here.
mixin _AuthTransitions {
  AllauthApi get _allauth;
  SessionTokenStore get _tokens;
  AuthSignals get _signals;
  List<void Function()> get onLocalWipe;

  Future<Result<AuthOutcome>> _completeSignIn(AuthUser user);
  Future<Result<AuthOutcome>> _emitPending(AllauthResponse r, String email);
  Future<void> _wipeLocal();

  Future<void>? _inFlight;
  _Transition? _inFlightKind;

  /// Upper bound on how long one transition may hold the lock: an abandoned
  /// Google picker must not break the login button for the life of the process.
  static const Duration _ttl = Duration(seconds: 90);

  /// Same kind in flight → join it; different kind → queue behind it.
  Future<T> _runTransition<T>(_Transition kind, Future<T> Function() attempt) {
    final existing = _inFlight;
    if (existing != null && _inFlightKind == kind) {
      return existing.then(
        (_) => attempt(),
      ); // joined: re-run cheaply after the first finishes
    }
    final future = existing == null
        ? attempt()
        : existing.catchError((_) {}).then((_) => attempt());
    _track(kind, future);
    return future;
  }

  void _track(_Transition kind, Future<Object?> future) {
    final tracked = future.then((_) {}, onError: (_) {});
    _inFlight = tracked;
    _inFlightKind = kind;
    void release() {
      if (identical(_inFlight, tracked)) {
        _inFlight = null;
        _inFlightKind = null;
      }
    }

    tracked.whenComplete(release).ignore();
    Future<void>.delayed(_ttl).then((_) => release()).ignore();
  }

  /// A sign-in style transition: open the credential-swap window, wipe local
  /// state (the token must go or allauth answers 409), run the call, map it.
  Future<Result<AuthOutcome>> _signInTransition(
    Future<AllauthResponse> Function() call, {
    required String email,
  }) => _runTransition(_Transition.signIn, () async {
    try {
      _signals.beginCredentialSwap();
      await _wipeLocal();
      final response = await call();
      return await _handleAuthResponse(response, email: email);
    } on DioException catch (e) {
      return fail(FailureMapper.fromDio(e));
    } finally {
      _signals.endCredentialSwap();
    }
  });

  /// Runs a non-transition call, mapping transport failures.
  Future<Result<T>> _guard<T>(Future<Result<T>> Function() call) async {
    try {
      return await call();
    } on DioException catch (e) {
      return fail(FailureMapper.fromDio(e));
    } on Object catch (e) {
      return fail(Failure.unknown(cause: e));
    }
  }

  /// Maps an allauth envelope to an outcome or failure.
  Future<Result<AuthOutcome>> _handleAuthResponse(
    AllauthResponse r, {
    String? email,
  }) async {
    if (r.isOk || r.isAuthenticated) {
      final token = r.sessionToken;
      if (token != null) await _tokens.write(token);
      _signals.endCredentialSwap();
      var user = r.user;
      if (user == null) {
        final session = await _allauth.getSession();
        user = session.user;
      }
      if (user == null) {
        return fail(const Failure.unknown(cause: 'no user in session'));
      }
      return await _completeSignIn(user);
    }
    if (r.isConflict) {
      // "Already logged in": the pre-login wipe did not take, and the session
      // it objects to is one we can use.
      _signals.endCredentialSwap();
      final session = await _allauth.getSession();
      if (session.isOk && session.user != null) {
        return await _completeSignIn(session.user!);
      }
      await _wipeLocal();
      return fail(Failure.conflict(message: r.errorMessage));
    }
    if (r.isRateLimited) return fail(const Failure.rateLimited());
    if (r.sessionGone) {
      await _wipeLocal();
      return fail(Failure.unauthenticated(message: r.errorMessage));
    }
    if (r.statusCode == 401 && r.hasPendingFlow) {
      return await _emitPending(r, email ?? '');
    }
    if (r.statusCode == 401) {
      // allauth answers 401 for a verified-email-now-sign-in and for bad
      // credentials alike; without a flow and without an error it is the
      // former (e.g. right after `auth/email/verify`).
      if (r.errorMessage == null && r.sessionToken == null) {
        return ok(const AuthOutcome.signedOut(SignOutReason.none));
      }
      return fail(
        Failure.validation(
          code: r.errorCode ?? 'invalid_credentials',
          message: r.errorMessage,
          fieldErrors: r.fieldErrors,
        ),
      );
    }
    return fail(_failureFrom(r));
  }

  Failure _failureFrom(AllauthResponse r) {
    if (r.isRateLimited) return const Failure.rateLimited();
    if (r.statusCode == 403) return Failure.forbidden(message: r.errorMessage);
    if (r.statusCode == 404) return Failure.notFound(message: r.errorMessage);
    if (r.statusCode == 409) return Failure.conflict(message: r.errorMessage);
    if (r.statusCode >= 500) return Failure.server(status: r.statusCode);
    return Failure.validation(
      code: r.errorCode ?? 'invalid',
      message: r.errorMessage,
      fieldErrors: r.fieldErrors,
    );
  }

  /// 2·[bytes] hex characters from a secure RNG (allauth username).
  static String _randomHex(int bytes) {
    final rnd = Random.secure();
    return List.generate(
      bytes,
      (_) => rnd.nextInt(256).toRadixString(16).padLeft(2, '0'),
    ).join();
  }
}
