// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_parts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Guardian {

 int? get id; String get relation;@JsonKey(name: 'first_name') String get firstName;@JsonKey(name: 'last_name') String get lastName; String get cnic; String get mobile; String get email;@JsonKey(name: 'marital_status') String get maritalStatus; String get work; String get organisation; String get designation;@JsonKey(name: 'phone_verified') bool get phoneVerified;@JsonKey(name: 'email_verified') bool get emailVerified;
/// Create a copy of Guardian
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuardianCopyWith<Guardian> get copyWith => _$GuardianCopyWithImpl<Guardian>(this as Guardian, _$identity);

  /// Serializes this Guardian to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Guardian;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Guardian&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.relation, _this.relation) || other.relation == _this.relation)&&(identical(other.firstName, _this.firstName) || other.firstName == _this.firstName)&&(identical(other.lastName, _this.lastName) || other.lastName == _this.lastName)&&(identical(other.cnic, _this.cnic) || other.cnic == _this.cnic)&&(identical(other.mobile, _this.mobile) || other.mobile == _this.mobile)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.maritalStatus, _this.maritalStatus) || other.maritalStatus == _this.maritalStatus)&&(identical(other.work, _this.work) || other.work == _this.work)&&(identical(other.organisation, _this.organisation) || other.organisation == _this.organisation)&&(identical(other.designation, _this.designation) || other.designation == _this.designation)&&(identical(other.phoneVerified, _this.phoneVerified) || other.phoneVerified == _this.phoneVerified)&&(identical(other.emailVerified, _this.emailVerified) || other.emailVerified == _this.emailVerified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Guardian;
  return Object.hash(runtimeType,_this.id,_this.relation,_this.firstName,_this.lastName,_this.cnic,_this.mobile,_this.email,_this.maritalStatus,_this.work,_this.organisation,_this.designation,_this.phoneVerified,_this.emailVerified);
}

@override
String toString() {
  final _this = this as Guardian;
  return 'Guardian(id: ${_this.id}, relation: ${_this.relation}, firstName: ${_this.firstName}, lastName: ${_this.lastName}, cnic: ${_this.cnic}, mobile: ${_this.mobile}, email: ${_this.email}, maritalStatus: ${_this.maritalStatus}, work: ${_this.work}, organisation: ${_this.organisation}, designation: ${_this.designation}, phoneVerified: ${_this.phoneVerified}, emailVerified: ${_this.emailVerified})';
}


}

/// @nodoc
abstract mixin class $GuardianCopyWith<$Res>  {
  factory $GuardianCopyWith(Guardian value, $Res Function(Guardian) _then) = _$GuardianCopyWithImpl;
@useResult
$Res call({
 int? id, String relation,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName, String cnic, String mobile, String email,@JsonKey(name: 'marital_status') String maritalStatus, String work, String organisation, String designation,@JsonKey(name: 'phone_verified') bool phoneVerified,@JsonKey(name: 'email_verified') bool emailVerified
});




}
/// @nodoc
class _$GuardianCopyWithImpl<$Res>
    implements $GuardianCopyWith<$Res> {
  _$GuardianCopyWithImpl(this._self, this._then);

  final Guardian _self;
  final $Res Function(Guardian) _then;

/// Create a copy of Guardian
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? relation = null,Object? firstName = null,Object? lastName = null,Object? cnic = null,Object? mobile = null,Object? email = null,Object? maritalStatus = null,Object? work = null,Object? organisation = null,Object? designation = null,Object? phoneVerified = null,Object? emailVerified = null,}) {
  return _then(Guardian(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,relation: null == relation ? _self.relation : relation // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,cnic: null == cnic ? _self.cnic : cnic // ignore: cast_nullable_to_non_nullable
as String,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,maritalStatus: null == maritalStatus ? _self.maritalStatus : maritalStatus // ignore: cast_nullable_to_non_nullable
as String,work: null == work ? _self.work : work // ignore: cast_nullable_to_non_nullable
as String,organisation: null == organisation ? _self.organisation : organisation // ignore: cast_nullable_to_non_nullable
as String,designation: null == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String,phoneVerified: null == phoneVerified ? _self.phoneVerified : phoneVerified // ignore: cast_nullable_to_non_nullable
as bool,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Guardian].
extension GuardianPatterns on Guardian {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Guardian value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Guardian() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Guardian value)  $default,){
final _that = this;
switch (_that) {
case _Guardian():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Guardian value)?  $default,){
final _that = this;
switch (_that) {
case _Guardian() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String relation, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String cnic,  String mobile,  String email, @JsonKey(name: 'marital_status')  String maritalStatus,  String work,  String organisation,  String designation, @JsonKey(name: 'phone_verified')  bool phoneVerified, @JsonKey(name: 'email_verified')  bool emailVerified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Guardian() when $default != null:
return $default(_that.id,_that.relation,_that.firstName,_that.lastName,_that.cnic,_that.mobile,_that.email,_that.maritalStatus,_that.work,_that.organisation,_that.designation,_that.phoneVerified,_that.emailVerified);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String relation, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String cnic,  String mobile,  String email, @JsonKey(name: 'marital_status')  String maritalStatus,  String work,  String organisation,  String designation, @JsonKey(name: 'phone_verified')  bool phoneVerified, @JsonKey(name: 'email_verified')  bool emailVerified)  $default,) {final _that = this;
switch (_that) {
case _Guardian():
return $default(_that.id,_that.relation,_that.firstName,_that.lastName,_that.cnic,_that.mobile,_that.email,_that.maritalStatus,_that.work,_that.organisation,_that.designation,_that.phoneVerified,_that.emailVerified);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String relation, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String cnic,  String mobile,  String email, @JsonKey(name: 'marital_status')  String maritalStatus,  String work,  String organisation,  String designation, @JsonKey(name: 'phone_verified')  bool phoneVerified, @JsonKey(name: 'email_verified')  bool emailVerified)?  $default,) {final _that = this;
switch (_that) {
case _Guardian() when $default != null:
return $default(_that.id,_that.relation,_that.firstName,_that.lastName,_that.cnic,_that.mobile,_that.email,_that.maritalStatus,_that.work,_that.organisation,_that.designation,_that.phoneVerified,_that.emailVerified);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Guardian extends Guardian {
  const _Guardian({this.id, this.relation = '', @JsonKey(name: 'first_name') this.firstName = '', @JsonKey(name: 'last_name') this.lastName = '', this.cnic = '', this.mobile = '', this.email = '', @JsonKey(name: 'marital_status') this.maritalStatus = '', this.work = '', this.organisation = '', this.designation = '', @JsonKey(name: 'phone_verified') this.phoneVerified = false, @JsonKey(name: 'email_verified') this.emailVerified = false}): super._();
  factory _Guardian.fromJson(Map<String, dynamic> json) => _$GuardianFromJson(json);

@override final  int? id;
@override@JsonKey() final  String relation;
@override@JsonKey(name: 'first_name') final  String firstName;
@override@JsonKey(name: 'last_name') final  String lastName;
@override@JsonKey() final  String cnic;
@override@JsonKey() final  String mobile;
@override@JsonKey() final  String email;
@override@JsonKey(name: 'marital_status') final  String maritalStatus;
@override@JsonKey() final  String work;
@override@JsonKey() final  String organisation;
@override@JsonKey() final  String designation;
@override@JsonKey(name: 'phone_verified') final  bool phoneVerified;
@override@JsonKey(name: 'email_verified') final  bool emailVerified;

/// Create a copy of Guardian
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuardianCopyWith<_Guardian> get copyWith => __$GuardianCopyWithImpl<_Guardian>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuardianToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Guardian&&(identical(other.id, id) || other.id == id)&&(identical(other.relation, relation) || other.relation == relation)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.cnic, cnic) || other.cnic == cnic)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.email, email) || other.email == email)&&(identical(other.maritalStatus, maritalStatus) || other.maritalStatus == maritalStatus)&&(identical(other.work, work) || other.work == work)&&(identical(other.organisation, organisation) || other.organisation == organisation)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.phoneVerified, phoneVerified) || other.phoneVerified == phoneVerified)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,relation,firstName,lastName,cnic,mobile,email,maritalStatus,work,organisation,designation,phoneVerified,emailVerified);
}

@override
String toString() {
    return 'Guardian(id: $id, relation: $relation, firstName: $firstName, lastName: $lastName, cnic: $cnic, mobile: $mobile, email: $email, maritalStatus: $maritalStatus, work: $work, organisation: $organisation, designation: $designation, phoneVerified: $phoneVerified, emailVerified: $emailVerified)';
}


}

/// @nodoc
abstract mixin class _$GuardianCopyWith<$Res> implements $GuardianCopyWith<$Res> {
  factory _$GuardianCopyWith(_Guardian value, $Res Function(_Guardian) _then) = __$GuardianCopyWithImpl;
@override @useResult
$Res call({
 int? id, String relation,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName, String cnic, String mobile, String email,@JsonKey(name: 'marital_status') String maritalStatus, String work, String organisation, String designation,@JsonKey(name: 'phone_verified') bool phoneVerified,@JsonKey(name: 'email_verified') bool emailVerified
});




}
/// @nodoc
class __$GuardianCopyWithImpl<$Res>
    implements _$GuardianCopyWith<$Res> {
  __$GuardianCopyWithImpl(this._self, this._then);

  final _Guardian _self;
  final $Res Function(_Guardian) _then;

/// Create a copy of Guardian
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? relation = null,Object? firstName = null,Object? lastName = null,Object? cnic = null,Object? mobile = null,Object? email = null,Object? maritalStatus = null,Object? work = null,Object? organisation = null,Object? designation = null,Object? phoneVerified = null,Object? emailVerified = null,}) {
  return _then(_Guardian(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,relation: null == relation ? _self.relation : relation // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,cnic: null == cnic ? _self.cnic : cnic // ignore: cast_nullable_to_non_nullable
as String,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,maritalStatus: null == maritalStatus ? _self.maritalStatus : maritalStatus // ignore: cast_nullable_to_non_nullable
as String,work: null == work ? _self.work : work // ignore: cast_nullable_to_non_nullable
as String,organisation: null == organisation ? _self.organisation : organisation // ignore: cast_nullable_to_non_nullable
as String,designation: null == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String,phoneVerified: null == phoneVerified ? _self.phoneVerified : phoneVerified // ignore: cast_nullable_to_non_nullable
as bool,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$Sibling {

 String get name;@JsonKey(name: 'year_or_class') String get yearOrClass;
/// Create a copy of Sibling
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SiblingCopyWith<Sibling> get copyWith => _$SiblingCopyWithImpl<Sibling>(this as Sibling, _$identity);

  /// Serializes this Sibling to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Sibling;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sibling&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.yearOrClass, _this.yearOrClass) || other.yearOrClass == _this.yearOrClass));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Sibling;
  return Object.hash(runtimeType,_this.name,_this.yearOrClass);
}

@override
String toString() {
  final _this = this as Sibling;
  return 'Sibling(name: ${_this.name}, yearOrClass: ${_this.yearOrClass})';
}


}

/// @nodoc
abstract mixin class $SiblingCopyWith<$Res>  {
  factory $SiblingCopyWith(Sibling value, $Res Function(Sibling) _then) = _$SiblingCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(name: 'year_or_class') String yearOrClass
});




}
/// @nodoc
class _$SiblingCopyWithImpl<$Res>
    implements $SiblingCopyWith<$Res> {
  _$SiblingCopyWithImpl(this._self, this._then);

  final Sibling _self;
  final $Res Function(Sibling) _then;

/// Create a copy of Sibling
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? yearOrClass = null,}) {
  return _then(Sibling(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,yearOrClass: null == yearOrClass ? _self.yearOrClass : yearOrClass // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Sibling].
extension SiblingPatterns on Sibling {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sibling value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sibling() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sibling value)  $default,){
final _that = this;
switch (_that) {
case _Sibling():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sibling value)?  $default,){
final _that = this;
switch (_that) {
case _Sibling() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'year_or_class')  String yearOrClass)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sibling() when $default != null:
return $default(_that.name,_that.yearOrClass);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'year_or_class')  String yearOrClass)  $default,) {final _that = this;
switch (_that) {
case _Sibling():
return $default(_that.name,_that.yearOrClass);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(name: 'year_or_class')  String yearOrClass)?  $default,) {final _that = this;
switch (_that) {
case _Sibling() when $default != null:
return $default(_that.name,_that.yearOrClass);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Sibling implements Sibling {
  const _Sibling({this.name = '', @JsonKey(name: 'year_or_class') this.yearOrClass = ''});
  factory _Sibling.fromJson(Map<String, dynamic> json) => _$SiblingFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey(name: 'year_or_class') final  String yearOrClass;

/// Create a copy of Sibling
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SiblingCopyWith<_Sibling> get copyWith => __$SiblingCopyWithImpl<_Sibling>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SiblingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sibling&&(identical(other.name, name) || other.name == name)&&(identical(other.yearOrClass, yearOrClass) || other.yearOrClass == yearOrClass));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,yearOrClass);
}

@override
String toString() {
    return 'Sibling(name: $name, yearOrClass: $yearOrClass)';
}


}

/// @nodoc
abstract mixin class _$SiblingCopyWith<$Res> implements $SiblingCopyWith<$Res> {
  factory _$SiblingCopyWith(_Sibling value, $Res Function(_Sibling) _then) = __$SiblingCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(name: 'year_or_class') String yearOrClass
});




}
/// @nodoc
class __$SiblingCopyWithImpl<$Res>
    implements _$SiblingCopyWith<$Res> {
  __$SiblingCopyWithImpl(this._self, this._then);

  final _Sibling _self;
  final $Res Function(_Sibling) _then;

/// Create a copy of Sibling
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? yearOrClass = null,}) {
  return _then(_Sibling(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,yearOrClass: null == yearOrClass ? _self.yearOrClass : yearOrClass // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ResultRow {

 String get subject; int? get id;@JsonKey(name: 'sitting_month') int? get sittingMonth;@JsonKey(name: 'sitting_year') int? get sittingYear;@JsonKey(name: 'result_out') bool get resultOut; String get grade; bool get verified;
/// Create a copy of ResultRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultRowCopyWith<ResultRow> get copyWith => _$ResultRowCopyWithImpl<ResultRow>(this as ResultRow, _$identity);

  /// Serializes this ResultRow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ResultRow;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultRow&&(identical(other.subject, _this.subject) || other.subject == _this.subject)&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.sittingMonth, _this.sittingMonth) || other.sittingMonth == _this.sittingMonth)&&(identical(other.sittingYear, _this.sittingYear) || other.sittingYear == _this.sittingYear)&&(identical(other.resultOut, _this.resultOut) || other.resultOut == _this.resultOut)&&(identical(other.grade, _this.grade) || other.grade == _this.grade)&&(identical(other.verified, _this.verified) || other.verified == _this.verified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ResultRow;
  return Object.hash(runtimeType,_this.subject,_this.id,_this.sittingMonth,_this.sittingYear,_this.resultOut,_this.grade,_this.verified);
}

@override
String toString() {
  final _this = this as ResultRow;
  return 'ResultRow(subject: ${_this.subject}, id: ${_this.id}, sittingMonth: ${_this.sittingMonth}, sittingYear: ${_this.sittingYear}, resultOut: ${_this.resultOut}, grade: ${_this.grade}, verified: ${_this.verified})';
}


}

/// @nodoc
abstract mixin class $ResultRowCopyWith<$Res>  {
  factory $ResultRowCopyWith(ResultRow value, $Res Function(ResultRow) _then) = _$ResultRowCopyWithImpl;
@useResult
$Res call({
 String subject, int? id,@JsonKey(name: 'sitting_month') int? sittingMonth,@JsonKey(name: 'sitting_year') int? sittingYear,@JsonKey(name: 'result_out') bool resultOut, String grade, bool verified
});




}
/// @nodoc
class _$ResultRowCopyWithImpl<$Res>
    implements $ResultRowCopyWith<$Res> {
  _$ResultRowCopyWithImpl(this._self, this._then);

  final ResultRow _self;
  final $Res Function(ResultRow) _then;

/// Create a copy of ResultRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subject = null,Object? id = freezed,Object? sittingMonth = freezed,Object? sittingYear = freezed,Object? resultOut = null,Object? grade = null,Object? verified = null,}) {
  return _then(ResultRow(
subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,sittingMonth: freezed == sittingMonth ? _self.sittingMonth : sittingMonth // ignore: cast_nullable_to_non_nullable
as int?,sittingYear: freezed == sittingYear ? _self.sittingYear : sittingYear // ignore: cast_nullable_to_non_nullable
as int?,resultOut: null == resultOut ? _self.resultOut : resultOut // ignore: cast_nullable_to_non_nullable
as bool,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ResultRow].
extension ResultRowPatterns on ResultRow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResultRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResultRow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResultRow value)  $default,){
final _that = this;
switch (_that) {
case _ResultRow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResultRow value)?  $default,){
final _that = this;
switch (_that) {
case _ResultRow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String subject,  int? id, @JsonKey(name: 'sitting_month')  int? sittingMonth, @JsonKey(name: 'sitting_year')  int? sittingYear, @JsonKey(name: 'result_out')  bool resultOut,  String grade,  bool verified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResultRow() when $default != null:
return $default(_that.subject,_that.id,_that.sittingMonth,_that.sittingYear,_that.resultOut,_that.grade,_that.verified);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String subject,  int? id, @JsonKey(name: 'sitting_month')  int? sittingMonth, @JsonKey(name: 'sitting_year')  int? sittingYear, @JsonKey(name: 'result_out')  bool resultOut,  String grade,  bool verified)  $default,) {final _that = this;
switch (_that) {
case _ResultRow():
return $default(_that.subject,_that.id,_that.sittingMonth,_that.sittingYear,_that.resultOut,_that.grade,_that.verified);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String subject,  int? id, @JsonKey(name: 'sitting_month')  int? sittingMonth, @JsonKey(name: 'sitting_year')  int? sittingYear, @JsonKey(name: 'result_out')  bool resultOut,  String grade,  bool verified)?  $default,) {final _that = this;
switch (_that) {
case _ResultRow() when $default != null:
return $default(_that.subject,_that.id,_that.sittingMonth,_that.sittingYear,_that.resultOut,_that.grade,_that.verified);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResultRow implements ResultRow {
  const _ResultRow({required this.subject, this.id, @JsonKey(name: 'sitting_month') this.sittingMonth, @JsonKey(name: 'sitting_year') this.sittingYear, @JsonKey(name: 'result_out') this.resultOut = false, this.grade = '', this.verified = false});
  factory _ResultRow.fromJson(Map<String, dynamic> json) => _$ResultRowFromJson(json);

@override final  String subject;
@override final  int? id;
@override@JsonKey(name: 'sitting_month') final  int? sittingMonth;
@override@JsonKey(name: 'sitting_year') final  int? sittingYear;
@override@JsonKey(name: 'result_out') final  bool resultOut;
@override@JsonKey() final  String grade;
@override@JsonKey() final  bool verified;

/// Create a copy of ResultRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultRowCopyWith<_ResultRow> get copyWith => __$ResultRowCopyWithImpl<_ResultRow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResultRowToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResultRow&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.id, id) || other.id == id)&&(identical(other.sittingMonth, sittingMonth) || other.sittingMonth == sittingMonth)&&(identical(other.sittingYear, sittingYear) || other.sittingYear == sittingYear)&&(identical(other.resultOut, resultOut) || other.resultOut == resultOut)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.verified, verified) || other.verified == verified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,subject,id,sittingMonth,sittingYear,resultOut,grade,verified);
}

@override
String toString() {
    return 'ResultRow(subject: $subject, id: $id, sittingMonth: $sittingMonth, sittingYear: $sittingYear, resultOut: $resultOut, grade: $grade, verified: $verified)';
}


}

/// @nodoc
abstract mixin class _$ResultRowCopyWith<$Res> implements $ResultRowCopyWith<$Res> {
  factory _$ResultRowCopyWith(_ResultRow value, $Res Function(_ResultRow) _then) = __$ResultRowCopyWithImpl;
@override @useResult
$Res call({
 String subject, int? id,@JsonKey(name: 'sitting_month') int? sittingMonth,@JsonKey(name: 'sitting_year') int? sittingYear,@JsonKey(name: 'result_out') bool resultOut, String grade, bool verified
});




}
/// @nodoc
class __$ResultRowCopyWithImpl<$Res>
    implements _$ResultRowCopyWith<$Res> {
  __$ResultRowCopyWithImpl(this._self, this._then);

  final _ResultRow _self;
  final $Res Function(_ResultRow) _then;

/// Create a copy of ResultRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subject = null,Object? id = freezed,Object? sittingMonth = freezed,Object? sittingYear = freezed,Object? resultOut = null,Object? grade = null,Object? verified = null,}) {
  return _then(_ResultRow(
subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,sittingMonth: freezed == sittingMonth ? _self.sittingMonth : sittingMonth // ignore: cast_nullable_to_non_nullable
as int?,sittingYear: freezed == sittingYear ? _self.sittingYear : sittingYear // ignore: cast_nullable_to_non_nullable
as int?,resultOut: null == resultOut ? _self.resultOut : resultOut // ignore: cast_nullable_to_non_nullable
as bool,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$SubjectPick {

 int get course; int get teacher;@JsonKey(name: 'course_name') String? get courseName;@JsonKey(name: 'teacher_name') String? get teacherName;
/// Create a copy of SubjectPick
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubjectPickCopyWith<SubjectPick> get copyWith => _$SubjectPickCopyWithImpl<SubjectPick>(this as SubjectPick, _$identity);

  /// Serializes this SubjectPick to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SubjectPick;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubjectPick&&(identical(other.course, _this.course) || other.course == _this.course)&&(identical(other.teacher, _this.teacher) || other.teacher == _this.teacher)&&(identical(other.courseName, _this.courseName) || other.courseName == _this.courseName)&&(identical(other.teacherName, _this.teacherName) || other.teacherName == _this.teacherName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SubjectPick;
  return Object.hash(runtimeType,_this.course,_this.teacher,_this.courseName,_this.teacherName);
}

@override
String toString() {
  final _this = this as SubjectPick;
  return 'SubjectPick(course: ${_this.course}, teacher: ${_this.teacher}, courseName: ${_this.courseName}, teacherName: ${_this.teacherName})';
}


}

/// @nodoc
abstract mixin class $SubjectPickCopyWith<$Res>  {
  factory $SubjectPickCopyWith(SubjectPick value, $Res Function(SubjectPick) _then) = _$SubjectPickCopyWithImpl;
@useResult
$Res call({
 int course, int teacher,@JsonKey(name: 'course_name') String? courseName,@JsonKey(name: 'teacher_name') String? teacherName
});




}
/// @nodoc
class _$SubjectPickCopyWithImpl<$Res>
    implements $SubjectPickCopyWith<$Res> {
  _$SubjectPickCopyWithImpl(this._self, this._then);

  final SubjectPick _self;
  final $Res Function(SubjectPick) _then;

/// Create a copy of SubjectPick
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? course = null,Object? teacher = null,Object? courseName = freezed,Object? teacherName = freezed,}) {
  return _then(SubjectPick(
course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as int,teacher: null == teacher ? _self.teacher : teacher // ignore: cast_nullable_to_non_nullable
as int,courseName: freezed == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String?,teacherName: freezed == teacherName ? _self.teacherName : teacherName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubjectPick].
extension SubjectPickPatterns on SubjectPick {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubjectPick value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubjectPick() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubjectPick value)  $default,){
final _that = this;
switch (_that) {
case _SubjectPick():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubjectPick value)?  $default,){
final _that = this;
switch (_that) {
case _SubjectPick() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int course,  int teacher, @JsonKey(name: 'course_name')  String? courseName, @JsonKey(name: 'teacher_name')  String? teacherName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubjectPick() when $default != null:
return $default(_that.course,_that.teacher,_that.courseName,_that.teacherName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int course,  int teacher, @JsonKey(name: 'course_name')  String? courseName, @JsonKey(name: 'teacher_name')  String? teacherName)  $default,) {final _that = this;
switch (_that) {
case _SubjectPick():
return $default(_that.course,_that.teacher,_that.courseName,_that.teacherName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int course,  int teacher, @JsonKey(name: 'course_name')  String? courseName, @JsonKey(name: 'teacher_name')  String? teacherName)?  $default,) {final _that = this;
switch (_that) {
case _SubjectPick() when $default != null:
return $default(_that.course,_that.teacher,_that.courseName,_that.teacherName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubjectPick implements SubjectPick {
  const _SubjectPick({required this.course, this.teacher = 0, @JsonKey(name: 'course_name') this.courseName, @JsonKey(name: 'teacher_name') this.teacherName});
  factory _SubjectPick.fromJson(Map<String, dynamic> json) => _$SubjectPickFromJson(json);

@override final  int course;
@override@JsonKey() final  int teacher;
@override@JsonKey(name: 'course_name') final  String? courseName;
@override@JsonKey(name: 'teacher_name') final  String? teacherName;

/// Create a copy of SubjectPick
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubjectPickCopyWith<_SubjectPick> get copyWith => __$SubjectPickCopyWithImpl<_SubjectPick>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubjectPickToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubjectPick&&(identical(other.course, course) || other.course == course)&&(identical(other.teacher, teacher) || other.teacher == teacher)&&(identical(other.courseName, courseName) || other.courseName == courseName)&&(identical(other.teacherName, teacherName) || other.teacherName == teacherName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,course,teacher,courseName,teacherName);
}

@override
String toString() {
    return 'SubjectPick(course: $course, teacher: $teacher, courseName: $courseName, teacherName: $teacherName)';
}


}

/// @nodoc
abstract mixin class _$SubjectPickCopyWith<$Res> implements $SubjectPickCopyWith<$Res> {
  factory _$SubjectPickCopyWith(_SubjectPick value, $Res Function(_SubjectPick) _then) = __$SubjectPickCopyWithImpl;
@override @useResult
$Res call({
 int course, int teacher,@JsonKey(name: 'course_name') String? courseName,@JsonKey(name: 'teacher_name') String? teacherName
});




}
/// @nodoc
class __$SubjectPickCopyWithImpl<$Res>
    implements _$SubjectPickCopyWith<$Res> {
  __$SubjectPickCopyWithImpl(this._self, this._then);

  final _SubjectPick _self;
  final $Res Function(_SubjectPick) _then;

/// Create a copy of SubjectPick
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? course = null,Object? teacher = null,Object? courseName = freezed,Object? teacherName = freezed,}) {
  return _then(_SubjectPick(
course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as int,teacher: null == teacher ? _self.teacher : teacher // ignore: cast_nullable_to_non_nullable
as int,courseName: freezed == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String?,teacherName: freezed == teacherName ? _self.teacherName : teacherName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ActivityRow {

/// `sport` or `activity`.
 String get kind; String get name;@JsonKey(name: 'sport_id') int? get sportId; String get level; String get details;@JsonKey(name: 'wants_trial') bool get wantsTrial;
/// Create a copy of ActivityRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityRowCopyWith<ActivityRow> get copyWith => _$ActivityRowCopyWithImpl<ActivityRow>(this as ActivityRow, _$identity);

  /// Serializes this ActivityRow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ActivityRow;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityRow&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.sportId, _this.sportId) || other.sportId == _this.sportId)&&(identical(other.level, _this.level) || other.level == _this.level)&&(identical(other.details, _this.details) || other.details == _this.details)&&(identical(other.wantsTrial, _this.wantsTrial) || other.wantsTrial == _this.wantsTrial));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ActivityRow;
  return Object.hash(runtimeType,_this.kind,_this.name,_this.sportId,_this.level,_this.details,_this.wantsTrial);
}

@override
String toString() {
  final _this = this as ActivityRow;
  return 'ActivityRow(kind: ${_this.kind}, name: ${_this.name}, sportId: ${_this.sportId}, level: ${_this.level}, details: ${_this.details}, wantsTrial: ${_this.wantsTrial})';
}


}

/// @nodoc
abstract mixin class $ActivityRowCopyWith<$Res>  {
  factory $ActivityRowCopyWith(ActivityRow value, $Res Function(ActivityRow) _then) = _$ActivityRowCopyWithImpl;
@useResult
$Res call({
 String kind, String name,@JsonKey(name: 'sport_id') int? sportId, String level, String details,@JsonKey(name: 'wants_trial') bool wantsTrial
});




}
/// @nodoc
class _$ActivityRowCopyWithImpl<$Res>
    implements $ActivityRowCopyWith<$Res> {
  _$ActivityRowCopyWithImpl(this._self, this._then);

  final ActivityRow _self;
  final $Res Function(ActivityRow) _then;

/// Create a copy of ActivityRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? name = null,Object? sportId = freezed,Object? level = null,Object? details = null,Object? wantsTrial = null,}) {
  return _then(ActivityRow(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sportId: freezed == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as int?,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String,wantsTrial: null == wantsTrial ? _self.wantsTrial : wantsTrial // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ActivityRow].
extension ActivityRowPatterns on ActivityRow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivityRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivityRow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivityRow value)  $default,){
final _that = this;
switch (_that) {
case _ActivityRow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivityRow value)?  $default,){
final _that = this;
switch (_that) {
case _ActivityRow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String kind,  String name, @JsonKey(name: 'sport_id')  int? sportId,  String level,  String details, @JsonKey(name: 'wants_trial')  bool wantsTrial)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivityRow() when $default != null:
return $default(_that.kind,_that.name,_that.sportId,_that.level,_that.details,_that.wantsTrial);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String kind,  String name, @JsonKey(name: 'sport_id')  int? sportId,  String level,  String details, @JsonKey(name: 'wants_trial')  bool wantsTrial)  $default,) {final _that = this;
switch (_that) {
case _ActivityRow():
return $default(_that.kind,_that.name,_that.sportId,_that.level,_that.details,_that.wantsTrial);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String kind,  String name, @JsonKey(name: 'sport_id')  int? sportId,  String level,  String details, @JsonKey(name: 'wants_trial')  bool wantsTrial)?  $default,) {final _that = this;
switch (_that) {
case _ActivityRow() when $default != null:
return $default(_that.kind,_that.name,_that.sportId,_that.level,_that.details,_that.wantsTrial);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActivityRow extends ActivityRow {
  const _ActivityRow({required this.kind, required this.name, @JsonKey(name: 'sport_id') this.sportId, this.level = '', this.details = '', @JsonKey(name: 'wants_trial') this.wantsTrial = false}): super._();
  factory _ActivityRow.fromJson(Map<String, dynamic> json) => _$ActivityRowFromJson(json);

/// `sport` or `activity`.
@override final  String kind;
@override final  String name;
@override@JsonKey(name: 'sport_id') final  int? sportId;
@override@JsonKey() final  String level;
@override@JsonKey() final  String details;
@override@JsonKey(name: 'wants_trial') final  bool wantsTrial;

/// Create a copy of ActivityRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityRowCopyWith<_ActivityRow> get copyWith => __$ActivityRowCopyWithImpl<_ActivityRow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActivityRowToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivityRow&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.name, name) || other.name == name)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.level, level) || other.level == level)&&(identical(other.details, details) || other.details == details)&&(identical(other.wantsTrial, wantsTrial) || other.wantsTrial == wantsTrial));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,kind,name,sportId,level,details,wantsTrial);
}

@override
String toString() {
    return 'ActivityRow(kind: $kind, name: $name, sportId: $sportId, level: $level, details: $details, wantsTrial: $wantsTrial)';
}


}

/// @nodoc
abstract mixin class _$ActivityRowCopyWith<$Res> implements $ActivityRowCopyWith<$Res> {
  factory _$ActivityRowCopyWith(_ActivityRow value, $Res Function(_ActivityRow) _then) = __$ActivityRowCopyWithImpl;
@override @useResult
$Res call({
 String kind, String name,@JsonKey(name: 'sport_id') int? sportId, String level, String details,@JsonKey(name: 'wants_trial') bool wantsTrial
});




}
/// @nodoc
class __$ActivityRowCopyWithImpl<$Res>
    implements _$ActivityRowCopyWith<$Res> {
  __$ActivityRowCopyWithImpl(this._self, this._then);

  final _ActivityRow _self;
  final $Res Function(_ActivityRow) _then;

/// Create a copy of ActivityRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? name = null,Object? sportId = freezed,Object? level = null,Object? details = null,Object? wantsTrial = null,}) {
  return _then(_ActivityRow(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sportId: freezed == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as int?,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String,wantsTrial: null == wantsTrial ? _self.wantsTrial : wantsTrial // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$Referee {

 String get name; String get email; String get organisation; String get designation;
/// Create a copy of Referee
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefereeCopyWith<Referee> get copyWith => _$RefereeCopyWithImpl<Referee>(this as Referee, _$identity);

  /// Serializes this Referee to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Referee;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Referee&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.organisation, _this.organisation) || other.organisation == _this.organisation)&&(identical(other.designation, _this.designation) || other.designation == _this.designation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Referee;
  return Object.hash(runtimeType,_this.name,_this.email,_this.organisation,_this.designation);
}

@override
String toString() {
  final _this = this as Referee;
  return 'Referee(name: ${_this.name}, email: ${_this.email}, organisation: ${_this.organisation}, designation: ${_this.designation})';
}


}

/// @nodoc
abstract mixin class $RefereeCopyWith<$Res>  {
  factory $RefereeCopyWith(Referee value, $Res Function(Referee) _then) = _$RefereeCopyWithImpl;
@useResult
$Res call({
 String name, String email, String organisation, String designation
});




}
/// @nodoc
class _$RefereeCopyWithImpl<$Res>
    implements $RefereeCopyWith<$Res> {
  _$RefereeCopyWithImpl(this._self, this._then);

  final Referee _self;
  final $Res Function(Referee) _then;

/// Create a copy of Referee
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? email = null,Object? organisation = null,Object? designation = null,}) {
  return _then(Referee(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,organisation: null == organisation ? _self.organisation : organisation // ignore: cast_nullable_to_non_nullable
as String,designation: null == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Referee].
extension RefereePatterns on Referee {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Referee value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Referee() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Referee value)  $default,){
final _that = this;
switch (_that) {
case _Referee():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Referee value)?  $default,){
final _that = this;
switch (_that) {
case _Referee() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String email,  String organisation,  String designation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Referee() when $default != null:
return $default(_that.name,_that.email,_that.organisation,_that.designation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String email,  String organisation,  String designation)  $default,) {final _that = this;
switch (_that) {
case _Referee():
return $default(_that.name,_that.email,_that.organisation,_that.designation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String email,  String organisation,  String designation)?  $default,) {final _that = this;
switch (_that) {
case _Referee() when $default != null:
return $default(_that.name,_that.email,_that.organisation,_that.designation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Referee extends Referee {
  const _Referee({this.name = '', this.email = '', this.organisation = '', this.designation = ''}): super._();
  factory _Referee.fromJson(Map<String, dynamic> json) => _$RefereeFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey() final  String email;
@override@JsonKey() final  String organisation;
@override@JsonKey() final  String designation;

/// Create a copy of Referee
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefereeCopyWith<_Referee> get copyWith => __$RefereeCopyWithImpl<_Referee>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefereeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Referee&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.organisation, organisation) || other.organisation == organisation)&&(identical(other.designation, designation) || other.designation == designation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,email,organisation,designation);
}

@override
String toString() {
    return 'Referee(name: $name, email: $email, organisation: $organisation, designation: $designation)';
}


}

/// @nodoc
abstract mixin class _$RefereeCopyWith<$Res> implements $RefereeCopyWith<$Res> {
  factory _$RefereeCopyWith(_Referee value, $Res Function(_Referee) _then) = __$RefereeCopyWithImpl;
@override @useResult
$Res call({
 String name, String email, String organisation, String designation
});




}
/// @nodoc
class __$RefereeCopyWithImpl<$Res>
    implements _$RefereeCopyWith<$Res> {
  __$RefereeCopyWithImpl(this._self, this._then);

  final _Referee _self;
  final $Res Function(_Referee) _then;

/// Create a copy of Referee
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? organisation = null,Object? designation = null,}) {
  return _then(_Referee(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,organisation: null == organisation ? _self.organisation : organisation // ignore: cast_nullable_to_non_nullable
as String,designation: null == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
