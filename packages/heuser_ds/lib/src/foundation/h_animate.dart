import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/tokens/h_motion.dart';

/// Entrance and emphasis presets built on flutter_animate. Every preset reads
/// the theme's motion tokens and collapses to nothing when motion is reduced,
/// so screens never pass durations.
extension HAnimate on Widget {
  /// Fade + 12px rise. The default entrance for cards, sections and tiles.
  Widget hFadeInUp(BuildContext context, {Duration delay = Duration.zero}) {
    final m = context.h.motion;
    if (!m.enabled) return this;
    return animate(delay: delay)
        .fadeIn(duration: m.standard, curve: HMotion.enter)
        .moveY(begin: 12, end: 0, duration: m.standard, curve: HMotion.enter);
  }

  /// Scale from 96 % with a fade. For dialogs, toasts and chips appearing.
  Widget hScaleIn(BuildContext context, {Duration delay = Duration.zero}) {
    final m = context.h.motion;
    if (!m.enabled) return this;
    return animate(delay: delay)
        .fadeIn(duration: m.fast, curve: HMotion.enter)
        .scaleXY(
          begin: 0.96,
          end: 1,
          duration: m.standard,
          curve: HMotion.enter,
        );
  }

  /// Success pop: a short overshoot. For checkmarks and "saved" pills.
  Widget hPop(BuildContext context) {
    final m = context.h.motion;
    if (!m.enabled) return this;
    return animate().scaleXY(
      begin: 0.8,
      end: 1,
      duration: m.standard,
      curve: HMotion.spring,
    );
  }

  /// Horizontal shake for validation errors.
  Widget hShake(BuildContext context) {
    final m = context.h.motion;
    if (!m.enabled) return this;
    return animate().shakeX(hz: 4, amount: 4, duration: m.slow);
  }
}

/// Stagger helper for lists: `children.hStaggered(context)` returns the same
/// children each entering `step` later than the previous one.
extension HAnimateList on List<Widget> {
  /// Applies `HAnimate.hFadeInUp` with a growing delay.
  List<Widget> hStaggered(
    BuildContext context, {
    Duration step = const Duration(milliseconds: 40),
    int maxStaggered = 8,
  }) {
    return [
      for (var i = 0; i < length; i++)
        this[i].hFadeInUp(
          context,
          delay: step * (i < maxStaggered ? i : maxStaggered),
        ),
    ];
  }
}
