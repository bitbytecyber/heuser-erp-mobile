part of 'auth_repository_impl.dart';

/// Google / Apple: provider → precheck → (choice) → `provider/token`.
///
/// The precheck exists so an unknown identity never becomes an account
/// silently: the person must say "Apply for admission" first. The provider
/// token is kept in memory between the precheck and that choice.
mixin _SocialFlows on _AuthTransitions {
  SocialAuthApi get _social;
  AppEnv get _env;
  GoogleAuthService? get _google;
  AppleAuthService? get _apple;
  @override
  Future<Result<AuthOutcome>> _handleAuthResponse(
    AllauthResponse r, {
    String? email,
  });

  ({SocialProvider provider, Map<String, dynamic> token})? _lastProviderToken;

  Future<Result<AuthOutcome>> loginWithGoogle() =>
      _runTransition(_Transition.signIn, () async {
        final google = _google;
        if (google == null) {
          return fail(const Failure.unknown(cause: 'google unavailable'));
        }
        if (_env.googleWebClientId.trim().isEmpty) {
          return fail(
            const Failure.validation(
              code: 'google_not_configured',
              message: 'Google sign-in is not configured for this build.',
            ),
          );
        }
        final GoogleTokens tokens;
        try {
          tokens = await google.signIn();
        } on GoogleSignInCancelled catch (e) {
          return fail(
            e.hasReason
                ? Failure.validation(
                    code: 'google_failed',
                    message: e.description,
                  )
                : const Failure.cancelled(),
          );
        } on GoogleSignInFailed catch (e) {
          return fail(
            Failure.validation(code: 'google_failed', message: e.message),
          );
        }
        return await _exchange(SocialProvider.google, {
          'id_token': tokens.idToken,
          'client_id': _env.googleWebClientId.trim(),
        }, email: tokens.email);
      });

  Future<Result<AuthOutcome>> loginWithApple() =>
      _runTransition(_Transition.signIn, () async {
        final apple = _apple;
        if (apple == null || !AppleAuthService.isSupportedPlatform) {
          return fail(
            const Failure.validation(
              code: 'apple_unavailable',
              message: 'Sign in with Apple is only available on iOS.',
            ),
          );
        }
        final AppleTokens tokens;
        try {
          tokens = await apple.signIn();
        } on AppleSignInCancelled {
          return fail(const Failure.cancelled());
        } on AppleSignInFailed catch (e) {
          return fail(
            Failure.validation(code: 'apple_failed', message: e.message),
          );
        }
        final clientId = (tokens.audience?.trim().isNotEmpty ?? false)
            ? tokens.audience!.trim()
            : _env.appleClientId.trim();
        return await _exchange(SocialProvider.apple, {
          'id_token': tokens.idToken,
          'client_id': clientId,
          if (tokens.authorizationCode.isNotEmpty)
            'access_token': tokens.authorizationCode,
        }, email: tokens.email ?? '');
      });

  Future<Result<AuthOutcome>> createApplicantAndSignIn(String pendingToken) =>
      _runTransition(_Transition.signIn, () async {
        final last = _lastProviderToken;
        if (last == null) {
          return fail(
            const Failure.validation(
              code: 'social_expired',
              message: 'Please sign in with the provider again.',
            ),
          );
        }
        final created = await _social.createApplicant(pendingToken);
        return await created.fold(
          fail,
          (_) => _providerToken(last.provider, last.token, email: ''),
        );
      });

  Future<Result<AuthOutcome>> _exchange(
    SocialProvider provider,
    Map<String, dynamic> token, {
    required String email,
  }) async {
    // The precheck is an ordinary /api/v1 call: it must not run inside the
    // credential-swap window (it would wait on its own swap for 20 s).
    final precheck = await _social.precheckIdentity(
      provider: provider,
      token: token,
    );
    return await precheck.fold((f) async => fail(f), (p) async {
      if (!p.known) {
        _lastProviderToken = (provider: provider, token: token);
        return ok(AuthOutcome.socialChoiceRequired(p));
      }
      return await _providerToken(provider, token, email: email);
    });
  }

  Future<Result<AuthOutcome>> _providerToken(
    SocialProvider provider,
    Map<String, dynamic> token, {
    required String email,
  }) async {
    try {
      _signals.beginCredentialSwap();
      // The old token must go or allauth answers 409.
      await _wipeLocal();
      final r = await _allauth.providerToken(
        provider: provider.name,
        token: token,
      );
      final outcome = await _handleAuthResponse(r, email: email);
      if (outcome.isOk) _lastProviderToken = null;
      return outcome;
    } on DioException catch (e) {
      return fail(FailureMapper.fromDio(e));
    } on Object catch (e) {
      return fail(Failure.unknown(cause: e));
    } finally {
      _signals.endCredentialSwap();
    }
  }
}
