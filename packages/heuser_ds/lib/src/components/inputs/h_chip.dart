import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/components/buttons/h_pressable.dart';
import 'package:heuser_ds/src/foundation/h_icon.dart';
import 'package:heuser_ds/src/foundation/h_icons.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/tokens/h_motion.dart';
import 'package:heuser_ds/src/tokens/h_radius.dart';
import 'package:heuser_ds/src/tokens/h_spacing.dart';

/// Selectable chip (filters, quick-pick subjects) or removable input chip
/// (chosen items). Selected = brand tint; unselected = outlined.
class HChip extends StatelessWidget {
  /// Creates a chip.
  const HChip(
    this.label, {
    this.selected = false,
    this.onTap,
    this.onDelete,
    this.icon,
    this.enabled = true,
    this.deleteLabel = 'Remove',
    super.key,
  });

  /// Text.
  final String label;

  /// Selected state.
  final bool selected;

  /// Tap handler (toggle).
  final VoidCallback? onTap;

  /// Delete handler; shows a trailing ×.
  final VoidCallback? onDelete;

  /// Leading glyph.
  final IconData? icon;

  /// Enabled.
  final bool enabled;

  /// Accessible label of the delete control.
  final String deleteLabel;

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final c = h.colors;
    return HPressable(
      onPressed: onTap,
      enabled: enabled,
      isButton: onTap != null,
      pressedScale: 0.96,
      semanticsLabel: label,
      excludeChildSemantics: true,
      builder: (context, state) {
        final bg = !enabled
            ? c.surfaceAlt
            : selected
            ? c.brandSoft
            : (state.pressed || state.hovered ? c.surfaceAlt : c.surfaceRaised);
        final fg = !enabled
            ? c.textTertiary
            : (selected ? c.brandStrong : c.textPrimary);
        final border = selected ? c.brandSoft : c.outline;
        return Semantics(
          selected: selected,
          child: AnimatedContainer(
            duration: h.motion.of(h.motion.fast),
            curve: HMotion.easeOut,
            // Grows with the text scale; 36 at 1.0.
            constraints: const BoxConstraints(minHeight: 36),
            padding: EdgeInsets.fromLTRB(
              icon == null ? HSpace.x3 : HSpace.x2 + 2,
              HSpace.x1,
              onDelete == null ? HSpace.x3 : HSpace.x1 + 2,
              HSpace.x1,
            ),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: HRadius.pillAll,
              border: Border.all(color: border, width: 1.2),
              boxShadow: state.focused
                  ? [BoxShadow(color: c.focusRing, spreadRadius: 3)]
                  : const [],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (selected && icon == null) ...[
                  HIcon(HIcons.check, size: HIconSize.sm, color: fg),
                  HSpace.hgap1,
                ],
                if (icon != null) ...[
                  HIcon(icon!, size: HIconSize.sm, color: fg),
                  HSpace.hgap1,
                ],
                // Loose flex: shrinks (ellipsis) in a bounded row, sizes to
                // the text in an unbounded one (horizontal lists).
                Flexible(
                  child: HText(
                    label,
                    style: HTextStyle.labelLg,
                    color: fg,
                    maxLines: 1,
                  ),
                ),
                if (onDelete != null) ...[
                  HSpace.hgap1,
                  GestureDetector(
                    onTap: enabled ? onDelete : null,
                    behavior: HitTestBehavior.opaque,
                    child: Semantics(
                      button: true,
                      label: deleteLabel,
                      child: Padding(
                        padding: const EdgeInsets.all(HSpace.x1),
                        child: HIcon(
                          HIcons.close,
                          size: HIconSize.sm,
                          color: fg,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
