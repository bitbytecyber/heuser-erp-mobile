import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/components/buttons/h_pressable.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/tokens/h_motion.dart';
import 'package:heuser_ds/src/tokens/h_radius.dart';
import 'package:heuser_ds/src/tokens/h_spacing.dart';

/// Card depth.
enum HCardElevation {
  /// Outline only.
  flat,

  /// Soft shadow (default).
  raised,

  /// Stronger shadow for emphasised cards.
  floating,
}

/// Raised surface for grouped content. Tappable when [onTap] is given.
class HCard extends StatelessWidget {
  /// Creates a card.
  const HCard({
    required this.child,
    this.onTap,
    this.padding = HSpace.card,
    this.elevation = HCardElevation.raised,
    this.radius = HRadius.lg,
    this.color,
    this.borderColor,
    this.clip = false,
    this.semanticsLabel,
    super.key,
  });

  /// Content.
  final Widget child;

  /// Tap handler (adds press feedback and button semantics).
  final VoidCallback? onTap;

  /// Inner padding.
  final EdgeInsetsGeometry padding;

  /// Depth.
  final HCardElevation elevation;

  /// Corner radius.
  final double radius;

  /// Background; defaults to `surfaceRaised`.
  final Color? color;

  /// Border; defaults to `outlineSoft` for flat cards, none otherwise.
  final Color? borderColor;

  /// Clip children to the rounded shape (images).
  final bool clip;

  /// Semantics label when tappable.
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final shadows = switch (elevation) {
      HCardElevation.flat => h.elevation.flat,
      HCardElevation.raised => h.elevation.raised,
      HCardElevation.floating => h.elevation.floating,
    };
    final border =
        borderColor ??
        (elevation == HCardElevation.flat ? h.colors.outlineSoft : null);

    Widget box(HPressState? state) {
      final bg = color ?? h.colors.surfaceRaised;
      return AnimatedContainer(
        duration: h.motion.of(h.motion.fast),
        curve: HMotion.easeOut,
        clipBehavior: clip ? Clip.antiAlias : Clip.none,
        decoration: BoxDecoration(
          color: state != null && (state.pressed || state.hovered)
              ? Color.lerp(bg, h.colors.textPrimary, 0.03)
              : bg,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          border: border == null ? null : Border.all(color: border),
          boxShadow: [
            ...shadows,
            if (state?.focused ?? false)
              BoxShadow(color: h.colors.focusRing, spreadRadius: 3),
          ],
        ),
        padding: padding,
        child: child,
      );
    }

    if (onTap == null) return box(null);
    return HPressable(
      onPressed: onTap,
      pressedScale: 0.985,
      semanticsLabel: semanticsLabel,
      builder: (context, state) => box(state),
    );
  }
}

/// Soft-gradient hero card for the top of a screen (welcome, application
/// status). Uses `heroGradientStart → heroGradientEnd` and the XL radius.
class HHeroCard extends StatelessWidget {
  /// Creates a hero card.
  const HHeroCard({
    required this.child,
    this.padding = HSpace.hero,
    this.onTap,
    this.inverse = false,
    super.key,
  });

  /// Content.
  final Widget child;

  /// Inner padding.
  final EdgeInsetsGeometry padding;

  /// Tap handler.
  final VoidCallback? onTap;

  /// Navy inverse variant (white text on `surfaceInverse`).
  final bool inverse;

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final c = h.colors;
    final decoration = BoxDecoration(
      gradient: inverse
          ? null
          : LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [c.heroGradientStart, c.heroGradientEnd],
            ),
      color: inverse ? c.surfaceInverse : null,
      borderRadius: HRadius.xlAll,
      boxShadow: h.elevation.floating,
    );
    final body = Container(
      padding: padding,
      decoration: decoration,
      child: child,
    );
    if (onTap == null) return body;
    return HPressable(
      onPressed: onTap,
      pressedScale: 0.985,
      builder: (_, _) => body,
    );
  }
}
