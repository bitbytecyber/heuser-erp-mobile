import 'package:heuser_ds/src/tokens/h_colors.dart';
import 'package:heuser_ds/src/tokens/h_typography.dart';

/// A named pair of colour schemes (light + dark) plus optional font override.
///
/// Built-in presets live next to this file and are listed in
/// `preset_registry.dart`; remote presets arrive through the admin
/// `mobile_theme` payload and are decoded by `MobileThemeCodec`.
class HPreset {
  /// Creates a preset.
  const HPreset({
    required this.id,
    required this.label,
    required this.light,
    required this.dark,
    this.fonts = HFonts.standard,
    this.description = '',
  });

  /// Stable id (`^[a-z0-9_]{2,40}$`), referenced by the backend and user prefs.
  final String id;

  /// Human label shown in the Appearance picker.
  final String label;

  /// One-line description for the picker.
  final String description;

  /// Scheme used in light mode.
  final HColorScheme light;

  /// Scheme used in dark mode.
  final HColorScheme dark;

  /// Font pair.
  final HFonts fonts;

  /// Picks the scheme for a brightness.
  HColorScheme schemeFor({required bool dark}) => dark ? this.dark : light;

  /// Copy with replaced members.
  HPreset copyWith({
    String? id,
    String? label,
    String? description,
    HColorScheme? light,
    HColorScheme? dark,
    HFonts? fonts,
  }) => HPreset(
    id: id ?? this.id,
    label: label ?? this.label,
    description: description ?? this.description,
    light: light ?? this.light,
    dark: dark ?? this.dark,
    fonts: fonts ?? this.fonts,
  );
}
