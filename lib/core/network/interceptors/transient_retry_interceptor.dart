import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:heuser_erp_mobile/core/connectivity/connectivity_service.dart';
import 'package:heuser_erp_mobile/core/network/headers.dart';

/// Retries **idempotent** requests that never reached the backend.
///
/// Scope is deliberately narrow (ported from sms-flutter):
/// - GET only; a retried write can create two records.
/// - Transport failures only; a 4xx/5xx is a real answer and passes through,
///   so this can never interfere with 401 handling.
/// - Never while the device is known offline, never after cancellation.
///
/// Backoff: original, then ~1 s, then ~2 s. The retry goes back through
/// `dio.fetch`, so the session-token interceptor re-attaches the current
/// token: a retry after a session change carries the new one.
class TransientRetryInterceptor extends Interceptor {
  /// Creates the interceptor.
  TransientRetryInterceptor(
    this._dio, {
    this._connectivity,
    this.backoff = const [Duration(seconds: 1), Duration(seconds: 2)],
  });

  final Dio _dio;
  final ConnectivityService? _connectivity;

  /// Delay before each retry; `backoff.length` retries after the first try.
  final List<Duration> backoff;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (!_shouldRetry(err)) {
      handler.next(err);
      return;
    }
    final options = err.requestOptions;
    final attempt = (options.extra[HExtra.retryAttempt] as int?) ?? 0;
    if (attempt >= backoff.length) {
      handler.next(err);
      return;
    }
    await Future<void>.delayed(backoff[attempt]);
    if ((options.cancelToken?.isCancelled ?? false) ||
        (_connectivity?.deviceOffline ?? false)) {
      handler.next(err);
      return;
    }
    options.extra[HExtra.retryAttempt] = attempt + 1;
    debugPrint(
      'TransientRetry: retry ${attempt + 1}/${backoff.length} for ${options.method} ${options.uri}',
    );
    try {
      handler.resolve(await _dio.fetch<dynamic>(options));
    } on DioException catch (retryError) {
      handler.next(retryError);
    } on Object catch (retryError, stackTrace) {
      handler.next(
        DioException(
          requestOptions: options,
          error: retryError,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  bool _shouldRetry(DioException err) {
    final o = err.requestOptions;
    if (o.extra[HExtra.noRetry] == true) return false;
    if (_connectivity?.deviceOffline ?? false) return false;
    if (o.method.toUpperCase() != 'GET') return false;
    if (o.cancelToken?.isCancelled ?? false) return false;
    return switch (err.type) {
      DioExceptionType.connectionError ||
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout => true,
      _ => false,
    };
  }
}
