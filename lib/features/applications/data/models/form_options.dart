import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/documents.dart';

part 'form_options.freezed.dart';
part 'form_options.g.dart';

/// A teacher offered for a subject.
@freezed
abstract class TeacherOption with _$TeacherOption {
  /// Creates a teacher.
  const factory TeacherOption({required int id, @Default('') String name}) =
      _TeacherOption;

  /// From JSON.
  factory TeacherOption.fromJson(Map<String, dynamic> json) =>
      _$TeacherOptionFromJson(json);
}

/// An A-Level subject open for the level.
@freezed
abstract class SubjectOption with _$SubjectOption {
  /// Creates a subject.
  const factory SubjectOption({
    required int course,
    @Default('') String code,
    @Default('') String name,
    @Default(<TeacherOption>[]) List<TeacherOption> teachers,
  }) = _SubjectOption;

  /// From JSON.
  factory SubjectOption.fromJson(Map<String, dynamic> json) =>
      _$SubjectOptionFromJson(json);
}

/// A sport in the catalogue.
@freezed
abstract class SportOption with _$SportOption {
  /// Creates a sport.
  const factory SportOption({
    required int id,
    @Default('') String name,
    @JsonKey(name: 'has_trial') @Default(false) bool hasTrial,
  }) = _SportOption;

  /// From JSON.
  factory SportOption.fromJson(Map<String, dynamic> json) =>
      _$SportOptionFromJson(json);
}

/// `GET me/applications/options/?level=`.
@freezed
abstract class FormOptions with _$FormOptions {
  /// Creates options.
  const factory FormOptions({
    @Default(<SubjectOption>[]) List<SubjectOption> subjects,
    @Default(<SportOption>[]) List<SportOption> sports,
    @JsonKey(name: 'document_types')
    @Default(<DocumentType>[])
    List<DocumentType> documentTypes,
  }) = _FormOptions;
  const FormOptions._();

  /// From JSON.
  factory FormOptions.fromJson(Map<String, dynamic> json) =>
      _$FormOptionsFromJson(json);

  /// The subject with [course], if open.
  SubjectOption? subject(int course) =>
      subjects.where((s) => s.course == course).firstOrNull;

  /// The document type with [code].
  DocumentType? documentType(String code) =>
      documentTypes.where((d) => d.code == code).firstOrNull;

  /// Whether [sportId] has trials.
  bool sportHasTrial(int? sportId) =>
      sportId != null && sports.any((s) => s.id == sportId && s.hasTrial);
}

/// `PATCH me/applications/{id}/step/{n}/`.
@freezed
abstract class StepResult with _$StepResult {
  /// Creates a result.
  const factory StepResult({
    required Application application,
    @Default(<String>[]) List<String> missing,
  }) = _StepResult;

  /// From JSON.
  factory StepResult.fromJson(Map<String, dynamic> json) =>
      _$StepResultFromJson(json);
}

/// A school from the catalogue search.
@freezed
abstract class SchoolHit with _$SchoolHit {
  /// Creates a hit.
  const factory SchoolHit({
    required int id,
    @Default('') String name,
    @Default('') String city,
  }) = _SchoolHit;

  /// From JSON.
  factory SchoolHit.fromJson(Map<String, dynamic> json) =>
      _$SchoolHitFromJson(json);
}

/// A country.
@freezed
abstract class Country with _$Country {
  /// Creates a country.
  const factory Country({required String code, @Default('') String name}) =
      _Country;

  /// From JSON.
  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}

/// A city of a country.
@freezed
abstract class City with _$City {
  /// Creates a city.
  const factory City({required int id, @Default('') String name}) = _City;

  /// From JSON.
  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

/// A bookable interview time.
@freezed
abstract class TimeOption with _$TimeOption {
  /// Creates a time.
  const factory TimeOption({
    @JsonKey(name: 'starts_at') required String startsAt,
    @JsonKey(name: 'ends_at') @Default('') String endsAt,
    @Default(0) int places,
    @Default(0) int booked,
    @Default(0) int total,
  }) = _TimeOption;

  /// From JSON.
  factory TimeOption.fromJson(Map<String, dynamic> json) =>
      _$TimeOptionFromJson(json);
}

/// A bookable sports trial session.
@freezed
abstract class TrialOption with _$TrialOption {
  /// Creates a session.
  const factory TrialOption({
    required int id,
    @JsonKey(name: 'starts_at') @Default('') String startsAt,
    @JsonKey(name: 'ends_at') @Default('') String endsAt,
    @JsonKey(name: 'places_left') @Default(0) int placesLeft,
  }) = _TrialOption;

  /// From JSON.
  factory TrialOption.fromJson(Map<String, dynamic> json) =>
      _$TrialOptionFromJson(json);
}
