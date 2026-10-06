import 'dart:ui' show FontWeight, TextLeadingDistribution;

import 'package:flutter/painting.dart' show TextStyle;

/// Font families used by the system. Both are bundled inside this package
/// (OFL licensed), so every style sets `package: 'heuser_ds'`.
class HFonts {
  /// Creates a font pair.
  const HFonts({this.ui = 'Manrope', this.display = 'BarlowSemiCondensed'});

  /// Default pair.
  static const HFonts standard = HFonts();

  /// Body / labels / titles (variable weight 200–800).
  final String ui;

  /// Display and headline sizes (condensed, confident).
  final String display;

  /// The package the fonts are declared in.
  static const String package = 'heuser_ds';

  /// Returns a copy with the given families replaced.
  HFonts copyWith({String? ui, String? display}) =>
      HFonts(ui: ui ?? this.ui, display: display ?? this.display);
}

/// The type scale. Styles carry size, weight, line height and letter spacing
/// but **no colour**: colour is applied by `HText` from the colour scheme so
/// one scale serves every preset.
class HTypeScale {
  /// Builds the scale for a font pair.
  const HTypeScale({required this.fonts});

  /// Families this scale renders with.
  final HFonts fonts;

  TextStyle _display(double size, double height, {double spacing = -0.5}) =>
      TextStyle(
        fontFamily: fonts.display,
        package: HFonts.package,
        fontSize: size,
        fontWeight: FontWeight.w600,
        height: height,
        letterSpacing: spacing,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle _ui(
    double size,
    double height,
    FontWeight weight, {
    double spacing = 0,
  }) => TextStyle(
    fontFamily: fonts.ui,
    package: HFonts.package,
    fontSize: size,
    fontWeight: weight,
    height: height,
    letterSpacing: spacing,
    leadingDistribution: TextLeadingDistribution.even,
  );

  /// 44/48 condensed — hero numbers and welcome screens.
  TextStyle get displayLg => _display(44, 1.08, spacing: -1);

  /// 36/40 condensed.
  TextStyle get displayMd => _display(36, 1.1, spacing: -0.8);

  /// 30/36 condensed.
  TextStyle get displaySm => _display(30, 1.15);

  /// 26/32 — page titles.
  TextStyle get headlineLg => _ui(26, 1.25, FontWeight.w700, spacing: -0.4);

  /// 22/28 — section titles.
  TextStyle get headlineMd => _ui(22, 1.27, FontWeight.w700, spacing: -0.3);

  /// 19/26.
  TextStyle get headlineSm => _ui(19, 1.3, FontWeight.w700, spacing: -0.2);

  /// 17/24 — card titles, app bar.
  TextStyle get titleLg => _ui(17, 1.4, FontWeight.w600);

  /// 15/22 — list tiles, buttons (large).
  TextStyle get titleMd => _ui(15, 1.45, FontWeight.w600);

  /// 13/18 — small titles, chips.
  TextStyle get titleSm => _ui(13, 1.4, FontWeight.w600, spacing: 0.1);

  /// 16/24 — long-form reading.
  TextStyle get bodyLg => _ui(16, 1.5, FontWeight.w400);

  /// 14/20 — default body.
  TextStyle get bodyMd => _ui(14, 1.45, FontWeight.w400);

  /// 12/16 — captions and helper text.
  TextStyle get bodySm => _ui(12, 1.35, FontWeight.w400);

  /// 14/20 — button labels.
  TextStyle get labelLg => _ui(14, 1.4, FontWeight.w600, spacing: 0.1);

  /// 12/16 — pills, tabs.
  TextStyle get labelMd => _ui(12, 1.35, FontWeight.w600, spacing: 0.3);

  /// 11/14 — overlines, uppercase meta.
  TextStyle get labelSm => _ui(11, 1.3, FontWeight.w600, spacing: 0.6);

  /// 13/18 tabular — references, amounts.
  TextStyle get mono => _ui(
    13,
    1.4,
    FontWeight.w500,
    spacing: 0.2,
  ).copyWith(fontFeatures: const []);
}
