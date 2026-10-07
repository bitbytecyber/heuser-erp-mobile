import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/components/buttons/h_pressable.dart';
import 'package:heuser_ds/src/foundation/h_icon.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/tokens/h_motion.dart';
import 'package:heuser_ds/src/tokens/h_radius.dart';

/// Icon button container style.
enum HIconButtonVariant {
  /// No container (app bar actions).
  ghost,

  /// Pastel brand circle.
  tonal,

  /// Brand circle.
  filled,

  /// Outlined circle.
  outline,
}

/// Circular icon button with a 44px tap target.
class HIconButton extends StatelessWidget {
  /// Creates an icon button. [semanticsLabel] is required: an icon alone is
  /// not accessible.
  const HIconButton({
    required this.icon,
    required this.onPressed,
    required this.semanticsLabel,
    this.variant = HIconButtonVariant.ghost,
    this.size = 44,
    this.badge = false,
    super.key,
  });

  /// Glyph.
  final IconData icon;

  /// Handler; `null` disables.
  final VoidCallback? onPressed;

  /// Accessible name.
  final String semanticsLabel;

  /// Container style.
  final HIconButtonVariant variant;

  /// Outer diameter (also the tap target).
  final double size;

  /// Shows a small brand dot (unread indicator).
  final bool badge;

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final c = h.colors;
    return HPressable(
      onPressed: onPressed,
      semanticsLabel: semanticsLabel,
      excludeChildSemantics: true,
      pressedScale: 0.92,
      builder: (context, state) {
        final (bg, fg, border) = switch (variant) {
          HIconButtonVariant.ghost => (
            state.pressed || state.hovered
                ? c.surfaceAlt
                : const Color(0x00000000),
            state.enabled ? c.textPrimary : c.textTertiary,
            null,
          ),
          HIconButtonVariant.tonal => (
            state.enabled ? c.brandSoft : c.surfaceAlt,
            state.enabled ? c.brandStrong : c.textTertiary,
            null,
          ),
          HIconButtonVariant.filled => (
            state.enabled ? c.brand : c.surfaceAlt,
            state.enabled ? c.onBrand : c.textTertiary,
            null,
          ),
          HIconButtonVariant.outline => (
            state.pressed || state.hovered
                ? c.surfaceAlt
                : const Color(0x00000000),
            state.enabled ? c.textPrimary : c.textTertiary,
            state.enabled ? c.outline : c.outlineSoft,
          ),
        };
        return AnimatedContainer(
          duration: h.motion.of(h.motion.fast),
          curve: HMotion.easeOut,
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: bg,
            shape: BoxShape.circle,
            border: border == null
                ? null
                : Border.all(color: border, width: 1.2),
            boxShadow: state.focused
                ? [BoxShadow(color: c.focusRing, spreadRadius: 3)]
                : const [],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              HIcon(icon, size: HIconSize.lg, color: fg),
              if (badge)
                Positioned(
                  top: size * 0.22,
                  right: size * 0.22,
                  child: Container(
                    width: 9,
                    height: 9,
                    decoration: BoxDecoration(
                      color: c.danger,
                      borderRadius: HRadius.pillAll,
                      border: Border.all(color: c.surface, width: 1.5),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
