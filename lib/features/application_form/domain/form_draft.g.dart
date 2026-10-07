// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_draft.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Emergency _$EmergencyFromJson(Map<String, dynamic> json) => _Emergency(
  same: json['same'] as bool? ?? true,
  firstName: json['firstName'] as String? ?? '',
  lastName: json['lastName'] as String? ?? '',
  relation: json['relation'] as String? ?? '',
  mobile: json['mobile'] as String? ?? '',
  cnic: json['cnic'] as String? ?? '',
  email: json['email'] as String? ?? '',
);

Map<String, dynamic> _$EmergencyToJson(_Emergency instance) =>
    <String, dynamic>{
      'same': instance.same,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'relation': instance.relation,
      'mobile': instance.mobile,
      'cnic': instance.cnic,
      'email': instance.email,
    };

_FormDraft _$FormDraftFromJson(Map<String, dynamic> json) => _FormDraft(
  level: $enumDecodeNullable(_$LevelEnumMap, json['level']) ?? Level.as_,
  firstName: json['firstName'] as String? ?? '',
  lastName: json['lastName'] as String? ?? '',
  dateOfBirth: json['dateOfBirth'] as String?,
  gender: json['gender'] as String? ?? '',
  cnic: json['cnic'] as String? ?? '',
  religion: json['religion'] as String? ?? '',
  mobile: json['mobile'] as String? ?? '',
  email: json['email'] as String? ?? '',
  dual: json['dual'] as bool? ?? false,
  otherNationality: json['otherNationality'] as String? ?? '',
  address: json['address'] as String? ?? '',
  country: json['country'] as String? ?? CountryOrder.defaultCountry,
  cityId: (json['cityId'] as num?)?.toInt(),
  cityOther: json['cityOther'] as String? ?? '',
  cityText: json['cityText'] as String? ?? '',
  guardians:
      (json['guardians'] as List<dynamic>?)
          ?.map((e) => Guardian.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Guardian>[Guardian(), Guardian()],
  parentB: json['parentB'] as bool? ?? false,
  emg: json['emg'] == null
      ? const Emergency()
      : Emergency.fromJson(json['emg'] as Map<String, dynamic>),
  sib: json['sib'] as bool? ?? false,
  siblings:
      (json['siblings'] as List<dynamic>?)
          ?.map((e) => Sibling.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Sibling>[Sibling()],
  isPrivateCandidate: json['isPrivateCandidate'] as bool? ?? false,
  schoolId: (json['schoolId'] as num?)?.toInt(),
  schoolOther: json['schoolOther'] as String? ?? '',
  schoolText: json['schoolText'] as String? ?? '',
  schoolCampus: json['schoolCampus'] as String? ?? '',
  studiedFrom: (json['studiedFrom'] as num?)?.toInt(),
  studiedUntil: (json['studiedUntil'] as num?)?.toInt(),
  qualification:
      $enumDecodeNullable(_$QualificationEnumMap, json['qualification']) ??
      Qualification.oLevel,
  qualificationOther: json['qualificationOther'] as String? ?? '',
  matricPercentage: json['matricPercentage'] as String? ?? '',
  results:
      (json['results'] as List<dynamic>?)
          ?.map((e) => ResultRow.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ResultRow>[],
  subjects:
      (json['subjects'] as List<dynamic>?)
          ?.map((e) => SubjectPick.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <SubjectPick>[],
  futureStudy: json['futureStudy'] as String? ?? '',
  hasReferee: json['hasReferee'] as bool? ?? false,
  referee: json['referee'] == null
      ? const Referee()
      : Referee.fromJson(json['referee'] as Map<String, dynamic>),
  activities:
      (json['activities'] as List<dynamic>?)
          ?.map((e) => ActivityRow.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ActivityRow>[],
  wantsSportsTrial: json['wantsSportsTrial'] as bool? ?? false,
  more: json['more'] as bool? ?? false,
  anythingElse: json['anythingElse'] as String? ?? '',
  statement: json['statement'] as String? ?? '',
);

Map<String, dynamic> _$FormDraftToJson(_FormDraft instance) =>
    <String, dynamic>{
      'level': _$LevelEnumMap[instance.level]!,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'cnic': instance.cnic,
      'religion': instance.religion,
      'mobile': instance.mobile,
      'email': instance.email,
      'dual': instance.dual,
      'otherNationality': instance.otherNationality,
      'address': instance.address,
      'country': instance.country,
      'cityId': instance.cityId,
      'cityOther': instance.cityOther,
      'cityText': instance.cityText,
      'guardians': instance.guardians.map((e) => e.toJson()).toList(),
      'parentB': instance.parentB,
      'emg': instance.emg.toJson(),
      'sib': instance.sib,
      'siblings': instance.siblings.map((e) => e.toJson()).toList(),
      'isPrivateCandidate': instance.isPrivateCandidate,
      'schoolId': instance.schoolId,
      'schoolOther': instance.schoolOther,
      'schoolText': instance.schoolText,
      'schoolCampus': instance.schoolCampus,
      'studiedFrom': instance.studiedFrom,
      'studiedUntil': instance.studiedUntil,
      'qualification': _$QualificationEnumMap[instance.qualification]!,
      'qualificationOther': instance.qualificationOther,
      'matricPercentage': instance.matricPercentage,
      'results': instance.results.map((e) => e.toJson()).toList(),
      'subjects': instance.subjects.map((e) => e.toJson()).toList(),
      'futureStudy': instance.futureStudy,
      'hasReferee': instance.hasReferee,
      'referee': instance.referee.toJson(),
      'activities': instance.activities.map((e) => e.toJson()).toList(),
      'wantsSportsTrial': instance.wantsSportsTrial,
      'more': instance.more,
      'anythingElse': instance.anythingElse,
      'statement': instance.statement,
    };

const _$LevelEnumMap = {Level.as_: 'AS', Level.a2: 'A2'};

const _$QualificationEnumMap = {
  Qualification.oLevel: 'o_level',
  Qualification.igcse: 'igcse',
  Qualification.matric: 'matric',
  Qualification.akuEb: 'aku_eb',
  Qualification.other: 'other',
};
