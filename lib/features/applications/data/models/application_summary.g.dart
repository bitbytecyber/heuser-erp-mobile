// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrackerStage _$TrackerStageFromJson(Map<String, dynamic> json) =>
    _TrackerStage(
      key: json['key'] as String,
      label: json['label'] as String? ?? '',
    );

Map<String, dynamic> _$TrackerStageToJson(_TrackerStage instance) =>
    <String, dynamic>{'key': instance.key, 'label': instance.label};

_Tracker _$TrackerFromJson(Map<String, dynamic> json) => _Tracker(
  stages:
      (json['stages'] as List<dynamic>?)
          ?.map((e) => TrackerStage.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <TrackerStage>[],
  current: json['current'] as String?,
  ended: json['ended'] as String?,
);

Map<String, dynamic> _$TrackerToJson(_Tracker instance) => <String, dynamic>{
  'stages': instance.stages.map((e) => e.toJson()).toList(),
  'current': instance.current,
  'ended': instance.ended,
};

_AppSummary _$AppSummaryFromJson(Map<String, dynamic> json) => _AppSummary(
  id: (json['id'] as num).toInt(),
  reference: json['reference'] as String?,
  fullName: json['full_name'] as String? ?? '',
  level:
      $enumDecodeNullable(
        _$LevelEnumMap,
        json['level'],
        unknownValue: Level.as_,
      ) ??
      Level.as_,
  status:
      $enumDecodeNullable(
        _$AppStatusEnumMap,
        json['status'],
        unknownValue: AppStatus.unknown,
      ) ??
      AppStatus.draft,
  statusLabel: json['status_label'] as String? ?? '',
  formStep: (json['form_step'] as num?)?.toInt() ?? 1,
  updatedAt: json['updated_at'] as String? ?? '',
  tracker: json['tracker'] == null
      ? const Tracker()
      : Tracker.fromJson(json['tracker'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AppSummaryToJson(_AppSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reference': instance.reference,
      'full_name': instance.fullName,
      'level': _$LevelEnumMap[instance.level]!,
      'status': _$AppStatusEnumMap[instance.status]!,
      'status_label': instance.statusLabel,
      'form_step': instance.formStep,
      'updated_at': instance.updatedAt,
      'tracker': instance.tracker.toJson(),
    };

const _$LevelEnumMap = {Level.as_: 'AS', Level.a2: 'A2'};

const _$AppStatusEnumMap = {
  AppStatus.draft: 'draft',
  AppStatus.received: 'received',
  AppStatus.underReview: 'under_review',
  AppStatus.interviewScheduled: 'interview_scheduled',
  AppStatus.interviewed: 'interviewed',
  AppStatus.sportsTrial: 'sports_trial',
  AppStatus.offerInProgress: 'offer_in_progress',
  AppStatus.offered: 'offered',
  AppStatus.financialVerification: 'financial_verification',
  AppStatus.readyToEnroll: 'ready_to_enroll',
  AppStatus.enrolled: 'enrolled',
  AppStatus.notOffered: 'not_offered',
  AppStatus.closed: 'closed',
  AppStatus.withdrawn: 'withdrawn',
  AppStatus.unknown: 'unknown',
};
