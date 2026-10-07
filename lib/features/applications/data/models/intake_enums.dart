import 'package:freezed_annotation/freezed_annotation.dart';

/// Where an application is (`intake.models.Status`). [unknown] absorbs any
/// status a newer backend adds so decoding never fails.
@JsonEnum()
enum AppStatus {
  /// Being filled in.
  draft,

  /// Sent.
  received,

  /// Office reviewing documents.
  @JsonValue('under_review')
  underReview,

  /// Interview booked.
  @JsonValue('interview_scheduled')
  interviewScheduled,

  /// Interview done.
  interviewed,

  /// Sports trial pending.
  @JsonValue('sports_trial')
  sportsTrial,

  /// Office preparing an offer.
  @JsonValue('offer_in_progress')
  offerInProgress,

  /// Offer sent to the family.
  offered,

  /// Payments being verified.
  @JsonValue('financial_verification')
  financialVerification,

  /// Paid up; enrolment next.
  @JsonValue('ready_to_enroll')
  readyToEnroll,

  /// Enrolled.
  enrolled,

  /// Ended: not offered.
  @JsonValue('not_offered')
  notOffered,

  /// Ended: closed by the office.
  closed,

  /// Ended: withdrawn by the family.
  withdrawn,

  /// Not recognised by this app version.
  unknown;

  /// Still editable by the applicant.
  bool get isDraft => this == AppStatus.draft;

  /// One of the ended statuses.
  bool get isEnded => this == notOffered || this == closed || this == withdrawn;

  /// Can be withdrawn by the family (`intake.services.applications.withdraw`).
  bool get canWithdraw =>
      !isEnded && this != enrolled && this != readyToEnroll && this != unknown;
}

/// Which year the applicant joins.
@JsonEnum()
enum Level {
  /// First year.
  @JsonValue('AS')
  as_,

  /// Joining the second year.
  @JsonValue('A2')
  a2;

  /// The wire value.
  String get wire => this == Level.as_ ? 'AS' : 'A2';
}

/// Current qualification.
@JsonEnum()
enum Qualification {
  /// Cambridge O-Level.
  @JsonValue('o_level')
  oLevel,

  /// IGCSE.
  igcse,

  /// Matric.
  matric,

  /// AKU-EB.
  @JsonValue('aku_eb')
  akuEb,

  /// Something else (named in `qualification_other`).
  other;

  /// The wire value.
  String get wire => switch (this) {
    Qualification.oLevel => 'o_level',
    Qualification.igcse => 'igcse',
    Qualification.matric => 'matric',
    Qualification.akuEb => 'aku_eb',
    Qualification.other => 'other',
  };
}

/// When a document type is needed.
@JsonEnum()
enum DocStage {
  /// Must be in before the interview can be booked.
  @JsonValue('before_interview')
  beforeInterview,

  /// After results are announced.
  @JsonValue('after_results')
  afterResults,

  /// Nice to have.
  optional,

  /// Needed at enrolment.
  @JsonValue('at_enrolment')
  atEnrolment,

  /// Unrecognised.
  unknown,
}

/// A document slot's state as the backend reports it.
@JsonEnum()
enum DocSlotState {
  /// Uploaded, not yet reviewed.
  pending,

  /// Approved by the office.
  approved,

  /// Rejected; a replacement is requested.
  rejected,

  /// Nothing uploaded.
  missing,

  /// Deferred by the applicant.
  later,

  /// Unrecognised.
  unknown,
}

/// One uploaded version's review state.
@JsonEnum()
enum VersionState {
  /// Not reviewed.
  pending,

  /// Approved.
  approved,

  /// Rejected.
  rejected,

  /// Unrecognised.
  unknown,
}
