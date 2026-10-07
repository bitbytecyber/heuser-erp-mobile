import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer.freezed.dart';
part 'offer.g.dart';

/// One fee line of an offer's calculation.
@freezed
abstract class OfferLine with _$OfferLine {
  /// Creates a line.
  const factory OfferLine({
    @Default('') String component,
    @Default('') String label,
    @Default('0') String amount,
    @Default('one_time') String recurrence,
    @JsonKey(name: 'normal_percent') @Default('0') String normalPercent,
    @JsonKey(name: 'after_normal') @Default('0') String afterNormal,
    @JsonKey(name: 'special_percent') @Default('0') String specialPercent,
    @Default('0') String net,
    @Default('0') String saving,
  }) = _OfferLine;

  /// From JSON.
  factory OfferLine.fromJson(Map<String, dynamic> json) =>
      _$OfferLineFromJson(json);
}

/// The totals of an offer.
@freezed
abstract class OfferCalculation with _$OfferCalculation {
  /// Creates a calculation.
  const factory OfferCalculation({
    @Default(<OfferLine>[]) List<OfferLine> lines,
    @JsonKey(name: 'due_now') @Default('0') String dueNow,
    @Default('0') String monthly,
    @JsonKey(name: 'tuition_months') int? tuitionMonths,
    @JsonKey(name: 'tuition_due') String? tuitionDue,
    @JsonKey(name: 'tuition_period') String? tuitionPeriod,
  }) = _OfferCalculation;

  /// From JSON.
  factory OfferCalculation.fromJson(Map<String, dynamic> json) =>
      _$OfferCalculationFromJson(json);
}

/// A subject on the offer.
@freezed
abstract class OfferSubject with _$OfferSubject {
  /// Creates a subject.
  const factory OfferSubject({
    required int course,
    @JsonKey(name: 'course_name') @Default('') String courseName,
    @Default(0) int teacher,
    @JsonKey(name: 'teacher_name') @Default('') String teacherName,
  }) = _OfferSubject;

  /// From JSON.
  factory OfferSubject.fromJson(Map<String, dynamic> json) =>
      _$OfferSubjectFromJson(json);
}

/// A scholarship on the offer.
@freezed
abstract class OfferScholarship with _$OfferScholarship {
  /// Creates a scholarship.
  const factory OfferScholarship({
    @Default(0) int type,
    @Default('') String name,
    @Default('0') String percent,
    @Default('') String reason,
    @JsonKey(name: 'applied_on_remainder')
    @Default(false)
    bool appliedOnRemainder,
  }) = _OfferScholarship;

  /// From JSON.
  factory OfferScholarship.fromJson(Map<String, dynamic> json) =>
      _$OfferScholarshipFromJson(json);
}

/// Proof of payment sent for an instalment.
@freezed
abstract class PaymentEvidence with _$PaymentEvidence {
  /// Creates evidence.
  const factory PaymentEvidence({
    required int id,
    @Default('pending') String state,
    @Default('') String reason,
    @Default('') String method,
    @JsonKey(name: 'submitted_at') @Default('') String submittedAt,
    String? amount,
    @JsonKey(name: 'family_told') bool? familyTold,
    bool? replaceable,
  }) = _PaymentEvidence;

  /// From JSON.
  factory PaymentEvidence.fromJson(Map<String, dynamic> json) =>
      _$PaymentEvidenceFromJson(json);
}

/// One instalment of the offer.
@freezed
abstract class Instalment with _$Instalment {
  /// Creates an instalment.
  const factory Instalment({
    required int id,
    @Default(0) int sequence,
    @Default('admission') String kind,
    @Default('0') String amount,
    @JsonKey(name: 'due_date') String? dueDate,
    @JsonKey(name: 'unlocks_enrollment') @Default(false) bool unlocksEnrollment,
    @Default(false) bool paid,
    @JsonKey(name: 'paid_amount') @Default('0') String paidAmount,
    @Default('0') String remaining,
    @JsonKey(name: 'short_accepted') @Default(false) bool shortAccepted,
    @Default(<PaymentEvidence>[]) List<PaymentEvidence> evidence,
  }) = _Instalment;

  /// From JSON.
  factory Instalment.fromJson(Map<String, dynamic> json) =>
      _$InstalmentFromJson(json);
}

/// The offer as the family sees it.
@freezed
abstract class Offer with _$Offer {
  /// Creates an offer.
  const factory Offer({
    required int id,
    @Default(1) int version,
    @Default('') String state,
    @JsonKey(name: 'state_label') @Default('') String stateLabel,
    @JsonKey(name: 'is_conditional') @Default(false) bool isConditional,
    @Default('') String conditions,
    @Default(<OfferSubject>[]) List<OfferSubject> subjects,
    @Default(OfferCalculation()) OfferCalculation calculation,
    @JsonKey(name: 'tuition_months') int? tuitionMonths,
    @JsonKey(name: 'tuition_amount') String? tuitionAmount,
    @JsonKey(name: 'tuition_from') String? tuitionFrom,
    @JsonKey(name: 'tuition_period') String? tuitionPeriod,
    @Default(<OfferScholarship>[]) List<OfferScholarship> scholarships,
    String? deadline,
    @JsonKey(name: 'extended_once') @Default(false) bool extendedOnce,
    @JsonKey(name: 'sent_at') String? sentAt,
    @JsonKey(name: 'has_terms') @Default(false) bool hasTerms,
    @Default(<Instalment>[]) List<Instalment> instalments,
  }) = _Offer;

  /// From JSON.
  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);
}
