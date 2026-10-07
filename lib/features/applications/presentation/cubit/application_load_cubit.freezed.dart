// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_load_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApplicationLoadState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationLoadState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ApplicationLoadState()';
}


}

/// @nodoc
class $ApplicationLoadStateCopyWith<$Res>  {
$ApplicationLoadStateCopyWith(ApplicationLoadState _, $Res Function(ApplicationLoadState) __);
}


/// Adds pattern-matching-related methods to [ApplicationLoadState].
extension ApplicationLoadStatePatterns on ApplicationLoadState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ApplicationLoading value)?  loading,TResult Function( ApplicationLoaded value)?  loaded,TResult Function( ApplicationLoadFailed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ApplicationLoading() when loading != null:
return loading(_that);case ApplicationLoaded() when loaded != null:
return loaded(_that);case ApplicationLoadFailed() when failed != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ApplicationLoading value)  loading,required TResult Function( ApplicationLoaded value)  loaded,required TResult Function( ApplicationLoadFailed value)  failed,}){
final _that = this;
switch (_that) {
case ApplicationLoading():
return loading(_that);case ApplicationLoaded():
return loaded(_that);case ApplicationLoadFailed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ApplicationLoading value)?  loading,TResult? Function( ApplicationLoaded value)?  loaded,TResult? Function( ApplicationLoadFailed value)?  failed,}){
final _that = this;
switch (_that) {
case ApplicationLoading() when loading != null:
return loading(_that);case ApplicationLoaded() when loaded != null:
return loaded(_that);case ApplicationLoadFailed() when failed != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( Application application)?  loaded,TResult Function( Failure failure)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ApplicationLoading() when loading != null:
return loading();case ApplicationLoaded() when loaded != null:
return loaded(_that.application);case ApplicationLoadFailed() when failed != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( Application application)  loaded,required TResult Function( Failure failure)  failed,}) {final _that = this;
switch (_that) {
case ApplicationLoading():
return loading();case ApplicationLoaded():
return loaded(_that.application);case ApplicationLoadFailed():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( Application application)?  loaded,TResult? Function( Failure failure)?  failed,}) {final _that = this;
switch (_that) {
case ApplicationLoading() when loading != null:
return loading();case ApplicationLoaded() when loaded != null:
return loaded(_that.application);case ApplicationLoadFailed() when failed != null:
return failed(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class ApplicationLoading implements ApplicationLoadState {
  const ApplicationLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ApplicationLoadState.loading()';
}


}




/// @nodoc


class ApplicationLoaded implements ApplicationLoadState {
  const ApplicationLoaded(this.application);
  

 final  Application application;

/// Create a copy of ApplicationLoadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationLoadedCopyWith<ApplicationLoaded> get copyWith => _$ApplicationLoadedCopyWithImpl<ApplicationLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationLoaded&&(identical(other.application, application) || other.application == application));
}


@override
int get hashCode {
    return Object.hash(runtimeType,application);
}

@override
String toString() {
    return 'ApplicationLoadState.loaded(application: $application)';
}


}

/// @nodoc
abstract mixin class $ApplicationLoadedCopyWith<$Res> implements $ApplicationLoadStateCopyWith<$Res> {
  factory $ApplicationLoadedCopyWith(ApplicationLoaded value, $Res Function(ApplicationLoaded) _then) = _$ApplicationLoadedCopyWithImpl;
@useResult
$Res call({
 Application application
});


$ApplicationCopyWith<$Res> get application;

}
/// @nodoc
class _$ApplicationLoadedCopyWithImpl<$Res>
    implements $ApplicationLoadedCopyWith<$Res> {
  _$ApplicationLoadedCopyWithImpl(this._self, this._then);

  final ApplicationLoaded _self;
  final $Res Function(ApplicationLoaded) _then;

/// Create a copy of ApplicationLoadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? application = null,}) {
  return _then(ApplicationLoaded(
null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as Application,
  ));
}

/// Create a copy of ApplicationLoadState
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


class ApplicationLoadFailed implements ApplicationLoadState {
  const ApplicationLoadFailed(this.failure);
  

 final  Failure failure;

/// Create a copy of ApplicationLoadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationLoadFailedCopyWith<ApplicationLoadFailed> get copyWith => _$ApplicationLoadFailedCopyWithImpl<ApplicationLoadFailed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationLoadFailed&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,failure);
}

@override
String toString() {
    return 'ApplicationLoadState.failed(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ApplicationLoadFailedCopyWith<$Res> implements $ApplicationLoadStateCopyWith<$Res> {
  factory $ApplicationLoadFailedCopyWith(ApplicationLoadFailed value, $Res Function(ApplicationLoadFailed) _then) = _$ApplicationLoadFailedCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$ApplicationLoadFailedCopyWithImpl<$Res>
    implements $ApplicationLoadFailedCopyWith<$Res> {
  _$ApplicationLoadFailedCopyWithImpl(this._self, this._then);

  final ApplicationLoadFailed _self;
  final $Res Function(ApplicationLoadFailed) _then;

/// Create a copy of ApplicationLoadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ApplicationLoadFailed(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of ApplicationLoadState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res> get failure {
  
  return $FailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
