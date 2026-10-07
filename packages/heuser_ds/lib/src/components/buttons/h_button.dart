import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/components/buttons/h_pressable.dart';
import 'package:heuser_ds/src/components/feedback/h_progress.dart';
import 'package:heuser_ds/src/foundation/h_icon.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/theme/h_theme_data.dart';
import 'package:heuser_ds/src/tokens/h_motion.dart';
import 'package:heuser_ds/src/tokens/h_radius.dart';
import 'package:heuser_ds/src/tokens/h_spacing.dart';

/// Visual weight of a button.
enum HButtonVariant {
  /// Brand fill: the one primary action on a screen.
  filled,

  /// Pastel brand tint: secondary actions.
  tonal,

  /// 1px outline: tertiary actions, "Finish later".
  outline,

  /// No container: inline actions.
  ghost,

  /// Danger fill: destructive confirmations.
  danger,
}

/// Button heights.
enum HButtonSize {
  /// 36
  sm(36, HSpace.x3),

  /// 48 (default)
  md(48, HSpace.x5),

  /// 56 (bottom CTA)
  lg(56, HSpace.x6);

  HButtonSize(this.height, this.hPad);

  /// Height.
  final double height;

  /// Horizontal padding.
  final double hPad;
}

/// Resolved colours for a variant/state.
class _Look {
  const _Look(this.bg, this.fg, this.border);
  final Color bg;
  final Color fg;
  final Color? border;
}

_Look _look(HThemeData h, HButtonVariant v, HPressState s) {
  final c = h.colors;
  if (!s.enabled) {
    return switch (v) {
      HButtonVariant.ghost => _Look(
        const Color(0x00000000),
        c.textTertiary,
        null,
      ),
      HButtonVariant.outline => _Look(
        const Color(0x00000000),
        c.textTertiary,
        c.outlineSoft,
      ),
      _ => _Look(c.surfaceAlt, c.textTertiary, null),
    };
  }
  final dim = s.pressed ? 0.88 : (s.hovered ? 0.94 : 1.0);
  Color shade(Color base) => Color.lerp(base, c.textPrimary, 1 - dim)!;
  return switch (v) {
    HButtonVariant.filled => _Look(shade(c.brand), c.onBrand, null),
    HButtonVariant.tonal => _Look(shade(c.brandSoft), c.brandStrong, null),
    HButtonVariant.outline => _Look(
      s.pressed || s.hovered ? c.surfaceAlt : const Color(0x00000000),
      c.textPrimary,
      c.outline,
    ),
    HButtonVariant.ghost => _Look(
      s.pressed || s.hovered
          ? c.brandSoft.withValues(alpha: 0.5)
          : const Color(0x00000000),
      c.brand,
      null,
    ),
    HButtonVariant.danger => _Look(shade(c.danger), c.onDanger, null),
  };
}

/// The button. One `filled` per screen; everything else is quieter.
class HButton extends StatelessWidget {
  /// Creates a button.
  const HButton({
    required this.label,
    required this.onPressed,
    this.variant = HButtonVariant.filled,
    this.size = HButtonSize.md,
    this.icon,
    this.trailingIcon,
    this.loading = false,
    this.expand = true,
    this.semanticsLabel,
    super.key,
  });

  /// Filled variant.
  const HButton.filled({
    required this.label,
    required this.onPressed,
    this.size = HButtonSize.md,
    this.icon,
    this.trailingIcon,
    this.loading = false,
    this.expand = true,
    this.semanticsLabel,
    super.key,
  }) : variant = HButtonVariant.filled;

  /// Tonal variant.
  const HButton.tonal({
    required this.label,
    required this.onPressed,
    this.size = HButtonSize.md,
    this.icon,
    this.trailingIcon,
    this.loading = false,
    this.expand = true,
    this.semanticsLabel,
    super.key,
  }) : variant = HButtonVariant.tonal;

  /// Outline variant.
  const HButton.outline({
    required this.label,
    required this.onPressed,
    this.size = HButtonSize.md,
    this.icon,
    this.trailingIcon,
    this.loading = false,
    this.expand = true,
    this.semanticsLabel,
    super.key,
  }) : variant = HButtonVariant.outline;

  /// Ghost variant (not expanded by default).
  const HButton.ghost({
    required this.label,
    required this.onPressed,
    this.size = HButtonSize.md,
    this.icon,
    this.trailingIcon,
    this.loading = false,
    this.expand = false,
    this.semanticsLabel,
    super.key,
  }) : variant = HButtonVariant.ghost;

  /// Danger variant.
  const HButton.danger({
    required this.label,
    required this.onPressed,
    this.size = HButtonSize.md,
    this.icon,
    this.trailingIcon,
    this.loading = false,
    this.expand = true,
    this.semanticsLabel,
    super.key,
  }) : variant = HButtonVariant.danger;

  /// Text.
  final String label;

  /// Handler; `null` disables.
  final VoidCallback? onPressed;

  /// Variant.
  final HButtonVariant variant;

  /// Size.
  final HButtonSize size;

  /// Leading glyph.
  final IconData? icon;

  /// Trailing glyph.
  final IconData? trailingIcon;

  /// Shows a spinner and disables input while `true`.
  final bool loading;

  /// Fills the available width.
  final bool expand;

  /// Semantics label (defaults to [label]).
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final textStyle = size == HButtonSize.sm
        ? HTextStyle.labelMd
        : HTextStyle.labelLg;
    return HPressable(
      onPressed: loading ? null : onPressed,
      enabled: !loading && onPressed != null,
      semanticsLabel: semanticsLabel ?? label,
      excludeChildSemantics: true,
      builder: (context, state) {
        final look = _look(
          h,
          variant,
          loading
              ? const HPressState(
                  pressed: false,
                  hovered: false,
                  focused: false,
                  enabled: true,
                )
              : state,
        );
        return AnimatedContainer(
          duration: h.motion.of(h.motion.fast),
          curve: HMotion.easeOut,
          height: size.height,
          width: expand ? double.infinity : null,
          padding: EdgeInsets.symmetric(horizontal: size.hPad),
          decoration: BoxDecoration(
            color: look.bg,
            borderRadius: HRadius.mdAll,
            border: look.border == null
                ? null
                : Border.all(color: look.border!, width: 1.2),
            boxShadow: state.focused
                ? [BoxShadow(color: h.colors.focusRing, spreadRadius: 3)]
                : const [],
          ),
          child: Row(
            mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (loading) ...[
                HSpinner(color: look.fg),
                HSpace.hgap2,
              ] else if (icon != null) ...[
                HIcon(icon!, color: look.fg),
                HSpace.hgap2,
              ],
              Flexible(
                child: HText(
                  label,
                  style: textStyle,
                  color: look.fg,
                  maxLines: 1,
                ),
              ),
              if (trailingIcon != null && !loading) ...[
                HSpace.hgap2,
                HIcon(trailingIcon!, color: look.fg),
              ],
            ],
          ),
        );
      },
    );
  }
}
