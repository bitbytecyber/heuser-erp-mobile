import 'package:flutter/material.dart' show ThemeExtension;
import 'package:heuser_ds/src/theme/h_theme_data.dart';

/// Exposes [HThemeData] through `Theme.of(context).extension<HTokens>()` so
/// Material engine widgets (and the rare third-party widget that only knows
/// `ThemeData`) can reach the same tokens. App code uses `context.h`.
class HTokens extends ThemeExtension<HTokens> {
  /// Wraps [data].
  const HTokens(this.data);

  /// The theme.
  final HThemeData data;

  @override
  HTokens copyWith({HThemeData? data}) => HTokens(data ?? this.data);

  @override
  HTokens lerp(ThemeExtension<HTokens>? other, double t) {
    if (other is! HTokens) return this;
    // Colour cross-fades are handled by HThemeScope's AnimatedSwitcher; the
    // extension itself snaps so engine widgets stay consistent mid-fade.
    return t < 0.5 ? this : other;
  }
}
