import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:heuser_erp_mobile/core/auth/session_token_store.dart';
import 'package:heuser_erp_mobile/core/connectivity/connectivity_service.dart';
import 'package:heuser_erp_mobile/core/env/app_env.dart';
import 'package:heuser_erp_mobile/core/network/interceptors/network_error_interceptor.dart';
import 'package:heuser_erp_mobile/core/network/interceptors/session_token_interceptor.dart';
import 'package:heuser_erp_mobile/core/network/interceptors/transient_retry_interceptor.dart';
import 'package:heuser_erp_mobile/core/network/interceptors/truncating_log_interceptor.dart';

/// Builds the one [Dio] the app uses. Base URL is the backend origin; api
/// classes use paths relative to it (`api/v1/...`, `_allauth/app/v1/...`).
///
/// Interceptor order is load-bearing:
/// 1. [SessionTokenInterceptor] attaches/harvests the token and reports a
///    dead session;
/// 2. [TruncatingLogInterceptor] (debug only) logs what actually went out,
///    token included;
/// 3. [TransientRetryInterceptor] retries GET transport failures through
///    `dio.fetch`, so a retry re-enters the chain from the top;
/// 4. [NetworkErrorInterceptor] classifies the final outcome and feeds
///    connectivity, so it must see the *last* error, not a retried one.
abstract final class DioFactory {
  /// Creates the client.
  static Dio create({
    required AppEnv env,
    required SessionTokenStore tokenStore,
    required ConnectivityService connectivity,
    required void Function(Uri uri, int statusCode) onSessionRejected,
    required Future<void>? Function() credentialSwap,
    String? userAgent,
    void Function(String? message, {int? wrapWidth})? logSink,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: '${env.apiBaseUrl}/',
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 60),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'User-Agent': ?userAgent,
        },
      ),
    )..transformer = BackgroundTransformer();
    dio.interceptors.addAll([
      SessionTokenInterceptor(
        tokenStore,
        onSessionRejected: onSessionRejected,
        credentialSwap: credentialSwap,
      ),
      if (kDebugMode) TruncatingLogInterceptor(sink: logSink ?? debugPrint),
      TransientRetryInterceptor(dio, connectivity: connectivity),
      NetworkErrorInterceptor(connectivity),
    ]);
    return dio;
  }
}
