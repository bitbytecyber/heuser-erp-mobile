import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/components/buttons/h_pressable.dart';
import 'package:heuser_ds/src/components/feedback/h_status_pill.dart';
import 'package:heuser_ds/src/foundation/h_icon.dart';
import 'package:heuser_ds/src/foundation/h_icons.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/tokens/h_motion.dart';
import 'package:heuser_ds/src/tokens/h_radius.dart';
import 'package:heuser_ds/src/tokens/h_spacing.dart';

/// Row with a leading glyph in a tinted circle, title, subtitle and a
/// trailing widget (chevron by default when tappable). Used for settings,
/// task lists and document rows.
class HListTile extends StatelessWidget {
  /// Creates a tile.
  const HListTile({
    required this.title,
    this.subtitle,
    this.icon,
    this.leading,
    this.trailing,
    this.onTap,
    this.tone = HTone.brand,
    this.showChevron = true,
    this.padding = const EdgeInsets.symmetric(
      horizontal: HSpace.x4,
      vertical: HSpace.x3,
    ),
    this.enabled = true,
    super.key,
  });

  /// Title.
  final String title;

  /// Subtitle.
  final String? subtitle;

  /// Leading glyph (in a tinted circle).
  final IconData? icon;

  /// Custom leading (overrides [icon]).
  final Widget? leading;

  /// Trailing widget (pill, switch, text).
  final Widget? trailing;

  /// Tap handler.
  final VoidCallback? onTap;

  /// Tone of the icon circle.
  final HTone tone;

  /// Show a chevron when tappable and no [trailing] is given.
  final bool showChevron;

  /// Padding.
  final EdgeInsetsGeometry padding;

  /// Enabled.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final c = h.colors;
    final (bg, fg) = tone.resolve(h);
    final lead =
        leading ??
        (icon == null
            ? null
            : Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: HRadius.smAll,
                ),
                child: Center(child: HIcon(icon!, color: fg)),
              ));
    final trail =
        trailing ??
        (onTap != null && showChevron
            ? const HIcon(HIcons.chevronRight, tone: HTextTone.tertiary)
            : null);

    Widget row(HPressState? state) => AnimatedContainer(
      duration: h.motion.of(h.motion.fast),
      curve: HMotion.easeOut,
      padding: padding,
      color: state != null && (state.pressed || state.hovered)
          ? c.surfaceAlt
          : const Color(0x00000000),
      child: Row(
        children: [
          if (lead != null) ...[lead, HSpace.hgap3],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HText(
                  title,
                  style: HTextStyle.titleMd,
                  tone: enabled ? HTextTone.primary : HTextTone.tertiary,
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  HText(
                    subtitle!,
                    style: HTextStyle.bodySm,
                    tone: HTextTone.secondary,
                    maxLines: 2,
                  ),
                ],
              ],
            ),
          ),
          if (trail != null) ...[HSpace.hgap3, trail],
        ],
      ),
    );

    if (onTap == null) return row(null);
    return HPressable(
      onPressed: enabled ? onTap : null,
      pressedScale: 1,
      haptic: false,
      semanticsLabel: title,
      builder: (context, state) => row(state),
    );
  }
}

/// Hairline separator (use between [HListTile]s).
class HDivider extends StatelessWidget {
  /// Creates a divider.
  const HDivider({this.indent = 0, super.key});

  /// Left inset.
  final double indent;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(left: indent),
    child: SizedBox(
      height: 1,
      child: ColoredBox(color: context.h.colors.divider),
    ),
  );
}
