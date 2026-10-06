import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_erp_mobile/features/auth/data/models/allauth_response.dart';
import 'package:heuser_erp_mobile/features/auth/domain/pending_flow.dart';

void main() {
  test('200 login carries user and token', () {
    final r = AllauthResponse(200, {
      'status': 200,
      'data': {
        'user': {
          'id': 7,
          'email': 'a@b.c',
          'first_name': 'Ayesha',
          'has_usable_password': true,
        },
      },
      'meta': {'is_authenticated': true, 'session_token': 'tok'},
    });
    expect(r.isOk, isTrue);
    expect(r.isAuthenticated, isTrue);
    expect(r.sessionToken, 'tok');
    expect(r.user?.id, 7);
    expect(r.user?.greetingName, 'Ayesha');
    expect(r.hasPendingFlow, isFalse);
  });

  test('401 with pending verify_email', () {
    final r = AllauthResponse(401, {
      'status': 401,
      'data': {
        'flows': [
          {'id': 'login'},
          {'id': 'verify_email', 'is_pending': true},
        ],
      },
      'meta': {'is_authenticated': false, 'session_token': 'pending-tok'},
    });
    expect(r.isUnauthenticated, isTrue);
    expect(r.pendingFlow, const PendingFlow.verifyEmail());
    expect(r.sessionToken, 'pending-tok');
  });

  test('401 with mfa types', () {
    final r = AllauthResponse(401, {
      'data': {
        'flows': [
          {
            'id': 'mfa_authenticate',
            'is_pending': true,
            'types': ['totp', 'recovery_codes'],
          },
        ],
      },
      'meta': {'is_authenticated': false},
    });
    final flow = r.pendingFlow;
    expect(flow, isA<MfaAuthenticate>());
    expect((flow! as MfaAuthenticate).types, ['totp', 'recovery_codes']);
  });

  test('errors expose message, code and field map', () {
    final r = AllauthResponse(400, {
      'status': 400,
      'errors': [
        {
          'message': 'Too short',
          'code': 'password_too_short',
          'param': 'password',
        },
        {'message': 'Bad email', 'code': 'invalid', 'param': 'email'},
      ],
    });
    expect(r.errorMessage, 'Too short');
    expect(r.errorCode, 'password_too_short');
    expect(r.fieldErrors, {'password': 'Too short', 'email': 'Bad email'});
  });

  test('status helpers', () {
    expect(AllauthResponse(409, const {}).isConflict, isTrue);
    expect(AllauthResponse(410, const {}).sessionGone, isTrue);
    expect(AllauthResponse(429, const {}).isRateLimited, isTrue);
    expect(
      AllauthResponse(401, {
        'meta': {'is_authenticated': true},
      }).requiresReauthentication,
      isTrue,
    );
    expect(AllauthResponse(200, null).user, isNull);
  });
}
