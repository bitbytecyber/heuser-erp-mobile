// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoleMeta _$RoleMetaFromJson(Map<String, dynamic> json) => _RoleMeta(
  slug: json['slug'] as String,
  name: json['name'] as String? ?? '',
  campusId: (json['campus_id'] as num?)?.toInt(),
  portal: json['portal'] as String? ?? '',
);

Map<String, dynamic> _$RoleMetaToJson(_RoleMeta instance) => <String, dynamic>{
  'slug': instance.slug,
  'name': instance.name,
  'campus_id': instance.campusId,
  'portal': instance.portal,
};

_Abilities _$AbilitiesFromJson(Map<String, dynamic> json) => _Abilities(
  version: json['version'] as String? ?? '',
  isSuperuser: json['is_superuser'] as bool? ?? false,
  roles:
      (json['roles'] as List<dynamic>?)
          ?.map((e) => RoleMeta.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <RoleMeta>[],
  capabilities: json['capabilities'] == null
      ? const <String>{}
      : _capabilityKeys(json['capabilities']),
  defaultPortalCode: _defaultPortal(json['portals']),
);

Map<String, dynamic> _$AbilitiesToJson(_Abilities instance) =>
    <String, dynamic>{
      'version': instance.version,
      'is_superuser': instance.isSuperuser,
      'roles': instance.roles.map((e) => e.toJson()).toList(),
      'capabilities': _capabilityKeysToJson(instance.capabilities),
      'portals': _defaultPortalToJson(instance.defaultPortalCode),
    };
