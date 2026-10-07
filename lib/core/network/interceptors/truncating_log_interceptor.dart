import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Debug-only request/response logging that cannot flood the log pipe: the
/// envelope (method, status, path, timing) in full, bodies capped. A full
/// body dump on a large payload janks the UI isolate and can drop a wireless
/// ADB session. Never installed in release builds.
class TruncatingLogInterceptor extends Interceptor {
  /// Creates the interceptor.
  TruncatingLogInterceptor({
    this.maxBodyChars = 500,
    void Function(String? message, {int? wrapWidth})? sink,
  }) : sink = sink ?? debugPrint;

  /// How much of a body survives.
  final int maxBodyChars;

  /// Where lines go (debugPrint by default; talker in the app).
  final void Function(String? message, {int? wrapWidth}) sink;

  static const _startKey = 'h_log_start';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.extra[_startKey] = DateTime.now();
    sink('→ ${options.method} ${options.uri}');
    final body = options.data;
    if (body != null && body is! FormData) {
      sink('  body: ${_clip(_redact(body as Object))}');
    }
    if (body is FormData) {
      sink(
        '  multipart: ${body.fields.map((f) => f.key).join(', ')} + ${body.files.length} file(s)',
      );
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    sink(
      '← ${response.statusCode} ${response.requestOptions.uri}${_elapsed(response.requestOptions)}',
    );
    final data = response.data;
    if (data != null) sink('  ${_clip(data)}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    sink(
      '× ${err.response?.statusCode ?? err.type.name} ${err.requestOptions.uri}${_elapsed(err.requestOptions)}',
    );
    final data = err.response?.data;
    if (data != null) sink('  ${_clip(data)}');
    if (data == null && err.message != null) sink('  ${_clip(err.message)}');
    handler.next(err);
  }

  String _elapsed(RequestOptions options) {
    final start = options.extra[_startKey];
    if (start is! DateTime) return '';
    return ' (${DateTime.now().difference(start).inMilliseconds}ms)';
  }

  String _clip(dynamic value) {
    String text;
    if (value is String) {
      text = value;
    } else {
      try {
        text = jsonEncode(value);
      } on Object catch (_) {
        text = value.toString();
      }
    }
    text = text.replaceAll('\n', ' ');
    if (text.length <= maxBodyChars) return text;
    return '${text.substring(0, maxBodyChars)}… (+${text.length - maxBodyChars} chars)';
  }

  /// Secrets never reach a log line, even in debug.
  static const _secretKeys = {
    'password',
    'new_password',
    'current_password',
    'key',
    'code',
    'id_token',
    'token',
    'pending_token',
  };

  static Object _redact(Object body) {
    if (body is Map) {
      return {
        for (final e in body.entries)
          e.key: _secretKeys.contains(e.key.toString())
              ? '***'
              : _redact(e.value as Object? ?? ''),
      };
    }
    if (body is List) {
      return [for (final v in body) _redact(v as Object? ?? '')];
    }
    return body;
  }
}
