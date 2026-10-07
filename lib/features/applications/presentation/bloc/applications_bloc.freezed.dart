// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'applications_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApplicationsEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ApplicationsEvent()';
}


}

/// @nodoc
class $ApplicationsEventCopyWith<$Res>  {
$ApplicationsEventCopyWith(ApplicationsEvent _, $Res Function(ApplicationsEvent) __);
}


/// Adds pattern-matching-related methods to [ApplicationsEvent].
extension ApplicationsEventPatterns on ApplicationsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ApplicationsStarted value)?  started,TResult Function( ApplicationsRefreshed value)?  refreshed,TResult Function( ApplicationsStartRequested value)?  startRequested,TResult Function( ApplicationsWithdrawRequested value)?  withdrawRequested,TResult Function( ApplicationsNoticeConsumed value)?  noticeConsumed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ApplicationsStarted() when started != null:
return started(_that);case ApplicationsRefreshed() when refreshed != null:
return refreshed(_that);case ApplicationsStartRequested() when startRequested != null:
return startRequested(_that);case ApplicationsWithdrawRequested() when withdrawRequested != null:
return withdrawRequested(_that);case ApplicationsNoticeConsumed() when noticeConsumed != null:
return noticeConsumed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ApplicationsStarted value)  started,required TResult Function( ApplicationsRefreshed value)  refreshed,required TResult Function( ApplicationsStartRequested value)  startRequested,required TResult Function( ApplicationsWithdrawRequested value)  withdrawRequested,required TResult Function( ApplicationsNoticeConsumed value)  noticeConsumed,}){
final _that = this;
switch (_that) {
case ApplicationsStarted():
return started(_that);case ApplicationsRefreshed():
return refreshed(_that);case ApplicationsStartRequested():
return startRequested(_that);case ApplicationsWithdrawRequested():
return withdrawRequested(_that);case ApplicationsNoticeConsumed():
return noticeConsumed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ApplicationsStarted value)?  started,TResult? Function( ApplicationsRefreshed value)?  refreshed,TResult? Function( ApplicationsStartRequested value)?  startRequested,TResult? Function( ApplicationsWithdrawRequested value)?  withdrawRequested,TResult? Function( ApplicationsNoticeConsumed value)?  noticeConsumed,}){
final _that = this;
switch (_that) {
case ApplicationsStarted() when started != null:
return started(_that);case ApplicationsRefreshed() when refreshed != null:
return refreshed(_that);case ApplicationsStartRequested() when startRequested != null:
return startRequested(_that);case ApplicationsWithdrawRequested() when withdrawRequested != null:
return withdrawRequested(_that);case ApplicationsNoticeConsumed() when noticeConsumed != null:
return noticeConsumed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( bool force)?  refreshed,TResult Function( int? copyFamilyFrom)?  startRequested,TResult Function( int id)?  withdrawRequested,TResult Function()?  noticeConsumed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ApplicationsStarted() when started != null:
return started();case ApplicationsRefreshed() when refreshed != null:
return refreshed(_that.force);case ApplicationsStartRequested() when startRequested != null:
return startRequested(_that.copyFamilyFrom);case ApplicationsWithdrawRequested() when withdrawRequested != null:
return withdrawRequested(_that.id);case ApplicationsNoticeConsumed() when noticeConsumed != null:
return noticeConsumed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( bool force)  refreshed,required TResult Function( int? copyFamilyFrom)  startRequested,required TResult Function( int id)  withdrawRequested,required TResult Function()  noticeConsumed,}) {final _that = this;
switch (_that) {
case ApplicationsStarted():
return started();case ApplicationsRefreshed():
return refreshed(_that.force);case ApplicationsStartRequested():
return startRequested(_that.copyFamilyFrom);case ApplicationsWithdrawRequested():
return withdrawRequested(_that.id);case ApplicationsNoticeConsumed():
return noticeConsumed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( bool force)?  refreshed,TResult? Function( int? copyFamilyFrom)?  startRequested,TResult? Function( int id)?  withdrawRequested,TResult? Function()?  noticeConsumed,}) {final _that = this;
switch (_that) {
case ApplicationsStarted() when started != null:
return started();case ApplicationsRefreshed() when refreshed != null:
return refreshed(_that.force);case ApplicationsStartRequested() when startRequested != null:
return startRequested(_that.copyFamilyFrom);case ApplicationsWithdrawRequested() when withdrawRequested != null:
return withdrawRequested(_that.id);case ApplicationsNoticeConsumed() when noticeConsumed != null:
return noticeConsumed();case _:
  return null;

}
}

}

/// @nodoc


class ApplicationsStarted implements ApplicationsEvent {
  const ApplicationsStarted();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationsStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ApplicationsEvent.started()';
}


}




/// @nodoc


class ApplicationsRefreshed implements ApplicationsEvent {
  const ApplicationsRefreshed({this.force = false});
  

@JsonKey() final  bool force;

/// Create a copy of ApplicationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationsRefreshedCopyWith<ApplicationsRefreshed> get copyWith => _$ApplicationsRefreshedCopyWithImpl<ApplicationsRefreshed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationsRefreshed&&(identical(other.force, force) || other.force == force));
}


@override
int get hashCode {
    return Object.hash(runtimeType,force);
}

@override
String toString() {
    return 'ApplicationsEvent.refreshed(force: $force)';
}


}

/// @nodoc
abstract mixin class $ApplicationsRefreshedCopyWith<$Res> implements $ApplicationsEventCopyWith<$Res> {
  factory $ApplicationsRefreshedCopyWith(ApplicationsRefreshed value, $Res Function(ApplicationsRefreshed) _then) = _$ApplicationsRefreshedCopyWithImpl;
@useResult
$Res call({
 bool force
});




}
/// @nodoc
class _$ApplicationsRefreshedCopyWithImpl<$Res>
    implements $ApplicationsRefreshedCopyWith<$Res> {
  _$ApplicationsRefreshedCopyWithImpl(this._self, this._then);

  final ApplicationsRefreshed _self;
  final $Res Function(ApplicationsRefreshed) _then;

/// Create a copy of ApplicationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? force = null,}) {
  return _then(ApplicationsRefreshed(
force: null == force ? _self.force : force // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ApplicationsStartRequested implements ApplicationsEvent {
  const ApplicationsStartRequested({this.copyFamilyFrom});
  

 final  int? copyFamilyFrom;

/// Create a copy of ApplicationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationsStartRequestedCopyWith<ApplicationsStartRequested> get copyWith => _$ApplicationsStartRequestedCopyWithImpl<ApplicationsStartRequested>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationsStartRequested&&(identical(other.copyFamilyFrom, copyFamilyFrom) || other.copyFamilyFrom == copyFamilyFrom));
}


@override
int get hashCode {
    return Object.hash(runtimeType,copyFamilyFrom);
}

@override
String toString() {
    return 'ApplicationsEvent.startRequested(copyFamilyFrom: $copyFamilyFrom)';
}


}

/// @nodoc
abstract mixin class $ApplicationsStartRequestedCopyWith<$Res> implements $ApplicationsEventCopyWith<$Res> {
  factory $ApplicationsStartRequestedCopyWith(ApplicationsStartRequested value, $Res Function(ApplicationsStartRequested) _then) = _$ApplicationsStartRequestedCopyWithImpl;
@useResult
$Res call({
 int? copyFamilyFrom
});




}
/// @nodoc
class _$ApplicationsStartRequestedCopyWithImpl<$Res>
    implements $ApplicationsStartRequestedCopyWith<$Res> {
  _$ApplicationsStartRequestedCopyWithImpl(this._self, this._then);

  final ApplicationsStartRequested _self;
  final $Res Function(ApplicationsStartRequested) _then;

/// Create a copy of ApplicationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? copyFamilyFrom = freezed,}) {
  return _then(ApplicationsStartRequested(
copyFamilyFrom: freezed == copyFamilyFrom ? _self.copyFamilyFrom : copyFamilyFrom // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class ApplicationsWithdrawRequested implements ApplicationsEvent {
  const ApplicationsWithdrawRequested(this.id);
  

 final  int id;

/// Create a copy of ApplicationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationsWithdrawRequestedCopyWith<ApplicationsWithdrawRequested> get copyWith => _$ApplicationsWithdrawRequestedCopyWithImpl<ApplicationsWithdrawRequested>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationsWithdrawRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id);
}

@override
String toString() {
    return 'ApplicationsEvent.withdrawRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class $ApplicationsWithdrawRequestedCopyWith<$Res> implements $ApplicationsEventCopyWith<$Res> {
  factory $ApplicationsWithdrawRequestedCopyWith(ApplicationsWithdrawRequested value, $Res Function(ApplicationsWithdrawRequested) _then) = _$ApplicationsWithdrawRequestedCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$ApplicationsWithdrawRequestedCopyWithImpl<$Res>
    implements $ApplicationsWithdrawRequestedCopyWith<$Res> {
  _$ApplicationsWithdrawRequestedCopyWithImpl(this._self, this._then);

  final ApplicationsWithdrawRequested _self;
  final $Res Function(ApplicationsWithdrawRequested) _then;

/// Create a copy of ApplicationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(ApplicationsWithdrawRequested(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ApplicationsNoticeConsumed implements ApplicationsEvent {
  const ApplicationsNoticeConsumed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationsNoticeConsumed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ApplicationsEvent.noticeConsumed()';
}


}




/// @nodoc
mixin _$ApplicationsNotice {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationsNotice);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ApplicationsNotice()';
}


}

/// @nodoc
class $ApplicationsNoticeCopyWith<$Res>  {
$ApplicationsNoticeCopyWith(ApplicationsNotice _, $Res Function(ApplicationsNotice) __);
}


/// Adds pattern-matching-related methods to [ApplicationsNotice].
extension ApplicationsNoticePatterns on ApplicationsNotice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ApplicationsNoticeStarted value)?  started,TResult Function( ApplicationsNoticeWithdrawn value)?  withdrawn,TResult Function( ApplicationsNoticeFailed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ApplicationsNoticeStarted() when started != null:
return started(_that);case ApplicationsNoticeWithdrawn() when withdrawn != null:
return withdrawn(_that);case ApplicationsNoticeFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ApplicationsNoticeStarted value)  started,required TResult Function( ApplicationsNoticeWithdrawn value)  withdrawn,required TResult Function( ApplicationsNoticeFailed value)  failed,}){
final _that = this;
switch (_that) {
case ApplicationsNoticeStarted():
return started(_that);case ApplicationsNoticeWithdrawn():
return withdrawn(_that);case ApplicationsNoticeFailed():
return failed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ApplicationsNoticeStarted value)?  started,TResult? Function( ApplicationsNoticeWithdrawn value)?  withdrawn,TResult? Function( ApplicationsNoticeFailed value)?  failed,}){
final _that = this;
switch (_that) {
case ApplicationsNoticeStarted() when started != null:
return started(_that);case ApplicationsNoticeWithdrawn() when withdrawn != null:
return withdrawn(_that);case ApplicationsNoticeFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Application application)?  started,TResult Function( bool wasDraft)?  withdrawn,TResult Function( Failure failure)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ApplicationsNoticeStarted() when started != null:
return started(_that.application);case ApplicationsNoticeWithdrawn() when withdrawn != null:
return withdrawn(_that.wasDraft);case ApplicationsNoticeFailed() when failed != null:
return failed(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Application application)  started,required TResult Function( bool wasDraft)  withdrawn,required TResult Function( Failure failure)  failed,}) {final _that = this;
switch (_that) {
case ApplicationsNoticeStarted():
return started(_that.application);case ApplicationsNoticeWithdrawn():
return withdrawn(_that.wasDraft);case ApplicationsNoticeFailed():
return failed(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Application application)?  started,TResult? Function( bool wasDraft)?  withdrawn,TResult? Function( Failure failure)?  failed,}) {final _that = this;
switch (_that) {
case ApplicationsNoticeStarted() when started != null:
return started(_that.application);case ApplicationsNoticeWithdrawn() when withdrawn != null:
return withdrawn(_that.wasDraft);case ApplicationsNoticeFailed() when failed != null:
return failed(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class ApplicationsNoticeStarted implements ApplicationsNotice {
  const ApplicationsNoticeStarted(this.application);
  

 final  Application application;

/// Create a copy of ApplicationsNotice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationsNoticeStartedCopyWith<ApplicationsNoticeStarted> get copyWith => _$ApplicationsNoticeStartedCopyWithImpl<ApplicationsNoticeStarted>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationsNoticeStarted&&(identical(other.application, application) || other.application == application));
}


@override
int get hashCode {
    return Object.hash(runtimeType,application);
}

@override
String toString() {
    return 'ApplicationsNotice.started(application: $application)';
}


}

/// @nodoc
abstract mixin class $ApplicationsNoticeStartedCopyWith<$Res> implements $ApplicationsNoticeCopyWith<$Res> {
  factory $ApplicationsNoticeStartedCopyWith(ApplicationsNoticeStarted value, $Res Function(ApplicationsNoticeStarted) _then) = _$ApplicationsNoticeStartedCopyWithImpl;
@useResult
$Res call({
 Application application
});


$ApplicationCopyWith<$Res> get application;

}
/// @nodoc
class _$ApplicationsNoticeStartedCopyWithImpl<$Res>
    implements $ApplicationsNoticeStartedCopyWith<$Res> {
  _$ApplicationsNoticeStartedCopyWithImpl(this._self, this._then);

  final ApplicationsNoticeStarted _self;
  final $Res Function(ApplicationsNoticeStarted) _then;

/// Create a copy of ApplicationsNotice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? application = null,}) {
  return _then(ApplicationsNoticeStarted(
null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as Application,
  ));
}

/// Create a copy of ApplicationsNotice
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


class ApplicationsNoticeWithdrawn implements ApplicationsNotice {
  const ApplicationsNoticeWithdrawn({required this.wasDraft});
  

 final  bool wasDraft;

/// Create a copy of ApplicationsNotice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationsNoticeWithdrawnCopyWith<ApplicationsNoticeWithdrawn> get copyWith => _$ApplicationsNoticeWithdrawnCopyWithImpl<ApplicationsNoticeWithdrawn>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationsNoticeWithdrawn&&(identical(other.wasDraft, wasDraft) || other.wasDraft == wasDraft));
}


@override
int get hashCode {
    return Object.hash(runtimeType,wasDraft);
}

@override
String toString() {
    return 'ApplicationsNotice.withdrawn(wasDraft: $wasDraft)';
}


}

/// @nodoc
abstract mixin class $ApplicationsNoticeWithdrawnCopyWith<$Res> implements $ApplicationsNoticeCopyWith<$Res> {
  factory $ApplicationsNoticeWithdrawnCopyWith(ApplicationsNoticeWithdrawn value, $Res Function(ApplicationsNoticeWithdrawn) _then) = _$ApplicationsNoticeWithdrawnCopyWithImpl;
@useResult
$Res call({
 bool wasDraft
});




}
/// @nodoc
class _$ApplicationsNoticeWithdrawnCopyWithImpl<$Res>
    implements $ApplicationsNoticeWithdrawnCopyWith<$Res> {
  _$ApplicationsNoticeWithdrawnCopyWithImpl(this._self, this._then);

  final ApplicationsNoticeWithdrawn _self;
  final $Res Function(ApplicationsNoticeWithdrawn) _then;

/// Create a copy of ApplicationsNotice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? wasDraft = null,}) {
  return _then(ApplicationsNoticeWithdrawn(
wasDraft: null == wasDraft ? _self.wasDraft : wasDraft // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ApplicationsNoticeFailed implements ApplicationsNotice {
  const ApplicationsNoticeFailed(this.failure);
  

 final  Failure failure;

/// Create a copy of ApplicationsNotice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationsNoticeFailedCopyWith<ApplicationsNoticeFailed> get copyWith => _$ApplicationsNoticeFailedCopyWithImpl<ApplicationsNoticeFailed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationsNoticeFailed&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,failure);
}

@override
String toString() {
    return 'ApplicationsNotice.failed(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ApplicationsNoticeFailedCopyWith<$Res> implements $ApplicationsNoticeCopyWith<$Res> {
  factory $ApplicationsNoticeFailedCopyWith(ApplicationsNoticeFailed value, $Res Function(ApplicationsNoticeFailed) _then) = _$ApplicationsNoticeFailedCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$ApplicationsNoticeFailedCopyWithImpl<$Res>
    implements $ApplicationsNoticeFailedCopyWith<$Res> {
  _$ApplicationsNoticeFailedCopyWithImpl(this._self, this._then);

  final ApplicationsNoticeFailed _self;
  final $Res Function(ApplicationsNoticeFailed) _then;

/// Create a copy of ApplicationsNotice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ApplicationsNoticeFailed(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of ApplicationsNotice
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
mixin _$ApplicationsState {

 bool get loading; List<AppSummary> get items; Failure? get failure; bool get busy; ApplicationsNotice? get notice; int get noticeSeq; DateTime? get loadedAt;
/// Create a copy of ApplicationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationsStateCopyWith<ApplicationsState> get copyWith => _$ApplicationsStateCopyWithImpl<ApplicationsState>(this as ApplicationsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ApplicationsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationsState&&(identical(other.loading, _this.loading) || other.loading == _this.loading)&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.failure, _this.failure) || other.failure == _this.failure)&&(identical(other.busy, _this.busy) || other.busy == _this.busy)&&(identical(other.notice, _this.notice) || other.notice == _this.notice)&&(identical(other.noticeSeq, _this.noticeSeq) || other.noticeSeq == _this.noticeSeq)&&(identical(other.loadedAt, _this.loadedAt) || other.loadedAt == _this.loadedAt));
}


@override
int get hashCode {
  final _this = this as ApplicationsState;
  return Object.hash(runtimeType,_this.loading,const DeepCollectionEquality().hash(_this.items),_this.failure,_this.busy,_this.notice,_this.noticeSeq,_this.loadedAt);
}

@override
String toString() {
  final _this = this as ApplicationsState;
  return 'ApplicationsState(loading: ${_this.loading}, items: ${_this.items}, failure: ${_this.failure}, busy: ${_this.busy}, notice: ${_this.notice}, noticeSeq: ${_this.noticeSeq}, loadedAt: ${_this.loadedAt})';
}


}

/// @nodoc
abstract mixin class $ApplicationsStateCopyWith<$Res>  {
  factory $ApplicationsStateCopyWith(ApplicationsState value, $Res Function(ApplicationsState) _then) = _$ApplicationsStateCopyWithImpl;
@useResult
$Res call({
 bool loading, List<AppSummary> items, Failure? failure, bool busy, ApplicationsNotice? notice, int noticeSeq, DateTime? loadedAt
});


$FailureCopyWith<$Res>? get failure;$ApplicationsNoticeCopyWith<$Res>? get notice;

}
/// @nodoc
class _$ApplicationsStateCopyWithImpl<$Res>
    implements $ApplicationsStateCopyWith<$Res> {
  _$ApplicationsStateCopyWithImpl(this._self, this._then);

  final ApplicationsState _self;
  final $Res Function(ApplicationsState) _then;

/// Create a copy of ApplicationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loading = null,Object? items = null,Object? failure = freezed,Object? busy = null,Object? notice = freezed,Object? noticeSeq = null,Object? loadedAt = freezed,}) {
  return _then(ApplicationsState(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<AppSummary>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,busy: null == busy ? _self.busy : busy // ignore: cast_nullable_to_non_nullable
as bool,notice: freezed == notice ? _self.notice : notice // ignore: cast_nullable_to_non_nullable
as ApplicationsNotice?,noticeSeq: null == noticeSeq ? _self.noticeSeq : noticeSeq // ignore: cast_nullable_to_non_nullable
as int,loadedAt: freezed == loadedAt ? _self.loadedAt : loadedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of ApplicationsState
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
}/// Create a copy of ApplicationsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationsNoticeCopyWith<$Res>? get notice {
    if (_self.notice == null) {
    return null;
  }

  return $ApplicationsNoticeCopyWith<$Res>(_self.notice!, (value) {
    return _then(_self.copyWith(notice: value));
  });
}
}


/// Adds pattern-matching-related methods to [ApplicationsState].
extension ApplicationsStatePatterns on ApplicationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApplicationsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApplicationsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApplicationsState value)  $default,){
final _that = this;
switch (_that) {
case _ApplicationsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApplicationsState value)?  $default,){
final _that = this;
switch (_that) {
case _ApplicationsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool loading,  List<AppSummary> items,  Failure? failure,  bool busy,  ApplicationsNotice? notice,  int noticeSeq,  DateTime? loadedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApplicationsState() when $default != null:
return $default(_that.loading,_that.items,_that.failure,_that.busy,_that.notice,_that.noticeSeq,_that.loadedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool loading,  List<AppSummary> items,  Failure? failure,  bool busy,  ApplicationsNotice? notice,  int noticeSeq,  DateTime? loadedAt)  $default,) {final _that = this;
switch (_that) {
case _ApplicationsState():
return $default(_that.loading,_that.items,_that.failure,_that.busy,_that.notice,_that.noticeSeq,_that.loadedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool loading,  List<AppSummary> items,  Failure? failure,  bool busy,  ApplicationsNotice? notice,  int noticeSeq,  DateTime? loadedAt)?  $default,) {final _that = this;
switch (_that) {
case _ApplicationsState() when $default != null:
return $default(_that.loading,_that.items,_that.failure,_that.busy,_that.notice,_that.noticeSeq,_that.loadedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ApplicationsState extends ApplicationsState {
  const _ApplicationsState({this.loading = true,  List<AppSummary> items = const <AppSummary>[], this.failure, this.busy = false, this.notice, this.noticeSeq = 0, this.loadedAt}): _items = items,super._();
  

@override@JsonKey() final  bool loading;
 final  List<AppSummary> _items;
@override@JsonKey() List<AppSummary> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  Failure? failure;
@override@JsonKey() final  bool busy;
@override final  ApplicationsNotice? notice;
@override@JsonKey() final  int noticeSeq;
@override final  DateTime? loadedAt;

/// Create a copy of ApplicationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplicationsStateCopyWith<_ApplicationsState> get copyWith => __$ApplicationsStateCopyWithImpl<_ApplicationsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplicationsState&&(identical(other.loading, loading) || other.loading == loading)&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.busy, busy) || other.busy == busy)&&(identical(other.notice, notice) || other.notice == notice)&&(identical(other.noticeSeq, noticeSeq) || other.noticeSeq == noticeSeq)&&(identical(other.loadedAt, loadedAt) || other.loadedAt == loadedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,loading,const DeepCollectionEquality().hash(_items),failure,busy,notice,noticeSeq,loadedAt);
}

@override
String toString() {
    return 'ApplicationsState(loading: $loading, items: $items, failure: $failure, busy: $busy, notice: $notice, noticeSeq: $noticeSeq, loadedAt: $loadedAt)';
}


}

/// @nodoc
abstract mixin class _$ApplicationsStateCopyWith<$Res> implements $ApplicationsStateCopyWith<$Res> {
  factory _$ApplicationsStateCopyWith(_ApplicationsState value, $Res Function(_ApplicationsState) _then) = __$ApplicationsStateCopyWithImpl;
@override @useResult
$Res call({
 bool loading, List<AppSummary> items, Failure? failure, bool busy, ApplicationsNotice? notice, int noticeSeq, DateTime? loadedAt
});


@override $FailureCopyWith<$Res>? get failure;@override $ApplicationsNoticeCopyWith<$Res>? get notice;

}
/// @nodoc
class __$ApplicationsStateCopyWithImpl<$Res>
    implements _$ApplicationsStateCopyWith<$Res> {
  __$ApplicationsStateCopyWithImpl(this._self, this._then);

  final _ApplicationsState _self;
  final $Res Function(_ApplicationsState) _then;

/// Create a copy of ApplicationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loading = null,Object? items = null,Object? failure = freezed,Object? busy = null,Object? notice = freezed,Object? noticeSeq = null,Object? loadedAt = freezed,}) {
  return _then(_ApplicationsState(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<AppSummary>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,busy: null == busy ? _self.busy : busy // ignore: cast_nullable_to_non_nullable
as bool,notice: freezed == notice ? _self.notice : notice // ignore: cast_nullable_to_non_nullable
as ApplicationsNotice?,noticeSeq: null == noticeSeq ? _self.noticeSeq : noticeSeq // ignore: cast_nullable_to_non_nullable
as int,loadedAt: freezed == loadedAt ? _self.loadedAt : loadedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of ApplicationsState
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
}/// Create a copy of ApplicationsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationsNoticeCopyWith<$Res>? get notice {
    if (_self.notice == null) {
    return null;
  }

  return $ApplicationsNoticeCopyWith<$Res>(_self.notice!, (value) {
    return _then(_self.copyWith(notice: value));
  });
}
}

// dart format on
