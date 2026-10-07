// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_parts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Guardian _$GuardianFromJson(Map<String, dynamic> json) => _Guardian(
  id: (json['id'] as num?)?.toInt(),
  relation: json['relation'] as String? ?? '',
  firstName: json['first_name'] as String? ?? '',
  lastName: json['last_name'] as String? ?? '',
  cnic: json['cnic'] as String? ?? '',
  mobile: json['mobile'] as String? ?? '',
  email: json['email'] as String? ?? '',
  maritalStatus: json['marital_status'] as String? ?? '',
  work: json['work'] as String? ?? '',
  organisation: json['organisation'] as String? ?? '',
  designation: json['designation'] as String? ?? '',
  phoneVerified: json['phone_verified'] as bool? ?? false,
  emailVerified: json['email_verified'] as bool? ?? false,
);

Map<String, dynamic> _$GuardianToJson(_Guardian instance) => <String, dynamic>{
  'id': instance.id,
  'relation': instance.relation,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'cnic': instance.cnic,
  'mobile': instance.mobile,
  'email': instance.email,
  'marital_status': instance.maritalStatus,
  'work': instance.work,
  'organisation': instance.organisation,
  'designation': instance.designation,
  'phone_verified': instance.phoneVerified,
  'email_verified': instance.emailVerified,
};

_Sibling _$SiblingFromJson(Map<String, dynamic> json) => _Sibling(
  name: json['name'] as String? ?? '',
  yearOrClass: json['year_or_class'] as String? ?? '',
);

Map<String, dynamic> _$SiblingToJson(_Sibling instance) => <String, dynamic>{
  'name': instance.name,
  'year_or_class': instance.yearOrClass,
};

_ResultRow _$ResultRowFromJson(Map<String, dynamic> json) => _ResultRow(
  subject: json['subject'] as String,
  id: (json['id'] as num?)?.toInt(),
  sittingMonth: (json['sitting_month'] as num?)?.toInt(),
  sittingYear: (json['sitting_year'] as num?)?.toInt(),
  resultOut: json['result_out'] as bool? ?? false,
  grade: json['grade'] as String? ?? '',
  verified: json['verified'] as bool? ?? false,
);

Map<String, dynamic> _$ResultRowToJson(_ResultRow instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'id': instance.id,
      'sitting_month': instance.sittingMonth,
      'sitting_year': instance.sittingYear,
      'result_out': instance.resultOut,
      'grade': instance.grade,
      'verified': instance.verified,
    };

_SubjectPick _$SubjectPickFromJson(Map<String, dynamic> json) => _SubjectPick(
  course: (json['course'] as num).toInt(),
  teacher: (json['teacher'] as num?)?.toInt() ?? 0,
  courseName: json['course_name'] as String?,
  teacherName: json['teacher_name'] as String?,
);

Map<String, dynamic> _$SubjectPickToJson(_SubjectPick instance) =>
    <String, dynamic>{
      'course': instance.course,
      'teacher': instance.teacher,
      'course_name': instance.courseName,
      'teacher_name': instance.teacherName,
    };

_ActivityRow _$ActivityRowFromJson(Map<String, dynamic> json) => _ActivityRow(
  kind: json['kind'] as String,
  name: json['name'] as String,
  sportId: (json['sport_id'] as num?)?.toInt(),
  level: json['level'] as String? ?? '',
  details: json['details'] as String? ?? '',
  wantsTrial: json['wants_trial'] as bool? ?? false,
);

Map<String, dynamic> _$ActivityRowToJson(_ActivityRow instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'name': instance.name,
      'sport_id': instance.sportId,
      'level': instance.level,
      'details': instance.details,
      'wants_trial': instance.wantsTrial,
    };

_Referee _$RefereeFromJson(Map<String, dynamic> json) => _Referee(
  name: json['name'] as String? ?? '',
  email: json['email'] as String? ?? '',
  organisation: json['organisation'] as String? ?? '',
  designation: json['designation'] as String? ?? '',
);

Map<String, dynamic> _$RefereeToJson(_Referee instance) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'organisation': instance.organisation,
  'designation': instance.designation,
};
