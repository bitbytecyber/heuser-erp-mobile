import 'dart:ui' show Brightness;

import 'package:equatable/equatable.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/app/theme/theme_preference.dart';

/// The outcome of [resolveTheme].
class ResolvedTheme extends Equatable {
  /// Creates a resolved theme.
  const ResolvedTheme({
    required this.data,
    required this.preset,
    required this.available,
    required this.userCanOverride,
  });

  /// What the widget tree renders with.
  final HThemeData data;

  /// The preset in effect.
  final HPreset preset;

  /// Presets the Appearance page may offer (built-in ∪ remote).
  final List<HPreset> available;

  /// Whether the admin allows the user to pick a preset.
  final bool userCanOverride;

  @override
  List<Object?> get props => [
    data,
    preset.id,
    available.map((p) => p.id).toList(),
    userCanOverride,
  ];
}

/// Pure resolution of the effective theme (see DESIGN.md "Resolution"):
///
/// 1. the preset pool is built-in presets with remote presets layered on top;
/// 2. the preset id is the admin's `active_preset` unless the admin allows
///    overrides and the user chose one that still exists;
/// 3. unknown ids fall back to the admin's choice, then to Heuser Classic;
/// 4. brightness comes from the user's mode (system → platform).
ResolvedTheme resolveTheme({
  required MobileTheme remote,
  required ThemePreference pref,
  required Brightness platform,
  bool reduceMotion = false,
}) {
  final available = remote.availablePresets;
  final adminPreset = remote.activePreset == null
      ? null
      : remote.presetById(remote.activePreset!);
  HPreset? chosen;
  if (remote.allowUserOverride && pref.presetId != null) {
    chosen = remote.presetById(pref.presetId!);
  }
  final preset = chosen ?? adminPreset ?? HPresets.fallback;
  final dark = pref.mode.resolveDark(platform);
  return ResolvedTheme(
    data: HThemeData.fromPreset(preset, dark: dark, reduceMotion: reduceMotion),
    preset: preset,
    available: available,
    userCanOverride: remote.allowUserOverride,
  );
}
