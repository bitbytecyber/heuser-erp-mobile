// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_action_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthActionState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthActionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthActionState()';
}


}

/// @nodoc
class $AuthActionStateCopyWith<$Res>  {
$AuthActionStateCopyWith(AuthActionState _, $Res Function(AuthActionState) __);
}


/// Adds pattern-matching-related methods to [AuthActionState].
extension AuthActionStatePatterns on AuthActionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthActionIdle value)?  idle,TResult Function( AuthActionBusy value)?  busy,TResult Function( AuthActionFailed value)?  failed,TResult Function( AuthActionNeedsChoice value)?  needsChoice,TResult Function( AuthActionDone value)?  done,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthActionIdle() when idle != null:
return idle(_that);case AuthActionBusy() when busy != null:
return busy(_that);case AuthActionFailed() when failed != null:
return failed(_that);case AuthActionNeedsChoice() when needsChoice != null:
return needsChoice(_that);case AuthActionDone() when done != null:
return done(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthActionIdle value)  idle,required TResult Function( AuthActionBusy value)  busy,required TResult Function( AuthActionFailed value)  failed,required TResult Function( AuthActionNeedsChoice value)  needsChoice,required TResult Function( AuthActionDone value)  done,}){
final _that = this;
switch (_that) {
case AuthActionIdle():
return idle(_that);case AuthActionBusy():
return busy(_that);case AuthActionFailed():
return failed(_that);case AuthActionNeedsChoice():
return needsChoice(_that);case AuthActionDone():
return done(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthActionIdle value)?  idle,TResult? Function( AuthActionBusy value)?  busy,TResult? Function( AuthActionFailed value)?  failed,TResult? Function( AuthActionNeedsChoice value)?  needsChoice,TResult? Function( AuthActionDone value)?  done,}){
final _that = this;
switch (_that) {
case AuthActionIdle() when idle != null:
return idle(_that);case AuthActionBusy() when busy != null:
return busy(_that);case AuthActionFailed() when failed != null:
return failed(_that);case AuthActionNeedsChoice() when needsChoice != null:
return needsChoice(_that);case AuthActionDone() when done != null:
return done(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  busy,TResult Function( Failure failure)?  failed,TResult Function( SocialPrecheck precheck)?  needsChoice,TResult Function( AuthOutcome? outcome)?  done,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthActionIdle() when idle != null:
return idle();case AuthActionBusy() when busy != null:
return busy();case AuthActionFailed() when failed != null:
return failed(_that.failure);case AuthActionNeedsChoice() when needsChoice != null:
return needsChoice(_that.precheck);case AuthActionDone() when done != null:
return done(_that.outcome);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  busy,required TResult Function( Failure failure)  failed,required TResult Function( SocialPrecheck precheck)  needsChoice,required TResult Function( AuthOutcome? outcome)  done,}) {final _that = this;
switch (_that) {
case AuthActionIdle():
return idle();case AuthActionBusy():
return busy();case AuthActionFailed():
return failed(_that.failure);case AuthActionNeedsChoice():
return needsChoice(_that.precheck);case AuthActionDone():
return done(_that.outcome);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  busy,TResult? Function( Failure failure)?  failed,TResult? Function( SocialPrecheck precheck)?  needsChoice,TResult? Function( AuthOutcome? outcome)?  done,}) {final _that = this;
switch (_that) {
case AuthActionIdle() when idle != null:
return idle();case AuthActionBusy() when busy != null:
return busy();case AuthActionFailed() when failed != null:
return failed(_that.failure);case AuthActionNeedsChoice() when needsChoice != null:
return needsChoice(_that.precheck);case AuthActionDone() when done != null:
return done(_that.outcome);case _:
  return null;

}
}

}

/// @nodoc


class AuthActionIdle implements AuthActionState {
  const AuthActionIdle();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthActionIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthActionState.idle()';
}


}




/// @nodoc


class AuthActionBusy implements AuthActionState {
  const AuthActionBusy();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthActionBusy);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthActionState.busy()';
}


}




/// @nodoc


class AuthActionFailed implements AuthActionState {
  const AuthActionFailed(this.failure);
  

 final  Failure failure;

/// Create a copy of AuthActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthActionFailedCopyWith<AuthActionFailed> get copyWith => _$AuthActionFailedCopyWithImpl<AuthActionFailed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthActionFailed&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,failure);
}

@override
String toString() {
    return 'AuthActionState.failed(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $AuthActionFailedCopyWith<$Res> implements $AuthActionStateCopyWith<$Res> {
  factory $AuthActionFailedCopyWith(AuthActionFailed value, $Res Function(AuthActionFailed) _then) = _$AuthActionFailedCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$AuthActionFailedCopyWithImpl<$Res>
    implements $AuthActionFailedCopyWith<$Res> {
  _$AuthActionFailedCopyWithImpl(this._self, this._then);

  final AuthActionFailed _self;
  final $Res Function(AuthActionFailed) _then;

/// Create a copy of AuthActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(AuthActionFailed(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of AuthActionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res> get failure {
  
  return $FailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

/// @nodoc


class AuthActionNeedsChoice implements AuthActionState {
  const AuthActionNeedsChoice(this.precheck);
  

 final  SocialPrecheck precheck;

/// Create a copy of AuthActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthActionNeedsChoiceCopyWith<AuthActionNeedsChoice> get copyWith => _$AuthActionNeedsChoiceCopyWithImpl<AuthActionNeedsChoice>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthActionNeedsChoice&&(identical(other.precheck, precheck) || other.precheck == precheck));
}


@override
int get hashCode {
    return Object.hash(runtimeType,precheck);
}

@override
String toString() {
    return 'AuthActionState.needsChoice(precheck: $precheck)';
}


}

/// @nodoc
abstract mixin class $AuthActionNeedsChoiceCopyWith<$Res> implements $AuthActionStateCopyWith<$Res> {
  factory $AuthActionNeedsChoiceCopyWith(AuthActionNeedsChoice value, $Res Function(AuthActionNeedsChoice) _then) = _$AuthActionNeedsChoiceCopyWithImpl;
@useResult
$Res call({
 SocialPrecheck precheck
});


$SocialPrecheckCopyWith<$Res> get precheck;

}
/// @nodoc
class _$AuthActionNeedsChoiceCopyWithImpl<$Res>
    implements $AuthActionNeedsChoiceCopyWith<$Res> {
  _$AuthActionNeedsChoiceCopyWithImpl(this._self, this._then);

  final AuthActionNeedsChoice _self;
  final $Res Function(AuthActionNeedsChoice) _then;

/// Create a copy of AuthActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? precheck = null,}) {
  return _then(AuthActionNeedsChoice(
null == precheck ? _self.precheck : precheck // ignore: cast_nullable_to_non_nullable
as SocialPrecheck,
  ));
}

/// Create a copy of AuthActionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SocialPrecheckCopyWith<$Res> get precheck {
  
  return $SocialPrecheckCopyWith<$Res>(_self.precheck, (value) {
    return _then(_self.copyWith(precheck: value));
  });
}
}

/// @nodoc


class AuthActionDone implements AuthActionState {
  const AuthActionDone({this.outcome});
  

 final  AuthOutcome? outcome;

/// Create a copy of AuthActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthActionDoneCopyWith<AuthActionDone> get copyWith => _$AuthActionDoneCopyWithImpl<AuthActionDone>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthActionDone&&(identical(other.outcome, outcome) || other.outcome == outcome));
}


@override
int get hashCode {
    return Object.hash(runtimeType,outcome);
}

@override
String toString() {
    return 'AuthActionState.done(outcome: $outcome)';
}


}

/// @nodoc
abstract mixin class $AuthActionDoneCopyWith<$Res> implements $AuthActionStateCopyWith<$Res> {
  factory $AuthActionDoneCopyWith(AuthActionDone value, $Res Function(AuthActionDone) _then) = _$AuthActionDoneCopyWithImpl;
@useResult
$Res call({
 AuthOutcome? outcome
});


$AuthOutcomeCopyWith<$Res>? get outcome;

}
/// @nodoc
class _$AuthActionDoneCopyWithImpl<$Res>
    implements $AuthActionDoneCopyWith<$Res> {
  _$AuthActionDoneCopyWithImpl(this._self, this._then);

  final AuthActionDone _self;
  final $Res Function(AuthActionDone) _then;

/// Create a copy of AuthActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? outcome = freezed,}) {
  return _then(AuthActionDone(
outcome: freezed == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as AuthOutcome?,
  ));
}

/// Create a copy of AuthActionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthOutcomeCopyWith<$Res>? get outcome {
    if (_self.outcome == null) {
    return null;
  }

  return $AuthOutcomeCopyWith<$Res>(_self.outcome!, (value) {
    return _then(_self.copyWith(outcome: value));
  });
}
}

// dart format on
