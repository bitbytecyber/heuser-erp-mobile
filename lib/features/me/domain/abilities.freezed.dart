// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'abilities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoleMeta {

 String get slug; String get name;@JsonKey(name: 'campus_id') int? get campusId; String get portal;
/// Create a copy of RoleMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoleMetaCopyWith<RoleMeta> get copyWith => _$RoleMetaCopyWithImpl<RoleMeta>(this as RoleMeta, _$identity);

  /// Serializes this RoleMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RoleMeta;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleMeta&&(identical(other.slug, _this.slug) || other.slug == _this.slug)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.campusId, _this.campusId) || other.campusId == _this.campusId)&&(identical(other.portal, _this.portal) || other.portal == _this.portal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RoleMeta;
  return Object.hash(runtimeType,_this.slug,_this.name,_this.campusId,_this.portal);
}

@override
String toString() {
  final _this = this as RoleMeta;
  return 'RoleMeta(slug: ${_this.slug}, name: ${_this.name}, campusId: ${_this.campusId}, portal: ${_this.portal})';
}


}

/// @nodoc
abstract mixin class $RoleMetaCopyWith<$Res>  {
  factory $RoleMetaCopyWith(RoleMeta value, $Res Function(RoleMeta) _then) = _$RoleMetaCopyWithImpl;
@useResult
$Res call({
 String slug, String name,@JsonKey(name: 'campus_id') int? campusId, String portal
});




}
/// @nodoc
class _$RoleMetaCopyWithImpl<$Res>
    implements $RoleMetaCopyWith<$Res> {
  _$RoleMetaCopyWithImpl(this._self, this._then);

  final RoleMeta _self;
  final $Res Function(RoleMeta) _then;

/// Create a copy of RoleMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slug = null,Object? name = null,Object? campusId = freezed,Object? portal = null,}) {
  return _then(RoleMeta(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,campusId: freezed == campusId ? _self.campusId : campusId // ignore: cast_nullable_to_non_nullable
as int?,portal: null == portal ? _self.portal : portal // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RoleMeta].
extension RoleMetaPatterns on RoleMeta {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoleMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoleMeta() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoleMeta value)  $default,){
final _that = this;
switch (_that) {
case _RoleMeta():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoleMeta value)?  $default,){
final _that = this;
switch (_that) {
case _RoleMeta() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String slug,  String name, @JsonKey(name: 'campus_id')  int? campusId,  String portal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoleMeta() when $default != null:
return $default(_that.slug,_that.name,_that.campusId,_that.portal);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String slug,  String name, @JsonKey(name: 'campus_id')  int? campusId,  String portal)  $default,) {final _that = this;
switch (_that) {
case _RoleMeta():
return $default(_that.slug,_that.name,_that.campusId,_that.portal);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String slug,  String name, @JsonKey(name: 'campus_id')  int? campusId,  String portal)?  $default,) {final _that = this;
switch (_that) {
case _RoleMeta() when $default != null:
return $default(_that.slug,_that.name,_that.campusId,_that.portal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoleMeta implements RoleMeta {
  const _RoleMeta({required this.slug, this.name = '', @JsonKey(name: 'campus_id') this.campusId, this.portal = ''});
  factory _RoleMeta.fromJson(Map<String, dynamic> json) => _$RoleMetaFromJson(json);

@override final  String slug;
@override@JsonKey() final  String name;
@override@JsonKey(name: 'campus_id') final  int? campusId;
@override@JsonKey() final  String portal;

/// Create a copy of RoleMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoleMetaCopyWith<_RoleMeta> get copyWith => __$RoleMetaCopyWithImpl<_RoleMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoleMetaToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoleMeta&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.campusId, campusId) || other.campusId == campusId)&&(identical(other.portal, portal) || other.portal == portal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,slug,name,campusId,portal);
}

@override
String toString() {
    return 'RoleMeta(slug: $slug, name: $name, campusId: $campusId, portal: $portal)';
}


}

/// @nodoc
abstract mixin class _$RoleMetaCopyWith<$Res> implements $RoleMetaCopyWith<$Res> {
  factory _$RoleMetaCopyWith(_RoleMeta value, $Res Function(_RoleMeta) _then) = __$RoleMetaCopyWithImpl;
@override @useResult
$Res call({
 String slug, String name,@JsonKey(name: 'campus_id') int? campusId, String portal
});




}
/// @nodoc
class __$RoleMetaCopyWithImpl<$Res>
    implements _$RoleMetaCopyWith<$Res> {
  __$RoleMetaCopyWithImpl(this._self, this._then);

  final _RoleMeta _self;
  final $Res Function(_RoleMeta) _then;

/// Create a copy of RoleMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slug = null,Object? name = null,Object? campusId = freezed,Object? portal = null,}) {
  return _then(_RoleMeta(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,campusId: freezed == campusId ? _self.campusId : campusId // ignore: cast_nullable_to_non_nullable
as int?,portal: null == portal ? _self.portal : portal // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Abilities {

 String get version;@JsonKey(name: 'is_superuser') bool get isSuperuser; List<RoleMeta> get roles;@JsonKey(fromJson: _capabilityKeys, toJson: _capabilityKeysToJson) Set<String> get capabilities;@JsonKey(name: 'portals', fromJson: _defaultPortal, toJson: _defaultPortalToJson) String? get defaultPortalCode;
/// Create a copy of Abilities
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AbilitiesCopyWith<Abilities> get copyWith => _$AbilitiesCopyWithImpl<Abilities>(this as Abilities, _$identity);

  /// Serializes this Abilities to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Abilities;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Abilities&&(identical(other.version, _this.version) || other.version == _this.version)&&(identical(other.isSuperuser, _this.isSuperuser) || other.isSuperuser == _this.isSuperuser)&&const DeepCollectionEquality().equals(other.roles, _this.roles)&&const DeepCollectionEquality().equals(other.capabilities, _this.capabilities)&&(identical(other.defaultPortalCode, _this.defaultPortalCode) || other.defaultPortalCode == _this.defaultPortalCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Abilities;
  return Object.hash(runtimeType,_this.version,_this.isSuperuser,const DeepCollectionEquality().hash(_this.roles),const DeepCollectionEquality().hash(_this.capabilities),_this.defaultPortalCode);
}

@override
String toString() {
  final _this = this as Abilities;
  return 'Abilities(version: ${_this.version}, isSuperuser: ${_this.isSuperuser}, roles: ${_this.roles}, capabilities: ${_this.capabilities}, defaultPortalCode: ${_this.defaultPortalCode})';
}


}

/// @nodoc
abstract mixin class $AbilitiesCopyWith<$Res>  {
  factory $AbilitiesCopyWith(Abilities value, $Res Function(Abilities) _then) = _$AbilitiesCopyWithImpl;
@useResult
$Res call({
 String version,@JsonKey(name: 'is_superuser') bool isSuperuser, List<RoleMeta> roles,@JsonKey(fromJson: _capabilityKeys, toJson: _capabilityKeysToJson) Set<String> capabilities,@JsonKey(name: 'portals', fromJson: _defaultPortal, toJson: _defaultPortalToJson) String? defaultPortalCode
});




}
/// @nodoc
class _$AbilitiesCopyWithImpl<$Res>
    implements $AbilitiesCopyWith<$Res> {
  _$AbilitiesCopyWithImpl(this._self, this._then);

  final Abilities _self;
  final $Res Function(Abilities) _then;

/// Create a copy of Abilities
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? isSuperuser = null,Object? roles = null,Object? capabilities = null,Object? defaultPortalCode = freezed,}) {
  return _then(Abilities(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,isSuperuser: null == isSuperuser ? _self.isSuperuser : isSuperuser // ignore: cast_nullable_to_non_nullable
as bool,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<RoleMeta>,capabilities: null == capabilities ? _self.capabilities : capabilities // ignore: cast_nullable_to_non_nullable
as Set<String>,defaultPortalCode: freezed == defaultPortalCode ? _self.defaultPortalCode : defaultPortalCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Abilities].
extension AbilitiesPatterns on Abilities {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Abilities value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Abilities() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Abilities value)  $default,){
final _that = this;
switch (_that) {
case _Abilities():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Abilities value)?  $default,){
final _that = this;
switch (_that) {
case _Abilities() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String version, @JsonKey(name: 'is_superuser')  bool isSuperuser,  List<RoleMeta> roles, @JsonKey(fromJson: _capabilityKeys, toJson: _capabilityKeysToJson)  Set<String> capabilities, @JsonKey(name: 'portals', fromJson: _defaultPortal, toJson: _defaultPortalToJson)  String? defaultPortalCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Abilities() when $default != null:
return $default(_that.version,_that.isSuperuser,_that.roles,_that.capabilities,_that.defaultPortalCode);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String version, @JsonKey(name: 'is_superuser')  bool isSuperuser,  List<RoleMeta> roles, @JsonKey(fromJson: _capabilityKeys, toJson: _capabilityKeysToJson)  Set<String> capabilities, @JsonKey(name: 'portals', fromJson: _defaultPortal, toJson: _defaultPortalToJson)  String? defaultPortalCode)  $default,) {final _that = this;
switch (_that) {
case _Abilities():
return $default(_that.version,_that.isSuperuser,_that.roles,_that.capabilities,_that.defaultPortalCode);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String version, @JsonKey(name: 'is_superuser')  bool isSuperuser,  List<RoleMeta> roles, @JsonKey(fromJson: _capabilityKeys, toJson: _capabilityKeysToJson)  Set<String> capabilities, @JsonKey(name: 'portals', fromJson: _defaultPortal, toJson: _defaultPortalToJson)  String? defaultPortalCode)?  $default,) {final _that = this;
switch (_that) {
case _Abilities() when $default != null:
return $default(_that.version,_that.isSuperuser,_that.roles,_that.capabilities,_that.defaultPortalCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Abilities extends Abilities {
  const _Abilities({this.version = '', @JsonKey(name: 'is_superuser') this.isSuperuser = false,  List<RoleMeta> roles = const <RoleMeta>[], @JsonKey(fromJson: _capabilityKeys, toJson: _capabilityKeysToJson)  Set<String> capabilities = const <String>{}, @JsonKey(name: 'portals', fromJson: _defaultPortal, toJson: _defaultPortalToJson) this.defaultPortalCode}): _roles = roles,_capabilities = capabilities,super._();
  factory _Abilities.fromJson(Map<String, dynamic> json) => _$AbilitiesFromJson(json);

@override@JsonKey() final  String version;
@override@JsonKey(name: 'is_superuser') final  bool isSuperuser;
 final  List<RoleMeta> _roles;
@override@JsonKey() List<RoleMeta> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}

 final  Set<String> _capabilities;
@override@JsonKey(fromJson: _capabilityKeys, toJson: _capabilityKeysToJson) Set<String> get capabilities {
  if (_capabilities is EqualUnmodifiableSetView) return _capabilities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_capabilities);
}

@override@JsonKey(name: 'portals', fromJson: _defaultPortal, toJson: _defaultPortalToJson) final  String? defaultPortalCode;

/// Create a copy of Abilities
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AbilitiesCopyWith<_Abilities> get copyWith => __$AbilitiesCopyWithImpl<_Abilities>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AbilitiesToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Abilities&&(identical(other.version, version) || other.version == version)&&(identical(other.isSuperuser, isSuperuser) || other.isSuperuser == isSuperuser)&&const DeepCollectionEquality().equals(other.roles, _roles)&&const DeepCollectionEquality().equals(other.capabilities, _capabilities)&&(identical(other.defaultPortalCode, defaultPortalCode) || other.defaultPortalCode == defaultPortalCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,version,isSuperuser,const DeepCollectionEquality().hash(_roles),const DeepCollectionEquality().hash(_capabilities),defaultPortalCode);
}

@override
String toString() {
    return 'Abilities(version: $version, isSuperuser: $isSuperuser, roles: $roles, capabilities: $capabilities, defaultPortalCode: $defaultPortalCode)';
}


}

/// @nodoc
abstract mixin class _$AbilitiesCopyWith<$Res> implements $AbilitiesCopyWith<$Res> {
  factory _$AbilitiesCopyWith(_Abilities value, $Res Function(_Abilities) _then) = __$AbilitiesCopyWithImpl;
@override @useResult
$Res call({
 String version,@JsonKey(name: 'is_superuser') bool isSuperuser, List<RoleMeta> roles,@JsonKey(fromJson: _capabilityKeys, toJson: _capabilityKeysToJson) Set<String> capabilities,@JsonKey(name: 'portals', fromJson: _defaultPortal, toJson: _defaultPortalToJson) String? defaultPortalCode
});




}
/// @nodoc
class __$AbilitiesCopyWithImpl<$Res>
    implements _$AbilitiesCopyWith<$Res> {
  __$AbilitiesCopyWithImpl(this._self, this._then);

  final _Abilities _self;
  final $Res Function(_Abilities) _then;

/// Create a copy of Abilities
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? isSuperuser = null,Object? roles = null,Object? capabilities = null,Object? defaultPortalCode = freezed,}) {
  return _then(_Abilities(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,isSuperuser: null == isSuperuser ? _self.isSuperuser : isSuperuser // ignore: cast_nullable_to_non_nullable
as bool,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<RoleMeta>,capabilities: null == capabilities ? _self._capabilities : capabilities // ignore: cast_nullable_to_non_nullable
as Set<String>,defaultPortalCode: freezed == defaultPortalCode ? _self.defaultPortalCode : defaultPortalCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
