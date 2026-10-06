import 'dart:ui' show Color, Offset;

import 'package:flutter/painting.dart' show BoxShadow;

/// Layered soft shadows. Light schemes use a navy-tinted shadow at low alpha
/// (never pure black, which looks muddy on pastels); dark schemes use deeper
/// black shadows because surfaces are already dark.
class HElevation {
  /// Builds the four tiers from the scheme's shadow tint and brightness.
  const HElevation({required this.tint, required this.isDark});

  /// Shadow colour before alpha is applied (usually `textPrimary`).
  final Color tint;

  /// Whether the scheme is dark.
  final bool isDark;

  Color _a(double light, double dark) =>
      tint.withValues(alpha: isDark ? dark : light);

  /// No shadow; a 1px outline carries the edge instead.
  List<BoxShadow> get flat => const [];

  /// Cards resting on the page.
  List<BoxShadow> get raised => [
    BoxShadow(color: _a(0.06, 0.35), blurRadius: 8, offset: const Offset(0, 2)),
    BoxShadow(color: _a(0.04, 0.25), blurRadius: 2, offset: const Offset(0, 1)),
  ];

  /// Floating action, bottom nav, hero cards.
  List<BoxShadow> get floating => [
    BoxShadow(
      color: _a(0.10, 0.45),
      blurRadius: 24,
      offset: const Offset(0, 10),
    ),
    BoxShadow(color: _a(0.05, 0.30), blurRadius: 6, offset: const Offset(0, 2)),
  ];

  /// Sheets, dialogs, toasts.
  List<BoxShadow> get overlay => [
    BoxShadow(
      color: _a(0.16, 0.55),
      blurRadius: 40,
      offset: const Offset(0, 16),
    ),
    BoxShadow(color: _a(0.06, 0.35), blurRadius: 8, offset: const Offset(0, 2)),
  ];
}
