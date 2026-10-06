import 'package:flutter/animation.dart' show Cubic, Curve, Curves;

/// Durations and curves. Fast and smooth: nothing in the app waits on an
/// animation longer than [emphasized].
class HMotion {
  /// Default motion tokens.
  const HMotion({
    this.fast = const Duration(milliseconds: 120),
    this.standard = const Duration(milliseconds: 220),
    this.slow = const Duration(milliseconds: 360),
    this.emphasized = const Duration(milliseconds: 480),
    this.enabled = true,
  });

  /// Press feedback, hover, focus ring.
  final Duration fast;

  /// State changes, switches, chips, fades.
  final Duration standard;

  /// Page/step transitions, sheets.
  final Duration slow;

  /// Hero reveals, splash hand-off.
  final Duration emphasized;

  /// `false` when the OS asks to reduce motion; durations collapse to zero.
  final bool enabled;

  /// Standard easing (Material emphasized-decelerate feel).
  static const Curve easeOut = Cubic(0.2, 0, 0, 1);

  /// Enter curve for things appearing.
  static const Curve enter = Cubic(0.05, 0.7, 0.1, 1);

  /// Exit curve for things leaving.
  static const Curve exit = Cubic(0.3, 0, 0.8, 0.15);

  /// Gentle overshoot for playful confirmations (checkmarks, success).
  static const Curve spring = Curves.easeOutBack;

  /// Returns [d] or zero when motion is disabled.
  Duration of(Duration d) => enabled ? d : Duration.zero;

  /// Copy with motion toggled.
  HMotion copyWith({bool? enabled}) => HMotion(
    fast: fast,
    standard: standard,
    slow: slow,
    emphasized: emphasized,
    enabled: enabled ?? this.enabled,
  );
}
