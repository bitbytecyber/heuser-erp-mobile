// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_branding.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SiteBranding {

 String get name;@JsonKey(name: 'short_name') String get shortName; String get tagline; String? get logo;@JsonKey(name: 'logo_alt_text') String get logoAltText;@JsonKey(name: 'support_email') String get supportEmail;@JsonKey(name: 'support_phone') String get supportPhone; String get website;/// Raw `mobile_theme` block; decoded by the design system's codec.
@JsonKey(name: 'mobile_theme') Map<String, dynamic>? get mobileTheme;
/// Create a copy of SiteBranding
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SiteBrandingCopyWith<SiteBranding> get copyWith => _$SiteBrandingCopyWithImpl<SiteBranding>(this as SiteBranding, _$identity);

  /// Serializes this SiteBranding to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SiteBranding;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SiteBranding&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.shortName, _this.shortName) || other.shortName == _this.shortName)&&(identical(other.tagline, _this.tagline) || other.tagline == _this.tagline)&&(identical(other.logo, _this.logo) || other.logo == _this.logo)&&(identical(other.logoAltText, _this.logoAltText) || other.logoAltText == _this.logoAltText)&&(identical(other.supportEmail, _this.supportEmail) || other.supportEmail == _this.supportEmail)&&(identical(other.supportPhone, _this.supportPhone) || other.supportPhone == _this.supportPhone)&&(identical(other.website, _this.website) || other.website == _this.website)&&const DeepCollectionEquality().equals(other.mobileTheme, _this.mobileTheme));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SiteBranding;
  return Object.hash(runtimeType,_this.name,_this.shortName,_this.tagline,_this.logo,_this.logoAltText,_this.supportEmail,_this.supportPhone,_this.website,const DeepCollectionEquality().hash(_this.mobileTheme));
}

@override
String toString() {
  final _this = this as SiteBranding;
  return 'SiteBranding(name: ${_this.name}, shortName: ${_this.shortName}, tagline: ${_this.tagline}, logo: ${_this.logo}, logoAltText: ${_this.logoAltText}, supportEmail: ${_this.supportEmail}, supportPhone: ${_this.supportPhone}, website: ${_this.website}, mobileTheme: ${_this.mobileTheme})';
}


}

/// @nodoc
abstract mixin class $SiteBrandingCopyWith<$Res>  {
  factory $SiteBrandingCopyWith(SiteBranding value, $Res Function(SiteBranding) _then) = _$SiteBrandingCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(name: 'short_name') String shortName, String tagline, String? logo,@JsonKey(name: 'logo_alt_text') String logoAltText,@JsonKey(name: 'support_email') String supportEmail,@JsonKey(name: 'support_phone') String supportPhone, String website,@JsonKey(name: 'mobile_theme') Map<String, dynamic>? mobileTheme
});




}
/// @nodoc
class _$SiteBrandingCopyWithImpl<$Res>
    implements $SiteBrandingCopyWith<$Res> {
  _$SiteBrandingCopyWithImpl(this._self, this._then);

  final SiteBranding _self;
  final $Res Function(SiteBranding) _then;

/// Create a copy of SiteBranding
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? shortName = null,Object? tagline = null,Object? logo = freezed,Object? logoAltText = null,Object? supportEmail = null,Object? supportPhone = null,Object? website = null,Object? mobileTheme = freezed,}) {
  return _then(SiteBranding(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,shortName: null == shortName ? _self.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String,tagline: null == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,logoAltText: null == logoAltText ? _self.logoAltText : logoAltText // ignore: cast_nullable_to_non_nullable
as String,supportEmail: null == supportEmail ? _self.supportEmail : supportEmail // ignore: cast_nullable_to_non_nullable
as String,supportPhone: null == supportPhone ? _self.supportPhone : supportPhone // ignore: cast_nullable_to_non_nullable
as String,website: null == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String,mobileTheme: freezed == mobileTheme ? _self.mobileTheme : mobileTheme // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SiteBranding].
extension SiteBrandingPatterns on SiteBranding {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SiteBranding value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SiteBranding() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SiteBranding value)  $default,){
final _that = this;
switch (_that) {
case _SiteBranding():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SiteBranding value)?  $default,){
final _that = this;
switch (_that) {
case _SiteBranding() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'short_name')  String shortName,  String tagline,  String? logo, @JsonKey(name: 'logo_alt_text')  String logoAltText, @JsonKey(name: 'support_email')  String supportEmail, @JsonKey(name: 'support_phone')  String supportPhone,  String website, @JsonKey(name: 'mobile_theme')  Map<String, dynamic>? mobileTheme)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SiteBranding() when $default != null:
return $default(_that.name,_that.shortName,_that.tagline,_that.logo,_that.logoAltText,_that.supportEmail,_that.supportPhone,_that.website,_that.mobileTheme);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'short_name')  String shortName,  String tagline,  String? logo, @JsonKey(name: 'logo_alt_text')  String logoAltText, @JsonKey(name: 'support_email')  String supportEmail, @JsonKey(name: 'support_phone')  String supportPhone,  String website, @JsonKey(name: 'mobile_theme')  Map<String, dynamic>? mobileTheme)  $default,) {final _that = this;
switch (_that) {
case _SiteBranding():
return $default(_that.name,_that.shortName,_that.tagline,_that.logo,_that.logoAltText,_that.supportEmail,_that.supportPhone,_that.website,_that.mobileTheme);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(name: 'short_name')  String shortName,  String tagline,  String? logo, @JsonKey(name: 'logo_alt_text')  String logoAltText, @JsonKey(name: 'support_email')  String supportEmail, @JsonKey(name: 'support_phone')  String supportPhone,  String website, @JsonKey(name: 'mobile_theme')  Map<String, dynamic>? mobileTheme)?  $default,) {final _that = this;
switch (_that) {
case _SiteBranding() when $default != null:
return $default(_that.name,_that.shortName,_that.tagline,_that.logo,_that.logoAltText,_that.supportEmail,_that.supportPhone,_that.website,_that.mobileTheme);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SiteBranding extends SiteBranding {
  const _SiteBranding({this.name = 'Heuser College', @JsonKey(name: 'short_name') this.shortName = 'Heuser', this.tagline = '', this.logo, @JsonKey(name: 'logo_alt_text') this.logoAltText = '', @JsonKey(name: 'support_email') this.supportEmail = '', @JsonKey(name: 'support_phone') this.supportPhone = '', this.website = '', @JsonKey(name: 'mobile_theme')  Map<String, dynamic>? mobileTheme}): _mobileTheme = mobileTheme,super._();
  factory _SiteBranding.fromJson(Map<String, dynamic> json) => _$SiteBrandingFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey(name: 'short_name') final  String shortName;
@override@JsonKey() final  String tagline;
@override final  String? logo;
@override@JsonKey(name: 'logo_alt_text') final  String logoAltText;
@override@JsonKey(name: 'support_email') final  String supportEmail;
@override@JsonKey(name: 'support_phone') final  String supportPhone;
@override@JsonKey() final  String website;
/// Raw `mobile_theme` block; decoded by the design system's codec.
 final  Map<String, dynamic>? _mobileTheme;
/// Raw `mobile_theme` block; decoded by the design system's codec.
@override@JsonKey(name: 'mobile_theme') Map<String, dynamic>? get mobileTheme {
  final value = _mobileTheme;
  if (value == null) return null;
  if (_mobileTheme is EqualUnmodifiableMapView) return _mobileTheme;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of SiteBranding
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SiteBrandingCopyWith<_SiteBranding> get copyWith => __$SiteBrandingCopyWithImpl<_SiteBranding>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SiteBrandingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SiteBranding&&(identical(other.name, name) || other.name == name)&&(identical(other.shortName, shortName) || other.shortName == shortName)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.logoAltText, logoAltText) || other.logoAltText == logoAltText)&&(identical(other.supportEmail, supportEmail) || other.supportEmail == supportEmail)&&(identical(other.supportPhone, supportPhone) || other.supportPhone == supportPhone)&&(identical(other.website, website) || other.website == website)&&const DeepCollectionEquality().equals(other.mobileTheme, _mobileTheme));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,shortName,tagline,logo,logoAltText,supportEmail,supportPhone,website,const DeepCollectionEquality().hash(_mobileTheme));
}

@override
String toString() {
    return 'SiteBranding(name: $name, shortName: $shortName, tagline: $tagline, logo: $logo, logoAltText: $logoAltText, supportEmail: $supportEmail, supportPhone: $supportPhone, website: $website, mobileTheme: $mobileTheme)';
}


}

/// @nodoc
abstract mixin class _$SiteBrandingCopyWith<$Res> implements $SiteBrandingCopyWith<$Res> {
  factory _$SiteBrandingCopyWith(_SiteBranding value, $Res Function(_SiteBranding) _then) = __$SiteBrandingCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(name: 'short_name') String shortName, String tagline, String? logo,@JsonKey(name: 'logo_alt_text') String logoAltText,@JsonKey(name: 'support_email') String supportEmail,@JsonKey(name: 'support_phone') String supportPhone, String website,@JsonKey(name: 'mobile_theme') Map<String, dynamic>? mobileTheme
});




}
/// @nodoc
class __$SiteBrandingCopyWithImpl<$Res>
    implements _$SiteBrandingCopyWith<$Res> {
  __$SiteBrandingCopyWithImpl(this._self, this._then);

  final _SiteBranding _self;
  final $Res Function(_SiteBranding) _then;

/// Create a copy of SiteBranding
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? shortName = null,Object? tagline = null,Object? logo = freezed,Object? logoAltText = null,Object? supportEmail = null,Object? supportPhone = null,Object? website = null,Object? mobileTheme = freezed,}) {
  return _then(_SiteBranding(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,shortName: null == shortName ? _self.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String,tagline: null == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,logoAltText: null == logoAltText ? _self.logoAltText : logoAltText // ignore: cast_nullable_to_non_nullable
as String,supportEmail: null == supportEmail ? _self.supportEmail : supportEmail // ignore: cast_nullable_to_non_nullable
as String,supportPhone: null == supportPhone ? _self.supportPhone : supportPhone // ignore: cast_nullable_to_non_nullable
as String,website: null == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String,mobileTheme: freezed == mobileTheme ? _self._mobileTheme : mobileTheme // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
