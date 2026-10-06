import 'package:equatable/equatable.dart';
import 'package:heuser_ds/heuser_ds.dart';

/// What the user chose in Appearance. Persisted locally; honoured only when
/// the admin's policy allows overrides.
class ThemePreference extends Equatable {
  /// Creates a preference.
  const ThemePreference({this.presetId, this.mode = HThemeMode.system});

  /// Lenient parse.
  factory ThemePreference.fromJson(Object? json) {
    if (json is! Map) return none;
    final preset = json['preset_id'];
    return ThemePreference(
      presetId: preset is String && preset.isNotEmpty ? preset : null,
      mode: HThemeMode.parse(json['mode'] as String?),
    );
  }

  /// Nothing chosen: follow the admin's active preset and the OS mode.
  static const ThemePreference none = ThemePreference();

  /// Chosen preset id, or `null` for the admin's active preset.
  final String? presetId;

  /// Colour mode.
  final HThemeMode mode;

  /// Copy with replacements (`clearPreset` resets to the admin default).
  ThemePreference copyWith({
    String? presetId,
    HThemeMode? mode,
    bool clearPreset = false,
  }) => ThemePreference(
    presetId: clearPreset ? null : (presetId ?? this.presetId),
    mode: mode ?? this.mode,
  );

  /// JSON for the preference store.
  Map<String, Object?> toJson() => {'preset_id': presetId, 'mode': mode.name};

  @override
  List<Object?> get props => [presetId, mode];
}
