import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/components/buttons/h_pressable.dart';
import 'package:heuser_ds/src/foundation/h_haptics.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/tokens/h_motion.dart';
import 'package:heuser_ds/src/tokens/h_radius.dart';
import 'package:heuser_ds/src/tokens/h_spacing.dart';

/// Toggle switch (settings rows, "I am a private candidate").
class HSwitch extends StatelessWidget {
  /// Creates a switch.
  const HSwitch({
    required this.value,
    required this.onChanged,
    this.label,
    this.description,
    this.enabled = true,
    super.key,
  });

  /// On.
  final bool value;

  /// Change handler; `null` disables.
  final ValueChanged<bool>? onChanged;

  /// Label (left of the switch).
  final String? label;

  /// Secondary text under the label.
  final String? description;

  /// Enabled.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final c = h.colors;
    final active = enabled && onChanged != null;
    final track = HPressable(
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
        toggled: value,
        child: AnimatedContainer(
          duration: h.motion.of(h.motion.standard),
          curve: HMotion.easeOut,
          width: 48,
          height: 28,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: !active ? c.outlineSoft : (value ? c.brand : c.outline),
            borderRadius: HRadius.pillAll,
            boxShadow: state.focused
                ? [BoxShadow(color: c.focusRing, spreadRadius: 3)]
                : const [],
          ),
          child: AnimatedAlign(
            duration: h.motion.of(h.motion.standard),
            curve: HMotion.easeOut,
            alignment: value ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: c.surfaceRaised,
                shape: BoxShape.circle,
                boxShadow: h.elevation.raised,
              ),
            ),
          ),
        ),
      ),
    );
    if (label == null) return track;
    return MergeSemantics(
      child: Row(
        children: [
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
          HSpace.hgap3,
          track,
        ],
      ),
    );
  }
}
