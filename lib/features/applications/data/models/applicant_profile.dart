import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_parts.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';

part 'applicant_profile.freezed.dart';
part 'applicant_profile.g.dart';

/// `Application.profile`: the step 1–3 scalar fields.
@freezed
abstract class ApplicantProfile with _$ApplicantProfile {
  /// Creates a profile.
  const factory ApplicantProfile({
    @JsonKey(name: 'first_name') @Default('') String firstName,
    @JsonKey(name: 'last_name') @Default('') String lastName,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    @Default('') String gender,
    @Default('') String cnic,
    @Default('') String religion,
    @Default('') String mobile,
    @Default('') String email,
    @JsonKey(name: 'other_nationality') @Default('') String otherNationality,
    @Default('') String address,
    @Default('') String country,
    @JsonKey(name: 'city_id') int? cityId,
    @JsonKey(name: 'city_other') @Default('') String cityOther,
    @JsonKey(name: 'emergency_contact', fromJson: _mapFromJson)
    @Default(<String, dynamic>{})
    Map<String, dynamic> emergencyContact,
    @JsonKey(name: 'is_private_candidate')
    @Default(false)
    bool isPrivateCandidate,
    @JsonKey(name: 'school_id') int? schoolId,
    @JsonKey(name: 'school_other') @Default('') String schoolOther,
    @JsonKey(name: 'school_campus') @Default('') String schoolCampus,
    @JsonKey(name: 'studied_from') int? studiedFrom,
    @JsonKey(name: 'studied_until') int? studiedUntil,
    @JsonKey(unknownEnumValue: Qualification.oLevel)
    @Default(Qualification.oLevel)
    Qualification qualification,
    @JsonKey(name: 'qualification_other')
    @Default('')
    String qualificationOther,
    @JsonKey(name: 'matric_percentage') String? matricPercentage,
    @JsonKey(name: 'future_study') @Default('') String futureStudy,
    @JsonKey(fromJson: _refereeFromJson) @Default(Referee()) Referee referee,
    @JsonKey(name: 'wants_sports_trial') @Default(false) bool wantsSportsTrial,
    @JsonKey(name: 'anything_else') @Default('') String anythingElse,
    @Default('') String statement,
  }) = _ApplicantProfile;

  /// From JSON (unknown keys are ignored; `null` text becomes `''`).
  factory ApplicantProfile.fromJson(Map<String, dynamic> json) =>
      _$ApplicantProfileFromJson({
        for (final e in json.entries)
          e.key: e.value == null && _textKeys.contains(e.key) ? '' : e.value,
      });
}

Referee _refereeFromJson(Object? json) => json is Map
    ? Referee.fromJson(Map<String, dynamic>.from(json))
    : const Referee();

Map<String, dynamic> _mapFromJson(Object? json) =>
    json is Map ? Map<String, dynamic>.from(json) : const {};

const _textKeys = {
  'first_name',
  'last_name',
  'gender',
  'cnic',
  'religion',
  'mobile',
  'email',
  'other_nationality',
  'address',
  'country',
  'city_other',
  'school_other',
  'school_campus',
  'qualification',
  'qualification_other',
  'future_study',
  'anything_else',
  'statement',
};
