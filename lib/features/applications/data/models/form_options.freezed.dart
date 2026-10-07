// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TeacherOption {

 int get id; String get name;
/// Create a copy of TeacherOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherOptionCopyWith<TeacherOption> get copyWith => _$TeacherOptionCopyWithImpl<TeacherOption>(this as TeacherOption, _$identity);

  /// Serializes this TeacherOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TeacherOption;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherOption&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TeacherOption;
  return Object.hash(runtimeType,_this.id,_this.name);
}

@override
String toString() {
  final _this = this as TeacherOption;
  return 'TeacherOption(id: ${_this.id}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $TeacherOptionCopyWith<$Res>  {
  factory $TeacherOptionCopyWith(TeacherOption value, $Res Function(TeacherOption) _then) = _$TeacherOptionCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$TeacherOptionCopyWithImpl<$Res>
    implements $TeacherOptionCopyWith<$Res> {
  _$TeacherOptionCopyWithImpl(this._self, this._then);

  final TeacherOption _self;
  final $Res Function(TeacherOption) _then;

/// Create a copy of TeacherOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(TeacherOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherOption].
extension TeacherOptionPatterns on TeacherOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherOption value)  $default,){
final _that = this;
switch (_that) {
case _TeacherOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherOption value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherOption() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name)  $default,) {final _that = this;
switch (_that) {
case _TeacherOption():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _TeacherOption() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherOption implements TeacherOption {
  const _TeacherOption({required this.id, this.name = ''});
  factory _TeacherOption.fromJson(Map<String, dynamic> json) => _$TeacherOptionFromJson(json);

@override final  int id;
@override@JsonKey() final  String name;

/// Create a copy of TeacherOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherOptionCopyWith<_TeacherOption> get copyWith => __$TeacherOptionCopyWithImpl<_TeacherOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherOptionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherOption&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name);
}

@override
String toString() {
    return 'TeacherOption(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$TeacherOptionCopyWith<$Res> implements $TeacherOptionCopyWith<$Res> {
  factory _$TeacherOptionCopyWith(_TeacherOption value, $Res Function(_TeacherOption) _then) = __$TeacherOptionCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$TeacherOptionCopyWithImpl<$Res>
    implements _$TeacherOptionCopyWith<$Res> {
  __$TeacherOptionCopyWithImpl(this._self, this._then);

  final _TeacherOption _self;
  final $Res Function(_TeacherOption) _then;

/// Create a copy of TeacherOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_TeacherOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SubjectOption {

 int get course; String get code; String get name; List<TeacherOption> get teachers;
/// Create a copy of SubjectOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubjectOptionCopyWith<SubjectOption> get copyWith => _$SubjectOptionCopyWithImpl<SubjectOption>(this as SubjectOption, _$identity);

  /// Serializes this SubjectOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SubjectOption;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubjectOption&&(identical(other.course, _this.course) || other.course == _this.course)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.name, _this.name) || other.name == _this.name)&&const DeepCollectionEquality().equals(other.teachers, _this.teachers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SubjectOption;
  return Object.hash(runtimeType,_this.course,_this.code,_this.name,const DeepCollectionEquality().hash(_this.teachers));
}

@override
String toString() {
  final _this = this as SubjectOption;
  return 'SubjectOption(course: ${_this.course}, code: ${_this.code}, name: ${_this.name}, teachers: ${_this.teachers})';
}


}

/// @nodoc
abstract mixin class $SubjectOptionCopyWith<$Res>  {
  factory $SubjectOptionCopyWith(SubjectOption value, $Res Function(SubjectOption) _then) = _$SubjectOptionCopyWithImpl;
@useResult
$Res call({
 int course, String code, String name, List<TeacherOption> teachers
});




}
/// @nodoc
class _$SubjectOptionCopyWithImpl<$Res>
    implements $SubjectOptionCopyWith<$Res> {
  _$SubjectOptionCopyWithImpl(this._self, this._then);

  final SubjectOption _self;
  final $Res Function(SubjectOption) _then;

/// Create a copy of SubjectOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? course = null,Object? code = null,Object? name = null,Object? teachers = null,}) {
  return _then(SubjectOption(
course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,teachers: null == teachers ? _self.teachers : teachers // ignore: cast_nullable_to_non_nullable
as List<TeacherOption>,
  ));
}

}


/// Adds pattern-matching-related methods to [SubjectOption].
extension SubjectOptionPatterns on SubjectOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubjectOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubjectOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubjectOption value)  $default,){
final _that = this;
switch (_that) {
case _SubjectOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubjectOption value)?  $default,){
final _that = this;
switch (_that) {
case _SubjectOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int course,  String code,  String name,  List<TeacherOption> teachers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubjectOption() when $default != null:
return $default(_that.course,_that.code,_that.name,_that.teachers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int course,  String code,  String name,  List<TeacherOption> teachers)  $default,) {final _that = this;
switch (_that) {
case _SubjectOption():
return $default(_that.course,_that.code,_that.name,_that.teachers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int course,  String code,  String name,  List<TeacherOption> teachers)?  $default,) {final _that = this;
switch (_that) {
case _SubjectOption() when $default != null:
return $default(_that.course,_that.code,_that.name,_that.teachers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubjectOption implements SubjectOption {
  const _SubjectOption({required this.course, this.code = '', this.name = '',  List<TeacherOption> teachers = const <TeacherOption>[]}): _teachers = teachers;
  factory _SubjectOption.fromJson(Map<String, dynamic> json) => _$SubjectOptionFromJson(json);

@override final  int course;
@override@JsonKey() final  String code;
@override@JsonKey() final  String name;
 final  List<TeacherOption> _teachers;
@override@JsonKey() List<TeacherOption> get teachers {
  if (_teachers is EqualUnmodifiableListView) return _teachers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_teachers);
}


/// Create a copy of SubjectOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubjectOptionCopyWith<_SubjectOption> get copyWith => __$SubjectOptionCopyWithImpl<_SubjectOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubjectOptionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubjectOption&&(identical(other.course, course) || other.course == course)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.teachers, _teachers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,course,code,name,const DeepCollectionEquality().hash(_teachers));
}

@override
String toString() {
    return 'SubjectOption(course: $course, code: $code, name: $name, teachers: $teachers)';
}


}

/// @nodoc
abstract mixin class _$SubjectOptionCopyWith<$Res> implements $SubjectOptionCopyWith<$Res> {
  factory _$SubjectOptionCopyWith(_SubjectOption value, $Res Function(_SubjectOption) _then) = __$SubjectOptionCopyWithImpl;
@override @useResult
$Res call({
 int course, String code, String name, List<TeacherOption> teachers
});




}
/// @nodoc
class __$SubjectOptionCopyWithImpl<$Res>
    implements _$SubjectOptionCopyWith<$Res> {
  __$SubjectOptionCopyWithImpl(this._self, this._then);

  final _SubjectOption _self;
  final $Res Function(_SubjectOption) _then;

/// Create a copy of SubjectOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? course = null,Object? code = null,Object? name = null,Object? teachers = null,}) {
  return _then(_SubjectOption(
course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,teachers: null == teachers ? _self._teachers : teachers // ignore: cast_nullable_to_non_nullable
as List<TeacherOption>,
  ));
}


}


/// @nodoc
mixin _$SportOption {

 int get id; String get name;@JsonKey(name: 'has_trial') bool get hasTrial;
/// Create a copy of SportOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SportOptionCopyWith<SportOption> get copyWith => _$SportOptionCopyWithImpl<SportOption>(this as SportOption, _$identity);

  /// Serializes this SportOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SportOption;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SportOption&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.hasTrial, _this.hasTrial) || other.hasTrial == _this.hasTrial));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SportOption;
  return Object.hash(runtimeType,_this.id,_this.name,_this.hasTrial);
}

@override
String toString() {
  final _this = this as SportOption;
  return 'SportOption(id: ${_this.id}, name: ${_this.name}, hasTrial: ${_this.hasTrial})';
}


}

/// @nodoc
abstract mixin class $SportOptionCopyWith<$Res>  {
  factory $SportOptionCopyWith(SportOption value, $Res Function(SportOption) _then) = _$SportOptionCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'has_trial') bool hasTrial
});




}
/// @nodoc
class _$SportOptionCopyWithImpl<$Res>
    implements $SportOptionCopyWith<$Res> {
  _$SportOptionCopyWithImpl(this._self, this._then);

  final SportOption _self;
  final $Res Function(SportOption) _then;

/// Create a copy of SportOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? hasTrial = null,}) {
  return _then(SportOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hasTrial: null == hasTrial ? _self.hasTrial : hasTrial // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SportOption].
extension SportOptionPatterns on SportOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SportOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SportOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SportOption value)  $default,){
final _that = this;
switch (_that) {
case _SportOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SportOption value)?  $default,){
final _that = this;
switch (_that) {
case _SportOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'has_trial')  bool hasTrial)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SportOption() when $default != null:
return $default(_that.id,_that.name,_that.hasTrial);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'has_trial')  bool hasTrial)  $default,) {final _that = this;
switch (_that) {
case _SportOption():
return $default(_that.id,_that.name,_that.hasTrial);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'has_trial')  bool hasTrial)?  $default,) {final _that = this;
switch (_that) {
case _SportOption() when $default != null:
return $default(_that.id,_that.name,_that.hasTrial);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SportOption implements SportOption {
  const _SportOption({required this.id, this.name = '', @JsonKey(name: 'has_trial') this.hasTrial = false});
  factory _SportOption.fromJson(Map<String, dynamic> json) => _$SportOptionFromJson(json);

@override final  int id;
@override@JsonKey() final  String name;
@override@JsonKey(name: 'has_trial') final  bool hasTrial;

/// Create a copy of SportOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SportOptionCopyWith<_SportOption> get copyWith => __$SportOptionCopyWithImpl<_SportOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SportOptionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SportOption&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.hasTrial, hasTrial) || other.hasTrial == hasTrial));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,hasTrial);
}

@override
String toString() {
    return 'SportOption(id: $id, name: $name, hasTrial: $hasTrial)';
}


}

/// @nodoc
abstract mixin class _$SportOptionCopyWith<$Res> implements $SportOptionCopyWith<$Res> {
  factory _$SportOptionCopyWith(_SportOption value, $Res Function(_SportOption) _then) = __$SportOptionCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'has_trial') bool hasTrial
});




}
/// @nodoc
class __$SportOptionCopyWithImpl<$Res>
    implements _$SportOptionCopyWith<$Res> {
  __$SportOptionCopyWithImpl(this._self, this._then);

  final _SportOption _self;
  final $Res Function(_SportOption) _then;

/// Create a copy of SportOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? hasTrial = null,}) {
  return _then(_SportOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hasTrial: null == hasTrial ? _self.hasTrial : hasTrial // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$FormOptions {

 List<SubjectOption> get subjects; List<SportOption> get sports;@JsonKey(name: 'document_types') List<DocumentType> get documentTypes;
/// Create a copy of FormOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormOptionsCopyWith<FormOptions> get copyWith => _$FormOptionsCopyWithImpl<FormOptions>(this as FormOptions, _$identity);

  /// Serializes this FormOptions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FormOptions;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormOptions&&const DeepCollectionEquality().equals(other.subjects, _this.subjects)&&const DeepCollectionEquality().equals(other.sports, _this.sports)&&const DeepCollectionEquality().equals(other.documentTypes, _this.documentTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FormOptions;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.subjects),const DeepCollectionEquality().hash(_this.sports),const DeepCollectionEquality().hash(_this.documentTypes));
}

@override
String toString() {
  final _this = this as FormOptions;
  return 'FormOptions(subjects: ${_this.subjects}, sports: ${_this.sports}, documentTypes: ${_this.documentTypes})';
}


}

/// @nodoc
abstract mixin class $FormOptionsCopyWith<$Res>  {
  factory $FormOptionsCopyWith(FormOptions value, $Res Function(FormOptions) _then) = _$FormOptionsCopyWithImpl;
@useResult
$Res call({
 List<SubjectOption> subjects, List<SportOption> sports,@JsonKey(name: 'document_types') List<DocumentType> documentTypes
});




}
/// @nodoc
class _$FormOptionsCopyWithImpl<$Res>
    implements $FormOptionsCopyWith<$Res> {
  _$FormOptionsCopyWithImpl(this._self, this._then);

  final FormOptions _self;
  final $Res Function(FormOptions) _then;

/// Create a copy of FormOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subjects = null,Object? sports = null,Object? documentTypes = null,}) {
  return _then(FormOptions(
subjects: null == subjects ? _self.subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<SubjectOption>,sports: null == sports ? _self.sports : sports // ignore: cast_nullable_to_non_nullable
as List<SportOption>,documentTypes: null == documentTypes ? _self.documentTypes : documentTypes // ignore: cast_nullable_to_non_nullable
as List<DocumentType>,
  ));
}

}


/// Adds pattern-matching-related methods to [FormOptions].
extension FormOptionsPatterns on FormOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FormOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FormOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FormOptions value)  $default,){
final _that = this;
switch (_that) {
case _FormOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FormOptions value)?  $default,){
final _that = this;
switch (_that) {
case _FormOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SubjectOption> subjects,  List<SportOption> sports, @JsonKey(name: 'document_types')  List<DocumentType> documentTypes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormOptions() when $default != null:
return $default(_that.subjects,_that.sports,_that.documentTypes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SubjectOption> subjects,  List<SportOption> sports, @JsonKey(name: 'document_types')  List<DocumentType> documentTypes)  $default,) {final _that = this;
switch (_that) {
case _FormOptions():
return $default(_that.subjects,_that.sports,_that.documentTypes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SubjectOption> subjects,  List<SportOption> sports, @JsonKey(name: 'document_types')  List<DocumentType> documentTypes)?  $default,) {final _that = this;
switch (_that) {
case _FormOptions() when $default != null:
return $default(_that.subjects,_that.sports,_that.documentTypes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FormOptions extends FormOptions {
  const _FormOptions({ List<SubjectOption> subjects = const <SubjectOption>[],  List<SportOption> sports = const <SportOption>[], @JsonKey(name: 'document_types')  List<DocumentType> documentTypes = const <DocumentType>[]}): _subjects = subjects,_sports = sports,_documentTypes = documentTypes,super._();
  factory _FormOptions.fromJson(Map<String, dynamic> json) => _$FormOptionsFromJson(json);

 final  List<SubjectOption> _subjects;
@override@JsonKey() List<SubjectOption> get subjects {
  if (_subjects is EqualUnmodifiableListView) return _subjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subjects);
}

 final  List<SportOption> _sports;
@override@JsonKey() List<SportOption> get sports {
  if (_sports is EqualUnmodifiableListView) return _sports;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sports);
}

 final  List<DocumentType> _documentTypes;
@override@JsonKey(name: 'document_types') List<DocumentType> get documentTypes {
  if (_documentTypes is EqualUnmodifiableListView) return _documentTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_documentTypes);
}


/// Create a copy of FormOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormOptionsCopyWith<_FormOptions> get copyWith => __$FormOptionsCopyWithImpl<_FormOptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FormOptionsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormOptions&&const DeepCollectionEquality().equals(other.subjects, _subjects)&&const DeepCollectionEquality().equals(other.sports, _sports)&&const DeepCollectionEquality().equals(other.documentTypes, _documentTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_subjects),const DeepCollectionEquality().hash(_sports),const DeepCollectionEquality().hash(_documentTypes));
}

@override
String toString() {
    return 'FormOptions(subjects: $subjects, sports: $sports, documentTypes: $documentTypes)';
}


}

/// @nodoc
abstract mixin class _$FormOptionsCopyWith<$Res> implements $FormOptionsCopyWith<$Res> {
  factory _$FormOptionsCopyWith(_FormOptions value, $Res Function(_FormOptions) _then) = __$FormOptionsCopyWithImpl;
@override @useResult
$Res call({
 List<SubjectOption> subjects, List<SportOption> sports,@JsonKey(name: 'document_types') List<DocumentType> documentTypes
});




}
/// @nodoc
class __$FormOptionsCopyWithImpl<$Res>
    implements _$FormOptionsCopyWith<$Res> {
  __$FormOptionsCopyWithImpl(this._self, this._then);

  final _FormOptions _self;
  final $Res Function(_FormOptions) _then;

/// Create a copy of FormOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subjects = null,Object? sports = null,Object? documentTypes = null,}) {
  return _then(_FormOptions(
subjects: null == subjects ? _self._subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<SubjectOption>,sports: null == sports ? _self._sports : sports // ignore: cast_nullable_to_non_nullable
as List<SportOption>,documentTypes: null == documentTypes ? _self._documentTypes : documentTypes // ignore: cast_nullable_to_non_nullable
as List<DocumentType>,
  ));
}


}


/// @nodoc
mixin _$StepResult {

 Application get application; List<String> get missing;
/// Create a copy of StepResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StepResultCopyWith<StepResult> get copyWith => _$StepResultCopyWithImpl<StepResult>(this as StepResult, _$identity);

  /// Serializes this StepResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as StepResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StepResult&&(identical(other.application, _this.application) || other.application == _this.application)&&const DeepCollectionEquality().equals(other.missing, _this.missing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StepResult;
  return Object.hash(runtimeType,_this.application,const DeepCollectionEquality().hash(_this.missing));
}

@override
String toString() {
  final _this = this as StepResult;
  return 'StepResult(application: ${_this.application}, missing: ${_this.missing})';
}


}

/// @nodoc
abstract mixin class $StepResultCopyWith<$Res>  {
  factory $StepResultCopyWith(StepResult value, $Res Function(StepResult) _then) = _$StepResultCopyWithImpl;
@useResult
$Res call({
 Application application, List<String> missing
});


$ApplicationCopyWith<$Res> get application;

}
/// @nodoc
class _$StepResultCopyWithImpl<$Res>
    implements $StepResultCopyWith<$Res> {
  _$StepResultCopyWithImpl(this._self, this._then);

  final StepResult _self;
  final $Res Function(StepResult) _then;

/// Create a copy of StepResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? application = null,Object? missing = null,}) {
  return _then(StepResult(
application: null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as Application,missing: null == missing ? _self.missing : missing // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of StepResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationCopyWith<$Res> get application {
  
  return $ApplicationCopyWith<$Res>(_self.application, (value) {
    return _then(_self.copyWith(application: value));
  });
}
}


/// Adds pattern-matching-related methods to [StepResult].
extension StepResultPatterns on StepResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StepResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StepResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StepResult value)  $default,){
final _that = this;
switch (_that) {
case _StepResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StepResult value)?  $default,){
final _that = this;
switch (_that) {
case _StepResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Application application,  List<String> missing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StepResult() when $default != null:
return $default(_that.application,_that.missing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Application application,  List<String> missing)  $default,) {final _that = this;
switch (_that) {
case _StepResult():
return $default(_that.application,_that.missing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Application application,  List<String> missing)?  $default,) {final _that = this;
switch (_that) {
case _StepResult() when $default != null:
return $default(_that.application,_that.missing);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StepResult implements StepResult {
  const _StepResult({required this.application,  List<String> missing = const <String>[]}): _missing = missing;
  factory _StepResult.fromJson(Map<String, dynamic> json) => _$StepResultFromJson(json);

@override final  Application application;
 final  List<String> _missing;
@override@JsonKey() List<String> get missing {
  if (_missing is EqualUnmodifiableListView) return _missing;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_missing);
}


/// Create a copy of StepResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StepResultCopyWith<_StepResult> get copyWith => __$StepResultCopyWithImpl<_StepResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StepResultToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StepResult&&(identical(other.application, application) || other.application == application)&&const DeepCollectionEquality().equals(other.missing, _missing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,application,const DeepCollectionEquality().hash(_missing));
}

@override
String toString() {
    return 'StepResult(application: $application, missing: $missing)';
}


}

/// @nodoc
abstract mixin class _$StepResultCopyWith<$Res> implements $StepResultCopyWith<$Res> {
  factory _$StepResultCopyWith(_StepResult value, $Res Function(_StepResult) _then) = __$StepResultCopyWithImpl;
@override @useResult
$Res call({
 Application application, List<String> missing
});


@override $ApplicationCopyWith<$Res> get application;

}
/// @nodoc
class __$StepResultCopyWithImpl<$Res>
    implements _$StepResultCopyWith<$Res> {
  __$StepResultCopyWithImpl(this._self, this._then);

  final _StepResult _self;
  final $Res Function(_StepResult) _then;

/// Create a copy of StepResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? application = null,Object? missing = null,}) {
  return _then(_StepResult(
application: null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as Application,missing: null == missing ? _self._missing : missing // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of StepResult
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
mixin _$SchoolHit {

 int get id; String get name; String get city;
/// Create a copy of SchoolHit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SchoolHitCopyWith<SchoolHit> get copyWith => _$SchoolHitCopyWithImpl<SchoolHit>(this as SchoolHit, _$identity);

  /// Serializes this SchoolHit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SchoolHit;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SchoolHit&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.city, _this.city) || other.city == _this.city));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SchoolHit;
  return Object.hash(runtimeType,_this.id,_this.name,_this.city);
}

@override
String toString() {
  final _this = this as SchoolHit;
  return 'SchoolHit(id: ${_this.id}, name: ${_this.name}, city: ${_this.city})';
}


}

/// @nodoc
abstract mixin class $SchoolHitCopyWith<$Res>  {
  factory $SchoolHitCopyWith(SchoolHit value, $Res Function(SchoolHit) _then) = _$SchoolHitCopyWithImpl;
@useResult
$Res call({
 int id, String name, String city
});




}
/// @nodoc
class _$SchoolHitCopyWithImpl<$Res>
    implements $SchoolHitCopyWith<$Res> {
  _$SchoolHitCopyWithImpl(this._self, this._then);

  final SchoolHit _self;
  final $Res Function(SchoolHit) _then;

/// Create a copy of SchoolHit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? city = null,}) {
  return _then(SchoolHit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SchoolHit].
extension SchoolHitPatterns on SchoolHit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SchoolHit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SchoolHit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SchoolHit value)  $default,){
final _that = this;
switch (_that) {
case _SchoolHit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SchoolHit value)?  $default,){
final _that = this;
switch (_that) {
case _SchoolHit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String city)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SchoolHit() when $default != null:
return $default(_that.id,_that.name,_that.city);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String city)  $default,) {final _that = this;
switch (_that) {
case _SchoolHit():
return $default(_that.id,_that.name,_that.city);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String city)?  $default,) {final _that = this;
switch (_that) {
case _SchoolHit() when $default != null:
return $default(_that.id,_that.name,_that.city);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SchoolHit implements SchoolHit {
  const _SchoolHit({required this.id, this.name = '', this.city = ''});
  factory _SchoolHit.fromJson(Map<String, dynamic> json) => _$SchoolHitFromJson(json);

@override final  int id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String city;

/// Create a copy of SchoolHit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SchoolHitCopyWith<_SchoolHit> get copyWith => __$SchoolHitCopyWithImpl<_SchoolHit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SchoolHitToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SchoolHit&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.city, city) || other.city == city));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,city);
}

@override
String toString() {
    return 'SchoolHit(id: $id, name: $name, city: $city)';
}


}

/// @nodoc
abstract mixin class _$SchoolHitCopyWith<$Res> implements $SchoolHitCopyWith<$Res> {
  factory _$SchoolHitCopyWith(_SchoolHit value, $Res Function(_SchoolHit) _then) = __$SchoolHitCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String city
});




}
/// @nodoc
class __$SchoolHitCopyWithImpl<$Res>
    implements _$SchoolHitCopyWith<$Res> {
  __$SchoolHitCopyWithImpl(this._self, this._then);

  final _SchoolHit _self;
  final $Res Function(_SchoolHit) _then;

/// Create a copy of SchoolHit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? city = null,}) {
  return _then(_SchoolHit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Country {

 String get code; String get name;
/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountryCopyWith<Country> get copyWith => _$CountryCopyWithImpl<Country>(this as Country, _$identity);

  /// Serializes this Country to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Country;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Country&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Country;
  return Object.hash(runtimeType,_this.code,_this.name);
}

@override
String toString() {
  final _this = this as Country;
  return 'Country(code: ${_this.code}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $CountryCopyWith<$Res>  {
  factory $CountryCopyWith(Country value, $Res Function(Country) _then) = _$CountryCopyWithImpl;
@useResult
$Res call({
 String code, String name
});




}
/// @nodoc
class _$CountryCopyWithImpl<$Res>
    implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._self, this._then);

  final Country _self;
  final $Res Function(Country) _then;

/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? name = null,}) {
  return _then(Country(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Country].
extension CountryPatterns on Country {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Country value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Country() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Country value)  $default,){
final _that = this;
switch (_that) {
case _Country():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Country value)?  $default,){
final _that = this;
switch (_that) {
case _Country() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Country() when $default != null:
return $default(_that.code,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String name)  $default,) {final _that = this;
switch (_that) {
case _Country():
return $default(_that.code,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String name)?  $default,) {final _that = this;
switch (_that) {
case _Country() when $default != null:
return $default(_that.code,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Country implements Country {
  const _Country({required this.code, this.name = ''});
  factory _Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);

@override final  String code;
@override@JsonKey() final  String name;

/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountryCopyWith<_Country> get copyWith => __$CountryCopyWithImpl<_Country>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CountryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Country&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,code,name);
}

@override
String toString() {
    return 'Country(code: $code, name: $name)';
}


}

/// @nodoc
abstract mixin class _$CountryCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$CountryCopyWith(_Country value, $Res Function(_Country) _then) = __$CountryCopyWithImpl;
@override @useResult
$Res call({
 String code, String name
});




}
/// @nodoc
class __$CountryCopyWithImpl<$Res>
    implements _$CountryCopyWith<$Res> {
  __$CountryCopyWithImpl(this._self, this._then);

  final _Country _self;
  final $Res Function(_Country) _then;

/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? name = null,}) {
  return _then(_Country(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$City {

 int get id; String get name;
/// Create a copy of City
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CityCopyWith<City> get copyWith => _$CityCopyWithImpl<City>(this as City, _$identity);

  /// Serializes this City to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as City;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is City&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as City;
  return Object.hash(runtimeType,_this.id,_this.name);
}

@override
String toString() {
  final _this = this as City;
  return 'City(id: ${_this.id}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $CityCopyWith<$Res>  {
  factory $CityCopyWith(City value, $Res Function(City) _then) = _$CityCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$CityCopyWithImpl<$Res>
    implements $CityCopyWith<$Res> {
  _$CityCopyWithImpl(this._self, this._then);

  final City _self;
  final $Res Function(City) _then;

/// Create a copy of City
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(City(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [City].
extension CityPatterns on City {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _City value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _City() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _City value)  $default,){
final _that = this;
switch (_that) {
case _City():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _City value)?  $default,){
final _that = this;
switch (_that) {
case _City() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _City() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name)  $default,) {final _that = this;
switch (_that) {
case _City():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _City() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _City implements City {
  const _City({required this.id, this.name = ''});
  factory _City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

@override final  int id;
@override@JsonKey() final  String name;

/// Create a copy of City
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CityCopyWith<_City> get copyWith => __$CityCopyWithImpl<_City>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _City&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name);
}

@override
String toString() {
    return 'City(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$CityCopyWith<$Res> implements $CityCopyWith<$Res> {
  factory _$CityCopyWith(_City value, $Res Function(_City) _then) = __$CityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$CityCopyWithImpl<$Res>
    implements _$CityCopyWith<$Res> {
  __$CityCopyWithImpl(this._self, this._then);

  final _City _self;
  final $Res Function(_City) _then;

/// Create a copy of City
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_City(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TimeOption {

@JsonKey(name: 'starts_at') String get startsAt;@JsonKey(name: 'ends_at') String get endsAt; int get places; int get booked; int get total;
/// Create a copy of TimeOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeOptionCopyWith<TimeOption> get copyWith => _$TimeOptionCopyWithImpl<TimeOption>(this as TimeOption, _$identity);

  /// Serializes this TimeOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TimeOption;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeOption&&(identical(other.startsAt, _this.startsAt) || other.startsAt == _this.startsAt)&&(identical(other.endsAt, _this.endsAt) || other.endsAt == _this.endsAt)&&(identical(other.places, _this.places) || other.places == _this.places)&&(identical(other.booked, _this.booked) || other.booked == _this.booked)&&(identical(other.total, _this.total) || other.total == _this.total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TimeOption;
  return Object.hash(runtimeType,_this.startsAt,_this.endsAt,_this.places,_this.booked,_this.total);
}

@override
String toString() {
  final _this = this as TimeOption;
  return 'TimeOption(startsAt: ${_this.startsAt}, endsAt: ${_this.endsAt}, places: ${_this.places}, booked: ${_this.booked}, total: ${_this.total})';
}


}

/// @nodoc
abstract mixin class $TimeOptionCopyWith<$Res>  {
  factory $TimeOptionCopyWith(TimeOption value, $Res Function(TimeOption) _then) = _$TimeOptionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'starts_at') String startsAt,@JsonKey(name: 'ends_at') String endsAt, int places, int booked, int total
});




}
/// @nodoc
class _$TimeOptionCopyWithImpl<$Res>
    implements $TimeOptionCopyWith<$Res> {
  _$TimeOptionCopyWithImpl(this._self, this._then);

  final TimeOption _self;
  final $Res Function(TimeOption) _then;

/// Create a copy of TimeOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startsAt = null,Object? endsAt = null,Object? places = null,Object? booked = null,Object? total = null,}) {
  return _then(TimeOption(
startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as String,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as String,places: null == places ? _self.places : places // ignore: cast_nullable_to_non_nullable
as int,booked: null == booked ? _self.booked : booked // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeOption].
extension TimeOptionPatterns on TimeOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeOption value)  $default,){
final _that = this;
switch (_that) {
case _TimeOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeOption value)?  $default,){
final _that = this;
switch (_that) {
case _TimeOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'starts_at')  String startsAt, @JsonKey(name: 'ends_at')  String endsAt,  int places,  int booked,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeOption() when $default != null:
return $default(_that.startsAt,_that.endsAt,_that.places,_that.booked,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'starts_at')  String startsAt, @JsonKey(name: 'ends_at')  String endsAt,  int places,  int booked,  int total)  $default,) {final _that = this;
switch (_that) {
case _TimeOption():
return $default(_that.startsAt,_that.endsAt,_that.places,_that.booked,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'starts_at')  String startsAt, @JsonKey(name: 'ends_at')  String endsAt,  int places,  int booked,  int total)?  $default,) {final _that = this;
switch (_that) {
case _TimeOption() when $default != null:
return $default(_that.startsAt,_that.endsAt,_that.places,_that.booked,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimeOption implements TimeOption {
  const _TimeOption({@JsonKey(name: 'starts_at') required this.startsAt, @JsonKey(name: 'ends_at') this.endsAt = '', this.places = 0, this.booked = 0, this.total = 0});
  factory _TimeOption.fromJson(Map<String, dynamic> json) => _$TimeOptionFromJson(json);

@override@JsonKey(name: 'starts_at') final  String startsAt;
@override@JsonKey(name: 'ends_at') final  String endsAt;
@override@JsonKey() final  int places;
@override@JsonKey() final  int booked;
@override@JsonKey() final  int total;

/// Create a copy of TimeOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeOptionCopyWith<_TimeOption> get copyWith => __$TimeOptionCopyWithImpl<_TimeOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimeOptionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeOption&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.places, places) || other.places == places)&&(identical(other.booked, booked) || other.booked == booked)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,startsAt,endsAt,places,booked,total);
}

@override
String toString() {
    return 'TimeOption(startsAt: $startsAt, endsAt: $endsAt, places: $places, booked: $booked, total: $total)';
}


}

/// @nodoc
abstract mixin class _$TimeOptionCopyWith<$Res> implements $TimeOptionCopyWith<$Res> {
  factory _$TimeOptionCopyWith(_TimeOption value, $Res Function(_TimeOption) _then) = __$TimeOptionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'starts_at') String startsAt,@JsonKey(name: 'ends_at') String endsAt, int places, int booked, int total
});




}
/// @nodoc
class __$TimeOptionCopyWithImpl<$Res>
    implements _$TimeOptionCopyWith<$Res> {
  __$TimeOptionCopyWithImpl(this._self, this._then);

  final _TimeOption _self;
  final $Res Function(_TimeOption) _then;

/// Create a copy of TimeOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startsAt = null,Object? endsAt = null,Object? places = null,Object? booked = null,Object? total = null,}) {
  return _then(_TimeOption(
startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as String,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as String,places: null == places ? _self.places : places // ignore: cast_nullable_to_non_nullable
as int,booked: null == booked ? _self.booked : booked // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$TrialOption {

 int get id;@JsonKey(name: 'starts_at') String get startsAt;@JsonKey(name: 'ends_at') String get endsAt;@JsonKey(name: 'places_left') int get placesLeft;
/// Create a copy of TrialOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrialOptionCopyWith<TrialOption> get copyWith => _$TrialOptionCopyWithImpl<TrialOption>(this as TrialOption, _$identity);

  /// Serializes this TrialOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TrialOption;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrialOption&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.startsAt, _this.startsAt) || other.startsAt == _this.startsAt)&&(identical(other.endsAt, _this.endsAt) || other.endsAt == _this.endsAt)&&(identical(other.placesLeft, _this.placesLeft) || other.placesLeft == _this.placesLeft));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TrialOption;
  return Object.hash(runtimeType,_this.id,_this.startsAt,_this.endsAt,_this.placesLeft);
}

@override
String toString() {
  final _this = this as TrialOption;
  return 'TrialOption(id: ${_this.id}, startsAt: ${_this.startsAt}, endsAt: ${_this.endsAt}, placesLeft: ${_this.placesLeft})';
}


}

/// @nodoc
abstract mixin class $TrialOptionCopyWith<$Res>  {
  factory $TrialOptionCopyWith(TrialOption value, $Res Function(TrialOption) _then) = _$TrialOptionCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'starts_at') String startsAt,@JsonKey(name: 'ends_at') String endsAt,@JsonKey(name: 'places_left') int placesLeft
});




}
/// @nodoc
class _$TrialOptionCopyWithImpl<$Res>
    implements $TrialOptionCopyWith<$Res> {
  _$TrialOptionCopyWithImpl(this._self, this._then);

  final TrialOption _self;
  final $Res Function(TrialOption) _then;

/// Create a copy of TrialOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startsAt = null,Object? endsAt = null,Object? placesLeft = null,}) {
  return _then(TrialOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as String,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as String,placesLeft: null == placesLeft ? _self.placesLeft : placesLeft // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TrialOption].
extension TrialOptionPatterns on TrialOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrialOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrialOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrialOption value)  $default,){
final _that = this;
switch (_that) {
case _TrialOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrialOption value)?  $default,){
final _that = this;
switch (_that) {
case _TrialOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'starts_at')  String startsAt, @JsonKey(name: 'ends_at')  String endsAt, @JsonKey(name: 'places_left')  int placesLeft)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrialOption() when $default != null:
return $default(_that.id,_that.startsAt,_that.endsAt,_that.placesLeft);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'starts_at')  String startsAt, @JsonKey(name: 'ends_at')  String endsAt, @JsonKey(name: 'places_left')  int placesLeft)  $default,) {final _that = this;
switch (_that) {
case _TrialOption():
return $default(_that.id,_that.startsAt,_that.endsAt,_that.placesLeft);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'starts_at')  String startsAt, @JsonKey(name: 'ends_at')  String endsAt, @JsonKey(name: 'places_left')  int placesLeft)?  $default,) {final _that = this;
switch (_that) {
case _TrialOption() when $default != null:
return $default(_that.id,_that.startsAt,_that.endsAt,_that.placesLeft);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrialOption implements TrialOption {
  const _TrialOption({required this.id, @JsonKey(name: 'starts_at') this.startsAt = '', @JsonKey(name: 'ends_at') this.endsAt = '', @JsonKey(name: 'places_left') this.placesLeft = 0});
  factory _TrialOption.fromJson(Map<String, dynamic> json) => _$TrialOptionFromJson(json);

@override final  int id;
@override@JsonKey(name: 'starts_at') final  String startsAt;
@override@JsonKey(name: 'ends_at') final  String endsAt;
@override@JsonKey(name: 'places_left') final  int placesLeft;

/// Create a copy of TrialOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrialOptionCopyWith<_TrialOption> get copyWith => __$TrialOptionCopyWithImpl<_TrialOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrialOptionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrialOption&&(identical(other.id, id) || other.id == id)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.placesLeft, placesLeft) || other.placesLeft == placesLeft));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,startsAt,endsAt,placesLeft);
}

@override
String toString() {
    return 'TrialOption(id: $id, startsAt: $startsAt, endsAt: $endsAt, placesLeft: $placesLeft)';
}


}

/// @nodoc
abstract mixin class _$TrialOptionCopyWith<$Res> implements $TrialOptionCopyWith<$Res> {
  factory _$TrialOptionCopyWith(_TrialOption value, $Res Function(_TrialOption) _then) = __$TrialOptionCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'starts_at') String startsAt,@JsonKey(name: 'ends_at') String endsAt,@JsonKey(name: 'places_left') int placesLeft
});




}
/// @nodoc
class __$TrialOptionCopyWithImpl<$Res>
    implements _$TrialOptionCopyWith<$Res> {
  __$TrialOptionCopyWithImpl(this._self, this._then);

  final _TrialOption _self;
  final $Res Function(_TrialOption) _then;

/// Create a copy of TrialOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startsAt = null,Object? endsAt = null,Object? placesLeft = null,}) {
  return _then(_TrialOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as String,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as String,placesLeft: null == placesLeft ? _self.placesLeft : placesLeft // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
