// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_precheck.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SocialPrecheck {

 bool get known;@JsonKey(includeFromJson: false, includeToJson: false) SocialProvider get provider;@JsonKey(name: 'pending_token') String get pendingToken;@JsonKey(name: 'expires_in') int get expiresIn; String get email;@JsonKey(name: 'first_name') String get firstName;@JsonKey(name: 'last_name') String get lastName;@JsonKey(name: 'card_signup_enabled') bool get cardSignupEnabled;
/// Create a copy of SocialPrecheck
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SocialPrecheckCopyWith<SocialPrecheck> get copyWith => _$SocialPrecheckCopyWithImpl<SocialPrecheck>(this as SocialPrecheck, _$identity);

  /// Serializes this SocialPrecheck to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SocialPrecheck;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SocialPrecheck&&(identical(other.known, _this.known) || other.known == _this.known)&&(identical(other.provider, _this.provider) || other.provider == _this.provider)&&(identical(other.pendingToken, _this.pendingToken) || other.pendingToken == _this.pendingToken)&&(identical(other.expiresIn, _this.expiresIn) || other.expiresIn == _this.expiresIn)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.firstName, _this.firstName) || other.firstName == _this.firstName)&&(identical(other.lastName, _this.lastName) || other.lastName == _this.lastName)&&(identical(other.cardSignupEnabled, _this.cardSignupEnabled) || other.cardSignupEnabled == _this.cardSignupEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SocialPrecheck;
  return Object.hash(runtimeType,_this.known,_this.provider,_this.pendingToken,_this.expiresIn,_this.email,_this.firstName,_this.lastName,_this.cardSignupEnabled);
}

@override
String toString() {
  final _this = this as SocialPrecheck;
  return 'SocialPrecheck(known: ${_this.known}, provider: ${_this.provider}, pendingToken: ${_this.pendingToken}, expiresIn: ${_this.expiresIn}, email: ${_this.email}, firstName: ${_this.firstName}, lastName: ${_this.lastName}, cardSignupEnabled: ${_this.cardSignupEnabled})';
}


}

/// @nodoc
abstract mixin class $SocialPrecheckCopyWith<$Res>  {
  factory $SocialPrecheckCopyWith(SocialPrecheck value, $Res Function(SocialPrecheck) _then) = _$SocialPrecheckCopyWithImpl;
@useResult
$Res call({
 bool known,@JsonKey(includeFromJson: false, includeToJson: false) SocialProvider provider,@JsonKey(name: 'pending_token') String pendingToken,@JsonKey(name: 'expires_in') int expiresIn, String email,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName,@JsonKey(name: 'card_signup_enabled') bool cardSignupEnabled
});




}
/// @nodoc
class _$SocialPrecheckCopyWithImpl<$Res>
    implements $SocialPrecheckCopyWith<$Res> {
  _$SocialPrecheckCopyWithImpl(this._self, this._then);

  final SocialPrecheck _self;
  final $Res Function(SocialPrecheck) _then;

/// Create a copy of SocialPrecheck
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? known = null,Object? provider = null,Object? pendingToken = null,Object? expiresIn = null,Object? email = null,Object? firstName = null,Object? lastName = null,Object? cardSignupEnabled = null,}) {
  return _then(SocialPrecheck(
known: null == known ? _self.known : known // ignore: cast_nullable_to_non_nullable
as bool,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as SocialProvider,pendingToken: null == pendingToken ? _self.pendingToken : pendingToken // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,cardSignupEnabled: null == cardSignupEnabled ? _self.cardSignupEnabled : cardSignupEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SocialPrecheck].
extension SocialPrecheckPatterns on SocialPrecheck {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SocialPrecheck value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SocialPrecheck() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SocialPrecheck value)  $default,){
final _that = this;
switch (_that) {
case _SocialPrecheck():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SocialPrecheck value)?  $default,){
final _that = this;
switch (_that) {
case _SocialPrecheck() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool known, @JsonKey(includeFromJson: false, includeToJson: false)  SocialProvider provider, @JsonKey(name: 'pending_token')  String pendingToken, @JsonKey(name: 'expires_in')  int expiresIn,  String email, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'card_signup_enabled')  bool cardSignupEnabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SocialPrecheck() when $default != null:
return $default(_that.known,_that.provider,_that.pendingToken,_that.expiresIn,_that.email,_that.firstName,_that.lastName,_that.cardSignupEnabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool known, @JsonKey(includeFromJson: false, includeToJson: false)  SocialProvider provider, @JsonKey(name: 'pending_token')  String pendingToken, @JsonKey(name: 'expires_in')  int expiresIn,  String email, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'card_signup_enabled')  bool cardSignupEnabled)  $default,) {final _that = this;
switch (_that) {
case _SocialPrecheck():
return $default(_that.known,_that.provider,_that.pendingToken,_that.expiresIn,_that.email,_that.firstName,_that.lastName,_that.cardSignupEnabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool known, @JsonKey(includeFromJson: false, includeToJson: false)  SocialProvider provider, @JsonKey(name: 'pending_token')  String pendingToken, @JsonKey(name: 'expires_in')  int expiresIn,  String email, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'card_signup_enabled')  bool cardSignupEnabled)?  $default,) {final _that = this;
switch (_that) {
case _SocialPrecheck() when $default != null:
return $default(_that.known,_that.provider,_that.pendingToken,_that.expiresIn,_that.email,_that.firstName,_that.lastName,_that.cardSignupEnabled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SocialPrecheck extends SocialPrecheck {
  const _SocialPrecheck({required this.known, @JsonKey(includeFromJson: false, includeToJson: false) this.provider = SocialProvider.google, @JsonKey(name: 'pending_token') this.pendingToken = '', @JsonKey(name: 'expires_in') this.expiresIn = 0, this.email = '', @JsonKey(name: 'first_name') this.firstName = '', @JsonKey(name: 'last_name') this.lastName = '', @JsonKey(name: 'card_signup_enabled') this.cardSignupEnabled = false}): super._();
  factory _SocialPrecheck.fromJson(Map<String, dynamic> json) => _$SocialPrecheckFromJson(json);

@override final  bool known;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  SocialProvider provider;
@override@JsonKey(name: 'pending_token') final  String pendingToken;
@override@JsonKey(name: 'expires_in') final  int expiresIn;
@override@JsonKey() final  String email;
@override@JsonKey(name: 'first_name') final  String firstName;
@override@JsonKey(name: 'last_name') final  String lastName;
@override@JsonKey(name: 'card_signup_enabled') final  bool cardSignupEnabled;

/// Create a copy of SocialPrecheck
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SocialPrecheckCopyWith<_SocialPrecheck> get copyWith => __$SocialPrecheckCopyWithImpl<_SocialPrecheck>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SocialPrecheckToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SocialPrecheck&&(identical(other.known, known) || other.known == known)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.pendingToken, pendingToken) || other.pendingToken == pendingToken)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.cardSignupEnabled, cardSignupEnabled) || other.cardSignupEnabled == cardSignupEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,known,provider,pendingToken,expiresIn,email,firstName,lastName,cardSignupEnabled);
}

@override
String toString() {
    return 'SocialPrecheck(known: $known, provider: $provider, pendingToken: $pendingToken, expiresIn: $expiresIn, email: $email, firstName: $firstName, lastName: $lastName, cardSignupEnabled: $cardSignupEnabled)';
}


}

/// @nodoc
abstract mixin class _$SocialPrecheckCopyWith<$Res> implements $SocialPrecheckCopyWith<$Res> {
  factory _$SocialPrecheckCopyWith(_SocialPrecheck value, $Res Function(_SocialPrecheck) _then) = __$SocialPrecheckCopyWithImpl;
@override @useResult
$Res call({
 bool known,@JsonKey(includeFromJson: false, includeToJson: false) SocialProvider provider,@JsonKey(name: 'pending_token') String pendingToken,@JsonKey(name: 'expires_in') int expiresIn, String email,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName,@JsonKey(name: 'card_signup_enabled') bool cardSignupEnabled
});




}
/// @nodoc
class __$SocialPrecheckCopyWithImpl<$Res>
    implements _$SocialPrecheckCopyWith<$Res> {
  __$SocialPrecheckCopyWithImpl(this._self, this._then);

  final _SocialPrecheck _self;
  final $Res Function(_SocialPrecheck) _then;

/// Create a copy of SocialPrecheck
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? known = null,Object? provider = null,Object? pendingToken = null,Object? expiresIn = null,Object? email = null,Object? firstName = null,Object? lastName = null,Object? cardSignupEnabled = null,}) {
  return _then(_SocialPrecheck(
known: null == known ? _self.known : known // ignore: cast_nullable_to_non_nullable
as bool,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as SocialProvider,pendingToken: null == pendingToken ? _self.pendingToken : pendingToken // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,cardSignupEnabled: null == cardSignupEnabled ? _self.cardSignupEnabled : cardSignupEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
