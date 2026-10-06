import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// The user dismissed the Google picker, or Google reported a failure under
/// the `canceled` code (an unregistered SHA-1 arrives this way too). A real
/// dismissal has no [description]; a failure explains itself.
class GoogleSignInCancelled implements Exception {
  /// Creates the exception.
  const GoogleSignInCancelled([this.description]);

  /// Platform description, when any.
  final String? description;

  /// A failure wearing a cancel's clothes.
  bool get hasReason => description != null && description!.trim().isNotEmpty;
}

/// Google sign-in failed for a stated reason.
class GoogleSignInFailed implements Exception {
  /// Creates the exception.
  const GoogleSignInFailed(this.message);

  /// Reason.
  final String message;
}

/// Tokens from Google.
class GoogleTokens {
  /// Creates tokens.
  const GoogleTokens({
    required this.idToken,
    required this.email,
    this.displayName,
  });

  /// The JWT the backend verifies.
  final String idToken;

  /// Account email.
  final String email;

  /// Display name.
  final String? displayName;
}

/// Google Sign-In (v7 `initialize` / `authenticate` API). Talks only to
/// Google; the repository exchanges the id token with the backend.
class GoogleAuthService {
  /// Creates the service with the **web** client id (so the id token's `aud`
  /// is what the backend's `GOOGLE_OAUTH_CLIENT_ID` expects).
  GoogleAuthService({required this.serverClientId});

  /// Web OAuth client id; empty = read from google-services.json.
  final String serverClientId;

  bool _initialised = false;

  /// Whether the platform can authenticate.
  static bool get isSupported {
    try {
      return GoogleSignIn.instance.supportsAuthenticate();
    } on Object catch (_) {
      return false;
    }
  }

  Future<void> _ensureInitialised() async {
    if (_initialised) return;
    await GoogleSignIn.instance.initialize(
      serverClientId: serverClientId.trim().isEmpty
          ? null
          : serverClientId.trim(),
    );
    _initialised = true;
  }

  /// Shows the account picker and returns an id token.
  Future<GoogleTokens> signIn() async {
    if (!isSupported) {
      throw const GoogleSignInFailed(
        'Google sign-in is not available on this device.',
      );
    }
    await _ensureInitialised();
    try {
      final account = await GoogleSignIn.instance
          .authenticate(scopeHint: const ['email', 'profile', 'openid'])
          .timeout(const Duration(seconds: 60));
      final idToken = account.authentication.idToken;
      if (idToken == null || idToken.isEmpty) {
        throw const GoogleSignInFailed(
          'Google did not return an ID token. Check the web client id and the SHA-1 fingerprints in Firebase.',
        );
      }
      return GoogleTokens(
        idToken: idToken,
        email: account.email,
        displayName: account.displayName,
      );
    } on GoogleSignInException catch (e) {
      debugPrint('GoogleSignInException: ${e.code} - ${e.description}');
      if (e.code == GoogleSignInExceptionCode.canceled) {
        throw GoogleSignInCancelled(e.description);
      }
      throw GoogleSignInFailed(e.description ?? e.code.name);
    } on TimeoutException {
      throw const GoogleSignInFailed(
        'Google sign-in timed out. Please try again.',
      );
    }
  }

  /// Forgets the Google account on this device (sign-out).
  Future<void> signOut() async {
    if (!isSupported) return;
    try {
      await _ensureInitialised();
      await GoogleSignIn.instance.disconnect();
    } on Object catch (_) {
      // Best effort.
    }
  }
}
