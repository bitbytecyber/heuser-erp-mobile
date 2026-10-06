import 'package:dio/dio.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/core/network/safe_call.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_user.dart';
import 'package:heuser_erp_mobile/features/me/domain/abilities.dart';

/// `/api/v1/me/*`: the signed-in account's abilities, profile and flags.
class MeApi {
  /// Creates the api.
  MeApi(this._dio);

  final Dio _dio;

  /// `me/abilities/`
  static const abilities = 'api/v1/me/abilities/';

  /// `me/profile/`
  static const profile = 'api/v1/me/profile/';

  /// `me/feature-flags/`
  static const featureFlags = 'api/v1/me/feature-flags/';

  /// Roles, portals and capabilities. Also returns the raw JSON so the
  /// session snapshot can cache it verbatim.
  Future<Result<(Abilities, Map<String, dynamic>)>> fetchAbilities() =>
      safeCall(() async {
        final r = await _dio.get<Map<String, dynamic>>(abilities);
        final json = r.data ?? const {};
        return (Abilities.fromJson(json), json);
      });

  /// The account profile.
  Future<Result<AuthUser>> fetchProfile() => safeCall(() async {
    final r = await _dio.get<Map<String, dynamic>>(profile);
    final json = r.data ?? const {};
    // Some views wrap in {ok, data}; the profile does not, but be safe.
    final body = json['data'] is Map
        ? Map<String, dynamic>.from(json['data'] as Map)
        : json;
    return AuthUser.fromJson(body);
  });

  /// Waffle flags: `{flags: {name: bool}}`.
  Future<Result<Map<String, bool>>> fetchFeatureFlags() => safeCall(() async {
    final r = await _dio.get<Map<String, dynamic>>(featureFlags);
    final flags = r.data?['flags'];
    if (flags is! Map) return const {};
    return {for (final e in flags.entries) e.key.toString(): e.value == true};
  });
}
