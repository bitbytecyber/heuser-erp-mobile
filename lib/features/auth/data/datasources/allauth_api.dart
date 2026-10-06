import 'package:dio/dio.dart';
import 'package:heuser_erp_mobile/core/network/headers.dart';
import 'package:heuser_erp_mobile/features/auth/data/models/allauth_response.dart';

/// django-allauth headless **app client** (`/_allauth/app/v1/*`).
///
/// Every call reads statuses below 500 as data (`Options(validateStatus)`),
/// because allauth uses 401/409/410 as meaningful answers. Transport failures
/// and 5xx still throw `DioException` and are handled by the repository.
class AllauthApi {
  /// Creates the api over the shared [Dio].
  AllauthApi(this._dio);

  final Dio _dio;

  static const _base = '_allauth/app/v1/';

  /// `auth/login`
  static const login_ = '${_base}auth/login';

  /// `auth/signup`
  static const signup_ = '${_base}auth/signup';

  /// `auth/session`
  static const session = '${_base}auth/session';

  /// `auth/email/verify`
  static const emailVerify = '${_base}auth/email/verify';

  /// `auth/email/verify/resend`
  static const emailVerifyResend = '${_base}auth/email/verify/resend';

  /// `auth/2fa/authenticate`
  static const mfaAuthenticate_ = '${_base}auth/2fa/authenticate';

  /// `auth/code/request`
  static const codeRequest = '${_base}auth/code/request';

  /// `auth/code/confirm`
  static const codeConfirm = '${_base}auth/code/confirm';

  /// `auth/password/request`
  static const passwordRequest = '${_base}auth/password/request';

  /// `auth/password/reset`
  static const passwordReset = '${_base}auth/password/reset';

  /// `account/password/change`
  static const passwordChange = '${_base}account/password/change';

  /// `auth/provider/token`
  static const providerTokenPath = '${_base}auth/provider/token';

  static final Options _lenient = Options(
    validateStatus: (s) => s != null && s < 500,
  );

  Future<AllauthResponse> _post(
    String path,
    Map<String, dynamic> body, {
    Options? options,
  }) async {
    final r = await _dio.post<Map<String, dynamic>>(
      path,
      data: body,
      options: options ?? _lenient,
    );
    return AllauthResponse(r.statusCode ?? 0, r.data);
  }

  /// `POST auth/login {email, password}`.
  Future<AllauthResponse> login({
    required String email,
    required String password,
  }) => _post(login_, {
    'email': email.trim().toLowerCase(),
    'password': password,
  });

  /// `POST auth/signup`. allauth still validates `username`, so a random one
  /// is sent like the web does; the backend overwrites it anyway.
  Future<AllauthResponse> signup({
    required String email,
    required String password,
    required String username,
    String? firstName,
    String? lastName,
    String? cnic,
    String? phone,
  }) => _post(signup_, {
    'email': email.trim().toLowerCase(),
    'password': password,
    'username': username,
    if (firstName != null && firstName.trim().isNotEmpty)
      'first_name': firstName.trim(),
    if (lastName != null && lastName.trim().isNotEmpty)
      'last_name': lastName.trim(),
    if (cnic != null && cnic.trim().isNotEmpty) 'cnic': cnic.trim(),
    if (phone != null && phone.trim().isNotEmpty) 'phone': phone.trim(),
  });

  /// `GET auth/session`: 200 live, 401 not authenticated, 410 gone.
  Future<AllauthResponse> getSession() async {
    final r = await _dio.get<Map<String, dynamic>>(session, options: _lenient);
    return AllauthResponse(r.statusCode ?? 0, r.data);
  }

  /// `DELETE auth/session` with an explicit token (sign-out clears the store
  /// first). allauth answers 401 by design once it succeeds.
  Future<void> logout({String? sessionToken}) => _dio.delete<dynamic>(
    session,
    options: Options(
      validateStatus: (s) => s != null && s < 500,
      headers: sessionToken == null || sessionToken.isEmpty
          ? null
          : {HHeaders.sessionToken: sessionToken},
    ),
  );

  /// `POST auth/email/verify {key}`.
  Future<AllauthResponse> verifyEmail(String key) =>
      _post(emailVerify, {'key': key});

  /// `POST auth/email/verify/resend`.
  Future<AllauthResponse> resendVerification() =>
      _post(emailVerifyResend, const {});

  /// `POST auth/2fa/authenticate {code}`.
  Future<AllauthResponse> mfaAuthenticate(String code) =>
      _post(mfaAuthenticate_, {'code': code});

  /// `POST auth/code/request {email}`: 401 with pending `login_by_code` = sent.
  Future<AllauthResponse> requestLoginCode(String email) =>
      _post(codeRequest, {'email': email.trim().toLowerCase()});

  /// `POST auth/code/confirm {code}`.
  Future<AllauthResponse> confirmLoginCode(String code) =>
      _post(codeConfirm, {'code': code});

  /// `POST auth/password/request {email}`.
  Future<AllauthResponse> requestPasswordReset(String email) =>
      _post(passwordRequest, {'email': email.trim().toLowerCase()});

  /// `GET auth/password/reset` with the key header: 200 while valid.
  Future<AllauthResponse> getPasswordResetKeyInfo(String key) async {
    final r = await _dio.get<Map<String, dynamic>>(
      passwordReset,
      options: Options(
        validateStatus: (s) => s != null && s < 500,
        headers: {HHeaders.passwordResetKey: key},
      ),
    );
    return AllauthResponse(r.statusCode ?? 0, r.data);
  }

  /// `POST auth/password/reset {key, password}`: 401 is success (login-on-reset off).
  Future<AllauthResponse> resetPassword({
    required String key,
    required String password,
  }) => _post(passwordReset, {'key': key, 'password': password});

  /// `POST account/password/change`. `current_password` is omitted for
  /// accounts without one (social signups).
  Future<AllauthResponse> changePassword({
    required String newPassword,
    String? currentPassword,
  }) => _post(passwordChange, {
    if (currentPassword != null && currentPassword.isNotEmpty)
      'current_password': currentPassword,
    'new_password': newPassword,
  });

  /// `POST auth/provider/token {provider, process: login, token}`.
  Future<AllauthResponse> providerToken({
    required String provider,
    required Map<String, dynamic> token,
  }) => _post(providerTokenPath, {
    'provider': provider,
    'process': 'login',
    'token': token,
  });
}
