// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'documents_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DocsNotice {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DocsNotice);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DocsNotice()';
}


}

/// @nodoc
class $DocsNoticeCopyWith<$Res>  {
$DocsNoticeCopyWith(DocsNotice _, $Res Function(DocsNotice) __);
}


/// Adds pattern-matching-related methods to [DocsNotice].
extension DocsNoticePatterns on DocsNotice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DocsUploaded value)?  uploaded,TResult Function( DocsRemoved value)?  removed,TResult Function( DocsUploadFailed value)?  uploadFailed,TResult Function( DocsRemoveFailed value)?  removeFailed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DocsUploaded() when uploaded != null:
return uploaded(_that);case DocsRemoved() when removed != null:
return removed(_that);case DocsUploadFailed() when uploadFailed != null:
return uploadFailed(_that);case DocsRemoveFailed() when removeFailed != null:
return removeFailed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DocsUploaded value)  uploaded,required TResult Function( DocsRemoved value)  removed,required TResult Function( DocsUploadFailed value)  uploadFailed,required TResult Function( DocsRemoveFailed value)  removeFailed,}){
final _that = this;
switch (_that) {
case DocsUploaded():
return uploaded(_that);case DocsRemoved():
return removed(_that);case DocsUploadFailed():
return uploadFailed(_that);case DocsRemoveFailed():
return removeFailed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DocsUploaded value)?  uploaded,TResult? Function( DocsRemoved value)?  removed,TResult? Function( DocsUploadFailed value)?  uploadFailed,TResult? Function( DocsRemoveFailed value)?  removeFailed,}){
final _that = this;
switch (_that) {
case DocsUploaded() when uploaded != null:
return uploaded(_that);case DocsRemoved() when removed != null:
return removed(_that);case DocsUploadFailed() when uploadFailed != null:
return uploadFailed(_that);case DocsRemoveFailed() when removeFailed != null:
return removeFailed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Application application,  String title,  bool withFile)?  uploaded,TResult Function( Application application,  String title)?  removed,TResult Function( Failure failure)?  uploadFailed,TResult Function( Failure failure)?  removeFailed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DocsUploaded() when uploaded != null:
return uploaded(_that.application,_that.title,_that.withFile);case DocsRemoved() when removed != null:
return removed(_that.application,_that.title);case DocsUploadFailed() when uploadFailed != null:
return uploadFailed(_that.failure);case DocsRemoveFailed() when removeFailed != null:
return removeFailed(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Application application,  String title,  bool withFile)  uploaded,required TResult Function( Application application,  String title)  removed,required TResult Function( Failure failure)  uploadFailed,required TResult Function( Failure failure)  removeFailed,}) {final _that = this;
switch (_that) {
case DocsUploaded():
return uploaded(_that.application,_that.title,_that.withFile);case DocsRemoved():
return removed(_that.application,_that.title);case DocsUploadFailed():
return uploadFailed(_that.failure);case DocsRemoveFailed():
return removeFailed(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Application application,  String title,  bool withFile)?  uploaded,TResult? Function( Application application,  String title)?  removed,TResult? Function( Failure failure)?  uploadFailed,TResult? Function( Failure failure)?  removeFailed,}) {final _that = this;
switch (_that) {
case DocsUploaded() when uploaded != null:
return uploaded(_that.application,_that.title,_that.withFile);case DocsRemoved() when removed != null:
return removed(_that.application,_that.title);case DocsUploadFailed() when uploadFailed != null:
return uploadFailed(_that.failure);case DocsRemoveFailed() when removeFailed != null:
return removeFailed(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class DocsUploaded implements DocsNotice {
  const DocsUploaded({required this.application, required this.title, required this.withFile});
  

 final  Application application;
 final  String title;
 final  bool withFile;

/// Create a copy of DocsNotice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocsUploadedCopyWith<DocsUploaded> get copyWith => _$DocsUploadedCopyWithImpl<DocsUploaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DocsUploaded&&(identical(other.application, application) || other.application == application)&&(identical(other.title, title) || other.title == title)&&(identical(other.withFile, withFile) || other.withFile == withFile));
}


@override
int get hashCode {
    return Object.hash(runtimeType,application,title,withFile);
}

@override
String toString() {
    return 'DocsNotice.uploaded(application: $application, title: $title, withFile: $withFile)';
}


}

/// @nodoc
abstract mixin class $DocsUploadedCopyWith<$Res> implements $DocsNoticeCopyWith<$Res> {
  factory $DocsUploadedCopyWith(DocsUploaded value, $Res Function(DocsUploaded) _then) = _$DocsUploadedCopyWithImpl;
@useResult
$Res call({
 Application application, String title, bool withFile
});


$ApplicationCopyWith<$Res> get application;

}
/// @nodoc
class _$DocsUploadedCopyWithImpl<$Res>
    implements $DocsUploadedCopyWith<$Res> {
  _$DocsUploadedCopyWithImpl(this._self, this._then);

  final DocsUploaded _self;
  final $Res Function(DocsUploaded) _then;

/// Create a copy of DocsNotice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? application = null,Object? title = null,Object? withFile = null,}) {
  return _then(DocsUploaded(
application: null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as Application,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,withFile: null == withFile ? _self.withFile : withFile // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of DocsNotice
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


class DocsRemoved implements DocsNotice {
  const DocsRemoved({required this.application, required this.title});
  

 final  Application application;
 final  String title;

/// Create a copy of DocsNotice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocsRemovedCopyWith<DocsRemoved> get copyWith => _$DocsRemovedCopyWithImpl<DocsRemoved>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DocsRemoved&&(identical(other.application, application) || other.application == application)&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode {
    return Object.hash(runtimeType,application,title);
}

@override
String toString() {
    return 'DocsNotice.removed(application: $application, title: $title)';
}


}

/// @nodoc
abstract mixin class $DocsRemovedCopyWith<$Res> implements $DocsNoticeCopyWith<$Res> {
  factory $DocsRemovedCopyWith(DocsRemoved value, $Res Function(DocsRemoved) _then) = _$DocsRemovedCopyWithImpl;
@useResult
$Res call({
 Application application, String title
});


$ApplicationCopyWith<$Res> get application;

}
/// @nodoc
class _$DocsRemovedCopyWithImpl<$Res>
    implements $DocsRemovedCopyWith<$Res> {
  _$DocsRemovedCopyWithImpl(this._self, this._then);

  final DocsRemoved _self;
  final $Res Function(DocsRemoved) _then;

/// Create a copy of DocsNotice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? application = null,Object? title = null,}) {
  return _then(DocsRemoved(
application: null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as Application,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of DocsNotice
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


class DocsUploadFailed implements DocsNotice {
  const DocsUploadFailed(this.failure);
  

 final  Failure failure;

/// Create a copy of DocsNotice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocsUploadFailedCopyWith<DocsUploadFailed> get copyWith => _$DocsUploadFailedCopyWithImpl<DocsUploadFailed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DocsUploadFailed&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,failure);
}

@override
String toString() {
    return 'DocsNotice.uploadFailed(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $DocsUploadFailedCopyWith<$Res> implements $DocsNoticeCopyWith<$Res> {
  factory $DocsUploadFailedCopyWith(DocsUploadFailed value, $Res Function(DocsUploadFailed) _then) = _$DocsUploadFailedCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$DocsUploadFailedCopyWithImpl<$Res>
    implements $DocsUploadFailedCopyWith<$Res> {
  _$DocsUploadFailedCopyWithImpl(this._self, this._then);

  final DocsUploadFailed _self;
  final $Res Function(DocsUploadFailed) _then;

/// Create a copy of DocsNotice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(DocsUploadFailed(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of DocsNotice
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


class DocsRemoveFailed implements DocsNotice {
  const DocsRemoveFailed(this.failure);
  

 final  Failure failure;

/// Create a copy of DocsNotice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocsRemoveFailedCopyWith<DocsRemoveFailed> get copyWith => _$DocsRemoveFailedCopyWithImpl<DocsRemoveFailed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DocsRemoveFailed&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,failure);
}

@override
String toString() {
    return 'DocsNotice.removeFailed(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $DocsRemoveFailedCopyWith<$Res> implements $DocsNoticeCopyWith<$Res> {
  factory $DocsRemoveFailedCopyWith(DocsRemoveFailed value, $Res Function(DocsRemoveFailed) _then) = _$DocsRemoveFailedCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$DocsRemoveFailedCopyWithImpl<$Res>
    implements $DocsRemoveFailedCopyWith<$Res> {
  _$DocsRemoveFailedCopyWithImpl(this._self, this._then);

  final DocsRemoveFailed _self;
  final $Res Function(DocsRemoveFailed) _then;

/// Create a copy of DocsNotice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(DocsRemoveFailed(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of DocsNotice
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
mixin _$DocumentsState {

 String? get pending; DocsNotice? get notice; int get noticeSeq;
/// Create a copy of DocumentsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentsStateCopyWith<DocumentsState> get copyWith => _$DocumentsStateCopyWithImpl<DocumentsState>(this as DocumentsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DocumentsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentsState&&(identical(other.pending, _this.pending) || other.pending == _this.pending)&&(identical(other.notice, _this.notice) || other.notice == _this.notice)&&(identical(other.noticeSeq, _this.noticeSeq) || other.noticeSeq == _this.noticeSeq));
}


@override
int get hashCode {
  final _this = this as DocumentsState;
  return Object.hash(runtimeType,_this.pending,_this.notice,_this.noticeSeq);
}

@override
String toString() {
  final _this = this as DocumentsState;
  return 'DocumentsState(pending: ${_this.pending}, notice: ${_this.notice}, noticeSeq: ${_this.noticeSeq})';
}


}

/// @nodoc
abstract mixin class $DocumentsStateCopyWith<$Res>  {
  factory $DocumentsStateCopyWith(DocumentsState value, $Res Function(DocumentsState) _then) = _$DocumentsStateCopyWithImpl;
@useResult
$Res call({
 String? pending, DocsNotice? notice, int noticeSeq
});


$DocsNoticeCopyWith<$Res>? get notice;

}
/// @nodoc
class _$DocumentsStateCopyWithImpl<$Res>
    implements $DocumentsStateCopyWith<$Res> {
  _$DocumentsStateCopyWithImpl(this._self, this._then);

  final DocumentsState _self;
  final $Res Function(DocumentsState) _then;

/// Create a copy of DocumentsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pending = freezed,Object? notice = freezed,Object? noticeSeq = null,}) {
  return _then(DocumentsState(
pending: freezed == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as String?,notice: freezed == notice ? _self.notice : notice // ignore: cast_nullable_to_non_nullable
as DocsNotice?,noticeSeq: null == noticeSeq ? _self.noticeSeq : noticeSeq // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of DocumentsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocsNoticeCopyWith<$Res>? get notice {
    if (_self.notice == null) {
    return null;
  }

  return $DocsNoticeCopyWith<$Res>(_self.notice!, (value) {
    return _then(_self.copyWith(notice: value));
  });
}
}


/// Adds pattern-matching-related methods to [DocumentsState].
extension DocumentsStatePatterns on DocumentsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentsState value)  $default,){
final _that = this;
switch (_that) {
case _DocumentsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentsState value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? pending,  DocsNotice? notice,  int noticeSeq)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentsState() when $default != null:
return $default(_that.pending,_that.notice,_that.noticeSeq);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? pending,  DocsNotice? notice,  int noticeSeq)  $default,) {final _that = this;
switch (_that) {
case _DocumentsState():
return $default(_that.pending,_that.notice,_that.noticeSeq);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? pending,  DocsNotice? notice,  int noticeSeq)?  $default,) {final _that = this;
switch (_that) {
case _DocumentsState() when $default != null:
return $default(_that.pending,_that.notice,_that.noticeSeq);case _:
  return null;

}
}

}

/// @nodoc


class _DocumentsState extends DocumentsState {
  const _DocumentsState({this.pending, this.notice, this.noticeSeq = 0}): super._();
  

@override final  String? pending;
@override final  DocsNotice? notice;
@override@JsonKey() final  int noticeSeq;

/// Create a copy of DocumentsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentsStateCopyWith<_DocumentsState> get copyWith => __$DocumentsStateCopyWithImpl<_DocumentsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentsState&&(identical(other.pending, pending) || other.pending == pending)&&(identical(other.notice, notice) || other.notice == notice)&&(identical(other.noticeSeq, noticeSeq) || other.noticeSeq == noticeSeq));
}


@override
int get hashCode {
    return Object.hash(runtimeType,pending,notice,noticeSeq);
}

@override
String toString() {
    return 'DocumentsState(pending: $pending, notice: $notice, noticeSeq: $noticeSeq)';
}


}

/// @nodoc
abstract mixin class _$DocumentsStateCopyWith<$Res> implements $DocumentsStateCopyWith<$Res> {
  factory _$DocumentsStateCopyWith(_DocumentsState value, $Res Function(_DocumentsState) _then) = __$DocumentsStateCopyWithImpl;
@override @useResult
$Res call({
 String? pending, DocsNotice? notice, int noticeSeq
});


@override $DocsNoticeCopyWith<$Res>? get notice;

}
/// @nodoc
class __$DocumentsStateCopyWithImpl<$Res>
    implements _$DocumentsStateCopyWith<$Res> {
  __$DocumentsStateCopyWithImpl(this._self, this._then);

  final _DocumentsState _self;
  final $Res Function(_DocumentsState) _then;

/// Create a copy of DocumentsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pending = freezed,Object? notice = freezed,Object? noticeSeq = null,}) {
  return _then(_DocumentsState(
pending: freezed == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as String?,notice: freezed == notice ? _self.notice : notice // ignore: cast_nullable_to_non_nullable
as DocsNotice?,noticeSeq: null == noticeSeq ? _self.noticeSeq : noticeSeq // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of DocumentsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocsNoticeCopyWith<$Res>? get notice {
    if (_self.notice == null) {
    return null;
  }

  return $DocsNoticeCopyWith<$Res>(_self.notice!, (value) {
    return _then(_self.copyWith(notice: value));
  });
}
}

// dart format on
