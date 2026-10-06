import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/foundation/h_icon.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/theme/h_theme_data.dart';
import 'package:heuser_ds/src/tokens/h_radius.dart';
import 'package:heuser_ds/src/tokens/h_spacing.dart';

/// Semantic tone of a pill/badge/banner.
enum HTone {
  /// Neutral grey.
  neutral,

  /// Brand tint.
  brand,

  /// Green.
  success,

  /// Amber.
  warning,

  /// Red.
  danger,

  /// Blue.
  info;

  /// (background, foreground) for the tone.
  (Color, Color) resolve(HThemeData h) {
    final c = h.colors;
    return switch (this) {
      HTone.neutral => (c.surfaceAlt, c.textSecondary),
      HTone.brand => (c.brandSoft, c.brandStrong),
      HTone.success => (c.successSoft, c.success),
      HTone.warning => (c.warningSoft, c.warning),
      HTone.danger => (c.dangerSoft, c.danger),
      HTone.info => (c.infoSoft, c.info),
    };
  }

  /// Solid (fill, on-fill) for the tone.
  (Color, Color) resolveSolid(HThemeData h) {
    final c = h.colors;
    return switch (this) {
      HTone.neutral => (c.surfaceInverse, c.textInverse),
      HTone.brand => (c.brand, c.onBrand),
      HTone.success => (c.success, c.onSuccess),
      HTone.warning => (c.warning, c.onWarning),
      HTone.danger => (c.danger, c.onDanger),
      HTone.info => (c.info, c.onInfo),
    };
  }
}

/// Status pill: soft tint, small label, optional leading icon. Used for
/// application status, document state, instalment state.
class HStatusPill extends StatelessWidget {
  /// Creates a pill.
  const HStatusPill(
    this.label, {
    this.tone = HTone.neutral,
    this.icon,
    this.solid = false,
    this.semanticsLabel,
    super.key,
  });

  /// Text.
  final String label;

  /// Tone.
  final HTone tone;

  /// Leading glyph.
  final IconData? icon;

  /// Solid fill instead of a soft tint.
  final bool solid;

  /// Semantics label.
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final (bg, fg) = solid ? tone.resolveSolid(h) : tone.resolve(h);
    return Semantics(
      label: semanticsLabel ?? label,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: HSpace.x2 + 2,
          vertical: HSpace.x1,
        ),
        decoration: BoxDecoration(color: bg, borderRadius: HRadius.pillAll),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              HIcon(icon!, size: HIconSize.sm, color: fg),
              HSpace.hgap1,
            ],
            HText(label, style: HTextStyle.labelMd, color: fg, maxLines: 1),
          ],
        ),
      ),
    );
  }
}

/// Count badge (unread notifications) or dot.
class HBadge extends StatelessWidget {
  /// Creates a badge; `count == 0` renders nothing, `count == null` a dot.
  const HBadge({this.count, this.tone = HTone.danger, this.child, super.key});

  /// Number to show; capped at 99+.
  final int? count;

  /// Tone.
  final HTone tone;

  /// Widget the badge is anchored to (top-right).
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final (bg, fg) = tone.resolveSolid(h);
    if (count == 0) return child ?? const SizedBox.shrink();
    final text = count == null ? null : (count! > 99 ? '99+' : '$count');
    final badge = Container(
      constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
      padding: EdgeInsets.symmetric(
        horizontal: text == null ? 0 : HSpace.x1 + 1,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: HRadius.pillAll,
        border: Border.all(color: h.colors.surface, width: 1.5),
      ),
      alignment: Alignment.center,
      child: text == null
          ? const SizedBox(width: 6, height: 6)
          : HText(text, style: HTextStyle.labelSm, color: fg),
    );
    if (child == null) return badge;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child!,
        Positioned(top: -4, right: -6, child: badge),
      ],
    );
  }
}
