import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:heuser_erp_mobile/core/auth/session_token_store.dart';
import 'package:heuser_erp_mobile/core/network/failure_mapper.dart';
import 'package:heuser_erp_mobile/core/network/headers.dart';

/// Carries the allauth app-client session token and notices when the server
/// stops accepting it. Ported from sms-flutter; the reasoning there still
/// holds and is kept here.
///
/// * **onRequest**: attaches `X-Session-Token`. One immutable string, so
///   concurrent requests cannot race each other into an unauthenticated state.
/// * **onResponse / onError**: harvests `meta.session_token` from *any* body
///   (allauth rotates it on login, MFA and password change).
/// * **onError**: classifies 401 / 403 and reports a genuinely dead session.
///
/// The 401/403 split: 401 is allauth's "not authenticated" and is always a
/// dead session on `/api/v1/*`. 403 is ambiguous: DRF returns it both for "you
/// lack the capability" (live session) and "no credentials" (dead one); only
/// a body carrying `UNAUTHENTICATED` means the latter.
///
/// It reports rather than acts; the auth repository decides what a rejection
/// means. `/_allauth/*` is skipped entirely: a failed login is a 401 too.
class SessionTokenInterceptor extends Interceptor {
  /// Creates the interceptor.
  SessionTokenInterceptor(
    this._store, {
    this.onSessionRejected,
    this.credentialSwap,
  });

  /// How long a request waits for a credential swap before going out with
  /// whatever token exists. A hung sign-in must never wedge all networking.
  static const Duration _swapWait = Duration(seconds: 20);

  final SessionTokenStore _store;

  /// Called when the server rejected a token we actually hold.
  final void Function(Uri uri, int statusCode)? onSessionRejected;

  /// Open only while the credential is mid-swap (old token dropped, new one
  /// not yet stored). Requests wait it out rather than flying bare.
  final Future<void>? Function()? credentialSwap;

  static bool _isAuthEndpoint(RequestOptions o) =>
      o.uri.path.contains('/_allauth/');

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!_isAuthEndpoint(options)) {
      final swap = credentialSwap?.call();
      if (swap != null) {
        try {
          await swap.timeout(_swapWait);
        } on Object catch (_) {
          // Failed or timed out: proceed with whatever we have.
        }
      }
    }
    final token = _store.cachedToken ?? await _store.read();
    if (token != null && token.isNotEmpty) {
      options.headers[HHeaders.sessionToken] = token;
    } else if (!_isAuthEndpoint(options)) {
      debugPrint(
        'SessionToken: no token attached to ${options.method} ${options.uri.path}',
      );
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    _harvest(response.data, response.realUri);
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final response = err.response;
    if (response != null) {
      // allauth answers 401 *with* a rotated token for pending flows.
      _harvest(response.data, response.realUri);
      _reportIfRejected(response);
    }
    handler.next(err);
  }

  void _harvest(dynamic data, Uri uri) {
    final token = sessionTokenOf(data);
    if (token == null) return;
    unawaited(_store.write(token));
    debugPrint('SessionToken: stored rotated token from $uri');
  }

  void _reportIfRejected(Response<dynamic> response) {
    final code = response.statusCode ?? 0;
    if (code != 401 && code != 403) return;
    if (_isAuthEndpoint(response.requestOptions)) return;
    // Only a rejection of the token we hold *right now* counts: requests
    // outlive the session that issued them, and a late 403 from a previous
    // account must not wipe the new one's token.
    final current = _store.cachedToken;
    if (current == null) return;
    final sent = response.requestOptions.headers[HHeaders.sessionToken];
    if (sent is! String || sent != current) return;
    if (code == 403 && !FailureMapper.isUnauthenticatedBody(response.data)) {
      return;
    }
    debugPrint(
      'SessionToken: server rejected our token — $code ${response.realUri}',
    );
    onSessionRejected?.call(response.realUri, code);
  }

  /// `meta.session_token` from an allauth envelope, or `null`.
  static String? sessionTokenOf(dynamic data) {
    if (data is! Map) return null;
    final meta = data['meta'];
    if (meta is! Map) return null;
    final token = meta['session_token'];
    if (token is! String) return null;
    final trimmed = token.trim();
    return trimmed.isEmpty ? null : trimmed;
  }
}
