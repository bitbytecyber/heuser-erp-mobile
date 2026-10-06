import 'package:flutter/foundation.dart' show immutable;
import 'package:heuser_ds/src/theme/presets/h_preset.dart';
import 'package:heuser_ds/src/tokens/h_colors.dart';
import 'package:heuser_ds/src/tokens/h_elevation.dart';
import 'package:heuser_ds/src/tokens/h_motion.dart';
import 'package:heuser_ds/src/tokens/h_typography.dart';

/// Everything a widget needs to draw itself: one resolved scheme, the type
/// scale, motion and elevation. Built from a preset + brightness by
/// [HThemeData.fromPreset]; the app's `ThemeCubit` owns the resolution.
@immutable
class HThemeData {
  /// Creates theme data from already-resolved parts.
  const HThemeData({
    required this.presetId,
    required this.colors,
    required this.fonts,
    this.motion = const HMotion(),
  });

  /// Resolves [preset] for the requested brightness.
  factory HThemeData.fromPreset(
    HPreset preset, {
    required bool dark,
    bool reduceMotion = false,
  }) => HThemeData(
    presetId: preset.id,
    colors: preset.schemeFor(dark: dark),
    fonts: preset.fonts,
    motion: HMotion(enabled: !reduceMotion),
  );

  /// Id of the preset this was resolved from.
  final String presetId;

  /// Resolved colour roles.
  final HColorScheme colors;

  /// Font families.
  final HFonts fonts;

  /// Type scale for [fonts].
  HTypeScale get type => HTypeScale(fonts: fonts);

  /// Motion tokens (respecting reduce-motion).
  final HMotion motion;

  /// Shadow tiers for this brightness.
  HElevation get elevation =>
      HElevation(tint: colors.textPrimary, isDark: colors.isDark);

  /// `true` for dark schemes.
  bool get isDark => colors.isDark;

  /// Copy with replaced members.
  HThemeData copyWith({
    String? presetId,
    HColorScheme? colors,
    HFonts? fonts,
    HMotion? motion,
  }) => HThemeData(
    presetId: presetId ?? this.presetId,
    colors: colors ?? this.colors,
    fonts: fonts ?? this.fonts,
    motion: motion ?? this.motion,
  );

  @override
  bool operator ==(Object other) =>
      other is HThemeData &&
      other.presetId == presetId &&
      other.colors == colors &&
      other.fonts == fonts &&
      other.motion == motion;

  @override
  int get hashCode => Object.hash(presetId, colors, fonts, motion);
}
