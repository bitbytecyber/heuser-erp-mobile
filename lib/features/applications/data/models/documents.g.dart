// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documents.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DocVersion _$DocVersionFromJson(Map<String, dynamic> json) => _DocVersion(
  id: (json['id'] as num).toInt(),
  file: json['file'] as String?,
  state:
      $enumDecodeNullable(
        _$VersionStateEnumMap,
        json['state'],
        unknownValue: VersionState.unknown,
      ) ??
      VersionState.pending,
  reason: json['reason'] as String? ?? '',
  uploadedAt: json['uploaded_at'] as String? ?? '',
  reviewedBy: json['reviewed_by'] as String?,
  reviewedAt: json['reviewed_at'] as String?,
);

Map<String, dynamic> _$DocVersionToJson(_DocVersion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file': instance.file,
      'state': _$VersionStateEnumMap[instance.state]!,
      'reason': instance.reason,
      'uploaded_at': instance.uploadedAt,
      'reviewed_by': instance.reviewedBy,
      'reviewed_at': instance.reviewedAt,
    };

const _$VersionStateEnumMap = {
  VersionState.pending: 'pending',
  VersionState.approved: 'approved',
  VersionState.rejected: 'rejected',
  VersionState.unknown: 'unknown',
};

_DocSlot _$DocSlotFromJson(Map<String, dynamic> json) => _DocSlot(
  id: (json['id'] as num).toInt(),
  docType: (json['doc_type'] as num).toInt(),
  code: json['code'] as String? ?? '',
  name: json['name'] as String? ?? '',
  hint: json['hint'] as String? ?? '',
  stage:
      $enumDecodeNullable(
        _$DocStageEnumMap,
        json['stage'],
        unknownValue: DocStage.unknown,
      ) ??
      DocStage.optional,
  result: (json['result'] as num?)?.toInt(),
  activity: json['activity'] as String? ?? '',
  later: json['later'] as bool? ?? false,
  state:
      $enumDecodeNullable(
        _$DocSlotStateEnumMap,
        json['state'],
        unknownValue: DocSlotState.unknown,
      ) ??
      DocSlotState.missing,
  reason: json['reason'] as String? ?? '',
  versions:
      (json['versions'] as List<dynamic>?)
          ?.map((e) => DocVersion.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <DocVersion>[],
);

Map<String, dynamic> _$DocSlotToJson(_DocSlot instance) => <String, dynamic>{
  'id': instance.id,
  'doc_type': instance.docType,
  'code': instance.code,
  'name': instance.name,
  'hint': instance.hint,
  'stage': _$DocStageEnumMap[instance.stage]!,
  'result': instance.result,
  'activity': instance.activity,
  'later': instance.later,
  'state': _$DocSlotStateEnumMap[instance.state]!,
  'reason': instance.reason,
  'versions': instance.versions.map((e) => e.toJson()).toList(),
};

const _$DocStageEnumMap = {
  DocStage.beforeInterview: 'before_interview',
  DocStage.afterResults: 'after_results',
  DocStage.optional: 'optional',
  DocStage.atEnrolment: 'at_enrolment',
  DocStage.unknown: 'unknown',
};

const _$DocSlotStateEnumMap = {
  DocSlotState.pending: 'pending',
  DocSlotState.approved: 'approved',
  DocSlotState.rejected: 'rejected',
  DocSlotState.missing: 'missing',
  DocSlotState.later: 'later',
  DocSlotState.unknown: 'unknown',
};

_DocumentType _$DocumentTypeFromJson(Map<String, dynamic> json) =>
    _DocumentType(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String? ?? '',
      hint: json['hint'] as String? ?? '',
      stage:
          $enumDecodeNullable(
            _$DocStageEnumMap,
            json['stage'],
            unknownValue: DocStage.unknown,
          ) ??
          DocStage.optional,
      perSubject: json['per_subject'] as bool? ?? false,
      blocksInterview: json['blocks_interview'] as bool?,
    );

Map<String, dynamic> _$DocumentTypeToJson(_DocumentType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'hint': instance.hint,
      'stage': _$DocStageEnumMap[instance.stage]!,
      'per_subject': instance.perSubject,
      'blocks_interview': instance.blocksInterview,
    };
