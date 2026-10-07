// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TeacherOption _$TeacherOptionFromJson(Map<String, dynamic> json) =>
    _TeacherOption(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$TeacherOptionToJson(_TeacherOption instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_SubjectOption _$SubjectOptionFromJson(Map<String, dynamic> json) =>
    _SubjectOption(
      course: (json['course'] as num).toInt(),
      code: json['code'] as String? ?? '',
      name: json['name'] as String? ?? '',
      teachers:
          (json['teachers'] as List<dynamic>?)
              ?.map((e) => TeacherOption.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <TeacherOption>[],
    );

Map<String, dynamic> _$SubjectOptionToJson(_SubjectOption instance) =>
    <String, dynamic>{
      'course': instance.course,
      'code': instance.code,
      'name': instance.name,
      'teachers': instance.teachers.map((e) => e.toJson()).toList(),
    };

_SportOption _$SportOptionFromJson(Map<String, dynamic> json) => _SportOption(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String? ?? '',
  hasTrial: json['has_trial'] as bool? ?? false,
);

Map<String, dynamic> _$SportOptionToJson(_SportOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'has_trial': instance.hasTrial,
    };

_FormOptions _$FormOptionsFromJson(Map<String, dynamic> json) => _FormOptions(
  subjects:
      (json['subjects'] as List<dynamic>?)
          ?.map((e) => SubjectOption.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <SubjectOption>[],
  sports:
      (json['sports'] as List<dynamic>?)
          ?.map((e) => SportOption.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <SportOption>[],
  documentTypes:
      (json['document_types'] as List<dynamic>?)
          ?.map((e) => DocumentType.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <DocumentType>[],
);

Map<String, dynamic> _$FormOptionsToJson(_FormOptions instance) =>
    <String, dynamic>{
      'subjects': instance.subjects.map((e) => e.toJson()).toList(),
      'sports': instance.sports.map((e) => e.toJson()).toList(),
      'document_types': instance.documentTypes.map((e) => e.toJson()).toList(),
    };

_StepResult _$StepResultFromJson(Map<String, dynamic> json) => _StepResult(
  application: Application.fromJson(
    json['application'] as Map<String, dynamic>,
  ),
  missing:
      (json['missing'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
);

Map<String, dynamic> _$StepResultToJson(_StepResult instance) =>
    <String, dynamic>{
      'application': instance.application.toJson(),
      'missing': instance.missing,
    };

_SchoolHit _$SchoolHitFromJson(Map<String, dynamic> json) => _SchoolHit(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String? ?? '',
  city: json['city'] as String? ?? '',
);

Map<String, dynamic> _$SchoolHitToJson(_SchoolHit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
    };

_Country _$CountryFromJson(Map<String, dynamic> json) =>
    _Country(code: json['code'] as String, name: json['name'] as String? ?? '');

Map<String, dynamic> _$CountryToJson(_Country instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
};

_City _$CityFromJson(Map<String, dynamic> json) =>
    _City(id: (json['id'] as num).toInt(), name: json['name'] as String? ?? '');

Map<String, dynamic> _$CityToJson(_City instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};

_TimeOption _$TimeOptionFromJson(Map<String, dynamic> json) => _TimeOption(
  startsAt: json['starts_at'] as String,
  endsAt: json['ends_at'] as String? ?? '',
  places: (json['places'] as num?)?.toInt() ?? 0,
  booked: (json['booked'] as num?)?.toInt() ?? 0,
  total: (json['total'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$TimeOptionToJson(_TimeOption instance) =>
    <String, dynamic>{
      'starts_at': instance.startsAt,
      'ends_at': instance.endsAt,
      'places': instance.places,
      'booked': instance.booked,
      'total': instance.total,
    };

_TrialOption _$TrialOptionFromJson(Map<String, dynamic> json) => _TrialOption(
  id: (json['id'] as num).toInt(),
  startsAt: json['starts_at'] as String? ?? '',
  endsAt: json['ends_at'] as String? ?? '',
  placesLeft: (json['places_left'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$TrialOptionToJson(_TrialOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'starts_at': instance.startsAt,
      'ends_at': instance.endsAt,
      'places_left': instance.placesLeft,
    };
