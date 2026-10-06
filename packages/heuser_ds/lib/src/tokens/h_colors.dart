import 'dart:ui' show Brightness, Color;

/// Semantic colour roles of the Heuser design system.
///
/// Every visible colour in the app is one of these roles. Names describe what
/// an element *is* (`brand`, `surfaceRaised`, `textSecondary`, `dangerSoft`),
/// never what it looks like, so a preset can recolour the whole app without
/// touching a widget. The snake_case JSON keys used by the admin-editable
/// `mobile_theme` payload are in `HColorRoles`.
class HColorScheme {
  /// Creates a scheme. All roles are required: a preset is complete or it is
  /// not a preset (lenient decoding of remote payloads happens in
  /// `MobileThemeCodec`, which fills gaps from a built-in preset).
  const HColorScheme({
    required this.brightness,
    required this.brand,
    required this.onBrand,
    required this.brandSoft,
    required this.brandStrong,
    required this.accent,
    required this.onAccent,
    required this.accentSoft,
    required this.surface,
    required this.surfaceAlt,
    required this.surfaceRaised,
    required this.surfaceInverse,
    required this.outline,
    required this.outlineSoft,
    required this.divider,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textInverse,
    required this.success,
    required this.onSuccess,
    required this.successSoft,
    required this.warning,
    required this.onWarning,
    required this.warningSoft,
    required this.danger,
    required this.onDanger,
    required this.dangerSoft,
    required this.info,
    required this.onInfo,
    required this.infoSoft,
    required this.heroGradientStart,
    required this.heroGradientEnd,
    required this.overlay,
    required this.shimmerBase,
    required this.shimmerHighlight,
    required this.navIndicator,
    required this.focusRing,
  });

  /// Light or dark; drives elevation shadows and the Material bridge.
  final Brightness brightness;

  /// Primary brand fill (buttons, active states).
  final Color brand;

  /// Text/icon on [brand].
  final Color onBrand;

  /// Pastel tint of the brand for tonal buttons, chips and selected rows.
  final Color brandSoft;

  /// Darker brand for text on [brandSoft] and pressed states.
  final Color brandStrong;

  /// Secondary accent (apricot in the default preset).
  final Color accent;

  /// Text/icon on [accent].
  final Color onAccent;

  /// Pastel tint of [accent].
  final Color accentSoft;

  /// Page background.
  final Color surface;

  /// Slightly contrasting background for grouped sections and inputs.
  final Color surfaceAlt;

  /// Cards, sheets and anything that floats above [surface].
  final Color surfaceRaised;

  /// High-contrast surface (toasts, tooltips, inverse hero).
  final Color surfaceInverse;

  /// Borders on inputs and cards.
  final Color outline;

  /// Subtle borders and disabled outlines.
  final Color outlineSoft;

  /// Hairline separators inside lists.
  final Color divider;

  /// Primary text.
  final Color textPrimary;

  /// Supporting text.
  final Color textSecondary;

  /// Placeholders, captions and disabled text.
  final Color textTertiary;

  /// Text on [surfaceInverse].
  final Color textInverse;

  /// Positive state (paid, approved, booked).
  final Color success;

  /// Text/icon on [success].
  final Color onSuccess;

  /// Pastel background for success pills and banners.
  final Color successSoft;

  /// Attention state (pending, awaiting).
  final Color warning;

  /// Text/icon on [warning].
  final Color onWarning;

  /// Pastel background for warning pills and banners.
  final Color warningSoft;

  /// Error state. Deliberately not the brand red.
  final Color danger;

  /// Text/icon on [danger].
  final Color onDanger;

  /// Pastel background for error pills, field errors and banners.
  final Color dangerSoft;

  /// Informational state.
  final Color info;

  /// Text/icon on [info].
  final Color onInfo;

  /// Pastel background for info pills and banners.
  final Color infoSoft;

  /// Start of the soft gradient on hero cards.
  final Color heroGradientStart;

  /// End of the soft gradient on hero cards.
  final Color heroGradientEnd;

  /// Modal barrier colour (includes its alpha).
  final Color overlay;

  /// Skeleton base.
  final Color shimmerBase;

  /// Skeleton highlight sweep.
  final Color shimmerHighlight;

  /// Active indicator in the bottom navigation bar and tabs.
  final Color navIndicator;

  /// Keyboard-focus ring around inputs and buttons.
  final Color focusRing;

  /// `true` for dark schemes.
  bool get isDark => brightness == Brightness.dark;

  /// Returns a copy with the given roles replaced.
  HColorScheme copyWith({
    Brightness? brightness,
    Color? brand,
    Color? onBrand,
    Color? brandSoft,
    Color? brandStrong,
    Color? accent,
    Color? onAccent,
    Color? accentSoft,
    Color? surface,
    Color? surfaceAlt,
    Color? surfaceRaised,
    Color? surfaceInverse,
    Color? outline,
    Color? outlineSoft,
    Color? divider,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textInverse,
    Color? success,
    Color? onSuccess,
    Color? successSoft,
    Color? warning,
    Color? onWarning,
    Color? warningSoft,
    Color? danger,
    Color? onDanger,
    Color? dangerSoft,
    Color? info,
    Color? onInfo,
    Color? infoSoft,
    Color? heroGradientStart,
    Color? heroGradientEnd,
    Color? overlay,
    Color? shimmerBase,
    Color? shimmerHighlight,
    Color? navIndicator,
    Color? focusRing,
  }) {
    return HColorScheme(
      brightness: brightness ?? this.brightness,
      brand: brand ?? this.brand,
      onBrand: onBrand ?? this.onBrand,
      brandSoft: brandSoft ?? this.brandSoft,
      brandStrong: brandStrong ?? this.brandStrong,
      accent: accent ?? this.accent,
      onAccent: onAccent ?? this.onAccent,
      accentSoft: accentSoft ?? this.accentSoft,
      surface: surface ?? this.surface,
      surfaceAlt: surfaceAlt ?? this.surfaceAlt,
      surfaceRaised: surfaceRaised ?? this.surfaceRaised,
      surfaceInverse: surfaceInverse ?? this.surfaceInverse,
      outline: outline ?? this.outline,
      outlineSoft: outlineSoft ?? this.outlineSoft,
      divider: divider ?? this.divider,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textInverse: textInverse ?? this.textInverse,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      successSoft: successSoft ?? this.successSoft,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      warningSoft: warningSoft ?? this.warningSoft,
      danger: danger ?? this.danger,
      onDanger: onDanger ?? this.onDanger,
      dangerSoft: dangerSoft ?? this.dangerSoft,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      infoSoft: infoSoft ?? this.infoSoft,
      heroGradientStart: heroGradientStart ?? this.heroGradientStart,
      heroGradientEnd: heroGradientEnd ?? this.heroGradientEnd,
      overlay: overlay ?? this.overlay,
      shimmerBase: shimmerBase ?? this.shimmerBase,
      shimmerHighlight: shimmerHighlight ?? this.shimmerHighlight,
      navIndicator: navIndicator ?? this.navIndicator,
      focusRing: focusRing ?? this.focusRing,
    );
  }
}
