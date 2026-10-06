// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pending_flow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PendingFlow {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PendingFlow);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PendingFlow()';
}


}

/// @nodoc
class $PendingFlowCopyWith<$Res>  {
$PendingFlowCopyWith(PendingFlow _, $Res Function(PendingFlow) __);
}


/// Adds pattern-matching-related methods to [PendingFlow].
extension PendingFlowPatterns on PendingFlow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( VerifyEmail value)?  verifyEmail,TResult Function( MfaAuthenticate value)?  mfaAuthenticate,TResult Function( LoginByCode value)?  loginByCode,TResult Function( ProviderSignup value)?  providerSignup,TResult Function( UnsupportedFlow value)?  unsupported,required TResult orElse(),}){
final _that = this;
switch (_that) {
case VerifyEmail() when verifyEmail != null:
return verifyEmail(_that);case MfaAuthenticate() when mfaAuthenticate != null:
return mfaAuthenticate(_that);case LoginByCode() when loginByCode != null:
return loginByCode(_that);case ProviderSignup() when providerSignup != null:
return providerSignup(_that);case UnsupportedFlow() when unsupported != null:
return unsupported(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( VerifyEmail value)  verifyEmail,required TResult Function( MfaAuthenticate value)  mfaAuthenticate,required TResult Function( LoginByCode value)  loginByCode,required TResult Function( ProviderSignup value)  providerSignup,required TResult Function( UnsupportedFlow value)  unsupported,}){
final _that = this;
switch (_that) {
case VerifyEmail():
return verifyEmail(_that);case MfaAuthenticate():
return mfaAuthenticate(_that);case LoginByCode():
return loginByCode(_that);case ProviderSignup():
return providerSignup(_that);case UnsupportedFlow():
return unsupported(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( VerifyEmail value)?  verifyEmail,TResult? Function( MfaAuthenticate value)?  mfaAuthenticate,TResult? Function( LoginByCode value)?  loginByCode,TResult? Function( ProviderSignup value)?  providerSignup,TResult? Function( UnsupportedFlow value)?  unsupported,}){
final _that = this;
switch (_that) {
case VerifyEmail() when verifyEmail != null:
return verifyEmail(_that);case MfaAuthenticate() when mfaAuthenticate != null:
return mfaAuthenticate(_that);case LoginByCode() when loginByCode != null:
return loginByCode(_that);case ProviderSignup() when providerSignup != null:
return providerSignup(_that);case UnsupportedFlow() when unsupported != null:
return unsupported(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  verifyEmail,TResult Function( List<String> types)?  mfaAuthenticate,TResult Function()?  loginByCode,TResult Function()?  providerSignup,TResult Function( String id)?  unsupported,required TResult orElse(),}) {final _that = this;
switch (_that) {
case VerifyEmail() when verifyEmail != null:
return verifyEmail();case MfaAuthenticate() when mfaAuthenticate != null:
return mfaAuthenticate(_that.types);case LoginByCode() when loginByCode != null:
return loginByCode();case ProviderSignup() when providerSignup != null:
return providerSignup();case UnsupportedFlow() when unsupported != null:
return unsupported(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  verifyEmail,required TResult Function( List<String> types)  mfaAuthenticate,required TResult Function()  loginByCode,required TResult Function()  providerSignup,required TResult Function( String id)  unsupported,}) {final _that = this;
switch (_that) {
case VerifyEmail():
return verifyEmail();case MfaAuthenticate():
return mfaAuthenticate(_that.types);case LoginByCode():
return loginByCode();case ProviderSignup():
return providerSignup();case UnsupportedFlow():
return unsupported(_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  verifyEmail,TResult? Function( List<String> types)?  mfaAuthenticate,TResult? Function()?  loginByCode,TResult? Function()?  providerSignup,TResult? Function( String id)?  unsupported,}) {final _that = this;
switch (_that) {
case VerifyEmail() when verifyEmail != null:
return verifyEmail();case MfaAuthenticate() when mfaAuthenticate != null:
return mfaAuthenticate(_that.types);case LoginByCode() when loginByCode != null:
return loginByCode();case ProviderSignup() when providerSignup != null:
return providerSignup();case UnsupportedFlow() when unsupported != null:
return unsupported(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class VerifyEmail extends PendingFlow {
  const VerifyEmail(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyEmail);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PendingFlow.verifyEmail()';
}


}




/// @nodoc


class MfaAuthenticate extends PendingFlow {
  const MfaAuthenticate({ List<String> types = const <String>[]}): _types = types,super._();
  

 final  List<String> _types;
@JsonKey() List<String> get types {
  if (_types is EqualUnmodifiableListView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_types);
}


/// Create a copy of PendingFlow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MfaAuthenticateCopyWith<MfaAuthenticate> get copyWith => _$MfaAuthenticateCopyWithImpl<MfaAuthenticate>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is MfaAuthenticate&&const DeepCollectionEquality().equals(other.types, _types));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_types));
}

@override
String toString() {
    return 'PendingFlow.mfaAuthenticate(types: $types)';
}


}

/// @nodoc
abstract mixin class $MfaAuthenticateCopyWith<$Res> implements $PendingFlowCopyWith<$Res> {
  factory $MfaAuthenticateCopyWith(MfaAuthenticate value, $Res Function(MfaAuthenticate) _then) = _$MfaAuthenticateCopyWithImpl;
@useResult
$Res call({
 List<String> types
});




}
/// @nodoc
class _$MfaAuthenticateCopyWithImpl<$Res>
    implements $MfaAuthenticateCopyWith<$Res> {
  _$MfaAuthenticateCopyWithImpl(this._self, this._then);

  final MfaAuthenticate _self;
  final $Res Function(MfaAuthenticate) _then;

/// Create a copy of PendingFlow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? types = null,}) {
  return _then(MfaAuthenticate(
types: null == types ? _self._types : types // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class LoginByCode extends PendingFlow {
  const LoginByCode(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginByCode);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PendingFlow.loginByCode()';
}


}




/// @nodoc


class ProviderSignup extends PendingFlow {
  const ProviderSignup(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderSignup);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PendingFlow.providerSignup()';
}


}




/// @nodoc


class UnsupportedFlow extends PendingFlow {
  const UnsupportedFlow({required this.id}): super._();
  

 final  String id;

/// Create a copy of PendingFlow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnsupportedFlowCopyWith<UnsupportedFlow> get copyWith => _$UnsupportedFlowCopyWithImpl<UnsupportedFlow>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is UnsupportedFlow&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id);
}

@override
String toString() {
    return 'PendingFlow.unsupported(id: $id)';
}


}

/// @nodoc
abstract mixin class $UnsupportedFlowCopyWith<$Res> implements $PendingFlowCopyWith<$Res> {
  factory $UnsupportedFlowCopyWith(UnsupportedFlow value, $Res Function(UnsupportedFlow) _then) = _$UnsupportedFlowCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$UnsupportedFlowCopyWithImpl<$Res>
    implements $UnsupportedFlowCopyWith<$Res> {
  _$UnsupportedFlowCopyWithImpl(this._self, this._then);

  final UnsupportedFlow _self;
  final $Res Function(UnsupportedFlow) _then;

/// Create a copy of PendingFlow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(UnsupportedFlow(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
