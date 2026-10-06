import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';

/// Turns transport and HTTP outcomes into a [Failure], once, at the edge of
/// the network layer. Ported from sms-flutter's `NetworkFailure.fromDio` and
/// extended with this backend's error envelopes.
abstract final class FailureMapper {
  /// Classifies a [DioException]. [deviceOffline] comes from the connectivity
  /// service and is the only thing that turns a transport failure into
  /// [NoConnection]: `connectivity_plus` alone is never proof either way.
  static Failure fromDio(DioException error, {bool deviceOffline = false}) {
    final attached = error.error;
    if (attached is Failure) return attached;
    final uri = error.requestOptions.uri;
    Failure transport() => deviceOffline
        ? Failure.noConnection(uri: uri)
        : Failure.unreachable(uri: uri);
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.transformTimeout:
        return deviceOffline
            ? Failure.noConnection(uri: uri)
            : Failure.timeout(uri: uri);
      case DioExceptionType.connectionError:
      case DioExceptionType.badCertificate:
        return transport();
      case DioExceptionType.cancel:
        return const Failure.cancelled();
      case DioExceptionType.badResponse:
        return fromResponse(error.response);
      case DioExceptionType.unknown:
        final inner = error.error;
        if (inner is SocketException ||
            inner is HandshakeException ||
            inner is HttpException) {
          return transport();
        }
        if (inner is TimeoutException) return Failure.timeout(uri: uri);
        return Failure.unknown(cause: error);
    }
  }

  /// Classifies a non-2xx [Response].
  static Failure fromResponse(Response<dynamic>? response) {
    final code = response?.statusCode;
    final data = response?.data;
    final message = extractServerMessage(data);
    if (code == null) return Failure.unknown(cause: response);
    if (code == 503 && data is Map && data['code'] == 'module_disabled') {
      return const Failure.moduleDisabled(code: 'module_disabled');
    }
    if (code >= 500) return Failure.server(status: code);
    return switch (code) {
      401 => Failure.unauthenticated(message: message),
      403 =>
        isUnauthenticatedBody(data)
            ? Failure.unauthenticated(message: message)
            : Failure.forbidden(message: message),
      404 => Failure.notFound(message: message),
      409 => Failure.conflict(message: message),
      429 => const Failure.rateLimited(),
      400 || 422 => validationFrom(data, message: message),
      _ => Failure.unknown(cause: response),
    };
  }

  /// Builds a [Validation] failure from any of the backend's error bodies.
  static Failure validationFrom(dynamic data, {String? message}) {
    if (data is! Map) {
      return Failure.validation(code: 'invalid', message: message);
    }
    final map = data.cast<Object?, Object?>();
    // Admissions: {code, detail, details: {fields?: [...], ...}}
    final code = map['code'];
    final details = map['details'];
    final missing = <String>[];
    if (details is Map) {
      final fields = details['fields'] ?? details['missing'];
      if (fields is List) missing.addAll(fields.map((e) => e.toString()));
    }
    final fieldErrors = <String, String>{};
    // allauth: {errors: [{code, message, param}]}
    final errors = map['errors'];
    if (errors is List) {
      for (final e in errors) {
        if (e is Map && e['param'] != null && e['message'] != null) {
          fieldErrors.putIfAbsent(
            e['param'].toString(),
            () => e['message'].toString(),
          );
        }
      }
    }
    // DRF: {field: ["msg"], non_field_errors: [...]}
    for (final entry in map.entries) {
      final k = entry.key;
      final v = entry.value;
      if (k is! String ||
          k == 'code' ||
          k == 'detail' ||
          k == 'details' ||
          k == 'errors') {
        continue;
      }
      if (v is List && v.isNotEmpty) {
        fieldErrors.putIfAbsent(k, () => v.first.toString());
      }
      if (v is String && k != 'message') fieldErrors.putIfAbsent(k, () => v);
    }
    return Failure.validation(
      code: code is String && code.isNotEmpty ? code : 'invalid',
      message: message,
      details: details is Map ? Map<String, dynamic>.from(details) : null,
      missing: missing,
      fieldErrors: fieldErrors,
    );
  }

  /// Whether a 403 body means "no credentials" rather than "not allowed".
  static bool isUnauthenticatedBody(dynamic data) {
    if (data is! Map) return false;
    for (final key in const ['code', 'error']) {
      if (data[key]?.toString().toUpperCase() == 'UNAUTHENTICATED') return true;
    }
    final detail = data['detail']?.toString().toLowerCase() ?? '';
    return detail.contains('authentication credentials were not provided');
  }

  /// Pulls a human message out of an allauth / DRF / admissions error body.
  static String? extractServerMessage(dynamic data) {
    if (data is String) {
      final trimmed = data.trim();
      if (trimmed.isEmpty || trimmed.startsWith('<')) return null;
      return trimmed.length > 200 ? null : trimmed;
    }
    if (data is! Map) return null;
    final errors = data['errors'];
    if (errors is List && errors.isNotEmpty) {
      final first = errors.first;
      if (first is Map && first['message'] != null) {
        return first['message'].toString();
      }
      if (first is String) return first;
    }
    for (final key in const [
      'detail',
      'message',
      'error',
      'non_field_errors',
    ]) {
      final value = data[key];
      if (value is String && value.trim().isNotEmpty) return value.trim();
      if (value is List && value.isNotEmpty) return value.first.toString();
    }
    return null;
  }
}
