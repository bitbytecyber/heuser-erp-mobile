import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/foundation/h_haptics.dart';
import 'package:heuser_ds/src/foundation/h_icon.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/tokens/h_motion.dart';
import 'package:heuser_ds/src/tokens/h_radius.dart';
import 'package:heuser_ds/src/tokens/h_spacing.dart';

/// One segment.
class HSegment<T> {
  /// Creates a segment.
  const HSegment({required this.value, required this.label, this.icon});

  /// Value.
  final T value;

  /// Label.
  final String label;

  /// Optional glyph.
  final IconData? icon;
}

/// Segmented control with a sliding pill indicator (AS / A2, online / bank).
class HSegmented<T> extends StatelessWidget {
  /// Creates a segmented control (two or more segments).
  const HSegmented({
    required this.segments,
    required this.value,
    required this.onChanged,
    this.enabled = true,
    super.key,
  });

  /// Segments.
  final List<HSegment<T>> segments;

  /// Selected value; `null` shows no indicator (nothing chosen yet).
  final T? value;

  /// Change handler.
  final ValueChanged<T>? onChanged;

  /// Enabled.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final c = h.colors;
    final active = enabled && onChanged != null;
    final n = segments.length;
    final selectedIndex = segments.indexWhere((s) => s.value == value);
    final index = selectedIndex.clamp(0, n - 1);
    final alignX = n == 1 ? 0.0 : -1 + 2 * index / (n - 1);
    final hasSelection = selectedIndex >= 0;
    return Container(
      // Grows with the text scale; 44 at 1.0.
      constraints: const BoxConstraints(minHeight: 44),
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: c.surfaceAlt,
        borderRadius: HRadius.mdAll,
      ),
      // Passthrough so the row inherits the minimum height.
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned.fill(
            child: AnimatedAlign(
              duration: h.motion.of(h.motion.standard),
              curve: HMotion.easeOut,
              alignment: Alignment(alignX, 0),
              child: FractionallySizedBox(
                widthFactor: 1 / n,
                heightFactor: 1,
                child: AnimatedOpacity(
                  duration: h.motion.of(h.motion.fast),
                  opacity: hasSelection ? 1 : 0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: active ? c.surfaceRaised : c.outlineSoft,
                      borderRadius: HRadius.smAll,
                      boxShadow: h.elevation.raised,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Every segment takes the tallest one's height (full-height targets).
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final s in segments)
                  Expanded(
                    child: Semantics(
                      button: true,
                      selected: s.value == value,
                      label: s.label,
                      excludeSemantics: true,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: active && s.value != value
                            ? () {
                                unawaited(HHaptics.selection());
                                onChanged!(s.value);
                              }
                            : null,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: HSpace.x2,
                          ),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (s.icon != null) ...[
                                  HIcon(
                                    s.icon!,
                                    size: HIconSize.sm,
                                    tone: s.value == value && active
                                        ? HTextTone.brand
                                        : HTextTone.secondary,
                                  ),
                                  HSpace.hgap1,
                                ],
                                Flexible(
                                  child: HText(
                                    s.label,
                                    style: HTextStyle.labelLg,
                                    tone: !active
                                        ? HTextTone.tertiary
                                        : s.value == value
                                        ? HTextTone.primary
                                        : HTextTone.secondary,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
