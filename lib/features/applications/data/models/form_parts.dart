import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_parts.freezed.dart';
part 'form_parts.g.dart';

/// A parent or guardian (`intake.models.Guardian`).
@freezed
abstract class Guardian with _$Guardian {
  /// Creates a guardian.
  const factory Guardian({
    int? id,
    @Default('') String relation,
    @JsonKey(name: 'first_name') @Default('') String firstName,
    @JsonKey(name: 'last_name') @Default('') String lastName,
    @Default('') String cnic,
    @Default('') String mobile,
    @Default('') String email,
    @JsonKey(name: 'marital_status') @Default('') String maritalStatus,
    @Default('') String work,
    @Default('') String organisation,
    @Default('') String designation,
    @JsonKey(name: 'phone_verified') @Default(false) bool phoneVerified,
    @JsonKey(name: 'email_verified') @Default(false) bool emailVerified,
  }) = _Guardian;
  const Guardian._();

  /// From JSON (nulls become empty strings).
  factory Guardian.fromJson(Map<String, dynamic> json) =>
      _$GuardianFromJson(_nullsToEmpty(json));

  /// Anything typed at all.
  bool get isFilled =>
      relation.isNotEmpty ||
      firstName.isNotEmpty ||
      lastName.isNotEmpty ||
      cnic.isNotEmpty ||
      mobile.isNotEmpty ||
      email.isNotEmpty;

  /// Employed or running a business: organisation and designation apply.
  bool get isEmployed => work == 'Employed' || work == 'Self-employed';
}

/// A sibling at the college.
@freezed
abstract class Sibling with _$Sibling {
  /// Creates a sibling.
  const factory Sibling({
    @Default('') String name,
    @JsonKey(name: 'year_or_class') @Default('') String yearOrClass,
  }) = _Sibling;

  /// From JSON.
  factory Sibling.fromJson(Map<String, dynamic> json) =>
      _$SiblingFromJson(_nullsToEmpty(json));
}

/// One O-Level / Matric subject result (out, or still awaited).
@freezed
abstract class ResultRow with _$ResultRow {
  /// Creates a row.
  const factory ResultRow({
    required String subject,
    int? id,
    @JsonKey(name: 'sitting_month') int? sittingMonth,
    @JsonKey(name: 'sitting_year') int? sittingYear,
    @JsonKey(name: 'result_out') @Default(false) bool resultOut,
    @Default('') String grade,
    @Default(false) bool verified,
  }) = _ResultRow;

  /// From JSON.
  factory ResultRow.fromJson(Map<String, dynamic> json) =>
      _$ResultRowFromJson(_nullsToEmpty(json));
}

/// An A-Level subject choice with the preferred teacher (0 = not chosen).
@freezed
abstract class SubjectPick with _$SubjectPick {
  /// Creates a pick.
  const factory SubjectPick({
    required int course,
    @Default(0) int teacher,
    @JsonKey(name: 'course_name') String? courseName,
    @JsonKey(name: 'teacher_name') String? teacherName,
  }) = _SubjectPick;

  /// From JSON.
  factory SubjectPick.fromJson(Map<String, dynamic> json) =>
      _$SubjectPickFromJson(json);
}

/// A sport or other activity.
@freezed
abstract class ActivityRow with _$ActivityRow {
  /// Creates a row.
  const factory ActivityRow({
    /// `sport` or `activity`.
    required String kind,
    required String name,
    @JsonKey(name: 'sport_id') int? sportId,
    @Default('') String level,
    @Default('') String details,
    @JsonKey(name: 'wants_trial') @Default(false) bool wantsTrial,
  }) = _ActivityRow;
  const ActivityRow._();

  /// From JSON.
  factory ActivityRow.fromJson(Map<String, dynamic> json) =>
      _$ActivityRowFromJson(_nullsToEmpty(json));

  /// A sport (catalogue or custom).
  bool get isSport => kind == 'sport';

  /// The key a certificate is filed under (the backend's `activity_key`).
  String get activityKey =>
      sportId != null ? 'sport:$sportId' : '$kind:${name.trim().toLowerCase()}';
}

/// A teacher who can recommend the applicant.
@freezed
abstract class Referee with _$Referee {
  /// Creates a referee.
  const factory Referee({
    @Default('') String name,
    @Default('') String email,
    @Default('') String organisation,
    @Default('') String designation,
  }) = _Referee;
  const Referee._();

  /// From JSON.
  factory Referee.fromJson(Map<String, dynamic> json) =>
      _$RefereeFromJson(_nullsToEmpty(json));

  /// Something is filled in.
  bool get isFilled => name.trim().isNotEmpty || email.trim().isNotEmpty;
}

/// The API serialises absent text as `null`; the form wants `''`.
Map<String, dynamic> _nullsToEmpty(Map<String, dynamic> json) => {
  for (final e in json.entries)
    e.key: e.value == null && _textKeys.contains(e.key) ? '' : e.value,
};

const _textKeys = {
  'relation',
  'first_name',
  'last_name',
  'cnic',
  'mobile',
  'email',
  'marital_status',
  'work',
  'organisation',
  'designation',
  'name',
  'year_or_class',
  'grade',
  'level',
  'details',
  'subject',
};
