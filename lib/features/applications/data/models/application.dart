import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/applicant_profile.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application_summary.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/documents.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_parts.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/offer.dart';

part 'application.freezed.dart';
part 'application.g.dart';

/// The applicant's interview.
@freezed
abstract class Interview with _$Interview {
  /// Creates an interview.
  const factory Interview({
    required int id,
    @Default('') String state,
    @JsonKey(name: 'starts_at') String? startsAt,
    @JsonKey(name: 'ends_at') String? endsAt,
    @JsonKey(name: 'can_reschedule') @Default(false) bool canReschedule,
    int? interviewer,
    @JsonKey(name: 'interviewer_name') String? interviewerName,
    String? outcome,
    bool? locked,
  }) = _Interview;

  /// From JSON.
  factory Interview.fromJson(Map<String, dynamic> json) =>
      _$InterviewFromJson(json);
}

/// A sports trial booking.
@freezed
abstract class Trial with _$Trial {
  /// Creates a trial.
  const factory Trial({
    required int id,
    @Default(0) int sport,
    @JsonKey(name: 'sport_name') @Default('') String sportName,
    @Default('') String state,
    @JsonKey(name: 'starts_at') String? startsAt,
  }) = _Trial;

  /// From JSON.
  factory Trial.fromJson(Map<String, dynamic> json) => _$TrialFromJson(json);
}

/// The financial-aid request, when the office sent one.
@freezed
abstract class FinancialAid with _$FinancialAid {
  /// Creates the record.
  const factory FinancialAid({
    @JsonKey(name: 'sent_at') @Default('') String sentAt,
    @JsonKey(name: 'submitted_at') String? submittedAt,
    @Default(<String, dynamic>{}) Map<String, dynamic> answers,
  }) = _FinancialAid;

  /// From JSON.
  factory FinancialAid.fromJson(Map<String, dynamic> json) =>
      _$FinancialAidFromJson(json);
}

/// A history line visible to the applicant.
@freezed
abstract class HistoryEntry with _$HistoryEntry {
  /// Creates an entry.
  const factory HistoryEntry({
    @Default('') String at,
    @Default('') String action,
    @Default('') String note,
  }) = _HistoryEntry;

  /// From JSON.
  factory HistoryEntry.fromJson(Map<String, dynamic> json) =>
      _$HistoryEntryFromJson(json);
}

/// A full application (`GET me/applications/{id}/`).
@freezed
abstract class Application with _$Application {
  /// Creates an application.
  const factory Application({
    required int id,
    String? reference,
    @Default('') String cycle,
    String? round,
    @JsonKey(unknownEnumValue: Level.as_) @Default(Level.as_) Level level,
    @JsonKey(unknownEnumValue: AppStatus.unknown)
    @Default(AppStatus.draft)
    AppStatus status,
    @JsonKey(name: 'status_label') @Default('') String statusLabel,
    @Default(Tracker()) Tracker tracker,
    @JsonKey(name: 'form_step') @Default(1) int formStep,
    @JsonKey(name: 'submitted_at') String? submittedAt,
    @JsonKey(name: 'updated_at') @Default('') String updatedAt,
    @JsonKey(name: 'documents_cleared') @Default(false) bool documentsCleared,
    @JsonKey(name: 'interview_released') @Default(false) bool interviewReleased,
    @JsonKey(name: 'trial_released') @Default(false) bool trialReleased,
    @JsonKey(name: 'interview_rebook') @Default(false) bool interviewRebook,
    @Default(ApplicantProfile()) ApplicantProfile profile,
    @JsonKey(name: 'full_name') @Default('') String fullName,
    @JsonKey(name: 'city_name') @Default('') String cityName,
    @JsonKey(name: 'school_name') @Default('') String schoolName,
    @Default(<Guardian>[]) List<Guardian> guardians,
    @Default(<Sibling>[]) List<Sibling> siblings,
    @Default(<ResultRow>[]) List<ResultRow> results,
    @Default(<SubjectPick>[]) List<SubjectPick> subjects,
    @Default(<ActivityRow>[]) List<ActivityRow> activities,
    @Default(<DocSlot>[]) List<DocSlot> documents,
    Interview? interview,
    @Default(<Trial>[]) List<Trial> trials,
    Offer? offer,
    @JsonKey(name: 'financial_aid') FinancialAid? financialAid,
    @Default(<HistoryEntry>[]) List<HistoryEntry> history,
  }) = _Application;
  const Application._();

  /// From JSON (staff-only keys are ignored).
  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);

  /// Editable by the applicant.
  bool get isDraft => status.isDraft;

  /// Parsed `updated_at`, or `null` when absent.
  DateTime? get updatedAtTime => DateTime.tryParse(updatedAt);
}
