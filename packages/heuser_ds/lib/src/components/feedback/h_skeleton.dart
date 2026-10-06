import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/tokens/h_radius.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Turns its subtree into a shimmering skeleton while [enabled]. Build the
/// real layout with placeholder data and wrap it: the skeleton then matches
/// the loaded layout exactly, which is what makes the swap feel instant.
class HSkeleton extends StatelessWidget {
  /// Creates a skeleton wrapper.
  const HSkeleton({required this.enabled, required this.child, super.key});

  /// Whether to show the skeleton.
  final bool enabled;

  /// The real layout (rendered with placeholder data while loading).
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    return Skeletonizer(
      enabled: enabled,
      enableSwitchAnimation: h.motion.enabled,
      switchAnimationConfig: SwitchAnimationConfig(
        duration: h.motion.of(h.motion.standard),
      ),
      effect: h.motion.enabled
          ? ShimmerEffect(
              baseColor: h.colors.shimmerBase,
              highlightColor: h.colors.shimmerHighlight,
              duration: const Duration(milliseconds: 1400),
            )
          : SolidColorEffect(color: h.colors.shimmerBase),
      containersColor: h.colors.shimmerBase,
      child: child,
    );
  }
}

/// A fixed-size placeholder block for places where no layout exists yet.
class HSkeletonBox extends StatelessWidget {
  /// Creates a block.
  const HSkeletonBox({
    this.width,
    this.height = 16,
    this.radius = HRadius.sm,
    super.key,
  });

  /// Width (null = fill).
  final double? width;

  /// Height.
  final double height;

  /// Corner radius.
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: context.h.colors.shimmerBase,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
    );
  }
}
