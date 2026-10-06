import 'package:dio/dio.dart';
import 'package:heuser_erp_mobile/core/network/headers.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/core/network/safe_call.dart';
import 'package:heuser_erp_mobile/features/branding/domain/site_branding.dart';

/// Public `GET /api/v1/site-branding/`: name, logo, support contacts and the
/// `mobile_theme` policy. No session needed; fetched on every launch with a
/// short budget and cached by the repository.
class SiteBrandingApi {
  /// Creates the api.
  SiteBrandingApi(this._dio);

  final Dio _dio;

  /// `site-branding/`
  static const path = 'api/v1/site-branding/';

  /// Fetches the branding.
  Future<Result<SiteBranding>> fetch({Duration? timeout}) => safeCall(() async {
    final r = await _dio.get<Map<String, dynamic>>(
      path,
      options: Options(
        receiveTimeout: timeout,
        // Startup fetch: a retry ladder would only delay the first frame.
        extra: {HExtra.noRetry: timeout != null},
      ),
    );
    final json = r.data ?? const {};
    final body = json['data'] is Map
        ? Map<String, dynamic>.from(json['data'] as Map)
        : json;
    return SiteBranding.fromJson(body);
  });
}
