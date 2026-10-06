import 'package:dio/dio.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/core/network/safe_call.dart';
import 'package:heuser_erp_mobile/features/auth/domain/social_precheck.dart';

/// The backend's own social endpoints under `/api/v1/auth/social/*`
/// (`people/views_social.py`). Ordinary DRF semantics: 4xx throws into
/// [safeCall].
class SocialAuthApi {
  /// Creates the api.
  SocialAuthApi(this._dio);

  final Dio _dio;

  /// `auth/social/precheck/`
  static const precheck = 'api/v1/auth/social/precheck/';

  /// `auth/social/applicant/`
  static const applicant = 'api/v1/auth/social/applicant/';

  /// Is this provider identity known? Creates nothing.
  Future<Result<SocialPrecheck>> precheckIdentity({
    required SocialProvider provider,
    required Map<String, dynamic> token,
  }) => safeCall(() async {
    final r = await _dio.post<Map<String, dynamic>>(
      precheck,
      data: {'provider': provider.name, 'token': token},
    );
    return SocialPrecheck.fromJson(r.data ?? const {})
        .copyWith(provider: provider);
  });

  /// "Apply for admission": creates the applicant account only; the caller
  /// follows with `provider/token`.
  Future<Result<void>> createApplicant(String pendingToken) =>
      safeCall(() async {
        await _dio.post<Map<String, dynamic>>(
          applicant,
          data: {'pending_token': pendingToken},
        );
      });
}
