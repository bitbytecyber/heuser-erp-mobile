// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Interview _$InterviewFromJson(Map<String, dynamic> json) => _Interview(
  id: (json['id'] as num).toInt(),
  state: json['state'] as String? ?? '',
  startsAt: json['starts_at'] as String?,
  endsAt: json['ends_at'] as String?,
  canReschedule: json['can_reschedule'] as bool? ?? false,
  interviewer: (json['interviewer'] as num?)?.toInt(),
  interviewerName: json['interviewer_name'] as String?,
  outcome: json['outcome'] as String?,
  locked: json['locked'] as bool?,
);

Map<String, dynamic> _$InterviewToJson(_Interview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state': instance.state,
      'starts_at': instance.startsAt,
      'ends_at': instance.endsAt,
      'can_reschedule': instance.canReschedule,
      'interviewer': instance.interviewer,
      'interviewer_name': instance.interviewerName,
      'outcome': instance.outcome,
      'locked': instance.locked,
    };

_Trial _$TrialFromJson(Map<String, dynamic> json) => _Trial(
  id: (json['id'] as num).toInt(),
  sport: (json['sport'] as num?)?.toInt() ?? 0,
  sportName: json['sport_name'] as String? ?? '',
  state: json['state'] as String? ?? '',
  startsAt: json['starts_at'] as String?,
);

Map<String, dynamic> _$TrialToJson(_Trial instance) => <String, dynamic>{
  'id': instance.id,
  'sport': instance.sport,
  'sport_name': instance.sportName,
  'state': instance.state,
  'starts_at': instance.startsAt,
};

_FinancialAid _$FinancialAidFromJson(Map<String, dynamic> json) =>
    _FinancialAid(
      sentAt: json['sent_at'] as String? ?? '',
      submittedAt: json['submitted_at'] as String?,
      answers:
          json['answers'] as Map<String, dynamic>? ?? const <String, dynamic>{},
    );

Map<String, dynamic> _$FinancialAidToJson(_FinancialAid instance) =>
    <String, dynamic>{
      'sent_at': instance.sentAt,
      'submitted_at': instance.submittedAt,
      'answers': instance.answers,
    };

_HistoryEntry _$HistoryEntryFromJson(Map<String, dynamic> json) =>
    _HistoryEntry(
      at: json['at'] as String? ?? '',
      action: json['action'] as String? ?? '',
      note: json['note'] as String? ?? '',
    );

Map<String, dynamic> _$HistoryEntryToJson(_HistoryEntry instance) =>
    <String, dynamic>{
      'at': instance.at,
      'action': instance.action,
      'note': instance.note,
    };

_Application _$ApplicationFromJson(Map<String, dynamic> json) => _Application(
  id: (json['id'] as num).toInt(),
  reference: json['reference'] as String?,
  cycle: json['cycle'] as String? ?? '',
  round: json['round'] as String?,
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
  tracker: json['tracker'] == null
      ? const Tracker()
      : Tracker.fromJson(json['tracker'] as Map<String, dynamic>),
  formStep: (json['form_step'] as num?)?.toInt() ?? 1,
  submittedAt: json['submitted_at'] as String?,
  updatedAt: json['updated_at'] as String? ?? '',
  documentsCleared: json['documents_cleared'] as bool? ?? false,
  interviewReleased: json['interview_released'] as bool? ?? false,
  trialReleased: json['trial_released'] as bool? ?? false,
  interviewRebook: json['interview_rebook'] as bool? ?? false,
  profile: json['profile'] == null
      ? const ApplicantProfile()
      : ApplicantProfile.fromJson(json['profile'] as Map<String, dynamic>),
  fullName: json['full_name'] as String? ?? '',
  cityName: json['city_name'] as String? ?? '',
  schoolName: json['school_name'] as String? ?? '',
  guardians:
      (json['guardians'] as List<dynamic>?)
          ?.map((e) => Guardian.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Guardian>[],
  siblings:
      (json['siblings'] as List<dynamic>?)
          ?.map((e) => Sibling.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Sibling>[],
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
  activities:
      (json['activities'] as List<dynamic>?)
          ?.map((e) => ActivityRow.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ActivityRow>[],
  documents:
      (json['documents'] as List<dynamic>?)
          ?.map((e) => DocSlot.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <DocSlot>[],
  interview: json['interview'] == null
      ? null
      : Interview.fromJson(json['interview'] as Map<String, dynamic>),
  trials:
      (json['trials'] as List<dynamic>?)
          ?.map((e) => Trial.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Trial>[],
  offer: json['offer'] == null
      ? null
      : Offer.fromJson(json['offer'] as Map<String, dynamic>),
  financialAid: json['financial_aid'] == null
      ? null
      : FinancialAid.fromJson(json['financial_aid'] as Map<String, dynamic>),
  history:
      (json['history'] as List<dynamic>?)
          ?.map((e) => HistoryEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <HistoryEntry>[],
);

Map<String, dynamic> _$ApplicationToJson(_Application instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reference': instance.reference,
      'cycle': instance.cycle,
      'round': instance.round,
      'level': _$LevelEnumMap[instance.level]!,
      'status': _$AppStatusEnumMap[instance.status]!,
      'status_label': instance.statusLabel,
      'tracker': instance.tracker.toJson(),
      'form_step': instance.formStep,
      'submitted_at': instance.submittedAt,
      'updated_at': instance.updatedAt,
      'documents_cleared': instance.documentsCleared,
      'interview_released': instance.interviewReleased,
      'trial_released': instance.trialReleased,
      'interview_rebook': instance.interviewRebook,
      'profile': instance.profile.toJson(),
      'full_name': instance.fullName,
      'city_name': instance.cityName,
      'school_name': instance.schoolName,
      'guardians': instance.guardians.map((e) => e.toJson()).toList(),
      'siblings': instance.siblings.map((e) => e.toJson()).toList(),
      'results': instance.results.map((e) => e.toJson()).toList(),
      'subjects': instance.subjects.map((e) => e.toJson()).toList(),
      'activities': instance.activities.map((e) => e.toJson()).toList(),
      'documents': instance.documents.map((e) => e.toJson()).toList(),
      'interview': instance.interview?.toJson(),
      'trials': instance.trials.map((e) => e.toJson()).toList(),
      'offer': instance.offer?.toJson(),
      'financial_aid': instance.financialAid?.toJson(),
      'history': instance.history.map((e) => e.toJson()).toList(),
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
