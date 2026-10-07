import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';

part 'application_summary.freezed.dart';
part 'application_summary.g.dart';

/// One stage of the applicant's tracker.
@freezed
abstract class TrackerStage with _$TrackerStage {
  /// Creates a stage.
  const factory TrackerStage({required String key, @Default('') String label}) =
      _TrackerStage;

  /// From JSON.
  factory TrackerStage.fromJson(Map<String, dynamic> json) =>
      _$TrackerStageFromJson(json);
}

/// The 7–8 stage bar: which are shown, the current one and an ended label.
@freezed
abstract class Tracker with _$Tracker {
  /// Creates a tracker.
  const factory Tracker({
    @Default(<TrackerStage>[]) List<TrackerStage> stages,
    String? current,
    String? ended,
  }) = _Tracker;
  const Tracker._();

  /// From JSON.
  factory Tracker.fromJson(Map<String, dynamic> json) =>
      _$TrackerFromJson(json);

  /// Index of the current stage, or -1 before the first.
  int get currentIndex => stages.indexWhere((s) => s.key == current);

  /// Progress 0–1 for a mini bar (0 for a draft).
  double get progress {
    if (stages.isEmpty) return 0;
    final i = currentIndex;
    return i < 0 ? 0 : (i + 1) / stages.length;
  }
}

/// A row of `GET me/applications/`.
@freezed
abstract class AppSummary with _$AppSummary {
  /// Creates a summary.
  const factory AppSummary({
    required int id,
    String? reference,
    @JsonKey(name: 'full_name') @Default('') String fullName,
    @JsonKey(unknownEnumValue: Level.as_) @Default(Level.as_) Level level,
    @JsonKey(unknownEnumValue: AppStatus.unknown)
    @Default(AppStatus.draft)
    AppStatus status,
    @JsonKey(name: 'status_label') @Default('') String statusLabel,
    @JsonKey(name: 'form_step') @Default(1) int formStep,
    @JsonKey(name: 'updated_at') @Default('') String updatedAt,
    @Default(Tracker()) Tracker tracker,
  }) = _AppSummary;
  const AppSummary._();

  /// From JSON.
  factory AppSummary.fromJson(Map<String, dynamic> json) =>
      _$AppSummaryFromJson(json);

  /// Parsed `updated_at`.
  DateTime? get updatedAtTime => DateTime.tryParse(updatedAt);
}
