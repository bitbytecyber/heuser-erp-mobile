// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthStarted value)?  started,TResult Function( AuthSessionEventReceived value)?  sessionEventReceived,TResult Function( AuthSignOutRequested value)?  signOutRequested,TResult Function( AuthAppResumed value)?  appResumed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthStarted() when started != null:
return started(_that);case AuthSessionEventReceived() when sessionEventReceived != null:
return sessionEventReceived(_that);case AuthSignOutRequested() when signOutRequested != null:
return signOutRequested(_that);case AuthAppResumed() when appResumed != null:
return appResumed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthStarted value)  started,required TResult Function( AuthSessionEventReceived value)  sessionEventReceived,required TResult Function( AuthSignOutRequested value)  signOutRequested,required TResult Function( AuthAppResumed value)  appResumed,}){
final _that = this;
switch (_that) {
case AuthStarted():
return started(_that);case AuthSessionEventReceived():
return sessionEventReceived(_that);case AuthSignOutRequested():
return signOutRequested(_that);case AuthAppResumed():
return appResumed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthStarted value)?  started,TResult? Function( AuthSessionEventReceived value)?  sessionEventReceived,TResult? Function( AuthSignOutRequested value)?  signOutRequested,TResult? Function( AuthAppResumed value)?  appResumed,}){
final _that = this;
switch (_that) {
case AuthStarted() when started != null:
return started(_that);case AuthSessionEventReceived() when sessionEventReceived != null:
return sessionEventReceived(_that);case AuthSignOutRequested() when signOutRequested != null:
return signOutRequested(_that);case AuthAppResumed() when appResumed != null:
return appResumed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( SessionEvent event)?  sessionEventReceived,TResult Function()?  signOutRequested,TResult Function()?  appResumed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthStarted() when started != null:
return started();case AuthSessionEventReceived() when sessionEventReceived != null:
return sessionEventReceived(_that.event);case AuthSignOutRequested() when signOutRequested != null:
return signOutRequested();case AuthAppResumed() when appResumed != null:
return appResumed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( SessionEvent event)  sessionEventReceived,required TResult Function()  signOutRequested,required TResult Function()  appResumed,}) {final _that = this;
switch (_that) {
case AuthStarted():
return started();case AuthSessionEventReceived():
return sessionEventReceived(_that.event);case AuthSignOutRequested():
return signOutRequested();case AuthAppResumed():
return appResumed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( SessionEvent event)?  sessionEventReceived,TResult? Function()?  signOutRequested,TResult? Function()?  appResumed,}) {final _that = this;
switch (_that) {
case AuthStarted() when started != null:
return started();case AuthSessionEventReceived() when sessionEventReceived != null:
return sessionEventReceived(_that.event);case AuthSignOutRequested() when signOutRequested != null:
return signOutRequested();case AuthAppResumed() when appResumed != null:
return appResumed();case _:
  return null;

}
}

}

/// @nodoc


class AuthStarted implements AuthEvent {
  const AuthStarted();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthEvent.started()';
}


}




/// @nodoc


class AuthSessionEventReceived implements AuthEvent {
  const AuthSessionEventReceived(this.event);
  

 final  SessionEvent event;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthSessionEventReceivedCopyWith<AuthSessionEventReceived> get copyWith => _$AuthSessionEventReceivedCopyWithImpl<AuthSessionEventReceived>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSessionEventReceived&&(identical(other.event, event) || other.event == event));
}


@override
int get hashCode {
    return Object.hash(runtimeType,event);
}

@override
String toString() {
    return 'AuthEvent.sessionEventReceived(event: $event)';
}


}

/// @nodoc
abstract mixin class $AuthSessionEventReceivedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthSessionEventReceivedCopyWith(AuthSessionEventReceived value, $Res Function(AuthSessionEventReceived) _then) = _$AuthSessionEventReceivedCopyWithImpl;
@useResult
$Res call({
 SessionEvent event
});


$SessionEventCopyWith<$Res> get event;

}
/// @nodoc
class _$AuthSessionEventReceivedCopyWithImpl<$Res>
    implements $AuthSessionEventReceivedCopyWith<$Res> {
  _$AuthSessionEventReceivedCopyWithImpl(this._self, this._then);

  final AuthSessionEventReceived _self;
  final $Res Function(AuthSessionEventReceived) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? event = null,}) {
  return _then(AuthSessionEventReceived(
null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as SessionEvent,
  ));
}

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionEventCopyWith<$Res> get event {
  
  return $SessionEventCopyWith<$Res>(_self.event, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}

/// @nodoc


class AuthSignOutRequested implements AuthEvent {
  const AuthSignOutRequested();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSignOutRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthEvent.signOutRequested()';
}


}




/// @nodoc


class AuthAppResumed implements AuthEvent {
  const AuthAppResumed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthAppResumed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthEvent.appResumed()';
}


}




/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthUnknown value)?  unknown,TResult Function( AuthUnauthenticated value)?  unauthenticated,TResult Function( AuthPending value)?  pending,TResult Function( AuthAuthenticated value)?  authenticated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthUnknown() when unknown != null:
return unknown(_that);case AuthUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case AuthPending() when pending != null:
return pending(_that);case AuthAuthenticated() when authenticated != null:
return authenticated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthUnknown value)  unknown,required TResult Function( AuthUnauthenticated value)  unauthenticated,required TResult Function( AuthPending value)  pending,required TResult Function( AuthAuthenticated value)  authenticated,}){
final _that = this;
switch (_that) {
case AuthUnknown():
return unknown(_that);case AuthUnauthenticated():
return unauthenticated(_that);case AuthPending():
return pending(_that);case AuthAuthenticated():
return authenticated(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthUnknown value)?  unknown,TResult? Function( AuthUnauthenticated value)?  unauthenticated,TResult? Function( AuthPending value)?  pending,TResult? Function( AuthAuthenticated value)?  authenticated,}){
final _that = this;
switch (_that) {
case AuthUnknown() when unknown != null:
return unknown(_that);case AuthUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case AuthPending() when pending != null:
return pending(_that);case AuthAuthenticated() when authenticated != null:
return authenticated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  unknown,TResult Function( SignOutReason reason)?  unauthenticated,TResult Function( PendingFlow flow,  String email)?  pending,TResult Function( AuthUser user,  Abilities abilities,  Portal portal,  bool fromSnapshot)?  authenticated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthUnknown() when unknown != null:
return unknown();case AuthUnauthenticated() when unauthenticated != null:
return unauthenticated(_that.reason);case AuthPending() when pending != null:
return pending(_that.flow,_that.email);case AuthAuthenticated() when authenticated != null:
return authenticated(_that.user,_that.abilities,_that.portal,_that.fromSnapshot);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  unknown,required TResult Function( SignOutReason reason)  unauthenticated,required TResult Function( PendingFlow flow,  String email)  pending,required TResult Function( AuthUser user,  Abilities abilities,  Portal portal,  bool fromSnapshot)  authenticated,}) {final _that = this;
switch (_that) {
case AuthUnknown():
return unknown();case AuthUnauthenticated():
return unauthenticated(_that.reason);case AuthPending():
return pending(_that.flow,_that.email);case AuthAuthenticated():
return authenticated(_that.user,_that.abilities,_that.portal,_that.fromSnapshot);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  unknown,TResult? Function( SignOutReason reason)?  unauthenticated,TResult? Function( PendingFlow flow,  String email)?  pending,TResult? Function( AuthUser user,  Abilities abilities,  Portal portal,  bool fromSnapshot)?  authenticated,}) {final _that = this;
switch (_that) {
case AuthUnknown() when unknown != null:
return unknown();case AuthUnauthenticated() when unauthenticated != null:
return unauthenticated(_that.reason);case AuthPending() when pending != null:
return pending(_that.flow,_that.email);case AuthAuthenticated() when authenticated != null:
return authenticated(_that.user,_that.abilities,_that.portal,_that.fromSnapshot);case _:
  return null;

}
}

}

/// @nodoc


class AuthUnknown extends AuthState {
  const AuthUnknown(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUnknown);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthState.unknown()';
}


}




/// @nodoc


class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated({this.reason = SignOutReason.none}): super._();
  

@JsonKey() final  SignOutReason reason;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthUnauthenticatedCopyWith<AuthUnauthenticated> get copyWith => _$AuthUnauthenticatedCopyWithImpl<AuthUnauthenticated>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUnauthenticated&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode {
    return Object.hash(runtimeType,reason);
}

@override
String toString() {
    return 'AuthState.unauthenticated(reason: $reason)';
}


}

/// @nodoc
abstract mixin class $AuthUnauthenticatedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthUnauthenticatedCopyWith(AuthUnauthenticated value, $Res Function(AuthUnauthenticated) _then) = _$AuthUnauthenticatedCopyWithImpl;
@useResult
$Res call({
 SignOutReason reason
});




}
/// @nodoc
class _$AuthUnauthenticatedCopyWithImpl<$Res>
    implements $AuthUnauthenticatedCopyWith<$Res> {
  _$AuthUnauthenticatedCopyWithImpl(this._self, this._then);

  final AuthUnauthenticated _self;
  final $Res Function(AuthUnauthenticated) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reason = null,}) {
  return _then(AuthUnauthenticated(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as SignOutReason,
  ));
}


}

/// @nodoc


class AuthPending extends AuthState {
  const AuthPending({required this.flow, required this.email}): super._();
  

 final  PendingFlow flow;
 final  String email;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthPendingCopyWith<AuthPending> get copyWith => _$AuthPendingCopyWithImpl<AuthPending>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthPending&&(identical(other.flow, flow) || other.flow == flow)&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode {
    return Object.hash(runtimeType,flow,email);
}

@override
String toString() {
    return 'AuthState.pending(flow: $flow, email: $email)';
}


}

/// @nodoc
abstract mixin class $AuthPendingCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthPendingCopyWith(AuthPending value, $Res Function(AuthPending) _then) = _$AuthPendingCopyWithImpl;
@useResult
$Res call({
 PendingFlow flow, String email
});


$PendingFlowCopyWith<$Res> get flow;

}
/// @nodoc
class _$AuthPendingCopyWithImpl<$Res>
    implements $AuthPendingCopyWith<$Res> {
  _$AuthPendingCopyWithImpl(this._self, this._then);

  final AuthPending _self;
  final $Res Function(AuthPending) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? flow = null,Object? email = null,}) {
  return _then(AuthPending(
flow: null == flow ? _self.flow : flow // ignore: cast_nullable_to_non_nullable
as PendingFlow,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of AuthState
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


class AuthAuthenticated extends AuthState {
  const AuthAuthenticated({required this.user, required this.abilities, required this.portal, this.fromSnapshot = false}): super._();
  

 final  AuthUser user;
 final  Abilities abilities;
 final  Portal portal;
@JsonKey() final  bool fromSnapshot;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthAuthenticatedCopyWith<AuthAuthenticated> get copyWith => _$AuthAuthenticatedCopyWithImpl<AuthAuthenticated>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthAuthenticated&&(identical(other.user, user) || other.user == user)&&(identical(other.abilities, abilities) || other.abilities == abilities)&&(identical(other.portal, portal) || other.portal == portal)&&(identical(other.fromSnapshot, fromSnapshot) || other.fromSnapshot == fromSnapshot));
}


@override
int get hashCode {
    return Object.hash(runtimeType,user,abilities,portal,fromSnapshot);
}

@override
String toString() {
    return 'AuthState.authenticated(user: $user, abilities: $abilities, portal: $portal, fromSnapshot: $fromSnapshot)';
}


}

/// @nodoc
abstract mixin class $AuthAuthenticatedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthAuthenticatedCopyWith(AuthAuthenticated value, $Res Function(AuthAuthenticated) _then) = _$AuthAuthenticatedCopyWithImpl;
@useResult
$Res call({
 AuthUser user, Abilities abilities, Portal portal, bool fromSnapshot
});


$AuthUserCopyWith<$Res> get user;$AbilitiesCopyWith<$Res> get abilities;

}
/// @nodoc
class _$AuthAuthenticatedCopyWithImpl<$Res>
    implements $AuthAuthenticatedCopyWith<$Res> {
  _$AuthAuthenticatedCopyWithImpl(this._self, this._then);

  final AuthAuthenticated _self;
  final $Res Function(AuthAuthenticated) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? abilities = null,Object? portal = null,Object? fromSnapshot = null,}) {
  return _then(AuthAuthenticated(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AuthUser,abilities: null == abilities ? _self.abilities : abilities // ignore: cast_nullable_to_non_nullable
as Abilities,portal: null == portal ? _self.portal : portal // ignore: cast_nullable_to_non_nullable
as Portal,fromSnapshot: null == fromSnapshot ? _self.fromSnapshot : fromSnapshot // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserCopyWith<$Res> get user {
  
  return $AuthUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AbilitiesCopyWith<$Res> get abilities {
  
  return $AbilitiesCopyWith<$Res>(_self.abilities, (value) {
    return _then(_self.copyWith(abilities: value));
  });
}
}

// dart format on
