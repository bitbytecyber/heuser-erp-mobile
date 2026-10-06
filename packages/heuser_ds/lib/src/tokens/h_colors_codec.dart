import 'dart:ui' show Brightness, Color;

import 'package:heuser_ds/src/tokens/h_colors.dart';

/// The snake_case keys of every colour role, in declaration order. These are
/// the keys of the admin-editable `mobile_theme` JSON and must match the
/// backend validator's `COLOR_ROLES`.
abstract final class HColorRoles {
  /// All role keys.
  static const List<String> all = [
    'brand',
    'on_brand',
    'brand_soft',
    'brand_strong',
    'accent',
    'on_accent',
    'accent_soft',
    'surface',
    'surface_alt',
    'surface_raised',
    'surface_inverse',
    'outline',
    'outline_soft',
    'divider',
    'text_primary',
    'text_secondary',
    'text_tertiary',
    'text_inverse',
    'success',
    'on_success',
    'success_soft',
    'warning',
    'on_warning',
    'warning_soft',
    'danger',
    'on_danger',
    'danger_soft',
    'info',
    'on_info',
    'info_soft',
    'hero_gradient_start',
    'hero_gradient_end',
    'overlay',
    'shimmer_base',
    'shimmer_highlight',
    'nav_indicator',
    'focus_ring',
  ];
}

/// Map and hex conversions for [HColorScheme].
extension HColorSchemeCodec on HColorScheme {
  /// Role → colour, keyed by [HColorRoles].
  Map<String, Color> toMap() => {
    'brand': brand,
    'on_brand': onBrand,
    'brand_soft': brandSoft,
    'brand_strong': brandStrong,
    'accent': accent,
    'on_accent': onAccent,
    'accent_soft': accentSoft,
    'surface': surface,
    'surface_alt': surfaceAlt,
    'surface_raised': surfaceRaised,
    'surface_inverse': surfaceInverse,
    'outline': outline,
    'outline_soft': outlineSoft,
    'divider': divider,
    'text_primary': textPrimary,
    'text_secondary': textSecondary,
    'text_tertiary': textTertiary,
    'text_inverse': textInverse,
    'success': success,
    'on_success': onSuccess,
    'success_soft': successSoft,
    'warning': warning,
    'on_warning': onWarning,
    'warning_soft': warningSoft,
    'danger': danger,
    'on_danger': onDanger,
    'danger_soft': dangerSoft,
    'info': info,
    'on_info': onInfo,
    'info_soft': infoSoft,
    'hero_gradient_start': heroGradientStart,
    'hero_gradient_end': heroGradientEnd,
    'overlay': overlay,
    'shimmer_base': shimmerBase,
    'shimmer_highlight': shimmerHighlight,
    'nav_indicator': navIndicator,
    'focus_ring': focusRing,
  };

  /// Role → `#RRGGBB` / `#RRGGBBAA` hex, for the remote JSON and DESIGN.md.
  Map<String, String> toHexMap() =>
      toMap().map((k, v) => MapEntry(k, HHex.encode(v)));

  /// Builds a scheme from a (possibly partial) role map, taking any missing
  /// role from [fallback]. Unknown keys are ignored.
  static HColorScheme fromMap(
    Map<String, Color> roles, {
    required HColorScheme fallback,
    Brightness? brightness,
  }) {
    Color pick(String key, Color base) => roles[key] ?? base;
    return HColorScheme(
      brightness: brightness ?? fallback.brightness,
      brand: pick('brand', fallback.brand),
      onBrand: pick('on_brand', fallback.onBrand),
      brandSoft: pick('brand_soft', fallback.brandSoft),
      brandStrong: pick('brand_strong', fallback.brandStrong),
      accent: pick('accent', fallback.accent),
      onAccent: pick('on_accent', fallback.onAccent),
      accentSoft: pick('accent_soft', fallback.accentSoft),
      surface: pick('surface', fallback.surface),
      surfaceAlt: pick('surface_alt', fallback.surfaceAlt),
      surfaceRaised: pick('surface_raised', fallback.surfaceRaised),
      surfaceInverse: pick('surface_inverse', fallback.surfaceInverse),
      outline: pick('outline', fallback.outline),
      outlineSoft: pick('outline_soft', fallback.outlineSoft),
      divider: pick('divider', fallback.divider),
      textPrimary: pick('text_primary', fallback.textPrimary),
      textSecondary: pick('text_secondary', fallback.textSecondary),
      textTertiary: pick('text_tertiary', fallback.textTertiary),
      textInverse: pick('text_inverse', fallback.textInverse),
      success: pick('success', fallback.success),
      onSuccess: pick('on_success', fallback.onSuccess),
      successSoft: pick('success_soft', fallback.successSoft),
      warning: pick('warning', fallback.warning),
      onWarning: pick('on_warning', fallback.onWarning),
      warningSoft: pick('warning_soft', fallback.warningSoft),
      danger: pick('danger', fallback.danger),
      onDanger: pick('on_danger', fallback.onDanger),
      dangerSoft: pick('danger_soft', fallback.dangerSoft),
      info: pick('info', fallback.info),
      onInfo: pick('on_info', fallback.onInfo),
      infoSoft: pick('info_soft', fallback.infoSoft),
      heroGradientStart: pick(
        'hero_gradient_start',
        fallback.heroGradientStart,
      ),
      heroGradientEnd: pick('hero_gradient_end', fallback.heroGradientEnd),
      overlay: pick('overlay', fallback.overlay),
      shimmerBase: pick('shimmer_base', fallback.shimmerBase),
      shimmerHighlight: pick('shimmer_highlight', fallback.shimmerHighlight),
      navIndicator: pick('nav_indicator', fallback.navIndicator),
      focusRing: pick('focus_ring', fallback.focusRing),
    );
  }

  /// Linear interpolation between two schemes (theme cross-fades).
  static HColorScheme lerp(HColorScheme a, HColorScheme b, double t) {
    final am = a.toMap();
    final bm = b.toMap();
    final out = <String, Color>{
      for (final k in HColorRoles.all) k: Color.lerp(am[k], bm[k], t)!,
    };
    return fromMap(
      out,
      fallback: t < 0.5 ? a : b,
      brightness: t < 0.5 ? a.brightness : b.brightness,
    );
  }
}

/// Hex ⇄ [Color] helpers shared by presets, the remote codec and docs.
abstract final class HHex {
  static final _re = RegExp(r'^#?([0-9a-fA-F]{6})([0-9a-fA-F]{2})?$');

  /// Parses `#RRGGBB` or `#RRGGBBAA`; returns `null` for anything else.
  static Color? tryDecode(String raw) {
    final m = _re.firstMatch(raw.trim());
    if (m == null) return null;
    final rgb = int.parse(m.group(1)!, radix: 16);
    final alpha = m.group(2) == null ? 0xFF : int.parse(m.group(2)!, radix: 16);
    return Color((alpha << 24) | rgb);
  }

  /// Encodes as `#RRGGBB`, or `#RRGGBBAA` when not fully opaque.
  static String encode(Color c) {
    String two(double v) =>
        (v * 255).round().toRadixString(16).padLeft(2, '0').toUpperCase();
    final rgb = '#${two(c.r)}${two(c.g)}${two(c.b)}';
    return c.a >= 1 ? rgb : '$rgb${two(c.a)}';
  }
}
