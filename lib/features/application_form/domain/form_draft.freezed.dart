// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Emergency {

 bool get same; String get firstName; String get lastName; String get relation; String get mobile; String get cnic; String get email;
/// Create a copy of Emergency
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmergencyCopyWith<Emergency> get copyWith => _$EmergencyCopyWithImpl<Emergency>(this as Emergency, _$identity);

  /// Serializes this Emergency to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Emergency;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Emergency&&(identical(other.same, _this.same) || other.same == _this.same)&&(identical(other.firstName, _this.firstName) || other.firstName == _this.firstName)&&(identical(other.lastName, _this.lastName) || other.lastName == _this.lastName)&&(identical(other.relation, _this.relation) || other.relation == _this.relation)&&(identical(other.mobile, _this.mobile) || other.mobile == _this.mobile)&&(identical(other.cnic, _this.cnic) || other.cnic == _this.cnic)&&(identical(other.email, _this.email) || other.email == _this.email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Emergency;
  return Object.hash(runtimeType,_this.same,_this.firstName,_this.lastName,_this.relation,_this.mobile,_this.cnic,_this.email);
}

@override
String toString() {
  final _this = this as Emergency;
  return 'Emergency(same: ${_this.same}, firstName: ${_this.firstName}, lastName: ${_this.lastName}, relation: ${_this.relation}, mobile: ${_this.mobile}, cnic: ${_this.cnic}, email: ${_this.email})';
}


}

/// @nodoc
abstract mixin class $EmergencyCopyWith<$Res>  {
  factory $EmergencyCopyWith(Emergency value, $Res Function(Emergency) _then) = _$EmergencyCopyWithImpl;
@useResult
$Res call({
 bool same, String firstName, String lastName, String relation, String mobile, String cnic, String email
});




}
/// @nodoc
class _$EmergencyCopyWithImpl<$Res>
    implements $EmergencyCopyWith<$Res> {
  _$EmergencyCopyWithImpl(this._self, this._then);

  final Emergency _self;
  final $Res Function(Emergency) _then;

/// Create a copy of Emergency
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? same = null,Object? firstName = null,Object? lastName = null,Object? relation = null,Object? mobile = null,Object? cnic = null,Object? email = null,}) {
  return _then(Emergency(
same: null == same ? _self.same : same // ignore: cast_nullable_to_non_nullable
as bool,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,relation: null == relation ? _self.relation : relation // ignore: cast_nullable_to_non_nullable
as String,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,cnic: null == cnic ? _self.cnic : cnic // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Emergency].
extension EmergencyPatterns on Emergency {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Emergency value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Emergency() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Emergency value)  $default,){
final _that = this;
switch (_that) {
case _Emergency():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Emergency value)?  $default,){
final _that = this;
switch (_that) {
case _Emergency() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool same,  String firstName,  String lastName,  String relation,  String mobile,  String cnic,  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Emergency() when $default != null:
return $default(_that.same,_that.firstName,_that.lastName,_that.relation,_that.mobile,_that.cnic,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool same,  String firstName,  String lastName,  String relation,  String mobile,  String cnic,  String email)  $default,) {final _that = this;
switch (_that) {
case _Emergency():
return $default(_that.same,_that.firstName,_that.lastName,_that.relation,_that.mobile,_that.cnic,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool same,  String firstName,  String lastName,  String relation,  String mobile,  String cnic,  String email)?  $default,) {final _that = this;
switch (_that) {
case _Emergency() when $default != null:
return $default(_that.same,_that.firstName,_that.lastName,_that.relation,_that.mobile,_that.cnic,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Emergency implements Emergency {
  const _Emergency({this.same = true, this.firstName = '', this.lastName = '', this.relation = '', this.mobile = '', this.cnic = '', this.email = ''});
  factory _Emergency.fromJson(Map<String, dynamic> json) => _$EmergencyFromJson(json);

@override@JsonKey() final  bool same;
@override@JsonKey() final  String firstName;
@override@JsonKey() final  String lastName;
@override@JsonKey() final  String relation;
@override@JsonKey() final  String mobile;
@override@JsonKey() final  String cnic;
@override@JsonKey() final  String email;

/// Create a copy of Emergency
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmergencyCopyWith<_Emergency> get copyWith => __$EmergencyCopyWithImpl<_Emergency>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmergencyToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Emergency&&(identical(other.same, same) || other.same == same)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.relation, relation) || other.relation == relation)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.cnic, cnic) || other.cnic == cnic)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,same,firstName,lastName,relation,mobile,cnic,email);
}

@override
String toString() {
    return 'Emergency(same: $same, firstName: $firstName, lastName: $lastName, relation: $relation, mobile: $mobile, cnic: $cnic, email: $email)';
}


}

/// @nodoc
abstract mixin class _$EmergencyCopyWith<$Res> implements $EmergencyCopyWith<$Res> {
  factory _$EmergencyCopyWith(_Emergency value, $Res Function(_Emergency) _then) = __$EmergencyCopyWithImpl;
@override @useResult
$Res call({
 bool same, String firstName, String lastName, String relation, String mobile, String cnic, String email
});




}
/// @nodoc
class __$EmergencyCopyWithImpl<$Res>
    implements _$EmergencyCopyWith<$Res> {
  __$EmergencyCopyWithImpl(this._self, this._then);

  final _Emergency _self;
  final $Res Function(_Emergency) _then;

/// Create a copy of Emergency
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? same = null,Object? firstName = null,Object? lastName = null,Object? relation = null,Object? mobile = null,Object? cnic = null,Object? email = null,}) {
  return _then(_Emergency(
same: null == same ? _self.same : same // ignore: cast_nullable_to_non_nullable
as bool,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,relation: null == relation ? _self.relation : relation // ignore: cast_nullable_to_non_nullable
as String,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,cnic: null == cnic ? _self.cnic : cnic // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$FormDraft {

 Level get level; String get firstName; String get lastName; String? get dateOfBirth; String get gender; String get cnic; String get religion; String get mobile; String get email; bool get dual; String get otherNationality; String get address; String get country; int? get cityId; String get cityOther; String get cityText; List<Guardian> get guardians; bool get parentB; Emergency get emg; bool get sib; List<Sibling> get siblings; bool get isPrivateCandidate; int? get schoolId; String get schoolOther; String get schoolText; String get schoolCampus; int? get studiedFrom; int? get studiedUntil; Qualification get qualification; String get qualificationOther; String get matricPercentage; List<ResultRow> get results; List<SubjectPick> get subjects; String get futureStudy; bool get hasReferee; Referee get referee; List<ActivityRow> get activities; bool get wantsSportsTrial; bool get more; String get anythingElse; String get statement;
/// Create a copy of FormDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormDraftCopyWith<FormDraft> get copyWith => _$FormDraftCopyWithImpl<FormDraft>(this as FormDraft, _$identity);

  /// Serializes this FormDraft to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FormDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormDraft&&(identical(other.level, _this.level) || other.level == _this.level)&&(identical(other.firstName, _this.firstName) || other.firstName == _this.firstName)&&(identical(other.lastName, _this.lastName) || other.lastName == _this.lastName)&&(identical(other.dateOfBirth, _this.dateOfBirth) || other.dateOfBirth == _this.dateOfBirth)&&(identical(other.gender, _this.gender) || other.gender == _this.gender)&&(identical(other.cnic, _this.cnic) || other.cnic == _this.cnic)&&(identical(other.religion, _this.religion) || other.religion == _this.religion)&&(identical(other.mobile, _this.mobile) || other.mobile == _this.mobile)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.dual, _this.dual) || other.dual == _this.dual)&&(identical(other.otherNationality, _this.otherNationality) || other.otherNationality == _this.otherNationality)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.country, _this.country) || other.country == _this.country)&&(identical(other.cityId, _this.cityId) || other.cityId == _this.cityId)&&(identical(other.cityOther, _this.cityOther) || other.cityOther == _this.cityOther)&&(identical(other.cityText, _this.cityText) || other.cityText == _this.cityText)&&const DeepCollectionEquality().equals(other.guardians, _this.guardians)&&(identical(other.parentB, _this.parentB) || other.parentB == _this.parentB)&&(identical(other.emg, _this.emg) || other.emg == _this.emg)&&(identical(other.sib, _this.sib) || other.sib == _this.sib)&&const DeepCollectionEquality().equals(other.siblings, _this.siblings)&&(identical(other.isPrivateCandidate, _this.isPrivateCandidate) || other.isPrivateCandidate == _this.isPrivateCandidate)&&(identical(other.schoolId, _this.schoolId) || other.schoolId == _this.schoolId)&&(identical(other.schoolOther, _this.schoolOther) || other.schoolOther == _this.schoolOther)&&(identical(other.schoolText, _this.schoolText) || other.schoolText == _this.schoolText)&&(identical(other.schoolCampus, _this.schoolCampus) || other.schoolCampus == _this.schoolCampus)&&(identical(other.studiedFrom, _this.studiedFrom) || other.studiedFrom == _this.studiedFrom)&&(identical(other.studiedUntil, _this.studiedUntil) || other.studiedUntil == _this.studiedUntil)&&(identical(other.qualification, _this.qualification) || other.qualification == _this.qualification)&&(identical(other.qualificationOther, _this.qualificationOther) || other.qualificationOther == _this.qualificationOther)&&(identical(other.matricPercentage, _this.matricPercentage) || other.matricPercentage == _this.matricPercentage)&&const DeepCollectionEquality().equals(other.results, _this.results)&&const DeepCollectionEquality().equals(other.subjects, _this.subjects)&&(identical(other.futureStudy, _this.futureStudy) || other.futureStudy == _this.futureStudy)&&(identical(other.hasReferee, _this.hasReferee) || other.hasReferee == _this.hasReferee)&&(identical(other.referee, _this.referee) || other.referee == _this.referee)&&const DeepCollectionEquality().equals(other.activities, _this.activities)&&(identical(other.wantsSportsTrial, _this.wantsSportsTrial) || other.wantsSportsTrial == _this.wantsSportsTrial)&&(identical(other.more, _this.more) || other.more == _this.more)&&(identical(other.anythingElse, _this.anythingElse) || other.anythingElse == _this.anythingElse)&&(identical(other.statement, _this.statement) || other.statement == _this.statement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FormDraft;
  return Object.hashAll([runtimeType,_this.level,_this.firstName,_this.lastName,_this.dateOfBirth,_this.gender,_this.cnic,_this.religion,_this.mobile,_this.email,_this.dual,_this.otherNationality,_this.address,_this.country,_this.cityId,_this.cityOther,_this.cityText,const DeepCollectionEquality().hash(_this.guardians),_this.parentB,_this.emg,_this.sib,const DeepCollectionEquality().hash(_this.siblings),_this.isPrivateCandidate,_this.schoolId,_this.schoolOther,_this.schoolText,_this.schoolCampus,_this.studiedFrom,_this.studiedUntil,_this.qualification,_this.qualificationOther,_this.matricPercentage,const DeepCollectionEquality().hash(_this.results),const DeepCollectionEquality().hash(_this.subjects),_this.futureStudy,_this.hasReferee,_this.referee,const DeepCollectionEquality().hash(_this.activities),_this.wantsSportsTrial,_this.more,_this.anythingElse,_this.statement]);
}

@override
String toString() {
  final _this = this as FormDraft;
  return 'FormDraft(level: ${_this.level}, firstName: ${_this.firstName}, lastName: ${_this.lastName}, dateOfBirth: ${_this.dateOfBirth}, gender: ${_this.gender}, cnic: ${_this.cnic}, religion: ${_this.religion}, mobile: ${_this.mobile}, email: ${_this.email}, dual: ${_this.dual}, otherNationality: ${_this.otherNationality}, address: ${_this.address}, country: ${_this.country}, cityId: ${_this.cityId}, cityOther: ${_this.cityOther}, cityText: ${_this.cityText}, guardians: ${_this.guardians}, parentB: ${_this.parentB}, emg: ${_this.emg}, sib: ${_this.sib}, siblings: ${_this.siblings}, isPrivateCandidate: ${_this.isPrivateCandidate}, schoolId: ${_this.schoolId}, schoolOther: ${_this.schoolOther}, schoolText: ${_this.schoolText}, schoolCampus: ${_this.schoolCampus}, studiedFrom: ${_this.studiedFrom}, studiedUntil: ${_this.studiedUntil}, qualification: ${_this.qualification}, qualificationOther: ${_this.qualificationOther}, matricPercentage: ${_this.matricPercentage}, results: ${_this.results}, subjects: ${_this.subjects}, futureStudy: ${_this.futureStudy}, hasReferee: ${_this.hasReferee}, referee: ${_this.referee}, activities: ${_this.activities}, wantsSportsTrial: ${_this.wantsSportsTrial}, more: ${_this.more}, anythingElse: ${_this.anythingElse}, statement: ${_this.statement})';
}


}

/// @nodoc
abstract mixin class $FormDraftCopyWith<$Res>  {
  factory $FormDraftCopyWith(FormDraft value, $Res Function(FormDraft) _then) = _$FormDraftCopyWithImpl;
@useResult
$Res call({
 Level level, String firstName, String lastName, String? dateOfBirth, String gender, String cnic, String religion, String mobile, String email, bool dual, String otherNationality, String address, String country, int? cityId, String cityOther, String cityText, List<Guardian> guardians, bool parentB, Emergency emg, bool sib, List<Sibling> siblings, bool isPrivateCandidate, int? schoolId, String schoolOther, String schoolText, String schoolCampus, int? studiedFrom, int? studiedUntil, Qualification qualification, String qualificationOther, String matricPercentage, List<ResultRow> results, List<SubjectPick> subjects, String futureStudy, bool hasReferee, Referee referee, List<ActivityRow> activities, bool wantsSportsTrial, bool more, String anythingElse, String statement
});


$EmergencyCopyWith<$Res> get emg;$RefereeCopyWith<$Res> get referee;

}
/// @nodoc
class _$FormDraftCopyWithImpl<$Res>
    implements $FormDraftCopyWith<$Res> {
  _$FormDraftCopyWithImpl(this._self, this._then);

  final FormDraft _self;
  final $Res Function(FormDraft) _then;

/// Create a copy of FormDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? level = null,Object? firstName = null,Object? lastName = null,Object? dateOfBirth = freezed,Object? gender = null,Object? cnic = null,Object? religion = null,Object? mobile = null,Object? email = null,Object? dual = null,Object? otherNationality = null,Object? address = null,Object? country = null,Object? cityId = freezed,Object? cityOther = null,Object? cityText = null,Object? guardians = null,Object? parentB = null,Object? emg = null,Object? sib = null,Object? siblings = null,Object? isPrivateCandidate = null,Object? schoolId = freezed,Object? schoolOther = null,Object? schoolText = null,Object? schoolCampus = null,Object? studiedFrom = freezed,Object? studiedUntil = freezed,Object? qualification = null,Object? qualificationOther = null,Object? matricPercentage = null,Object? results = null,Object? subjects = null,Object? futureStudy = null,Object? hasReferee = null,Object? referee = null,Object? activities = null,Object? wantsSportsTrial = null,Object? more = null,Object? anythingElse = null,Object? statement = null,}) {
  return _then(FormDraft(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as Level,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,cnic: null == cnic ? _self.cnic : cnic // ignore: cast_nullable_to_non_nullable
as String,religion: null == religion ? _self.religion : religion // ignore: cast_nullable_to_non_nullable
as String,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,dual: null == dual ? _self.dual : dual // ignore: cast_nullable_to_non_nullable
as bool,otherNationality: null == otherNationality ? _self.otherNationality : otherNationality // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,cityId: freezed == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as int?,cityOther: null == cityOther ? _self.cityOther : cityOther // ignore: cast_nullable_to_non_nullable
as String,cityText: null == cityText ? _self.cityText : cityText // ignore: cast_nullable_to_non_nullable
as String,guardians: null == guardians ? _self.guardians : guardians // ignore: cast_nullable_to_non_nullable
as List<Guardian>,parentB: null == parentB ? _self.parentB : parentB // ignore: cast_nullable_to_non_nullable
as bool,emg: null == emg ? _self.emg : emg // ignore: cast_nullable_to_non_nullable
as Emergency,sib: null == sib ? _self.sib : sib // ignore: cast_nullable_to_non_nullable
as bool,siblings: null == siblings ? _self.siblings : siblings // ignore: cast_nullable_to_non_nullable
as List<Sibling>,isPrivateCandidate: null == isPrivateCandidate ? _self.isPrivateCandidate : isPrivateCandidate // ignore: cast_nullable_to_non_nullable
as bool,schoolId: freezed == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as int?,schoolOther: null == schoolOther ? _self.schoolOther : schoolOther // ignore: cast_nullable_to_non_nullable
as String,schoolText: null == schoolText ? _self.schoolText : schoolText // ignore: cast_nullable_to_non_nullable
as String,schoolCampus: null == schoolCampus ? _self.schoolCampus : schoolCampus // ignore: cast_nullable_to_non_nullable
as String,studiedFrom: freezed == studiedFrom ? _self.studiedFrom : studiedFrom // ignore: cast_nullable_to_non_nullable
as int?,studiedUntil: freezed == studiedUntil ? _self.studiedUntil : studiedUntil // ignore: cast_nullable_to_non_nullable
as int?,qualification: null == qualification ? _self.qualification : qualification // ignore: cast_nullable_to_non_nullable
as Qualification,qualificationOther: null == qualificationOther ? _self.qualificationOther : qualificationOther // ignore: cast_nullable_to_non_nullable
as String,matricPercentage: null == matricPercentage ? _self.matricPercentage : matricPercentage // ignore: cast_nullable_to_non_nullable
as String,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<ResultRow>,subjects: null == subjects ? _self.subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<SubjectPick>,futureStudy: null == futureStudy ? _self.futureStudy : futureStudy // ignore: cast_nullable_to_non_nullable
as String,hasReferee: null == hasReferee ? _self.hasReferee : hasReferee // ignore: cast_nullable_to_non_nullable
as bool,referee: null == referee ? _self.referee : referee // ignore: cast_nullable_to_non_nullable
as Referee,activities: null == activities ? _self.activities : activities // ignore: cast_nullable_to_non_nullable
as List<ActivityRow>,wantsSportsTrial: null == wantsSportsTrial ? _self.wantsSportsTrial : wantsSportsTrial // ignore: cast_nullable_to_non_nullable
as bool,more: null == more ? _self.more : more // ignore: cast_nullable_to_non_nullable
as bool,anythingElse: null == anythingElse ? _self.anythingElse : anythingElse // ignore: cast_nullable_to_non_nullable
as String,statement: null == statement ? _self.statement : statement // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of FormDraft
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmergencyCopyWith<$Res> get emg {
  
  return $EmergencyCopyWith<$Res>(_self.emg, (value) {
    return _then(_self.copyWith(emg: value));
  });
}/// Create a copy of FormDraft
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RefereeCopyWith<$Res> get referee {
  
  return $RefereeCopyWith<$Res>(_self.referee, (value) {
    return _then(_self.copyWith(referee: value));
  });
}
}


/// Adds pattern-matching-related methods to [FormDraft].
extension FormDraftPatterns on FormDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FormDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FormDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FormDraft value)  $default,){
final _that = this;
switch (_that) {
case _FormDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FormDraft value)?  $default,){
final _that = this;
switch (_that) {
case _FormDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Level level,  String firstName,  String lastName,  String? dateOfBirth,  String gender,  String cnic,  String religion,  String mobile,  String email,  bool dual,  String otherNationality,  String address,  String country,  int? cityId,  String cityOther,  String cityText,  List<Guardian> guardians,  bool parentB,  Emergency emg,  bool sib,  List<Sibling> siblings,  bool isPrivateCandidate,  int? schoolId,  String schoolOther,  String schoolText,  String schoolCampus,  int? studiedFrom,  int? studiedUntil,  Qualification qualification,  String qualificationOther,  String matricPercentage,  List<ResultRow> results,  List<SubjectPick> subjects,  String futureStudy,  bool hasReferee,  Referee referee,  List<ActivityRow> activities,  bool wantsSportsTrial,  bool more,  String anythingElse,  String statement)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormDraft() when $default != null:
return $default(_that.level,_that.firstName,_that.lastName,_that.dateOfBirth,_that.gender,_that.cnic,_that.religion,_that.mobile,_that.email,_that.dual,_that.otherNationality,_that.address,_that.country,_that.cityId,_that.cityOther,_that.cityText,_that.guardians,_that.parentB,_that.emg,_that.sib,_that.siblings,_that.isPrivateCandidate,_that.schoolId,_that.schoolOther,_that.schoolText,_that.schoolCampus,_that.studiedFrom,_that.studiedUntil,_that.qualification,_that.qualificationOther,_that.matricPercentage,_that.results,_that.subjects,_that.futureStudy,_that.hasReferee,_that.referee,_that.activities,_that.wantsSportsTrial,_that.more,_that.anythingElse,_that.statement);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Level level,  String firstName,  String lastName,  String? dateOfBirth,  String gender,  String cnic,  String religion,  String mobile,  String email,  bool dual,  String otherNationality,  String address,  String country,  int? cityId,  String cityOther,  String cityText,  List<Guardian> guardians,  bool parentB,  Emergency emg,  bool sib,  List<Sibling> siblings,  bool isPrivateCandidate,  int? schoolId,  String schoolOther,  String schoolText,  String schoolCampus,  int? studiedFrom,  int? studiedUntil,  Qualification qualification,  String qualificationOther,  String matricPercentage,  List<ResultRow> results,  List<SubjectPick> subjects,  String futureStudy,  bool hasReferee,  Referee referee,  List<ActivityRow> activities,  bool wantsSportsTrial,  bool more,  String anythingElse,  String statement)  $default,) {final _that = this;
switch (_that) {
case _FormDraft():
return $default(_that.level,_that.firstName,_that.lastName,_that.dateOfBirth,_that.gender,_that.cnic,_that.religion,_that.mobile,_that.email,_that.dual,_that.otherNationality,_that.address,_that.country,_that.cityId,_that.cityOther,_that.cityText,_that.guardians,_that.parentB,_that.emg,_that.sib,_that.siblings,_that.isPrivateCandidate,_that.schoolId,_that.schoolOther,_that.schoolText,_that.schoolCampus,_that.studiedFrom,_that.studiedUntil,_that.qualification,_that.qualificationOther,_that.matricPercentage,_that.results,_that.subjects,_that.futureStudy,_that.hasReferee,_that.referee,_that.activities,_that.wantsSportsTrial,_that.more,_that.anythingElse,_that.statement);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Level level,  String firstName,  String lastName,  String? dateOfBirth,  String gender,  String cnic,  String religion,  String mobile,  String email,  bool dual,  String otherNationality,  String address,  String country,  int? cityId,  String cityOther,  String cityText,  List<Guardian> guardians,  bool parentB,  Emergency emg,  bool sib,  List<Sibling> siblings,  bool isPrivateCandidate,  int? schoolId,  String schoolOther,  String schoolText,  String schoolCampus,  int? studiedFrom,  int? studiedUntil,  Qualification qualification,  String qualificationOther,  String matricPercentage,  List<ResultRow> results,  List<SubjectPick> subjects,  String futureStudy,  bool hasReferee,  Referee referee,  List<ActivityRow> activities,  bool wantsSportsTrial,  bool more,  String anythingElse,  String statement)?  $default,) {final _that = this;
switch (_that) {
case _FormDraft() when $default != null:
return $default(_that.level,_that.firstName,_that.lastName,_that.dateOfBirth,_that.gender,_that.cnic,_that.religion,_that.mobile,_that.email,_that.dual,_that.otherNationality,_that.address,_that.country,_that.cityId,_that.cityOther,_that.cityText,_that.guardians,_that.parentB,_that.emg,_that.sib,_that.siblings,_that.isPrivateCandidate,_that.schoolId,_that.schoolOther,_that.schoolText,_that.schoolCampus,_that.studiedFrom,_that.studiedUntil,_that.qualification,_that.qualificationOther,_that.matricPercentage,_that.results,_that.subjects,_that.futureStudy,_that.hasReferee,_that.referee,_that.activities,_that.wantsSportsTrial,_that.more,_that.anythingElse,_that.statement);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FormDraft extends FormDraft {
  const _FormDraft({this.level = Level.as_, this.firstName = '', this.lastName = '', this.dateOfBirth, this.gender = '', this.cnic = '', this.religion = '', this.mobile = '', this.email = '', this.dual = false, this.otherNationality = '', this.address = '', this.country = CountryOrder.defaultCountry, this.cityId, this.cityOther = '', this.cityText = '',  List<Guardian> guardians = const <Guardian>[Guardian(), Guardian()], this.parentB = false, this.emg = const Emergency(), this.sib = false,  List<Sibling> siblings = const <Sibling>[Sibling()], this.isPrivateCandidate = false, this.schoolId, this.schoolOther = '', this.schoolText = '', this.schoolCampus = '', this.studiedFrom, this.studiedUntil, this.qualification = Qualification.oLevel, this.qualificationOther = '', this.matricPercentage = '',  List<ResultRow> results = const <ResultRow>[],  List<SubjectPick> subjects = const <SubjectPick>[], this.futureStudy = '', this.hasReferee = false, this.referee = const Referee(),  List<ActivityRow> activities = const <ActivityRow>[], this.wantsSportsTrial = false, this.more = false, this.anythingElse = '', this.statement = ''}): _guardians = guardians,_siblings = siblings,_results = results,_subjects = subjects,_activities = activities,super._();
  factory _FormDraft.fromJson(Map<String, dynamic> json) => _$FormDraftFromJson(json);

@override@JsonKey() final  Level level;
@override@JsonKey() final  String firstName;
@override@JsonKey() final  String lastName;
@override final  String? dateOfBirth;
@override@JsonKey() final  String gender;
@override@JsonKey() final  String cnic;
@override@JsonKey() final  String religion;
@override@JsonKey() final  String mobile;
@override@JsonKey() final  String email;
@override@JsonKey() final  bool dual;
@override@JsonKey() final  String otherNationality;
@override@JsonKey() final  String address;
@override@JsonKey() final  String country;
@override final  int? cityId;
@override@JsonKey() final  String cityOther;
@override@JsonKey() final  String cityText;
 final  List<Guardian> _guardians;
@override@JsonKey() List<Guardian> get guardians {
  if (_guardians is EqualUnmodifiableListView) return _guardians;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_guardians);
}

@override@JsonKey() final  bool parentB;
@override@JsonKey() final  Emergency emg;
@override@JsonKey() final  bool sib;
 final  List<Sibling> _siblings;
@override@JsonKey() List<Sibling> get siblings {
  if (_siblings is EqualUnmodifiableListView) return _siblings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_siblings);
}

@override@JsonKey() final  bool isPrivateCandidate;
@override final  int? schoolId;
@override@JsonKey() final  String schoolOther;
@override@JsonKey() final  String schoolText;
@override@JsonKey() final  String schoolCampus;
@override final  int? studiedFrom;
@override final  int? studiedUntil;
@override@JsonKey() final  Qualification qualification;
@override@JsonKey() final  String qualificationOther;
@override@JsonKey() final  String matricPercentage;
 final  List<ResultRow> _results;
@override@JsonKey() List<ResultRow> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

 final  List<SubjectPick> _subjects;
@override@JsonKey() List<SubjectPick> get subjects {
  if (_subjects is EqualUnmodifiableListView) return _subjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subjects);
}

@override@JsonKey() final  String futureStudy;
@override@JsonKey() final  bool hasReferee;
@override@JsonKey() final  Referee referee;
 final  List<ActivityRow> _activities;
@override@JsonKey() List<ActivityRow> get activities {
  if (_activities is EqualUnmodifiableListView) return _activities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activities);
}

@override@JsonKey() final  bool wantsSportsTrial;
@override@JsonKey() final  bool more;
@override@JsonKey() final  String anythingElse;
@override@JsonKey() final  String statement;

/// Create a copy of FormDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormDraftCopyWith<_FormDraft> get copyWith => __$FormDraftCopyWithImpl<_FormDraft>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FormDraftToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormDraft&&(identical(other.level, level) || other.level == level)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.cnic, cnic) || other.cnic == cnic)&&(identical(other.religion, religion) || other.religion == religion)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.email, email) || other.email == email)&&(identical(other.dual, dual) || other.dual == dual)&&(identical(other.otherNationality, otherNationality) || other.otherNationality == otherNationality)&&(identical(other.address, address) || other.address == address)&&(identical(other.country, country) || other.country == country)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.cityOther, cityOther) || other.cityOther == cityOther)&&(identical(other.cityText, cityText) || other.cityText == cityText)&&const DeepCollectionEquality().equals(other.guardians, _guardians)&&(identical(other.parentB, parentB) || other.parentB == parentB)&&(identical(other.emg, emg) || other.emg == emg)&&(identical(other.sib, sib) || other.sib == sib)&&const DeepCollectionEquality().equals(other.siblings, _siblings)&&(identical(other.isPrivateCandidate, isPrivateCandidate) || other.isPrivateCandidate == isPrivateCandidate)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.schoolOther, schoolOther) || other.schoolOther == schoolOther)&&(identical(other.schoolText, schoolText) || other.schoolText == schoolText)&&(identical(other.schoolCampus, schoolCampus) || other.schoolCampus == schoolCampus)&&(identical(other.studiedFrom, studiedFrom) || other.studiedFrom == studiedFrom)&&(identical(other.studiedUntil, studiedUntil) || other.studiedUntil == studiedUntil)&&(identical(other.qualification, qualification) || other.qualification == qualification)&&(identical(other.qualificationOther, qualificationOther) || other.qualificationOther == qualificationOther)&&(identical(other.matricPercentage, matricPercentage) || other.matricPercentage == matricPercentage)&&const DeepCollectionEquality().equals(other.results, _results)&&const DeepCollectionEquality().equals(other.subjects, _subjects)&&(identical(other.futureStudy, futureStudy) || other.futureStudy == futureStudy)&&(identical(other.hasReferee, hasReferee) || other.hasReferee == hasReferee)&&(identical(other.referee, referee) || other.referee == referee)&&const DeepCollectionEquality().equals(other.activities, _activities)&&(identical(other.wantsSportsTrial, wantsSportsTrial) || other.wantsSportsTrial == wantsSportsTrial)&&(identical(other.more, more) || other.more == more)&&(identical(other.anythingElse, anythingElse) || other.anythingElse == anythingElse)&&(identical(other.statement, statement) || other.statement == statement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,level,firstName,lastName,dateOfBirth,gender,cnic,religion,mobile,email,dual,otherNationality,address,country,cityId,cityOther,cityText,const DeepCollectionEquality().hash(_guardians),parentB,emg,sib,const DeepCollectionEquality().hash(_siblings),isPrivateCandidate,schoolId,schoolOther,schoolText,schoolCampus,studiedFrom,studiedUntil,qualification,qualificationOther,matricPercentage,const DeepCollectionEquality().hash(_results),const DeepCollectionEquality().hash(_subjects),futureStudy,hasReferee,referee,const DeepCollectionEquality().hash(_activities),wantsSportsTrial,more,anythingElse,statement]);
}

@override
String toString() {
    return 'FormDraft(level: $level, firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth, gender: $gender, cnic: $cnic, religion: $religion, mobile: $mobile, email: $email, dual: $dual, otherNationality: $otherNationality, address: $address, country: $country, cityId: $cityId, cityOther: $cityOther, cityText: $cityText, guardians: $guardians, parentB: $parentB, emg: $emg, sib: $sib, siblings: $siblings, isPrivateCandidate: $isPrivateCandidate, schoolId: $schoolId, schoolOther: $schoolOther, schoolText: $schoolText, schoolCampus: $schoolCampus, studiedFrom: $studiedFrom, studiedUntil: $studiedUntil, qualification: $qualification, qualificationOther: $qualificationOther, matricPercentage: $matricPercentage, results: $results, subjects: $subjects, futureStudy: $futureStudy, hasReferee: $hasReferee, referee: $referee, activities: $activities, wantsSportsTrial: $wantsSportsTrial, more: $more, anythingElse: $anythingElse, statement: $statement)';
}


}

/// @nodoc
abstract mixin class _$FormDraftCopyWith<$Res> implements $FormDraftCopyWith<$Res> {
  factory _$FormDraftCopyWith(_FormDraft value, $Res Function(_FormDraft) _then) = __$FormDraftCopyWithImpl;
@override @useResult
$Res call({
 Level level, String firstName, String lastName, String? dateOfBirth, String gender, String cnic, String religion, String mobile, String email, bool dual, String otherNationality, String address, String country, int? cityId, String cityOther, String cityText, List<Guardian> guardians, bool parentB, Emergency emg, bool sib, List<Sibling> siblings, bool isPrivateCandidate, int? schoolId, String schoolOther, String schoolText, String schoolCampus, int? studiedFrom, int? studiedUntil, Qualification qualification, String qualificationOther, String matricPercentage, List<ResultRow> results, List<SubjectPick> subjects, String futureStudy, bool hasReferee, Referee referee, List<ActivityRow> activities, bool wantsSportsTrial, bool more, String anythingElse, String statement
});


@override $EmergencyCopyWith<$Res> get emg;@override $RefereeCopyWith<$Res> get referee;

}
/// @nodoc
class __$FormDraftCopyWithImpl<$Res>
    implements _$FormDraftCopyWith<$Res> {
  __$FormDraftCopyWithImpl(this._self, this._then);

  final _FormDraft _self;
  final $Res Function(_FormDraft) _then;

/// Create a copy of FormDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? level = null,Object? firstName = null,Object? lastName = null,Object? dateOfBirth = freezed,Object? gender = null,Object? cnic = null,Object? religion = null,Object? mobile = null,Object? email = null,Object? dual = null,Object? otherNationality = null,Object? address = null,Object? country = null,Object? cityId = freezed,Object? cityOther = null,Object? cityText = null,Object? guardians = null,Object? parentB = null,Object? emg = null,Object? sib = null,Object? siblings = null,Object? isPrivateCandidate = null,Object? schoolId = freezed,Object? schoolOther = null,Object? schoolText = null,Object? schoolCampus = null,Object? studiedFrom = freezed,Object? studiedUntil = freezed,Object? qualification = null,Object? qualificationOther = null,Object? matricPercentage = null,Object? results = null,Object? subjects = null,Object? futureStudy = null,Object? hasReferee = null,Object? referee = null,Object? activities = null,Object? wantsSportsTrial = null,Object? more = null,Object? anythingElse = null,Object? statement = null,}) {
  return _then(_FormDraft(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as Level,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,cnic: null == cnic ? _self.cnic : cnic // ignore: cast_nullable_to_non_nullable
as String,religion: null == religion ? _self.religion : religion // ignore: cast_nullable_to_non_nullable
as String,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,dual: null == dual ? _self.dual : dual // ignore: cast_nullable_to_non_nullable
as bool,otherNationality: null == otherNationality ? _self.otherNationality : otherNationality // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,cityId: freezed == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as int?,cityOther: null == cityOther ? _self.cityOther : cityOther // ignore: cast_nullable_to_non_nullable
as String,cityText: null == cityText ? _self.cityText : cityText // ignore: cast_nullable_to_non_nullable
as String,guardians: null == guardians ? _self._guardians : guardians // ignore: cast_nullable_to_non_nullable
as List<Guardian>,parentB: null == parentB ? _self.parentB : parentB // ignore: cast_nullable_to_non_nullable
as bool,emg: null == emg ? _self.emg : emg // ignore: cast_nullable_to_non_nullable
as Emergency,sib: null == sib ? _self.sib : sib // ignore: cast_nullable_to_non_nullable
as bool,siblings: null == siblings ? _self._siblings : siblings // ignore: cast_nullable_to_non_nullable
as List<Sibling>,isPrivateCandidate: null == isPrivateCandidate ? _self.isPrivateCandidate : isPrivateCandidate // ignore: cast_nullable_to_non_nullable
as bool,schoolId: freezed == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as int?,schoolOther: null == schoolOther ? _self.schoolOther : schoolOther // ignore: cast_nullable_to_non_nullable
as String,schoolText: null == schoolText ? _self.schoolText : schoolText // ignore: cast_nullable_to_non_nullable
as String,schoolCampus: null == schoolCampus ? _self.schoolCampus : schoolCampus // ignore: cast_nullable_to_non_nullable
as String,studiedFrom: freezed == studiedFrom ? _self.studiedFrom : studiedFrom // ignore: cast_nullable_to_non_nullable
as int?,studiedUntil: freezed == studiedUntil ? _self.studiedUntil : studiedUntil // ignore: cast_nullable_to_non_nullable
as int?,qualification: null == qualification ? _self.qualification : qualification // ignore: cast_nullable_to_non_nullable
as Qualification,qualificationOther: null == qualificationOther ? _self.qualificationOther : qualificationOther // ignore: cast_nullable_to_non_nullable
as String,matricPercentage: null == matricPercentage ? _self.matricPercentage : matricPercentage // ignore: cast_nullable_to_non_nullable
as String,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<ResultRow>,subjects: null == subjects ? _self._subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<SubjectPick>,futureStudy: null == futureStudy ? _self.futureStudy : futureStudy // ignore: cast_nullable_to_non_nullable
as String,hasReferee: null == hasReferee ? _self.hasReferee : hasReferee // ignore: cast_nullable_to_non_nullable
as bool,referee: null == referee ? _self.referee : referee // ignore: cast_nullable_to_non_nullable
as Referee,activities: null == activities ? _self._activities : activities // ignore: cast_nullable_to_non_nullable
as List<ActivityRow>,wantsSportsTrial: null == wantsSportsTrial ? _self.wantsSportsTrial : wantsSportsTrial // ignore: cast_nullable_to_non_nullable
as bool,more: null == more ? _self.more : more // ignore: cast_nullable_to_non_nullable
as bool,anythingElse: null == anythingElse ? _self.anythingElse : anythingElse // ignore: cast_nullable_to_non_nullable
as String,statement: null == statement ? _self.statement : statement // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of FormDraft
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmergencyCopyWith<$Res> get emg {
  
  return $EmergencyCopyWith<$Res>(_self.emg, (value) {
    return _then(_self.copyWith(emg: value));
  });
}/// Create a copy of FormDraft
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RefereeCopyWith<$Res> get referee {
  
  return $RefereeCopyWith<$Res>(_self.referee, (value) {
    return _then(_self.copyWith(referee: value));
  });
}
}

// dart format on
