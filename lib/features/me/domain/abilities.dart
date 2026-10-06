import 'package:freezed_annotation/freezed_annotation.dart';

part 'abilities.freezed.dart';
part 'abilities.g.dart';

/// Which tab-set the app shows.
enum Portal {
  /// Applicant portal (`adm_apply.use`).
  apply,

  /// Enrolled-student portal (phase 2).
  student,

  /// Signed in, but no mobile portal for this account.
  none,
}

/// One role assignment.
@freezed
abstract class RoleMeta with _$RoleMeta {
  /// Creates a role.
  const factory RoleMeta({
    required String slug,
    @Default('') String name,
    @JsonKey(name: 'campus_id') int? campusId,
    @Default('') String portal,
  }) = _RoleMeta;

  /// From JSON.
  factory RoleMeta.fromJson(Map<String, dynamic> json) =>
      _$RoleMetaFromJson(json);
}

/// `GET /api/v1/me/abilities/`: the only source of permission in the app.
/// Capability keys are dotted (`adm_apply.use`, `device_token.manage`).
@freezed
abstract class Abilities with _$Abilities {
  /// Creates abilities.
  const factory Abilities({
    @Default('') String version,
    @JsonKey(name: 'is_superuser') @Default(false) bool isSuperuser,
    @Default(<RoleMeta>[]) List<RoleMeta> roles,
    @JsonKey(fromJson: _capabilityKeys, toJson: _capabilityKeysToJson)
    @Default(<String>{})
    Set<String> capabilities,
    @JsonKey(
      name: 'portals',
      fromJson: _defaultPortal,
      toJson: _defaultPortalToJson,
    )
    String? defaultPortalCode,
  }) = _Abilities;
  const Abilities._();

  /// From JSON.
  factory Abilities.fromJson(Map<String, dynamic> json) =>
      _$AbilitiesFromJson(json);

  /// Empty abilities (signed out / unknown).
  static const Abilities none = Abilities();

  /// Whether the account holds a capability (superusers hold all).
  bool has(String key) => isSuperuser || capabilities.contains(key);

  /// Which portal the app opens.
  Portal get portal {
    if (has('adm_apply.use')) return Portal.apply;
    if (has('dashboard.view_student')) return Portal.student;
    if (defaultPortalCode == 'apply') return Portal.apply;
    if (defaultPortalCode == 'student') return Portal.student;
    return Portal.none;
  }

  /// Push registration allowed (`device_token.manage`).
  bool get canRegisterDevice => has('device_token.manage');
}

Set<String> _capabilityKeys(Object? raw) {
  if (raw is! List) return const {};
  return {
    for (final e in raw)
      if (e is Map && e['key'] is String)
        e['key'] as String
      else if (e is String)
        e,
  };
}

List<Map<String, Object?>> _capabilityKeysToJson(Set<String> keys) => [
  for (final k in keys) {'key': k},
];

String? _defaultPortal(Object? raw) =>
    raw is Map ? raw['default_portal_code'] as String? : null;

Map<String, Object?> _defaultPortalToJson(String? code) => {
  'default_portal_code': code,
};
