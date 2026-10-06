import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

/// The user dismissed the Apple sheet.
class AppleSignInCancelled implements Exception {
  /// Creates the exception.
  const AppleSignInCancelled();
}

/// Apple sign-in failed.
class AppleSignInFailed implements Exception {
  /// Creates the exception.
  const AppleSignInFailed(this.message);

  /// Reason.
  final String message;
}

/// Tokens from Apple.
class AppleTokens {
  /// Creates tokens.
  const AppleTokens({
    required this.idToken,
    required this.authorizationCode,
    this.email,
    this.givenName,
    this.familyName,
    this.audience,
  });

  /// Identity JWT.
  final String idToken;

  /// Authorization code (sent as `access_token` to allauth).
  final String authorizationCode;

  /// Email: only on the **first** authorization.
  final String? email;

  /// Given name (first authorization only).
  final String? givenName;

  /// Family name (first authorization only).
  final String? familyName;

  /// `aud` of the JWT: the bundle id on native iOS.
  final String? audience;
}

/// Sign in with Apple (iOS only). Talks only to Apple.
class AppleAuthService {
  /// Creates the service.
  const AppleAuthService();

  /// Native Apple sign-in is iOS only in this app.
  static bool get isSupportedPlatform =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;

  /// Whether the device can show the sheet.
  Future<bool> isAvailable() async {
    if (!isSupportedPlatform) return false;
    try {
      return await SignInWithApple.isAvailable();
    } on Object catch (_) {
      return false;
    }
  }

  /// Shows the sheet.
  Future<AppleTokens> signIn() async {
    if (!await isAvailable()) {
      throw const AppleSignInFailed(
        'Sign in with Apple is not available on this device.',
      );
    }
    try {
      final c = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final idToken = c.identityToken;
      if (idToken == null || idToken.isEmpty) {
        throw const AppleSignInFailed(
          'Apple did not return an identity token.',
        );
      }
      return AppleTokens(
        idToken: idToken,
        authorizationCode: c.authorizationCode,
        email: c.email,
        givenName: c.givenName,
        familyName: c.familyName,
        audience: audienceOf(idToken),
      );
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled) {
        throw const AppleSignInCancelled();
      }
      throw AppleSignInFailed(e.message);
    }
  }

  /// `aud` claim of a JWT, or `null`.
  static String? audienceOf(String jwt) {
    try {
      final parts = jwt.split('.');
      if (parts.length < 2) return null;
      final payload = jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))),
      );
      if (payload is! Map) return null;
      final aud = payload['aud'];
      if (aud is String && aud.trim().isNotEmpty) return aud.trim();
      if (aud is List && aud.isNotEmpty) return aud.first.toString();
    } on Object catch (_) {
      // Malformed token: the configured client id is used instead.
    }
    return null;
  }
}
