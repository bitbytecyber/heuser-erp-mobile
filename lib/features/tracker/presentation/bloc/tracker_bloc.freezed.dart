// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracker_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrackerEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackerEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'TrackerEvent()';
}


}

/// @nodoc
class $TrackerEventCopyWith<$Res>  {
$TrackerEventCopyWith(TrackerEvent _, $Res Function(TrackerEvent) __);
}


/// Adds pattern-matching-related methods to [TrackerEvent].
extension TrackerEventPatterns on TrackerEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TrackerStarted value)?  started,TResult Function( TrackerRefreshed value)?  refreshed,TResult Function( TrackerApplicationUpdated value)?  applicationUpdated,TResult Function( TrackerInterviewBooked value)?  interviewBooked,TResult Function( TrackerTrialBooked value)?  trialBooked,TResult Function( TrackerResultUpdated value)?  resultUpdated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TrackerStarted() when started != null:
return started(_that);case TrackerRefreshed() when refreshed != null:
return refreshed(_that);case TrackerApplicationUpdated() when applicationUpdated != null:
return applicationUpdated(_that);case TrackerInterviewBooked() when interviewBooked != null:
return interviewBooked(_that);case TrackerTrialBooked() when trialBooked != null:
return trialBooked(_that);case TrackerResultUpdated() when resultUpdated != null:
return resultUpdated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TrackerStarted value)  started,required TResult Function( TrackerRefreshed value)  refreshed,required TResult Function( TrackerApplicationUpdated value)  applicationUpdated,required TResult Function( TrackerInterviewBooked value)  interviewBooked,required TResult Function( TrackerTrialBooked value)  trialBooked,required TResult Function( TrackerResultUpdated value)  resultUpdated,}){
final _that = this;
switch (_that) {
case TrackerStarted():
return started(_that);case TrackerRefreshed():
return refreshed(_that);case TrackerApplicationUpdated():
return applicationUpdated(_that);case TrackerInterviewBooked():
return interviewBooked(_that);case TrackerTrialBooked():
return trialBooked(_that);case TrackerResultUpdated():
return resultUpdated(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TrackerStarted value)?  started,TResult? Function( TrackerRefreshed value)?  refreshed,TResult? Function( TrackerApplicationUpdated value)?  applicationUpdated,TResult? Function( TrackerInterviewBooked value)?  interviewBooked,TResult? Function( TrackerTrialBooked value)?  trialBooked,TResult? Function( TrackerResultUpdated value)?  resultUpdated,}){
final _that = this;
switch (_that) {
case TrackerStarted() when started != null:
return started(_that);case TrackerRefreshed() when refreshed != null:
return refreshed(_that);case TrackerApplicationUpdated() when applicationUpdated != null:
return applicationUpdated(_that);case TrackerInterviewBooked() when interviewBooked != null:
return interviewBooked(_that);case TrackerTrialBooked() when trialBooked != null:
return trialBooked(_that);case TrackerResultUpdated() when resultUpdated != null:
return resultUpdated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  refreshed,TResult Function( Application application)?  applicationUpdated,TResult Function( String startsAt,  bool reschedule)?  interviewBooked,TResult Function( int booking,  int session)?  trialBooked,TResult Function( int resultId,  String grade)?  resultUpdated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TrackerStarted() when started != null:
return started();case TrackerRefreshed() when refreshed != null:
return refreshed();case TrackerApplicationUpdated() when applicationUpdated != null:
return applicationUpdated(_that.application);case TrackerInterviewBooked() when interviewBooked != null:
return interviewBooked(_that.startsAt,_that.reschedule);case TrackerTrialBooked() when trialBooked != null:
return trialBooked(_that.booking,_that.session);case TrackerResultUpdated() when resultUpdated != null:
return resultUpdated(_that.resultId,_that.grade);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  refreshed,required TResult Function( Application application)  applicationUpdated,required TResult Function( String startsAt,  bool reschedule)  interviewBooked,required TResult Function( int booking,  int session)  trialBooked,required TResult Function( int resultId,  String grade)  resultUpdated,}) {final _that = this;
switch (_that) {
case TrackerStarted():
return started();case TrackerRefreshed():
return refreshed();case TrackerApplicationUpdated():
return applicationUpdated(_that.application);case TrackerInterviewBooked():
return interviewBooked(_that.startsAt,_that.reschedule);case TrackerTrialBooked():
return trialBooked(_that.booking,_that.session);case TrackerResultUpdated():
return resultUpdated(_that.resultId,_that.grade);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  refreshed,TResult? Function( Application application)?  applicationUpdated,TResult? Function( String startsAt,  bool reschedule)?  interviewBooked,TResult? Function( int booking,  int session)?  trialBooked,TResult? Function( int resultId,  String grade)?  resultUpdated,}) {final _that = this;
switch (_that) {
case TrackerStarted() when started != null:
return started();case TrackerRefreshed() when refreshed != null:
return refreshed();case TrackerApplicationUpdated() when applicationUpdated != null:
return applicationUpdated(_that.application);case TrackerInterviewBooked() when interviewBooked != null:
return interviewBooked(_that.startsAt,_that.reschedule);case TrackerTrialBooked() when trialBooked != null:
return trialBooked(_that.booking,_that.session);case TrackerResultUpdated() when resultUpdated != null:
return resultUpdated(_that.resultId,_that.grade);case _:
  return null;

}
}

}

/// @nodoc


class TrackerStarted implements TrackerEvent {
  const TrackerStarted();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackerStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'TrackerEvent.started()';
}


}




/// @nodoc


class TrackerRefreshed implements TrackerEvent {
  const TrackerRefreshed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackerRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'TrackerEvent.refreshed()';
}


}




/// @nodoc


class TrackerApplicationUpdated implements TrackerEvent {
  const TrackerApplicationUpdated(this.application);
  

 final  Application application;

/// Create a copy of TrackerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackerApplicationUpdatedCopyWith<TrackerApplicationUpdated> get copyWith => _$TrackerApplicationUpdatedCopyWithImpl<TrackerApplicationUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackerApplicationUpdated&&(identical(other.application, application) || other.application == application));
}


@override
int get hashCode {
    return Object.hash(runtimeType,application);
}

@override
String toString() {
    return 'TrackerEvent.applicationUpdated(application: $application)';
}


}

/// @nodoc
abstract mixin class $TrackerApplicationUpdatedCopyWith<$Res> implements $TrackerEventCopyWith<$Res> {
  factory $TrackerApplicationUpdatedCopyWith(TrackerApplicationUpdated value, $Res Function(TrackerApplicationUpdated) _then) = _$TrackerApplicationUpdatedCopyWithImpl;
@useResult
$Res call({
 Application application
});


$ApplicationCopyWith<$Res> get application;

}
/// @nodoc
class _$TrackerApplicationUpdatedCopyWithImpl<$Res>
    implements $TrackerApplicationUpdatedCopyWith<$Res> {
  _$TrackerApplicationUpdatedCopyWithImpl(this._self, this._then);

  final TrackerApplicationUpdated _self;
  final $Res Function(TrackerApplicationUpdated) _then;

/// Create a copy of TrackerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? application = null,}) {
  return _then(TrackerApplicationUpdated(
null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as Application,
  ));
}

/// Create a copy of TrackerEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationCopyWith<$Res> get application {
  
  return $ApplicationCopyWith<$Res>(_self.application, (value) {
    return _then(_self.copyWith(application: value));
  });
}
}

/// @nodoc


class TrackerInterviewBooked implements TrackerEvent {
  const TrackerInterviewBooked(this.startsAt, {required this.reschedule});
  

 final  String startsAt;
 final  bool reschedule;

/// Create a copy of TrackerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackerInterviewBookedCopyWith<TrackerInterviewBooked> get copyWith => _$TrackerInterviewBookedCopyWithImpl<TrackerInterviewBooked>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackerInterviewBooked&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.reschedule, reschedule) || other.reschedule == reschedule));
}


@override
int get hashCode {
    return Object.hash(runtimeType,startsAt,reschedule);
}

@override
String toString() {
    return 'TrackerEvent.interviewBooked(startsAt: $startsAt, reschedule: $reschedule)';
}


}

/// @nodoc
abstract mixin class $TrackerInterviewBookedCopyWith<$Res> implements $TrackerEventCopyWith<$Res> {
  factory $TrackerInterviewBookedCopyWith(TrackerInterviewBooked value, $Res Function(TrackerInterviewBooked) _then) = _$TrackerInterviewBookedCopyWithImpl;
@useResult
$Res call({
 String startsAt, bool reschedule
});




}
/// @nodoc
class _$TrackerInterviewBookedCopyWithImpl<$Res>
    implements $TrackerInterviewBookedCopyWith<$Res> {
  _$TrackerInterviewBookedCopyWithImpl(this._self, this._then);

  final TrackerInterviewBooked _self;
  final $Res Function(TrackerInterviewBooked) _then;

/// Create a copy of TrackerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? startsAt = null,Object? reschedule = null,}) {
  return _then(TrackerInterviewBooked(
null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as String,reschedule: null == reschedule ? _self.reschedule : reschedule // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class TrackerTrialBooked implements TrackerEvent {
  const TrackerTrialBooked({required this.booking, required this.session});
  

 final  int booking;
 final  int session;

/// Create a copy of TrackerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackerTrialBookedCopyWith<TrackerTrialBooked> get copyWith => _$TrackerTrialBookedCopyWithImpl<TrackerTrialBooked>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackerTrialBooked&&(identical(other.booking, booking) || other.booking == booking)&&(identical(other.session, session) || other.session == session));
}


@override
int get hashCode {
    return Object.hash(runtimeType,booking,session);
}

@override
String toString() {
    return 'TrackerEvent.trialBooked(booking: $booking, session: $session)';
}


}

/// @nodoc
abstract mixin class $TrackerTrialBookedCopyWith<$Res> implements $TrackerEventCopyWith<$Res> {
  factory $TrackerTrialBookedCopyWith(TrackerTrialBooked value, $Res Function(TrackerTrialBooked) _then) = _$TrackerTrialBookedCopyWithImpl;
@useResult
$Res call({
 int booking, int session
});




}
/// @nodoc
class _$TrackerTrialBookedCopyWithImpl<$Res>
    implements $TrackerTrialBookedCopyWith<$Res> {
  _$TrackerTrialBookedCopyWithImpl(this._self, this._then);

  final TrackerTrialBooked _self;
  final $Res Function(TrackerTrialBooked) _then;

/// Create a copy of TrackerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? booking = null,Object? session = null,}) {
  return _then(TrackerTrialBooked(
booking: null == booking ? _self.booking : booking // ignore: cast_nullable_to_non_nullable
as int,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class TrackerResultUpdated implements TrackerEvent {
  const TrackerResultUpdated({required this.resultId, required this.grade});
  

 final  int resultId;
 final  String grade;

/// Create a copy of TrackerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackerResultUpdatedCopyWith<TrackerResultUpdated> get copyWith => _$TrackerResultUpdatedCopyWithImpl<TrackerResultUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackerResultUpdated&&(identical(other.resultId, resultId) || other.resultId == resultId)&&(identical(other.grade, grade) || other.grade == grade));
}


@override
int get hashCode {
    return Object.hash(runtimeType,resultId,grade);
}

@override
String toString() {
    return 'TrackerEvent.resultUpdated(resultId: $resultId, grade: $grade)';
}


}

/// @nodoc
abstract mixin class $TrackerResultUpdatedCopyWith<$Res> implements $TrackerEventCopyWith<$Res> {
  factory $TrackerResultUpdatedCopyWith(TrackerResultUpdated value, $Res Function(TrackerResultUpdated) _then) = _$TrackerResultUpdatedCopyWithImpl;
@useResult
$Res call({
 int resultId, String grade
});




}
/// @nodoc
class _$TrackerResultUpdatedCopyWithImpl<$Res>
    implements $TrackerResultUpdatedCopyWith<$Res> {
  _$TrackerResultUpdatedCopyWithImpl(this._self, this._then);

  final TrackerResultUpdated _self;
  final $Res Function(TrackerResultUpdated) _then;

/// Create a copy of TrackerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? resultId = null,Object? grade = null,}) {
  return _then(TrackerResultUpdated(
resultId: null == resultId ? _self.resultId : resultId // ignore: cast_nullable_to_non_nullable
as int,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$TrackerState {

 Application get application; FormOptions? get options; bool get refreshing; bool get busy; Failure? get failure; TrackerNoticeKind? get notice; int get noticeSeq;
/// Create a copy of TrackerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackerStateCopyWith<TrackerState> get copyWith => _$TrackerStateCopyWithImpl<TrackerState>(this as TrackerState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TrackerState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackerState&&(identical(other.application, _this.application) || other.application == _this.application)&&(identical(other.options, _this.options) || other.options == _this.options)&&(identical(other.refreshing, _this.refreshing) || other.refreshing == _this.refreshing)&&(identical(other.busy, _this.busy) || other.busy == _this.busy)&&(identical(other.failure, _this.failure) || other.failure == _this.failure)&&(identical(other.notice, _this.notice) || other.notice == _this.notice)&&(identical(other.noticeSeq, _this.noticeSeq) || other.noticeSeq == _this.noticeSeq));
}


@override
int get hashCode {
  final _this = this as TrackerState;
  return Object.hash(runtimeType,_this.application,_this.options,_this.refreshing,_this.busy,_this.failure,_this.notice,_this.noticeSeq);
}

@override
String toString() {
  final _this = this as TrackerState;
  return 'TrackerState(application: ${_this.application}, options: ${_this.options}, refreshing: ${_this.refreshing}, busy: ${_this.busy}, failure: ${_this.failure}, notice: ${_this.notice}, noticeSeq: ${_this.noticeSeq})';
}


}

/// @nodoc
abstract mixin class $TrackerStateCopyWith<$Res>  {
  factory $TrackerStateCopyWith(TrackerState value, $Res Function(TrackerState) _then) = _$TrackerStateCopyWithImpl;
@useResult
$Res call({
 Application application, FormOptions? options, bool refreshing, bool busy, Failure? failure, TrackerNoticeKind? notice, int noticeSeq
});


$ApplicationCopyWith<$Res> get application;$FormOptionsCopyWith<$Res>? get options;$FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class _$TrackerStateCopyWithImpl<$Res>
    implements $TrackerStateCopyWith<$Res> {
  _$TrackerStateCopyWithImpl(this._self, this._then);

  final TrackerState _self;
  final $Res Function(TrackerState) _then;

/// Create a copy of TrackerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? application = null,Object? options = freezed,Object? refreshing = null,Object? busy = null,Object? failure = freezed,Object? notice = freezed,Object? noticeSeq = null,}) {
  return _then(TrackerState(
application: null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as Application,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as FormOptions?,refreshing: null == refreshing ? _self.refreshing : refreshing // ignore: cast_nullable_to_non_nullable
as bool,busy: null == busy ? _self.busy : busy // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,notice: freezed == notice ? _self.notice : notice // ignore: cast_nullable_to_non_nullable
as TrackerNoticeKind?,noticeSeq: null == noticeSeq ? _self.noticeSeq : noticeSeq // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of TrackerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationCopyWith<$Res> get application {
  
  return $ApplicationCopyWith<$Res>(_self.application, (value) {
    return _then(_self.copyWith(application: value));
  });
}/// Create a copy of TrackerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FormOptionsCopyWith<$Res>? get options {
    if (_self.options == null) {
    return null;
  }

  return $FormOptionsCopyWith<$Res>(_self.options!, (value) {
    return _then(_self.copyWith(options: value));
  });
}/// Create a copy of TrackerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}


/// Adds pattern-matching-related methods to [TrackerState].
extension TrackerStatePatterns on TrackerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackerState value)  $default,){
final _that = this;
switch (_that) {
case _TrackerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackerState value)?  $default,){
final _that = this;
switch (_that) {
case _TrackerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Application application,  FormOptions? options,  bool refreshing,  bool busy,  Failure? failure,  TrackerNoticeKind? notice,  int noticeSeq)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackerState() when $default != null:
return $default(_that.application,_that.options,_that.refreshing,_that.busy,_that.failure,_that.notice,_that.noticeSeq);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Application application,  FormOptions? options,  bool refreshing,  bool busy,  Failure? failure,  TrackerNoticeKind? notice,  int noticeSeq)  $default,) {final _that = this;
switch (_that) {
case _TrackerState():
return $default(_that.application,_that.options,_that.refreshing,_that.busy,_that.failure,_that.notice,_that.noticeSeq);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Application application,  FormOptions? options,  bool refreshing,  bool busy,  Failure? failure,  TrackerNoticeKind? notice,  int noticeSeq)?  $default,) {final _that = this;
switch (_that) {
case _TrackerState() when $default != null:
return $default(_that.application,_that.options,_that.refreshing,_that.busy,_that.failure,_that.notice,_that.noticeSeq);case _:
  return null;

}
}

}

/// @nodoc


class _TrackerState implements TrackerState {
  const _TrackerState({required this.application, this.options, this.refreshing = false, this.busy = false, this.failure, this.notice, this.noticeSeq = 0});
  

@override final  Application application;
@override final  FormOptions? options;
@override@JsonKey() final  bool refreshing;
@override@JsonKey() final  bool busy;
@override final  Failure? failure;
@override final  TrackerNoticeKind? notice;
@override@JsonKey() final  int noticeSeq;

/// Create a copy of TrackerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackerStateCopyWith<_TrackerState> get copyWith => __$TrackerStateCopyWithImpl<_TrackerState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackerState&&(identical(other.application, application) || other.application == application)&&(identical(other.options, options) || other.options == options)&&(identical(other.refreshing, refreshing) || other.refreshing == refreshing)&&(identical(other.busy, busy) || other.busy == busy)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.notice, notice) || other.notice == notice)&&(identical(other.noticeSeq, noticeSeq) || other.noticeSeq == noticeSeq));
}


@override
int get hashCode {
    return Object.hash(runtimeType,application,options,refreshing,busy,failure,notice,noticeSeq);
}

@override
String toString() {
    return 'TrackerState(application: $application, options: $options, refreshing: $refreshing, busy: $busy, failure: $failure, notice: $notice, noticeSeq: $noticeSeq)';
}


}

/// @nodoc
abstract mixin class _$TrackerStateCopyWith<$Res> implements $TrackerStateCopyWith<$Res> {
  factory _$TrackerStateCopyWith(_TrackerState value, $Res Function(_TrackerState) _then) = __$TrackerStateCopyWithImpl;
@override @useResult
$Res call({
 Application application, FormOptions? options, bool refreshing, bool busy, Failure? failure, TrackerNoticeKind? notice, int noticeSeq
});


@override $ApplicationCopyWith<$Res> get application;@override $FormOptionsCopyWith<$Res>? get options;@override $FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class __$TrackerStateCopyWithImpl<$Res>
    implements _$TrackerStateCopyWith<$Res> {
  __$TrackerStateCopyWithImpl(this._self, this._then);

  final _TrackerState _self;
  final $Res Function(_TrackerState) _then;

/// Create a copy of TrackerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? application = null,Object? options = freezed,Object? refreshing = null,Object? busy = null,Object? failure = freezed,Object? notice = freezed,Object? noticeSeq = null,}) {
  return _then(_TrackerState(
application: null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as Application,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as FormOptions?,refreshing: null == refreshing ? _self.refreshing : refreshing // ignore: cast_nullable_to_non_nullable
as bool,busy: null == busy ? _self.busy : busy // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,notice: freezed == notice ? _self.notice : notice // ignore: cast_nullable_to_non_nullable
as TrackerNoticeKind?,noticeSeq: null == noticeSeq ? _self.noticeSeq : noticeSeq // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of TrackerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationCopyWith<$Res> get application {
  
  return $ApplicationCopyWith<$Res>(_self.application, (value) {
    return _then(_self.copyWith(application: value));
  });
}/// Create a copy of TrackerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FormOptionsCopyWith<$Res>? get options {
    if (_self.options == null) {
    return null;
  }

  return $FormOptionsCopyWith<$Res>(_self.options!, (value) {
    return _then(_self.copyWith(options: value));
  });
}/// Create a copy of TrackerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
