import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/components/buttons/h_pressable.dart';
import 'package:heuser_ds/src/foundation/h_haptics.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/tokens/h_motion.dart';
import 'package:heuser_ds/src/tokens/h_spacing.dart';

/// One option of a radio group. Build the group as a `Column` of these
/// sharing [groupValue] and [onChanged].
class HRadio<T> extends StatelessWidget {
  /// Creates a radio option.
  const HRadio({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,
    this.description,
    this.enabled = true,
    super.key,
  });

  /// This option's value.
  final T value;

  /// The selected value of the group.
  final T? groupValue;

  /// Selection handler; `null` disables.
  final ValueChanged<T>? onChanged;

  /// Label.
  final String label;

  /// Secondary text.
  final String? description;

  /// Enabled.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final c = h.colors;
    final selected = value == groupValue;
    final active = enabled && onChanged != null;
    return HPressable(
      isButton: false,
      haptic: false,
      pressedScale: 1,
      enabled: active,
      onPressed: active
          ? () {
              unawaited(HHaptics.selection());
              onChanged!(value);
            }
          : null,
      builder: (context, state) => Semantics(
        inMutuallyExclusiveGroup: true,
        checked: selected,
        label: label,
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
                  shape: BoxShape.circle,
                  color: c.surfaceRaised,
                  border: Border.all(
                    color: !active
                        ? c.outlineSoft
                        : (selected ? c.brand : c.outline),
                    width: selected ? 6.5 : 1.6,
                  ),
                  boxShadow: state.focused
                      ? [BoxShadow(color: c.focusRing, spreadRadius: 3)]
                      : const [],
                ),
              ),
            ),
            HSpace.hgap3,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HText(
                    label,
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
        ),
      ),
    );
  }
}
