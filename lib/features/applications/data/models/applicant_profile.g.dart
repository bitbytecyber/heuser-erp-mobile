// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applicant_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApplicantProfile _$ApplicantProfileFromJson(Map<String, dynamic> json) =>
    _ApplicantProfile(
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      dateOfBirth: json['date_of_birth'] as String?,
      gender: json['gender'] as String? ?? '',
      cnic: json['cnic'] as String? ?? '',
      religion: json['religion'] as String? ?? '',
      mobile: json['mobile'] as String? ?? '',
      email: json['email'] as String? ?? '',
      otherNationality: json['other_nationality'] as String? ?? '',
      address: json['address'] as String? ?? '',
      country: json['country'] as String? ?? '',
      cityId: (json['city_id'] as num?)?.toInt(),
      cityOther: json['city_other'] as String? ?? '',
      emergencyContact: json['emergency_contact'] == null
          ? const <String, dynamic>{}
          : _mapFromJson(json['emergency_contact']),
      isPrivateCandidate: json['is_private_candidate'] as bool? ?? false,
      schoolId: (json['school_id'] as num?)?.toInt(),
      schoolOther: json['school_other'] as String? ?? '',
      schoolCampus: json['school_campus'] as String? ?? '',
      studiedFrom: (json['studied_from'] as num?)?.toInt(),
      studiedUntil: (json['studied_until'] as num?)?.toInt(),
      qualification:
          $enumDecodeNullable(
            _$QualificationEnumMap,
            json['qualification'],
            unknownValue: Qualification.oLevel,
          ) ??
          Qualification.oLevel,
      qualificationOther: json['qualification_other'] as String? ?? '',
      matricPercentage: json['matric_percentage'] as String?,
      futureStudy: json['future_study'] as String? ?? '',
      referee: json['referee'] == null
          ? const Referee()
          : _refereeFromJson(json['referee']),
      wantsSportsTrial: json['wants_sports_trial'] as bool? ?? false,
      anythingElse: json['anything_else'] as String? ?? '',
      statement: json['statement'] as String? ?? '',
    );

Map<String, dynamic> _$ApplicantProfileToJson(_ApplicantProfile instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'date_of_birth': instance.dateOfBirth,
      'gender': instance.gender,
      'cnic': instance.cnic,
      'religion': instance.religion,
      'mobile': instance.mobile,
      'email': instance.email,
      'other_nationality': instance.otherNationality,
      'address': instance.address,
      'country': instance.country,
      'city_id': instance.cityId,
      'city_other': instance.cityOther,
      'emergency_contact': instance.emergencyContact,
      'is_private_candidate': instance.isPrivateCandidate,
      'school_id': instance.schoolId,
      'school_other': instance.schoolOther,
      'school_campus': instance.schoolCampus,
      'studied_from': instance.studiedFrom,
      'studied_until': instance.studiedUntil,
      'qualification': _$QualificationEnumMap[instance.qualification]!,
      'qualification_other': instance.qualificationOther,
      'matric_percentage': instance.matricPercentage,
      'future_study': instance.futureStudy,
      'referee': instance.referee.toJson(),
      'wants_sports_trial': instance.wantsSportsTrial,
      'anything_else': instance.anythingElse,
      'statement': instance.statement,
    };

const _$QualificationEnumMap = {
  Qualification.oLevel: 'o_level',
  Qualification.igcse: 'igcse',
  Qualification.matric: 'matric',
  Qualification.akuEb: 'aku_eb',
  Qualification.other: 'other',
};
