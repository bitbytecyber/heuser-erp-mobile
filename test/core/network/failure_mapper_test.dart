import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart' hide Timeout;
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/core/network/failure_mapper.dart';

DioException _bad(int status, Object? body) {
  final opts = RequestOptions(path: '/api/v1/x/');
  return DioException(
    requestOptions: opts,
    type: DioExceptionType.badResponse,
    response: Response(requestOptions: opts, statusCode: status, data: body),
  );
}

void main() {
  group('FailureMapper.fromDio', () {
    test('transport failures depend on deviceOffline', () {
      final e = DioException(
        requestOptions: RequestOptions(path: '/'),
        type: DioExceptionType.connectionError,
      );
      expect(FailureMapper.fromDio(e), isA<Unreachable>());
      expect(
        FailureMapper.fromDio(e, deviceOffline: true),
        isA<NoConnection>(),
      );
      final t = DioException(
        requestOptions: RequestOptions(path: '/'),
        type: DioExceptionType.receiveTimeout,
      );
      expect(FailureMapper.fromDio(t), isA<Timeout>());
      final s = DioException(
        requestOptions: RequestOptions(path: '/'),
        error: const SocketException('x'),
      );
      expect(FailureMapper.fromDio(s), isA<Unreachable>());
      final c = DioException(
        requestOptions: RequestOptions(path: '/'),
        type: DioExceptionType.cancel,
      );
      expect(FailureMapper.fromDio(c), isA<Cancelled>());
    });

    test('an attached Failure wins', () {
      final e = DioException(
        requestOptions: RequestOptions(path: '/'),
        error: const Failure.rateLimited(),
      );
      expect(FailureMapper.fromDio(e), const Failure.rateLimited());
    });

    test('status codes', () {
      expect(
        FailureMapper.fromDio(_bad(401, {'detail': 'nope'})),
        isA<Unauthenticated>(),
      );
      expect(
        FailureMapper.fromDio(
          _bad(403, {'detail': 'You do not have permission'}),
        ),
        isA<Forbidden>(),
      );
      expect(
        FailureMapper.fromDio(_bad(403, {'code': 'UNAUTHENTICATED'})),
        isA<Unauthenticated>(),
      );
      expect(
        FailureMapper.fromDio(
          _bad(403, {
            'detail': 'Authentication credentials were not provided.',
          }),
        ),
        isA<Unauthenticated>(),
      );
      expect(FailureMapper.fromDio(_bad(404, null)), isA<NotFound>());
      expect(FailureMapper.fromDio(_bad(409, null)), isA<Conflict>());
      expect(FailureMapper.fromDio(_bad(429, null)), isA<RateLimited>());
      expect(
        FailureMapper.fromDio(_bad(500, '<html>')),
        const Failure.server(status: 500),
      );
      expect(
        FailureMapper.fromDio(_bad(503, {'code': 'module_disabled'})),
        isA<ModuleDisabled>(),
      );
    });

    test('admissions 400 {code, detail, details.fields}', () {
      final f = FailureMapper.fromDio(
        _bad(400, {
          'code': 'missing_fields',
          'detail': 'Some fields are missing',
          'details': {
            'fields': ['first_name', 'pA.cnic'],
          },
        }),
      );
      expect(f, isA<Validation>());
      final v = f as Validation;
      expect(v.code, 'missing_fields');
      expect(v.message, 'Some fields are missing');
      expect(v.missing, ['first_name', 'pA.cnic']);
    });

    test('DRF field errors and allauth errors become fieldErrors', () {
      final drf = FailureMapper.fromDio(
        _bad(400, {
          'email': ['Enter a valid email.'],
          'non_field_errors': ['x'],
        }),
      ) as Validation;
      expect(drf.fieldErrors['email'], 'Enter a valid email.');
      expect(drf.message, 'x');
      final allauth = FailureMapper.fromDio(
        _bad(400, {
          'errors': [
            {
              'message': 'Too short',
              'code': 'password_too_short',
              'param': 'password',
            },
          ],
        }),
      ) as Validation;
      expect(allauth.fieldErrors['password'], 'Too short');
      expect(allauth.message, 'Too short');
    });

    test('helpers', () {
      expect(const Failure.timeout().isConnectivity, isTrue);
      expect(const Failure.server().isTransient, isTrue);
      expect(const Failure.forbidden().isAuth, isTrue);
      expect(FailureMapper.extractServerMessage('<html>boom</html>'), isNull);
      expect(FailureMapper.extractServerMessage({'detail': ' hi '}), 'hi');
    });
  });
}
