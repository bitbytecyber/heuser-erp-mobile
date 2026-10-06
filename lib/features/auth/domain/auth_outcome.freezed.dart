// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_outcome.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthOutcome {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthOutcome);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthOutcome()';
}


}

/// @nodoc
class $AuthOutcomeCopyWith<$Res>  {
$AuthOutcomeCopyWith(AuthOutcome _, $Res Function(AuthOutcome) __);
}


/// Adds pattern-matching-related methods to [AuthOutcome].
extension AuthOutcomePatterns on AuthOutcome {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Authenticated value)?  authenticated,TResult Function( SignedOut value)?  signedOut,TResult Function( Pending value)?  pending,TResult Function( SocialChoiceRequired value)?  socialChoiceRequired,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Authenticated() when authenticated != null:
return authenticated(_that);case SignedOut() when signedOut != null:
return signedOut(_that);case Pending() when pending != null:
return pending(_that);case SocialChoiceRequired() when socialChoiceRequired != null:
return socialChoiceRequired(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Authenticated value)  authenticated,required TResult Function( SignedOut value)  signedOut,required TResult Function( Pending value)  pending,required TResult Function( SocialChoiceRequired value)  socialChoiceRequired,}){
final _that = this;
switch (_that) {
case Authenticated():
return authenticated(_that);case SignedOut():
return signedOut(_that);case Pending():
return pending(_that);case SocialChoiceRequired():
return socialChoiceRequired(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Authenticated value)?  authenticated,TResult? Function( SignedOut value)?  signedOut,TResult? Function( Pending value)?  pending,TResult? Function( SocialChoiceRequired value)?  socialChoiceRequired,}){
final _that = this;
switch (_that) {
case Authenticated() when authenticated != null:
return authenticated(_that);case SignedOut() when signedOut != null:
return signedOut(_that);case Pending() when pending != null:
return pending(_that);case SocialChoiceRequired() when socialChoiceRequired != null:
return socialChoiceRequired(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AuthUser user,  Abilities abilities,  bool fromSnapshot)?  authenticated,TResult Function( SignOutReason reason)?  signedOut,TResult Function( PendingFlow flow,  String email)?  pending,TResult Function( SocialPrecheck precheck)?  socialChoiceRequired,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Authenticated() when authenticated != null:
return authenticated(_that.user,_that.abilities,_that.fromSnapshot);case SignedOut() when signedOut != null:
return signedOut(_that.reason);case Pending() when pending != null:
return pending(_that.flow,_that.email);case SocialChoiceRequired() when socialChoiceRequired != null:
return socialChoiceRequired(_that.precheck);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AuthUser user,  Abilities abilities,  bool fromSnapshot)  authenticated,required TResult Function( SignOutReason reason)  signedOut,required TResult Function( PendingFlow flow,  String email)  pending,required TResult Function( SocialPrecheck precheck)  socialChoiceRequired,}) {final _that = this;
switch (_that) {
case Authenticated():
return authenticated(_that.user,_that.abilities,_that.fromSnapshot);case SignedOut():
return signedOut(_that.reason);case Pending():
return pending(_that.flow,_that.email);case SocialChoiceRequired():
return socialChoiceRequired(_that.precheck);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AuthUser user,  Abilities abilities,  bool fromSnapshot)?  authenticated,TResult? Function( SignOutReason reason)?  signedOut,TResult? Function( PendingFlow flow,  String email)?  pending,TResult? Function( SocialPrecheck precheck)?  socialChoiceRequired,}) {final _that = this;
switch (_that) {
case Authenticated() when authenticated != null:
return authenticated(_that.user,_that.abilities,_that.fromSnapshot);case SignedOut() when signedOut != null:
return signedOut(_that.reason);case Pending() when pending != null:
return pending(_that.flow,_that.email);case SocialChoiceRequired() when socialChoiceRequired != null:
return socialChoiceRequired(_that.precheck);case _:
  return null;

}
}

}

/// @nodoc


class Authenticated implements AuthOutcome {
  const Authenticated({required this.user, required this.abilities, this.fromSnapshot = false});
  

 final  AuthUser user;
 final  Abilities abilities;
@JsonKey() final  bool fromSnapshot;

/// Create a copy of AuthOutcome
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticatedCopyWith<Authenticated> get copyWith => _$AuthenticatedCopyWithImpl<Authenticated>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Authenticated&&(identical(other.user, user) || other.user == user)&&(identical(other.abilities, abilities) || other.abilities == abilities)&&(identical(other.fromSnapshot, fromSnapshot) || other.fromSnapshot == fromSnapshot));
}


@override
int get hashCode {
    return Object.hash(runtimeType,user,abilities,fromSnapshot);
}

@override
String toString() {
    return 'AuthOutcome.authenticated(user: $user, abilities: $abilities, fromSnapshot: $fromSnapshot)';
}


}

/// @nodoc
abstract mixin class $AuthenticatedCopyWith<$Res> implements $AuthOutcomeCopyWith<$Res> {
  factory $AuthenticatedCopyWith(Authenticated value, $Res Function(Authenticated) _then) = _$AuthenticatedCopyWithImpl;
@useResult
$Res call({
 AuthUser user, Abilities abilities, bool fromSnapshot
});


$AuthUserCopyWith<$Res> get user;$AbilitiesCopyWith<$Res> get abilities;

}
/// @nodoc
class _$AuthenticatedCopyWithImpl<$Res>
    implements $AuthenticatedCopyWith<$Res> {
  _$AuthenticatedCopyWithImpl(this._self, this._then);

  final Authenticated _self;
  final $Res Function(Authenticated) _then;

/// Create a copy of AuthOutcome
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? abilities = null,Object? fromSnapshot = null,}) {
  return _then(Authenticated(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AuthUser,abilities: null == abilities ? _self.abilities : abilities // ignore: cast_nullable_to_non_nullable
as Abilities,fromSnapshot: null == fromSnapshot ? _self.fromSnapshot : fromSnapshot // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of AuthOutcome
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserCopyWith<$Res> get user {
  
  return $AuthUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of AuthOutcome
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AbilitiesCopyWith<$Res> get abilities {
  
  return $AbilitiesCopyWith<$Res>(_self.abilities, (value) {
    return _then(_self.copyWith(abilities: value));
  });
}
}

/// @nodoc


class SignedOut implements AuthOutcome {
  const SignedOut(this.reason);
  

 final  SignOutReason reason;

/// Create a copy of AuthOutcome
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignedOutCopyWith<SignedOut> get copyWith => _$SignedOutCopyWithImpl<SignedOut>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SignedOut&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode {
    return Object.hash(runtimeType,reason);
}

@override
String toString() {
    return 'AuthOutcome.signedOut(reason: $reason)';
}


}

/// @nodoc
abstract mixin class $SignedOutCopyWith<$Res> implements $AuthOutcomeCopyWith<$Res> {
  factory $SignedOutCopyWith(SignedOut value, $Res Function(SignedOut) _then) = _$SignedOutCopyWithImpl;
@useResult
$Res call({
 SignOutReason reason
});




}
/// @nodoc
class _$SignedOutCopyWithImpl<$Res>
    implements $SignedOutCopyWith<$Res> {
  _$SignedOutCopyWithImpl(this._self, this._then);

  final SignedOut _self;
  final $Res Function(SignedOut) _then;

/// Create a copy of AuthOutcome
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reason = null,}) {
  return _then(SignedOut(
null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as SignOutReason,
  ));
}


}

/// @nodoc


class Pending implements AuthOutcome {
  const Pending({required this.flow, required this.email});
  

 final  PendingFlow flow;
 final  String email;

/// Create a copy of AuthOutcome
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PendingCopyWith<Pending> get copyWith => _$PendingCopyWithImpl<Pending>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Pending&&(identical(other.flow, flow) || other.flow == flow)&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode {
    return Object.hash(runtimeType,flow,email);
}

@override
String toString() {
    return 'AuthOutcome.pending(flow: $flow, email: $email)';
}


}

/// @nodoc
abstract mixin class $PendingCopyWith<$Res> implements $AuthOutcomeCopyWith<$Res> {
  factory $PendingCopyWith(Pending value, $Res Function(Pending) _then) = _$PendingCopyWithImpl;
@useResult
$Res call({
 PendingFlow flow, String email
});


$PendingFlowCopyWith<$Res> get flow;

}
/// @nodoc
class _$PendingCopyWithImpl<$Res>
    implements $PendingCopyWith<$Res> {
  _$PendingCopyWithImpl(this._self, this._then);

  final Pending _self;
  final $Res Function(Pending) _then;

/// Create a copy of AuthOutcome
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? flow = null,Object? email = null,}) {
  return _then(Pending(
flow: null == flow ? _self.flow : flow // ignore: cast_nullable_to_non_nullable
as PendingFlow,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of AuthOutcome
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PendingFlowCopyWith<$Res> get flow {
  
  return $PendingFlowCopyWith<$Res>(_self.flow, (value) {
    return _then(_self.copyWith(flow: value));
  });
}
}

/// @nodoc


class SocialChoiceRequired implements AuthOutcome {
  const SocialChoiceRequired(this.precheck);
  

 final  SocialPrecheck precheck;

/// Create a copy of AuthOutcome
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SocialChoiceRequiredCopyWith<SocialChoiceRequired> get copyWith => _$SocialChoiceRequiredCopyWithImpl<SocialChoiceRequired>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SocialChoiceRequired&&(identical(other.precheck, precheck) || other.precheck == precheck));
}


@override
int get hashCode {
    return Object.hash(runtimeType,precheck);
}

@override
String toString() {
    return 'AuthOutcome.socialChoiceRequired(precheck: $precheck)';
}


}

/// @nodoc
abstract mixin class $SocialChoiceRequiredCopyWith<$Res> implements $AuthOutcomeCopyWith<$Res> {
  factory $SocialChoiceRequiredCopyWith(SocialChoiceRequired value, $Res Function(SocialChoiceRequired) _then) = _$SocialChoiceRequiredCopyWithImpl;
@useResult
$Res call({
 SocialPrecheck precheck
});


$SocialPrecheckCopyWith<$Res> get precheck;

}
/// @nodoc
class _$SocialChoiceRequiredCopyWithImpl<$Res>
    implements $SocialChoiceRequiredCopyWith<$Res> {
  _$SocialChoiceRequiredCopyWithImpl(this._self, this._then);

  final SocialChoiceRequired _self;
  final $Res Function(SocialChoiceRequired) _then;

/// Create a copy of AuthOutcome
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? precheck = null,}) {
  return _then(SocialChoiceRequired(
null == precheck ? _self.precheck : precheck // ignore: cast_nullable_to_non_nullable
as SocialPrecheck,
  ));
}

/// Create a copy of AuthOutcome
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
mixin _$SessionEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SessionEvent()';
}


}

/// @nodoc
class $SessionEventCopyWith<$Res>  {
$SessionEventCopyWith(SessionEvent _, $Res Function(SessionEvent) __);
}


/// Adds pattern-matching-related methods to [SessionEvent].
extension SessionEventPatterns on SessionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SessionSignedIn value)?  signedIn,TResult Function( SessionSignedOut value)?  signedOut,TResult Function( SessionPending value)?  pending,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SessionSignedIn() when signedIn != null:
return signedIn(_that);case SessionSignedOut() when signedOut != null:
return signedOut(_that);case SessionPending() when pending != null:
return pending(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SessionSignedIn value)  signedIn,required TResult Function( SessionSignedOut value)  signedOut,required TResult Function( SessionPending value)  pending,}){
final _that = this;
switch (_that) {
case SessionSignedIn():
return signedIn(_that);case SessionSignedOut():
return signedOut(_that);case SessionPending():
return pending(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SessionSignedIn value)?  signedIn,TResult? Function( SessionSignedOut value)?  signedOut,TResult? Function( SessionPending value)?  pending,}){
final _that = this;
switch (_that) {
case SessionSignedIn() when signedIn != null:
return signedIn(_that);case SessionSignedOut() when signedOut != null:
return signedOut(_that);case SessionPending() when pending != null:
return pending(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AuthUser user,  Abilities abilities,  bool fromSnapshot)?  signedIn,TResult Function( SignOutReason reason)?  signedOut,TResult Function( PendingFlow flow,  String email)?  pending,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SessionSignedIn() when signedIn != null:
return signedIn(_that.user,_that.abilities,_that.fromSnapshot);case SessionSignedOut() when signedOut != null:
return signedOut(_that.reason);case SessionPending() when pending != null:
return pending(_that.flow,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AuthUser user,  Abilities abilities,  bool fromSnapshot)  signedIn,required TResult Function( SignOutReason reason)  signedOut,required TResult Function( PendingFlow flow,  String email)  pending,}) {final _that = this;
switch (_that) {
case SessionSignedIn():
return signedIn(_that.user,_that.abilities,_that.fromSnapshot);case SessionSignedOut():
return signedOut(_that.reason);case SessionPending():
return pending(_that.flow,_that.email);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AuthUser user,  Abilities abilities,  bool fromSnapshot)?  signedIn,TResult? Function( SignOutReason reason)?  signedOut,TResult? Function( PendingFlow flow,  String email)?  pending,}) {final _that = this;
switch (_that) {
case SessionSignedIn() when signedIn != null:
return signedIn(_that.user,_that.abilities,_that.fromSnapshot);case SessionSignedOut() when signedOut != null:
return signedOut(_that.reason);case SessionPending() when pending != null:
return pending(_that.flow,_that.email);case _:
  return null;

}
}

}

/// @nodoc


class SessionSignedIn implements SessionEvent {
  const SessionSignedIn({required this.user, required this.abilities, this.fromSnapshot = false});
  

 final  AuthUser user;
 final  Abilities abilities;
@JsonKey() final  bool fromSnapshot;

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionSignedInCopyWith<SessionSignedIn> get copyWith => _$SessionSignedInCopyWithImpl<SessionSignedIn>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionSignedIn&&(identical(other.user, user) || other.user == user)&&(identical(other.abilities, abilities) || other.abilities == abilities)&&(identical(other.fromSnapshot, fromSnapshot) || other.fromSnapshot == fromSnapshot));
}


@override
int get hashCode {
    return Object.hash(runtimeType,user,abilities,fromSnapshot);
}

@override
String toString() {
    return 'SessionEvent.signedIn(user: $user, abilities: $abilities, fromSnapshot: $fromSnapshot)';
}


}

/// @nodoc
abstract mixin class $SessionSignedInCopyWith<$Res> implements $SessionEventCopyWith<$Res> {
  factory $SessionSignedInCopyWith(SessionSignedIn value, $Res Function(SessionSignedIn) _then) = _$SessionSignedInCopyWithImpl;
@useResult
$Res call({
 AuthUser user, Abilities abilities, bool fromSnapshot
});


$AuthUserCopyWith<$Res> get user;$AbilitiesCopyWith<$Res> get abilities;

}
/// @nodoc
class _$SessionSignedInCopyWithImpl<$Res>
    implements $SessionSignedInCopyWith<$Res> {
  _$SessionSignedInCopyWithImpl(this._self, this._then);

  final SessionSignedIn _self;
  final $Res Function(SessionSignedIn) _then;

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? abilities = null,Object? fromSnapshot = null,}) {
  return _then(SessionSignedIn(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AuthUser,abilities: null == abilities ? _self.abilities : abilities // ignore: cast_nullable_to_non_nullable
as Abilities,fromSnapshot: null == fromSnapshot ? _self.fromSnapshot : fromSnapshot // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserCopyWith<$Res> get user {
  
  return $AuthUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AbilitiesCopyWith<$Res> get abilities {
  
  return $AbilitiesCopyWith<$Res>(_self.abilities, (value) {
    return _then(_self.copyWith(abilities: value));
  });
}
}

/// @nodoc


class SessionSignedOut implements SessionEvent {
  const SessionSignedOut(this.reason);
  

 final  SignOutReason reason;

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionSignedOutCopyWith<SessionSignedOut> get copyWith => _$SessionSignedOutCopyWithImpl<SessionSignedOut>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionSignedOut&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode {
    return Object.hash(runtimeType,reason);
}

@override
String toString() {
    return 'SessionEvent.signedOut(reason: $reason)';
}


}

/// @nodoc
abstract mixin class $SessionSignedOutCopyWith<$Res> implements $SessionEventCopyWith<$Res> {
  factory $SessionSignedOutCopyWith(SessionSignedOut value, $Res Function(SessionSignedOut) _then) = _$SessionSignedOutCopyWithImpl;
@useResult
$Res call({
 SignOutReason reason
});




}
/// @nodoc
class _$SessionSignedOutCopyWithImpl<$Res>
    implements $SessionSignedOutCopyWith<$Res> {
  _$SessionSignedOutCopyWithImpl(this._self, this._then);

  final SessionSignedOut _self;
  final $Res Function(SessionSignedOut) _then;

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reason = null,}) {
  return _then(SessionSignedOut(
null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as SignOutReason,
  ));
}


}

/// @nodoc


class SessionPending implements SessionEvent {
  const SessionPending({required this.flow, required this.email});
  

 final  PendingFlow flow;
 final  String email;

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionPendingCopyWith<SessionPending> get copyWith => _$SessionPendingCopyWithImpl<SessionPending>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionPending&&(identical(other.flow, flow) || other.flow == flow)&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode {
    return Object.hash(runtimeType,flow,email);
}

@override
String toString() {
    return 'SessionEvent.pending(flow: $flow, email: $email)';
}


}

/// @nodoc
abstract mixin class $SessionPendingCopyWith<$Res> implements $SessionEventCopyWith<$Res> {
  factory $SessionPendingCopyWith(SessionPending value, $Res Function(SessionPending) _then) = _$SessionPendingCopyWithImpl;
@useResult
$Res call({
 PendingFlow flow, String email
});


$PendingFlowCopyWith<$Res> get flow;

}
/// @nodoc
class _$SessionPendingCopyWithImpl<$Res>
    implements $SessionPendingCopyWith<$Res> {
  _$SessionPendingCopyWithImpl(this._self, this._then);

  final SessionPending _self;
  final $Res Function(SessionPending) _then;

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? flow = null,Object? email = null,}) {
  return _then(SessionPending(
flow: null == flow ? _self.flow : flow // ignore: cast_nullable_to_non_nullable
as PendingFlow,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PendingFlowCopyWith<$Res> get flow {
  
  return $PendingFlowCopyWith<$Res>(_self.flow, (value) {
    return _then(_self.copyWith(flow: value));
  });
}
}

// dart format on
