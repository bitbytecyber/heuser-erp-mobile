// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_errors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FormError {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FormError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'FormError()';
}


}

/// @nodoc
class $FormErrorCopyWith<$Res>  {
$FormErrorCopyWith(FormError _, $Res Function(FormError) __);
}


/// Adds pattern-matching-related methods to [FormError].
extension FormErrorPatterns on FormError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FormRequired value)?  required,TResult Function( FormFormat value)?  format,TResult Function( FormTeacher value)?  teacher,TResult Function( FormStatementShort value)?  statementShort,TResult Function( FormStatementLong value)?  statementLong,TResult Function( FormServer value)?  server,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FormRequired() when required != null:
return required(_that);case FormFormat() when format != null:
return format(_that);case FormTeacher() when teacher != null:
return teacher(_that);case FormStatementShort() when statementShort != null:
return statementShort(_that);case FormStatementLong() when statementLong != null:
return statementLong(_that);case FormServer() when server != null:
return server(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FormRequired value)  required,required TResult Function( FormFormat value)  format,required TResult Function( FormTeacher value)  teacher,required TResult Function( FormStatementShort value)  statementShort,required TResult Function( FormStatementLong value)  statementLong,required TResult Function( FormServer value)  server,}){
final _that = this;
switch (_that) {
case FormRequired():
return required(_that);case FormFormat():
return format(_that);case FormTeacher():
return teacher(_that);case FormStatementShort():
return statementShort(_that);case FormStatementLong():
return statementLong(_that);case FormServer():
return server(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FormRequired value)?  required,TResult? Function( FormFormat value)?  format,TResult? Function( FormTeacher value)?  teacher,TResult? Function( FormStatementShort value)?  statementShort,TResult? Function( FormStatementLong value)?  statementLong,TResult? Function( FormServer value)?  server,}){
final _that = this;
switch (_that) {
case FormRequired() when required != null:
return required(_that);case FormFormat() when format != null:
return format(_that);case FormTeacher() when teacher != null:
return teacher(_that);case FormStatementShort() when statementShort != null:
return statementShort(_that);case FormStatementLong() when statementLong != null:
return statementLong(_that);case FormServer() when server != null:
return server(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String field)?  required,TResult Function( FieldFormat format)?  format,TResult Function( String subject)?  teacher,TResult Function()?  statementShort,TResult Function()?  statementLong,TResult Function( String message)?  server,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FormRequired() when required != null:
return required(_that.field);case FormFormat() when format != null:
return format(_that.format);case FormTeacher() when teacher != null:
return teacher(_that.subject);case FormStatementShort() when statementShort != null:
return statementShort();case FormStatementLong() when statementLong != null:
return statementLong();case FormServer() when server != null:
return server(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String field)  required,required TResult Function( FieldFormat format)  format,required TResult Function( String subject)  teacher,required TResult Function()  statementShort,required TResult Function()  statementLong,required TResult Function( String message)  server,}) {final _that = this;
switch (_that) {
case FormRequired():
return required(_that.field);case FormFormat():
return format(_that.format);case FormTeacher():
return teacher(_that.subject);case FormStatementShort():
return statementShort();case FormStatementLong():
return statementLong();case FormServer():
return server(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String field)?  required,TResult? Function( FieldFormat format)?  format,TResult? Function( String subject)?  teacher,TResult? Function()?  statementShort,TResult? Function()?  statementLong,TResult? Function( String message)?  server,}) {final _that = this;
switch (_that) {
case FormRequired() when required != null:
return required(_that.field);case FormFormat() when format != null:
return format(_that.format);case FormTeacher() when teacher != null:
return teacher(_that.subject);case FormStatementShort() when statementShort != null:
return statementShort();case FormStatementLong() when statementLong != null:
return statementLong();case FormServer() when server != null:
return server(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class FormRequired implements FormError {
  const FormRequired(this.field);
  

 final  String field;

/// Create a copy of FormError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormRequiredCopyWith<FormRequired> get copyWith => _$FormRequiredCopyWithImpl<FormRequired>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FormRequired&&(identical(other.field, field) || other.field == field));
}


@override
int get hashCode {
    return Object.hash(runtimeType,field);
}

@override
String toString() {
    return 'FormError.required(field: $field)';
}


}

/// @nodoc
abstract mixin class $FormRequiredCopyWith<$Res> implements $FormErrorCopyWith<$Res> {
  factory $FormRequiredCopyWith(FormRequired value, $Res Function(FormRequired) _then) = _$FormRequiredCopyWithImpl;
@useResult
$Res call({
 String field
});




}
/// @nodoc
class _$FormRequiredCopyWithImpl<$Res>
    implements $FormRequiredCopyWith<$Res> {
  _$FormRequiredCopyWithImpl(this._self, this._then);

  final FormRequired _self;
  final $Res Function(FormRequired) _then;

/// Create a copy of FormError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field = null,}) {
  return _then(FormRequired(
null == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class FormFormat implements FormError {
  const FormFormat(this.format);
  

 final  FieldFormat format;

/// Create a copy of FormError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormFormatCopyWith<FormFormat> get copyWith => _$FormFormatCopyWithImpl<FormFormat>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FormFormat&&(identical(other.format, format) || other.format == format));
}


@override
int get hashCode {
    return Object.hash(runtimeType,format);
}

@override
String toString() {
    return 'FormError.format(format: $format)';
}


}

/// @nodoc
abstract mixin class $FormFormatCopyWith<$Res> implements $FormErrorCopyWith<$Res> {
  factory $FormFormatCopyWith(FormFormat value, $Res Function(FormFormat) _then) = _$FormFormatCopyWithImpl;
@useResult
$Res call({
 FieldFormat format
});




}
/// @nodoc
class _$FormFormatCopyWithImpl<$Res>
    implements $FormFormatCopyWith<$Res> {
  _$FormFormatCopyWithImpl(this._self, this._then);

  final FormFormat _self;
  final $Res Function(FormFormat) _then;

/// Create a copy of FormError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? format = null,}) {
  return _then(FormFormat(
null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as FieldFormat,
  ));
}


}

/// @nodoc


class FormTeacher implements FormError {
  const FormTeacher(this.subject);
  

 final  String subject;

/// Create a copy of FormError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormTeacherCopyWith<FormTeacher> get copyWith => _$FormTeacherCopyWithImpl<FormTeacher>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FormTeacher&&(identical(other.subject, subject) || other.subject == subject));
}


@override
int get hashCode {
    return Object.hash(runtimeType,subject);
}

@override
String toString() {
    return 'FormError.teacher(subject: $subject)';
}


}

/// @nodoc
abstract mixin class $FormTeacherCopyWith<$Res> implements $FormErrorCopyWith<$Res> {
  factory $FormTeacherCopyWith(FormTeacher value, $Res Function(FormTeacher) _then) = _$FormTeacherCopyWithImpl;
@useResult
$Res call({
 String subject
});




}
/// @nodoc
class _$FormTeacherCopyWithImpl<$Res>
    implements $FormTeacherCopyWith<$Res> {
  _$FormTeacherCopyWithImpl(this._self, this._then);

  final FormTeacher _self;
  final $Res Function(FormTeacher) _then;

/// Create a copy of FormError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? subject = null,}) {
  return _then(FormTeacher(
null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class FormStatementShort implements FormError {
  const FormStatementShort();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FormStatementShort);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'FormError.statementShort()';
}


}




/// @nodoc


class FormStatementLong implements FormError {
  const FormStatementLong();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FormStatementLong);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'FormError.statementLong()';
}


}




/// @nodoc


class FormServer implements FormError {
  const FormServer(this.message);
  

 final  String message;

/// Create a copy of FormError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormServerCopyWith<FormServer> get copyWith => _$FormServerCopyWithImpl<FormServer>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FormServer&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'FormError.server(message: $message)';
}


}

/// @nodoc
abstract mixin class $FormServerCopyWith<$Res> implements $FormErrorCopyWith<$Res> {
  factory $FormServerCopyWith(FormServer value, $Res Function(FormServer) _then) = _$FormServerCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$FormServerCopyWithImpl<$Res>
    implements $FormServerCopyWith<$Res> {
  _$FormServerCopyWithImpl(this._self, this._then);

  final FormServer _self;
  final $Res Function(FormServer) _then;

/// Create a copy of FormError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(FormServer(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
