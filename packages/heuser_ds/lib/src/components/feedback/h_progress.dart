import 'package:flutter/material.dart' show CircularProgressIndicator;
import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/tokens/h_radius.dart';

/// Small indeterminate spinner (buttons, inline loading).
class HSpinner extends StatelessWidget {
  /// Creates a spinner.
  const HSpinner({
    this.size = 18,
    this.color,
    this.strokeWidth = 2.2,
    super.key,
  });

  /// Diameter.
  final double size;

  /// Colour; defaults to `brand`.
  final Color? color;

  /// Stroke width.
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    final motion = context.h.motion;
    return SizedBox.square(
      dimension: size,
      child: CircularProgressIndicator(
        value: motion.enabled ? null : 0.72,
        strokeWidth: strokeWidth,
        strokeCap: StrokeCap.round,
        valueColor: AlwaysStoppedAnimation(color ?? context.h.colors.brand),
      ),
    );
  }
}

/// Determinate progress bar with animated value (step progress, uploads).
class HProgressBar extends StatelessWidget {
  /// Creates a bar; [value] is 0..1.
  const HProgressBar({
    required this.value,
    this.height = 6,
    this.color,
    this.trackColor,
    this.semanticsLabel,
    super.key,
  });

  /// 0..1.
  final double value;

  /// Thickness.
  final double height;

  /// Fill colour; defaults to `brand`.
  final Color? color;

  /// Track colour; defaults to `brandSoft`.
  final Color? trackColor;

  /// Semantics label.
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final clamped = value.clamp(0.0, 1.0);
    return Semantics(
      label: semanticsLabel,
      value: '${(clamped * 100).round()}%',
      child: ClipRRect(
        borderRadius: HRadius.pillAll,
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              Positioned.fill(
                child: ColoredBox(color: trackColor ?? h.colors.brandSoft),
              ),
              AnimatedFractionallySizedBox(
                duration: h.motion.of(h.motion.slow),
                curve: Curves.easeOutCubic,
                alignment: Alignment.centerLeft,
                widthFactor: clamped,
                heightFactor: 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: color ?? h.colors.brand,
                    borderRadius: HRadius.pillAll,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
