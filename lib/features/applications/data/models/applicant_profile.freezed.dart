// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'applicant_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApplicantProfile {

@JsonKey(name: 'first_name') String get firstName;@JsonKey(name: 'last_name') String get lastName;@JsonKey(name: 'date_of_birth') String? get dateOfBirth; String get gender; String get cnic; String get religion; String get mobile; String get email;@JsonKey(name: 'other_nationality') String get otherNationality; String get address; String get country;@JsonKey(name: 'city_id') int? get cityId;@JsonKey(name: 'city_other') String get cityOther;@JsonKey(name: 'emergency_contact', fromJson: _mapFromJson) Map<String, dynamic> get emergencyContact;@JsonKey(name: 'is_private_candidate') bool get isPrivateCandidate;@JsonKey(name: 'school_id') int? get schoolId;@JsonKey(name: 'school_other') String get schoolOther;@JsonKey(name: 'school_campus') String get schoolCampus;@JsonKey(name: 'studied_from') int? get studiedFrom;@JsonKey(name: 'studied_until') int? get studiedUntil;@JsonKey(unknownEnumValue: Qualification.oLevel) Qualification get qualification;@JsonKey(name: 'qualification_other') String get qualificationOther;@JsonKey(name: 'matric_percentage', fromJson: _decimalString) String? get matricPercentage;@JsonKey(name: 'future_study') String get futureStudy;@JsonKey(fromJson: _refereeFromJson) Referee get referee;@JsonKey(name: 'wants_sports_trial') bool get wantsSportsTrial;@JsonKey(name: 'anything_else') String get anythingElse; String get statement;
/// Create a copy of ApplicantProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicantProfileCopyWith<ApplicantProfile> get copyWith => _$ApplicantProfileCopyWithImpl<ApplicantProfile>(this as ApplicantProfile, _$identity);

  /// Serializes this ApplicantProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ApplicantProfile;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicantProfile&&(identical(other.firstName, _this.firstName) || other.firstName == _this.firstName)&&(identical(other.lastName, _this.lastName) || other.lastName == _this.lastName)&&(identical(other.dateOfBirth, _this.dateOfBirth) || other.dateOfBirth == _this.dateOfBirth)&&(identical(other.gender, _this.gender) || other.gender == _this.gender)&&(identical(other.cnic, _this.cnic) || other.cnic == _this.cnic)&&(identical(other.religion, _this.religion) || other.religion == _this.religion)&&(identical(other.mobile, _this.mobile) || other.mobile == _this.mobile)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.otherNationality, _this.otherNationality) || other.otherNationality == _this.otherNationality)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.country, _this.country) || other.country == _this.country)&&(identical(other.cityId, _this.cityId) || other.cityId == _this.cityId)&&(identical(other.cityOther, _this.cityOther) || other.cityOther == _this.cityOther)&&const DeepCollectionEquality().equals(other.emergencyContact, _this.emergencyContact)&&(identical(other.isPrivateCandidate, _this.isPrivateCandidate) || other.isPrivateCandidate == _this.isPrivateCandidate)&&(identical(other.schoolId, _this.schoolId) || other.schoolId == _this.schoolId)&&(identical(other.schoolOther, _this.schoolOther) || other.schoolOther == _this.schoolOther)&&(identical(other.schoolCampus, _this.schoolCampus) || other.schoolCampus == _this.schoolCampus)&&(identical(other.studiedFrom, _this.studiedFrom) || other.studiedFrom == _this.studiedFrom)&&(identical(other.studiedUntil, _this.studiedUntil) || other.studiedUntil == _this.studiedUntil)&&(identical(other.qualification, _this.qualification) || other.qualification == _this.qualification)&&(identical(other.qualificationOther, _this.qualificationOther) || other.qualificationOther == _this.qualificationOther)&&(identical(other.matricPercentage, _this.matricPercentage) || other.matricPercentage == _this.matricPercentage)&&(identical(other.futureStudy, _this.futureStudy) || other.futureStudy == _this.futureStudy)&&(identical(other.referee, _this.referee) || other.referee == _this.referee)&&(identical(other.wantsSportsTrial, _this.wantsSportsTrial) || other.wantsSportsTrial == _this.wantsSportsTrial)&&(identical(other.anythingElse, _this.anythingElse) || other.anythingElse == _this.anythingElse)&&(identical(other.statement, _this.statement) || other.statement == _this.statement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ApplicantProfile;
  return Object.hashAll([runtimeType,_this.firstName,_this.lastName,_this.dateOfBirth,_this.gender,_this.cnic,_this.religion,_this.mobile,_this.email,_this.otherNationality,_this.address,_this.country,_this.cityId,_this.cityOther,const DeepCollectionEquality().hash(_this.emergencyContact),_this.isPrivateCandidate,_this.schoolId,_this.schoolOther,_this.schoolCampus,_this.studiedFrom,_this.studiedUntil,_this.qualification,_this.qualificationOther,_this.matricPercentage,_this.futureStudy,_this.referee,_this.wantsSportsTrial,_this.anythingElse,_this.statement]);
}

@override
String toString() {
  final _this = this as ApplicantProfile;
  return 'ApplicantProfile(firstName: ${_this.firstName}, lastName: ${_this.lastName}, dateOfBirth: ${_this.dateOfBirth}, gender: ${_this.gender}, cnic: ${_this.cnic}, religion: ${_this.religion}, mobile: ${_this.mobile}, email: ${_this.email}, otherNationality: ${_this.otherNationality}, address: ${_this.address}, country: ${_this.country}, cityId: ${_this.cityId}, cityOther: ${_this.cityOther}, emergencyContact: ${_this.emergencyContact}, isPrivateCandidate: ${_this.isPrivateCandidate}, schoolId: ${_this.schoolId}, schoolOther: ${_this.schoolOther}, schoolCampus: ${_this.schoolCampus}, studiedFrom: ${_this.studiedFrom}, studiedUntil: ${_this.studiedUntil}, qualification: ${_this.qualification}, qualificationOther: ${_this.qualificationOther}, matricPercentage: ${_this.matricPercentage}, futureStudy: ${_this.futureStudy}, referee: ${_this.referee}, wantsSportsTrial: ${_this.wantsSportsTrial}, anythingElse: ${_this.anythingElse}, statement: ${_this.statement})';
}


}

/// @nodoc
abstract mixin class $ApplicantProfileCopyWith<$Res>  {
  factory $ApplicantProfileCopyWith(ApplicantProfile value, $Res Function(ApplicantProfile) _then) = _$ApplicantProfileCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName,@JsonKey(name: 'date_of_birth') String? dateOfBirth, String gender, String cnic, String religion, String mobile, String email,@JsonKey(name: 'other_nationality') String otherNationality, String address, String country,@JsonKey(name: 'city_id') int? cityId,@JsonKey(name: 'city_other') String cityOther,@JsonKey(name: 'emergency_contact', fromJson: _mapFromJson) Map<String, dynamic> emergencyContact,@JsonKey(name: 'is_private_candidate') bool isPrivateCandidate,@JsonKey(name: 'school_id') int? schoolId,@JsonKey(name: 'school_other') String schoolOther,@JsonKey(name: 'school_campus') String schoolCampus,@JsonKey(name: 'studied_from') int? studiedFrom,@JsonKey(name: 'studied_until') int? studiedUntil,@JsonKey(unknownEnumValue: Qualification.oLevel) Qualification qualification,@JsonKey(name: 'qualification_other') String qualificationOther,@JsonKey(name: 'matric_percentage', fromJson: _decimalString) String? matricPercentage,@JsonKey(name: 'future_study') String futureStudy,@JsonKey(fromJson: _refereeFromJson) Referee referee,@JsonKey(name: 'wants_sports_trial') bool wantsSportsTrial,@JsonKey(name: 'anything_else') String anythingElse, String statement
});


$RefereeCopyWith<$Res> get referee;

}
/// @nodoc
class _$ApplicantProfileCopyWithImpl<$Res>
    implements $ApplicantProfileCopyWith<$Res> {
  _$ApplicantProfileCopyWithImpl(this._self, this._then);

  final ApplicantProfile _self;
  final $Res Function(ApplicantProfile) _then;

/// Create a copy of ApplicantProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,Object? dateOfBirth = freezed,Object? gender = null,Object? cnic = null,Object? religion = null,Object? mobile = null,Object? email = null,Object? otherNationality = null,Object? address = null,Object? country = null,Object? cityId = freezed,Object? cityOther = null,Object? emergencyContact = null,Object? isPrivateCandidate = null,Object? schoolId = freezed,Object? schoolOther = null,Object? schoolCampus = null,Object? studiedFrom = freezed,Object? studiedUntil = freezed,Object? qualification = null,Object? qualificationOther = null,Object? matricPercentage = freezed,Object? futureStudy = null,Object? referee = null,Object? wantsSportsTrial = null,Object? anythingElse = null,Object? statement = null,}) {
  return _then(ApplicantProfile(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,cnic: null == cnic ? _self.cnic : cnic // ignore: cast_nullable_to_non_nullable
as String,religion: null == religion ? _self.religion : religion // ignore: cast_nullable_to_non_nullable
as String,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otherNationality: null == otherNationality ? _self.otherNationality : otherNationality // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,cityId: freezed == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as int?,cityOther: null == cityOther ? _self.cityOther : cityOther // ignore: cast_nullable_to_non_nullable
as String,emergencyContact: null == emergencyContact ? _self.emergencyContact : emergencyContact // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,isPrivateCandidate: null == isPrivateCandidate ? _self.isPrivateCandidate : isPrivateCandidate // ignore: cast_nullable_to_non_nullable
as bool,schoolId: freezed == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as int?,schoolOther: null == schoolOther ? _self.schoolOther : schoolOther // ignore: cast_nullable_to_non_nullable
as String,schoolCampus: null == schoolCampus ? _self.schoolCampus : schoolCampus // ignore: cast_nullable_to_non_nullable
as String,studiedFrom: freezed == studiedFrom ? _self.studiedFrom : studiedFrom // ignore: cast_nullable_to_non_nullable
as int?,studiedUntil: freezed == studiedUntil ? _self.studiedUntil : studiedUntil // ignore: cast_nullable_to_non_nullable
as int?,qualification: null == qualification ? _self.qualification : qualification // ignore: cast_nullable_to_non_nullable
as Qualification,qualificationOther: null == qualificationOther ? _self.qualificationOther : qualificationOther // ignore: cast_nullable_to_non_nullable
as String,matricPercentage: freezed == matricPercentage ? _self.matricPercentage : matricPercentage // ignore: cast_nullable_to_non_nullable
as String?,futureStudy: null == futureStudy ? _self.futureStudy : futureStudy // ignore: cast_nullable_to_non_nullable
as String,referee: null == referee ? _self.referee : referee // ignore: cast_nullable_to_non_nullable
as Referee,wantsSportsTrial: null == wantsSportsTrial ? _self.wantsSportsTrial : wantsSportsTrial // ignore: cast_nullable_to_non_nullable
as bool,anythingElse: null == anythingElse ? _self.anythingElse : anythingElse // ignore: cast_nullable_to_non_nullable
as String,statement: null == statement ? _self.statement : statement // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ApplicantProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RefereeCopyWith<$Res> get referee {
  
  return $RefereeCopyWith<$Res>(_self.referee, (value) {
    return _then(_self.copyWith(referee: value));
  });
}
}


/// Adds pattern-matching-related methods to [ApplicantProfile].
extension ApplicantProfilePatterns on ApplicantProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApplicantProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApplicantProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApplicantProfile value)  $default,){
final _that = this;
switch (_that) {
case _ApplicantProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApplicantProfile value)?  $default,){
final _that = this;
switch (_that) {
case _ApplicantProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'date_of_birth')  String? dateOfBirth,  String gender,  String cnic,  String religion,  String mobile,  String email, @JsonKey(name: 'other_nationality')  String otherNationality,  String address,  String country, @JsonKey(name: 'city_id')  int? cityId, @JsonKey(name: 'city_other')  String cityOther, @JsonKey(name: 'emergency_contact', fromJson: _mapFromJson)  Map<String, dynamic> emergencyContact, @JsonKey(name: 'is_private_candidate')  bool isPrivateCandidate, @JsonKey(name: 'school_id')  int? schoolId, @JsonKey(name: 'school_other')  String schoolOther, @JsonKey(name: 'school_campus')  String schoolCampus, @JsonKey(name: 'studied_from')  int? studiedFrom, @JsonKey(name: 'studied_until')  int? studiedUntil, @JsonKey(unknownEnumValue: Qualification.oLevel)  Qualification qualification, @JsonKey(name: 'qualification_other')  String qualificationOther, @JsonKey(name: 'matric_percentage', fromJson: _decimalString)  String? matricPercentage, @JsonKey(name: 'future_study')  String futureStudy, @JsonKey(fromJson: _refereeFromJson)  Referee referee, @JsonKey(name: 'wants_sports_trial')  bool wantsSportsTrial, @JsonKey(name: 'anything_else')  String anythingElse,  String statement)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApplicantProfile() when $default != null:
return $default(_that.firstName,_that.lastName,_that.dateOfBirth,_that.gender,_that.cnic,_that.religion,_that.mobile,_that.email,_that.otherNationality,_that.address,_that.country,_that.cityId,_that.cityOther,_that.emergencyContact,_that.isPrivateCandidate,_that.schoolId,_that.schoolOther,_that.schoolCampus,_that.studiedFrom,_that.studiedUntil,_that.qualification,_that.qualificationOther,_that.matricPercentage,_that.futureStudy,_that.referee,_that.wantsSportsTrial,_that.anythingElse,_that.statement);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'date_of_birth')  String? dateOfBirth,  String gender,  String cnic,  String religion,  String mobile,  String email, @JsonKey(name: 'other_nationality')  String otherNationality,  String address,  String country, @JsonKey(name: 'city_id')  int? cityId, @JsonKey(name: 'city_other')  String cityOther, @JsonKey(name: 'emergency_contact', fromJson: _mapFromJson)  Map<String, dynamic> emergencyContact, @JsonKey(name: 'is_private_candidate')  bool isPrivateCandidate, @JsonKey(name: 'school_id')  int? schoolId, @JsonKey(name: 'school_other')  String schoolOther, @JsonKey(name: 'school_campus')  String schoolCampus, @JsonKey(name: 'studied_from')  int? studiedFrom, @JsonKey(name: 'studied_until')  int? studiedUntil, @JsonKey(unknownEnumValue: Qualification.oLevel)  Qualification qualification, @JsonKey(name: 'qualification_other')  String qualificationOther, @JsonKey(name: 'matric_percentage', fromJson: _decimalString)  String? matricPercentage, @JsonKey(name: 'future_study')  String futureStudy, @JsonKey(fromJson: _refereeFromJson)  Referee referee, @JsonKey(name: 'wants_sports_trial')  bool wantsSportsTrial, @JsonKey(name: 'anything_else')  String anythingElse,  String statement)  $default,) {final _that = this;
switch (_that) {
case _ApplicantProfile():
return $default(_that.firstName,_that.lastName,_that.dateOfBirth,_that.gender,_that.cnic,_that.religion,_that.mobile,_that.email,_that.otherNationality,_that.address,_that.country,_that.cityId,_that.cityOther,_that.emergencyContact,_that.isPrivateCandidate,_that.schoolId,_that.schoolOther,_that.schoolCampus,_that.studiedFrom,_that.studiedUntil,_that.qualification,_that.qualificationOther,_that.matricPercentage,_that.futureStudy,_that.referee,_that.wantsSportsTrial,_that.anythingElse,_that.statement);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'date_of_birth')  String? dateOfBirth,  String gender,  String cnic,  String religion,  String mobile,  String email, @JsonKey(name: 'other_nationality')  String otherNationality,  String address,  String country, @JsonKey(name: 'city_id')  int? cityId, @JsonKey(name: 'city_other')  String cityOther, @JsonKey(name: 'emergency_contact', fromJson: _mapFromJson)  Map<String, dynamic> emergencyContact, @JsonKey(name: 'is_private_candidate')  bool isPrivateCandidate, @JsonKey(name: 'school_id')  int? schoolId, @JsonKey(name: 'school_other')  String schoolOther, @JsonKey(name: 'school_campus')  String schoolCampus, @JsonKey(name: 'studied_from')  int? studiedFrom, @JsonKey(name: 'studied_until')  int? studiedUntil, @JsonKey(unknownEnumValue: Qualification.oLevel)  Qualification qualification, @JsonKey(name: 'qualification_other')  String qualificationOther, @JsonKey(name: 'matric_percentage', fromJson: _decimalString)  String? matricPercentage, @JsonKey(name: 'future_study')  String futureStudy, @JsonKey(fromJson: _refereeFromJson)  Referee referee, @JsonKey(name: 'wants_sports_trial')  bool wantsSportsTrial, @JsonKey(name: 'anything_else')  String anythingElse,  String statement)?  $default,) {final _that = this;
switch (_that) {
case _ApplicantProfile() when $default != null:
return $default(_that.firstName,_that.lastName,_that.dateOfBirth,_that.gender,_that.cnic,_that.religion,_that.mobile,_that.email,_that.otherNationality,_that.address,_that.country,_that.cityId,_that.cityOther,_that.emergencyContact,_that.isPrivateCandidate,_that.schoolId,_that.schoolOther,_that.schoolCampus,_that.studiedFrom,_that.studiedUntil,_that.qualification,_that.qualificationOther,_that.matricPercentage,_that.futureStudy,_that.referee,_that.wantsSportsTrial,_that.anythingElse,_that.statement);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApplicantProfile implements ApplicantProfile {
  const _ApplicantProfile({@JsonKey(name: 'first_name') this.firstName = '', @JsonKey(name: 'last_name') this.lastName = '', @JsonKey(name: 'date_of_birth') this.dateOfBirth, this.gender = '', this.cnic = '', this.religion = '', this.mobile = '', this.email = '', @JsonKey(name: 'other_nationality') this.otherNationality = '', this.address = '', this.country = '', @JsonKey(name: 'city_id') this.cityId, @JsonKey(name: 'city_other') this.cityOther = '', @JsonKey(name: 'emergency_contact', fromJson: _mapFromJson)  Map<String, dynamic> emergencyContact = const <String, dynamic>{}, @JsonKey(name: 'is_private_candidate') this.isPrivateCandidate = false, @JsonKey(name: 'school_id') this.schoolId, @JsonKey(name: 'school_other') this.schoolOther = '', @JsonKey(name: 'school_campus') this.schoolCampus = '', @JsonKey(name: 'studied_from') this.studiedFrom, @JsonKey(name: 'studied_until') this.studiedUntil, @JsonKey(unknownEnumValue: Qualification.oLevel) this.qualification = Qualification.oLevel, @JsonKey(name: 'qualification_other') this.qualificationOther = '', @JsonKey(name: 'matric_percentage', fromJson: _decimalString) this.matricPercentage, @JsonKey(name: 'future_study') this.futureStudy = '', @JsonKey(fromJson: _refereeFromJson) this.referee = const Referee(), @JsonKey(name: 'wants_sports_trial') this.wantsSportsTrial = false, @JsonKey(name: 'anything_else') this.anythingElse = '', this.statement = ''}): _emergencyContact = emergencyContact;
  factory _ApplicantProfile.fromJson(Map<String, dynamic> json) => _$ApplicantProfileFromJson(json);

@override@JsonKey(name: 'first_name') final  String firstName;
@override@JsonKey(name: 'last_name') final  String lastName;
@override@JsonKey(name: 'date_of_birth') final  String? dateOfBirth;
@override@JsonKey() final  String gender;
@override@JsonKey() final  String cnic;
@override@JsonKey() final  String religion;
@override@JsonKey() final  String mobile;
@override@JsonKey() final  String email;
@override@JsonKey(name: 'other_nationality') final  String otherNationality;
@override@JsonKey() final  String address;
@override@JsonKey() final  String country;
@override@JsonKey(name: 'city_id') final  int? cityId;
@override@JsonKey(name: 'city_other') final  String cityOther;
 final  Map<String, dynamic> _emergencyContact;
@override@JsonKey(name: 'emergency_contact', fromJson: _mapFromJson) Map<String, dynamic> get emergencyContact {
  if (_emergencyContact is EqualUnmodifiableMapView) return _emergencyContact;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_emergencyContact);
}

@override@JsonKey(name: 'is_private_candidate') final  bool isPrivateCandidate;
@override@JsonKey(name: 'school_id') final  int? schoolId;
@override@JsonKey(name: 'school_other') final  String schoolOther;
@override@JsonKey(name: 'school_campus') final  String schoolCampus;
@override@JsonKey(name: 'studied_from') final  int? studiedFrom;
@override@JsonKey(name: 'studied_until') final  int? studiedUntil;
@override@JsonKey(unknownEnumValue: Qualification.oLevel) final  Qualification qualification;
@override@JsonKey(name: 'qualification_other') final  String qualificationOther;
@override@JsonKey(name: 'matric_percentage', fromJson: _decimalString) final  String? matricPercentage;
@override@JsonKey(name: 'future_study') final  String futureStudy;
@override@JsonKey(fromJson: _refereeFromJson) final  Referee referee;
@override@JsonKey(name: 'wants_sports_trial') final  bool wantsSportsTrial;
@override@JsonKey(name: 'anything_else') final  String anythingElse;
@override@JsonKey() final  String statement;

/// Create a copy of ApplicantProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplicantProfileCopyWith<_ApplicantProfile> get copyWith => __$ApplicantProfileCopyWithImpl<_ApplicantProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApplicantProfileToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplicantProfile&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.cnic, cnic) || other.cnic == cnic)&&(identical(other.religion, religion) || other.religion == religion)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.email, email) || other.email == email)&&(identical(other.otherNationality, otherNationality) || other.otherNationality == otherNationality)&&(identical(other.address, address) || other.address == address)&&(identical(other.country, country) || other.country == country)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.cityOther, cityOther) || other.cityOther == cityOther)&&const DeepCollectionEquality().equals(other.emergencyContact, _emergencyContact)&&(identical(other.isPrivateCandidate, isPrivateCandidate) || other.isPrivateCandidate == isPrivateCandidate)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.schoolOther, schoolOther) || other.schoolOther == schoolOther)&&(identical(other.schoolCampus, schoolCampus) || other.schoolCampus == schoolCampus)&&(identical(other.studiedFrom, studiedFrom) || other.studiedFrom == studiedFrom)&&(identical(other.studiedUntil, studiedUntil) || other.studiedUntil == studiedUntil)&&(identical(other.qualification, qualification) || other.qualification == qualification)&&(identical(other.qualificationOther, qualificationOther) || other.qualificationOther == qualificationOther)&&(identical(other.matricPercentage, matricPercentage) || other.matricPercentage == matricPercentage)&&(identical(other.futureStudy, futureStudy) || other.futureStudy == futureStudy)&&(identical(other.referee, referee) || other.referee == referee)&&(identical(other.wantsSportsTrial, wantsSportsTrial) || other.wantsSportsTrial == wantsSportsTrial)&&(identical(other.anythingElse, anythingElse) || other.anythingElse == anythingElse)&&(identical(other.statement, statement) || other.statement == statement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,firstName,lastName,dateOfBirth,gender,cnic,religion,mobile,email,otherNationality,address,country,cityId,cityOther,const DeepCollectionEquality().hash(_emergencyContact),isPrivateCandidate,schoolId,schoolOther,schoolCampus,studiedFrom,studiedUntil,qualification,qualificationOther,matricPercentage,futureStudy,referee,wantsSportsTrial,anythingElse,statement]);
}

@override
String toString() {
    return 'ApplicantProfile(firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth, gender: $gender, cnic: $cnic, religion: $religion, mobile: $mobile, email: $email, otherNationality: $otherNationality, address: $address, country: $country, cityId: $cityId, cityOther: $cityOther, emergencyContact: $emergencyContact, isPrivateCandidate: $isPrivateCandidate, schoolId: $schoolId, schoolOther: $schoolOther, schoolCampus: $schoolCampus, studiedFrom: $studiedFrom, studiedUntil: $studiedUntil, qualification: $qualification, qualificationOther: $qualificationOther, matricPercentage: $matricPercentage, futureStudy: $futureStudy, referee: $referee, wantsSportsTrial: $wantsSportsTrial, anythingElse: $anythingElse, statement: $statement)';
}


}

/// @nodoc
abstract mixin class _$ApplicantProfileCopyWith<$Res> implements $ApplicantProfileCopyWith<$Res> {
  factory _$ApplicantProfileCopyWith(_ApplicantProfile value, $Res Function(_ApplicantProfile) _then) = __$ApplicantProfileCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName,@JsonKey(name: 'date_of_birth') String? dateOfBirth, String gender, String cnic, String religion, String mobile, String email,@JsonKey(name: 'other_nationality') String otherNationality, String address, String country,@JsonKey(name: 'city_id') int? cityId,@JsonKey(name: 'city_other') String cityOther,@JsonKey(name: 'emergency_contact', fromJson: _mapFromJson) Map<String, dynamic> emergencyContact,@JsonKey(name: 'is_private_candidate') bool isPrivateCandidate,@JsonKey(name: 'school_id') int? schoolId,@JsonKey(name: 'school_other') String schoolOther,@JsonKey(name: 'school_campus') String schoolCampus,@JsonKey(name: 'studied_from') int? studiedFrom,@JsonKey(name: 'studied_until') int? studiedUntil,@JsonKey(unknownEnumValue: Qualification.oLevel) Qualification qualification,@JsonKey(name: 'qualification_other') String qualificationOther,@JsonKey(name: 'matric_percentage', fromJson: _decimalString) String? matricPercentage,@JsonKey(name: 'future_study') String futureStudy,@JsonKey(fromJson: _refereeFromJson) Referee referee,@JsonKey(name: 'wants_sports_trial') bool wantsSportsTrial,@JsonKey(name: 'anything_else') String anythingElse, String statement
});


@override $RefereeCopyWith<$Res> get referee;

}
/// @nodoc
class __$ApplicantProfileCopyWithImpl<$Res>
    implements _$ApplicantProfileCopyWith<$Res> {
  __$ApplicantProfileCopyWithImpl(this._self, this._then);

  final _ApplicantProfile _self;
  final $Res Function(_ApplicantProfile) _then;

/// Create a copy of ApplicantProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,Object? dateOfBirth = freezed,Object? gender = null,Object? cnic = null,Object? religion = null,Object? mobile = null,Object? email = null,Object? otherNationality = null,Object? address = null,Object? country = null,Object? cityId = freezed,Object? cityOther = null,Object? emergencyContact = null,Object? isPrivateCandidate = null,Object? schoolId = freezed,Object? schoolOther = null,Object? schoolCampus = null,Object? studiedFrom = freezed,Object? studiedUntil = freezed,Object? qualification = null,Object? qualificationOther = null,Object? matricPercentage = freezed,Object? futureStudy = null,Object? referee = null,Object? wantsSportsTrial = null,Object? anythingElse = null,Object? statement = null,}) {
  return _then(_ApplicantProfile(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,cnic: null == cnic ? _self.cnic : cnic // ignore: cast_nullable_to_non_nullable
as String,religion: null == religion ? _self.religion : religion // ignore: cast_nullable_to_non_nullable
as String,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otherNationality: null == otherNationality ? _self.otherNationality : otherNationality // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,cityId: freezed == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as int?,cityOther: null == cityOther ? _self.cityOther : cityOther // ignore: cast_nullable_to_non_nullable
as String,emergencyContact: null == emergencyContact ? _self._emergencyContact : emergencyContact // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,isPrivateCandidate: null == isPrivateCandidate ? _self.isPrivateCandidate : isPrivateCandidate // ignore: cast_nullable_to_non_nullable
as bool,schoolId: freezed == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as int?,schoolOther: null == schoolOther ? _self.schoolOther : schoolOther // ignore: cast_nullable_to_non_nullable
as String,schoolCampus: null == schoolCampus ? _self.schoolCampus : schoolCampus // ignore: cast_nullable_to_non_nullable
as String,studiedFrom: freezed == studiedFrom ? _self.studiedFrom : studiedFrom // ignore: cast_nullable_to_non_nullable
as int?,studiedUntil: freezed == studiedUntil ? _self.studiedUntil : studiedUntil // ignore: cast_nullable_to_non_nullable
as int?,qualification: null == qualification ? _self.qualification : qualification // ignore: cast_nullable_to_non_nullable
as Qualification,qualificationOther: null == qualificationOther ? _self.qualificationOther : qualificationOther // ignore: cast_nullable_to_non_nullable
as String,matricPercentage: freezed == matricPercentage ? _self.matricPercentage : matricPercentage // ignore: cast_nullable_to_non_nullable
as String?,futureStudy: null == futureStudy ? _self.futureStudy : futureStudy // ignore: cast_nullable_to_non_nullable
as String,referee: null == referee ? _self.referee : referee // ignore: cast_nullable_to_non_nullable
as Referee,wantsSportsTrial: null == wantsSportsTrial ? _self.wantsSportsTrial : wantsSportsTrial // ignore: cast_nullable_to_non_nullable
as bool,anythingElse: null == anythingElse ? _self.anythingElse : anythingElse // ignore: cast_nullable_to_non_nullable
as String,statement: null == statement ? _self.statement : statement // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ApplicantProfile
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
