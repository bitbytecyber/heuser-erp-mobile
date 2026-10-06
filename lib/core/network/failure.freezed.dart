// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'Failure()';
}


}

/// @nodoc
class $FailureCopyWith<$Res>  {
$FailureCopyWith(Failure _, $Res Function(Failure) __);
}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NoConnection value)?  noConnection,TResult Function( Unreachable value)?  unreachable,TResult Function( Timeout value)?  timeout,TResult Function( Unauthenticated value)?  unauthenticated,TResult Function( Forbidden value)?  forbidden,TResult Function( NotFound value)?  notFound,TResult Function( Validation value)?  validation,TResult Function( Conflict value)?  conflict,TResult Function( RateLimited value)?  rateLimited,TResult Function( ModuleDisabled value)?  moduleDisabled,TResult Function( Server value)?  server,TResult Function( Cancelled value)?  cancelled,TResult Function( Unknown value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NoConnection() when noConnection != null:
return noConnection(_that);case Unreachable() when unreachable != null:
return unreachable(_that);case Timeout() when timeout != null:
return timeout(_that);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case Forbidden() when forbidden != null:
return forbidden(_that);case NotFound() when notFound != null:
return notFound(_that);case Validation() when validation != null:
return validation(_that);case Conflict() when conflict != null:
return conflict(_that);case RateLimited() when rateLimited != null:
return rateLimited(_that);case ModuleDisabled() when moduleDisabled != null:
return moduleDisabled(_that);case Server() when server != null:
return server(_that);case Cancelled() when cancelled != null:
return cancelled(_that);case Unknown() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NoConnection value)  noConnection,required TResult Function( Unreachable value)  unreachable,required TResult Function( Timeout value)  timeout,required TResult Function( Unauthenticated value)  unauthenticated,required TResult Function( Forbidden value)  forbidden,required TResult Function( NotFound value)  notFound,required TResult Function( Validation value)  validation,required TResult Function( Conflict value)  conflict,required TResult Function( RateLimited value)  rateLimited,required TResult Function( ModuleDisabled value)  moduleDisabled,required TResult Function( Server value)  server,required TResult Function( Cancelled value)  cancelled,required TResult Function( Unknown value)  unknown,}){
final _that = this;
switch (_that) {
case NoConnection():
return noConnection(_that);case Unreachable():
return unreachable(_that);case Timeout():
return timeout(_that);case Unauthenticated():
return unauthenticated(_that);case Forbidden():
return forbidden(_that);case NotFound():
return notFound(_that);case Validation():
return validation(_that);case Conflict():
return conflict(_that);case RateLimited():
return rateLimited(_that);case ModuleDisabled():
return moduleDisabled(_that);case Server():
return server(_that);case Cancelled():
return cancelled(_that);case Unknown():
return unknown(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NoConnection value)?  noConnection,TResult? Function( Unreachable value)?  unreachable,TResult? Function( Timeout value)?  timeout,TResult? Function( Unauthenticated value)?  unauthenticated,TResult? Function( Forbidden value)?  forbidden,TResult? Function( NotFound value)?  notFound,TResult? Function( Validation value)?  validation,TResult? Function( Conflict value)?  conflict,TResult? Function( RateLimited value)?  rateLimited,TResult? Function( ModuleDisabled value)?  moduleDisabled,TResult? Function( Server value)?  server,TResult? Function( Cancelled value)?  cancelled,TResult? Function( Unknown value)?  unknown,}){
final _that = this;
switch (_that) {
case NoConnection() when noConnection != null:
return noConnection(_that);case Unreachable() when unreachable != null:
return unreachable(_that);case Timeout() when timeout != null:
return timeout(_that);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case Forbidden() when forbidden != null:
return forbidden(_that);case NotFound() when notFound != null:
return notFound(_that);case Validation() when validation != null:
return validation(_that);case Conflict() when conflict != null:
return conflict(_that);case RateLimited() when rateLimited != null:
return rateLimited(_that);case ModuleDisabled() when moduleDisabled != null:
return moduleDisabled(_that);case Server() when server != null:
return server(_that);case Cancelled() when cancelled != null:
return cancelled(_that);case Unknown() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Uri? uri)?  noConnection,TResult Function( Uri? uri)?  unreachable,TResult Function( Uri? uri)?  timeout,TResult Function( String? message)?  unauthenticated,TResult Function( String? message)?  forbidden,TResult Function( String? message)?  notFound,TResult Function( String code,  String? message,  Map<String, dynamic>? details,  List<String> missing,  Map<String, String> fieldErrors)?  validation,TResult Function( String? message)?  conflict,TResult Function()?  rateLimited,TResult Function( String code)?  moduleDisabled,TResult Function( int? status)?  server,TResult Function()?  cancelled,TResult Function( Object? cause)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NoConnection() when noConnection != null:
return noConnection(_that.uri);case Unreachable() when unreachable != null:
return unreachable(_that.uri);case Timeout() when timeout != null:
return timeout(_that.uri);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that.message);case Forbidden() when forbidden != null:
return forbidden(_that.message);case NotFound() when notFound != null:
return notFound(_that.message);case Validation() when validation != null:
return validation(_that.code,_that.message,_that.details,_that.missing,_that.fieldErrors);case Conflict() when conflict != null:
return conflict(_that.message);case RateLimited() when rateLimited != null:
return rateLimited();case ModuleDisabled() when moduleDisabled != null:
return moduleDisabled(_that.code);case Server() when server != null:
return server(_that.status);case Cancelled() when cancelled != null:
return cancelled();case Unknown() when unknown != null:
return unknown(_that.cause);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Uri? uri)  noConnection,required TResult Function( Uri? uri)  unreachable,required TResult Function( Uri? uri)  timeout,required TResult Function( String? message)  unauthenticated,required TResult Function( String? message)  forbidden,required TResult Function( String? message)  notFound,required TResult Function( String code,  String? message,  Map<String, dynamic>? details,  List<String> missing,  Map<String, String> fieldErrors)  validation,required TResult Function( String? message)  conflict,required TResult Function()  rateLimited,required TResult Function( String code)  moduleDisabled,required TResult Function( int? status)  server,required TResult Function()  cancelled,required TResult Function( Object? cause)  unknown,}) {final _that = this;
switch (_that) {
case NoConnection():
return noConnection(_that.uri);case Unreachable():
return unreachable(_that.uri);case Timeout():
return timeout(_that.uri);case Unauthenticated():
return unauthenticated(_that.message);case Forbidden():
return forbidden(_that.message);case NotFound():
return notFound(_that.message);case Validation():
return validation(_that.code,_that.message,_that.details,_that.missing,_that.fieldErrors);case Conflict():
return conflict(_that.message);case RateLimited():
return rateLimited();case ModuleDisabled():
return moduleDisabled(_that.code);case Server():
return server(_that.status);case Cancelled():
return cancelled();case Unknown():
return unknown(_that.cause);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Uri? uri)?  noConnection,TResult? Function( Uri? uri)?  unreachable,TResult? Function( Uri? uri)?  timeout,TResult? Function( String? message)?  unauthenticated,TResult? Function( String? message)?  forbidden,TResult? Function( String? message)?  notFound,TResult? Function( String code,  String? message,  Map<String, dynamic>? details,  List<String> missing,  Map<String, String> fieldErrors)?  validation,TResult? Function( String? message)?  conflict,TResult? Function()?  rateLimited,TResult? Function( String code)?  moduleDisabled,TResult? Function( int? status)?  server,TResult? Function()?  cancelled,TResult? Function( Object? cause)?  unknown,}) {final _that = this;
switch (_that) {
case NoConnection() when noConnection != null:
return noConnection(_that.uri);case Unreachable() when unreachable != null:
return unreachable(_that.uri);case Timeout() when timeout != null:
return timeout(_that.uri);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that.message);case Forbidden() when forbidden != null:
return forbidden(_that.message);case NotFound() when notFound != null:
return notFound(_that.message);case Validation() when validation != null:
return validation(_that.code,_that.message,_that.details,_that.missing,_that.fieldErrors);case Conflict() when conflict != null:
return conflict(_that.message);case RateLimited() when rateLimited != null:
return rateLimited();case ModuleDisabled() when moduleDisabled != null:
return moduleDisabled(_that.code);case Server() when server != null:
return server(_that.status);case Cancelled() when cancelled != null:
return cancelled();case Unknown() when unknown != null:
return unknown(_that.cause);case _:
  return null;

}
}

}

/// @nodoc


class NoConnection extends Failure {
  const NoConnection({this.uri}): super._();
  

 final  Uri? uri;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoConnectionCopyWith<NoConnection> get copyWith => _$NoConnectionCopyWithImpl<NoConnection>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is NoConnection&&(identical(other.uri, uri) || other.uri == uri));
}


@override
int get hashCode {
    return Object.hash(runtimeType,uri);
}

@override
String toString() {
    return 'Failure.noConnection(uri: $uri)';
}


}

/// @nodoc
abstract mixin class $NoConnectionCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $NoConnectionCopyWith(NoConnection value, $Res Function(NoConnection) _then) = _$NoConnectionCopyWithImpl;
@useResult
$Res call({
 Uri? uri
});




}
/// @nodoc
class _$NoConnectionCopyWithImpl<$Res>
    implements $NoConnectionCopyWith<$Res> {
  _$NoConnectionCopyWithImpl(this._self, this._then);

  final NoConnection _self;
  final $Res Function(NoConnection) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uri = freezed,}) {
  return _then(NoConnection(
uri: freezed == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as Uri?,
  ));
}


}

/// @nodoc


class Unreachable extends Failure {
  const Unreachable({this.uri}): super._();
  

 final  Uri? uri;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnreachableCopyWith<Unreachable> get copyWith => _$UnreachableCopyWithImpl<Unreachable>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Unreachable&&(identical(other.uri, uri) || other.uri == uri));
}


@override
int get hashCode {
    return Object.hash(runtimeType,uri);
}

@override
String toString() {
    return 'Failure.unreachable(uri: $uri)';
}


}

/// @nodoc
abstract mixin class $UnreachableCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $UnreachableCopyWith(Unreachable value, $Res Function(Unreachable) _then) = _$UnreachableCopyWithImpl;
@useResult
$Res call({
 Uri? uri
});




}
/// @nodoc
class _$UnreachableCopyWithImpl<$Res>
    implements $UnreachableCopyWith<$Res> {
  _$UnreachableCopyWithImpl(this._self, this._then);

  final Unreachable _self;
  final $Res Function(Unreachable) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uri = freezed,}) {
  return _then(Unreachable(
uri: freezed == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as Uri?,
  ));
}


}

/// @nodoc


class Timeout extends Failure {
  const Timeout({this.uri}): super._();
  

 final  Uri? uri;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeoutCopyWith<Timeout> get copyWith => _$TimeoutCopyWithImpl<Timeout>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Timeout&&(identical(other.uri, uri) || other.uri == uri));
}


@override
int get hashCode {
    return Object.hash(runtimeType,uri);
}

@override
String toString() {
    return 'Failure.timeout(uri: $uri)';
}


}

/// @nodoc
abstract mixin class $TimeoutCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $TimeoutCopyWith(Timeout value, $Res Function(Timeout) _then) = _$TimeoutCopyWithImpl;
@useResult
$Res call({
 Uri? uri
});




}
/// @nodoc
class _$TimeoutCopyWithImpl<$Res>
    implements $TimeoutCopyWith<$Res> {
  _$TimeoutCopyWithImpl(this._self, this._then);

  final Timeout _self;
  final $Res Function(Timeout) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uri = freezed,}) {
  return _then(Timeout(
uri: freezed == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as Uri?,
  ));
}


}

/// @nodoc


class Unauthenticated extends Failure {
  const Unauthenticated({this.message}): super._();
  

 final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnauthenticatedCopyWith<Unauthenticated> get copyWith => _$UnauthenticatedCopyWithImpl<Unauthenticated>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Unauthenticated&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'Failure.unauthenticated(message: $message)';
}


}

/// @nodoc
abstract mixin class $UnauthenticatedCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $UnauthenticatedCopyWith(Unauthenticated value, $Res Function(Unauthenticated) _then) = _$UnauthenticatedCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$UnauthenticatedCopyWithImpl<$Res>
    implements $UnauthenticatedCopyWith<$Res> {
  _$UnauthenticatedCopyWithImpl(this._self, this._then);

  final Unauthenticated _self;
  final $Res Function(Unauthenticated) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(Unauthenticated(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class Forbidden extends Failure {
  const Forbidden({this.message}): super._();
  

 final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForbiddenCopyWith<Forbidden> get copyWith => _$ForbiddenCopyWithImpl<Forbidden>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Forbidden&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'Failure.forbidden(message: $message)';
}


}

/// @nodoc
abstract mixin class $ForbiddenCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ForbiddenCopyWith(Forbidden value, $Res Function(Forbidden) _then) = _$ForbiddenCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$ForbiddenCopyWithImpl<$Res>
    implements $ForbiddenCopyWith<$Res> {
  _$ForbiddenCopyWithImpl(this._self, this._then);

  final Forbidden _self;
  final $Res Function(Forbidden) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(Forbidden(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class NotFound extends Failure {
  const NotFound({this.message}): super._();
  

 final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotFoundCopyWith<NotFound> get copyWith => _$NotFoundCopyWithImpl<NotFound>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is NotFound&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'Failure.notFound(message: $message)';
}


}

/// @nodoc
abstract mixin class $NotFoundCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $NotFoundCopyWith(NotFound value, $Res Function(NotFound) _then) = _$NotFoundCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$NotFoundCopyWithImpl<$Res>
    implements $NotFoundCopyWith<$Res> {
  _$NotFoundCopyWithImpl(this._self, this._then);

  final NotFound _self;
  final $Res Function(NotFound) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(NotFound(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class Validation extends Failure {
  const Validation({required this.code, this.message,  Map<String, dynamic>? details,  List<String> missing = const <String>[],  Map<String, String> fieldErrors = const <String, String>{}}): _details = details,_missing = missing,_fieldErrors = fieldErrors,super._();
  

 final  String code;
 final  String? message;
 final  Map<String, dynamic>? _details;
 Map<String, dynamic>? get details {
  final value = _details;
  if (value == null) return null;
  if (_details is EqualUnmodifiableMapView) return _details;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<String> _missing;
@JsonKey() List<String> get missing {
  if (_missing is EqualUnmodifiableListView) return _missing;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_missing);
}

 final  Map<String, String> _fieldErrors;
@JsonKey() Map<String, String> get fieldErrors {
  if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_fieldErrors);
}


/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidationCopyWith<Validation> get copyWith => _$ValidationCopyWithImpl<Validation>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Validation&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.details, _details)&&const DeepCollectionEquality().equals(other.missing, _missing)&&const DeepCollectionEquality().equals(other.fieldErrors, _fieldErrors));
}


@override
int get hashCode {
    return Object.hash(runtimeType,code,message,const DeepCollectionEquality().hash(_details),const DeepCollectionEquality().hash(_missing),const DeepCollectionEquality().hash(_fieldErrors));
}

@override
String toString() {
    return 'Failure.validation(code: $code, message: $message, details: $details, missing: $missing, fieldErrors: $fieldErrors)';
}


}

/// @nodoc
abstract mixin class $ValidationCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ValidationCopyWith(Validation value, $Res Function(Validation) _then) = _$ValidationCopyWithImpl;
@useResult
$Res call({
 String code, String? message, Map<String, dynamic>? details, List<String> missing, Map<String, String> fieldErrors
});




}
/// @nodoc
class _$ValidationCopyWithImpl<$Res>
    implements $ValidationCopyWith<$Res> {
  _$ValidationCopyWithImpl(this._self, this._then);

  final Validation _self;
  final $Res Function(Validation) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = freezed,Object? details = freezed,Object? missing = null,Object? fieldErrors = null,}) {
  return _then(Validation(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,details: freezed == details ? _self._details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,missing: null == missing ? _self._missing : missing // ignore: cast_nullable_to_non_nullable
as List<String>,fieldErrors: null == fieldErrors ? _self._fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}

/// @nodoc


class Conflict extends Failure {
  const Conflict({this.message}): super._();
  

 final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConflictCopyWith<Conflict> get copyWith => _$ConflictCopyWithImpl<Conflict>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Conflict&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'Failure.conflict(message: $message)';
}


}

/// @nodoc
abstract mixin class $ConflictCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ConflictCopyWith(Conflict value, $Res Function(Conflict) _then) = _$ConflictCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$ConflictCopyWithImpl<$Res>
    implements $ConflictCopyWith<$Res> {
  _$ConflictCopyWithImpl(this._self, this._then);

  final Conflict _self;
  final $Res Function(Conflict) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(Conflict(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class RateLimited extends Failure {
  const RateLimited(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is RateLimited);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'Failure.rateLimited()';
}


}




/// @nodoc


class ModuleDisabled extends Failure {
  const ModuleDisabled({required this.code}): super._();
  

 final  String code;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModuleDisabledCopyWith<ModuleDisabled> get copyWith => _$ModuleDisabledCopyWithImpl<ModuleDisabled>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ModuleDisabled&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode {
    return Object.hash(runtimeType,code);
}

@override
String toString() {
    return 'Failure.moduleDisabled(code: $code)';
}


}

/// @nodoc
abstract mixin class $ModuleDisabledCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ModuleDisabledCopyWith(ModuleDisabled value, $Res Function(ModuleDisabled) _then) = _$ModuleDisabledCopyWithImpl;
@useResult
$Res call({
 String code
});




}
/// @nodoc
class _$ModuleDisabledCopyWithImpl<$Res>
    implements $ModuleDisabledCopyWith<$Res> {
  _$ModuleDisabledCopyWithImpl(this._self, this._then);

  final ModuleDisabled _self;
  final $Res Function(ModuleDisabled) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,}) {
  return _then(ModuleDisabled(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Server extends Failure {
  const Server({this.status}): super._();
  

 final  int? status;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerCopyWith<Server> get copyWith => _$ServerCopyWithImpl<Server>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Server&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status);
}

@override
String toString() {
    return 'Failure.server(status: $status)';
}


}

/// @nodoc
abstract mixin class $ServerCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ServerCopyWith(Server value, $Res Function(Server) _then) = _$ServerCopyWithImpl;
@useResult
$Res call({
 int? status
});




}
/// @nodoc
class _$ServerCopyWithImpl<$Res>
    implements $ServerCopyWith<$Res> {
  _$ServerCopyWithImpl(this._self, this._then);

  final Server _self;
  final $Res Function(Server) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = freezed,}) {
  return _then(Server(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class Cancelled extends Failure {
  const Cancelled(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Cancelled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'Failure.cancelled()';
}


}




/// @nodoc


class Unknown extends Failure {
  const Unknown({this.cause}): super._();
  

 final  Object? cause;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnknownCopyWith<Unknown> get copyWith => _$UnknownCopyWithImpl<Unknown>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Unknown&&const DeepCollectionEquality().equals(other.cause, cause));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(cause));
}

@override
String toString() {
    return 'Failure.unknown(cause: $cause)';
}


}

/// @nodoc
abstract mixin class $UnknownCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $UnknownCopyWith(Unknown value, $Res Function(Unknown) _then) = _$UnknownCopyWithImpl;
@useResult
$Res call({
 Object? cause
});




}
/// @nodoc
class _$UnknownCopyWithImpl<$Res>
    implements $UnknownCopyWith<$Res> {
  _$UnknownCopyWithImpl(this._self, this._then);

  final Unknown _self;
  final $Res Function(Unknown) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cause = freezed,}) {
  return _then(Unknown(
cause: freezed == cause ? _self.cause : cause ,
  ));
}


}

// dart format on
