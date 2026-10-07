import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/components/buttons/h_pressable.dart';
import 'package:heuser_ds/src/foundation/h_haptics.dart';
import 'package:heuser_ds/src/foundation/h_icon.dart';
import 'package:heuser_ds/src/foundation/h_icons.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/tokens/h_motion.dart';
import 'package:heuser_ds/src/tokens/h_spacing.dart';

/// Checkbox with an optional label and description (declarations, toggles
/// in forms). The whole row is the tap target.
class HCheckbox extends StatelessWidget {
  /// Creates a checkbox.
  const HCheckbox({
    required this.value,
    required this.onChanged,
    this.label,
    this.description,
    this.error,
    this.enabled = true,
    super.key,
  });

  /// Checked.
  final bool value;

  /// Change handler; `null` disables.
  final ValueChanged<bool>? onChanged;

  /// Label text.
  final String? label;

  /// Secondary text below the label.
  final String? description;

  /// Error text (danger outline + message).
  final String? error;

  /// Enabled.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final c = h.colors;
    final hasError = error != null && error!.isNotEmpty;
    final active = enabled && onChanged != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        HPressable(
          isButton: false,
          haptic: false,
          pressedScale: 1,
          enabled: active,
          onPressed: active
              ? () {
                  unawaited(HHaptics.selection());
                  onChanged!(!value);
                }
              : null,
          builder: (context, state) => Semantics(
            checked: value,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: AnimatedContainer(
                    duration: h.motion.of(h.motion.fast),
                    curve: HMotion.easeOut,
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: value
                          ? (active ? c.brand : c.textTertiary)
                          : c.surfaceRaised,
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      border: Border.all(
                        color: hasError
                            ? c.danger
                            : (value
                                  ? (active ? c.brand : c.textTertiary)
                                  : c.outline),
                        width: 1.6,
                      ),
                      boxShadow: state.focused
                          ? [BoxShadow(color: c.focusRing, spreadRadius: 3)]
                          : const [],
                    ),
                    child: AnimatedScale(
                      scale: value ? 1 : 0,
                      duration: h.motion.of(h.motion.fast),
                      curve: HMotion.spring,
                      child: HIcon(
                        HIcons.check,
                        size: HIconSize.sm,
                        color: c.onBrand,
                      ),
                    ),
                  ),
                ),
                if (label != null) ...[
                  HSpace.hgap3,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HText(
                          label!,
                          style: HTextStyle.bodyLg,
                          tone: active ? HTextTone.primary : HTextTone.tertiary,
                        ),
                        if (description != null) ...[
                          const SizedBox(height: 2),
                          HText(
                            description!,
                            style: HTextStyle.bodySm,
                            tone: HTextTone.secondary,
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        if (hasError) ...[
          HSpace.gap1,
          HText(error!, style: HTextStyle.bodySm, tone: HTextTone.danger),
        ],
      ],
    );
  }
}
