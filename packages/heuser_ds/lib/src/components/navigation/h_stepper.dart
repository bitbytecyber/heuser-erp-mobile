import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/components/feedback/h_progress.dart';
import 'package:heuser_ds/src/foundation/h_icon.dart';
import 'package:heuser_ds/src/foundation/h_icons.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/tokens/h_motion.dart';
import 'package:heuser_ds/src/tokens/h_spacing.dart';

/// Header for a multi-step form: "Step 2 of 3 · Your studies", a progress
/// bar and tappable step dots (only reachable steps respond).
class HStepper extends StatelessWidget {
  /// Creates a stepper.
  const HStepper({
    required this.steps,
    required this.current,
    required this.completed,
    this.onStepTap,
    this.isReachable,
    this.stepLabel = 'Step',
    this.ofLabel = 'of',
    super.key,
  });

  /// Step titles.
  final List<String> steps;

  /// Current step index (0-based).
  final int current;

  /// Number of completed steps (steps `< completed` show a check).
  final int completed;

  /// Tap handler.
  final ValueChanged<int>? onStepTap;

  /// Whether a step can be jumped to; defaults to completed or current.
  final bool Function(int index)? isReachable;

  /// "Step" word (localised by the app).
  final String stepLabel;

  /// "of" word (localised by the app).
  final String ofLabel;

  bool _reachable(int i) =>
      isReachable?.call(i) ?? (i <= completed || i == current);

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final c = h.colors;
    final progress = (current + 1) / steps.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: HText(
                '$stepLabel ${current + 1} $ofLabel ${steps.length} · ${steps[current]}',
                style: HTextStyle.titleSm,
                tone: HTextTone.secondary,
                maxLines: 1,
              ),
            ),
            HText(
              '${(progress * 100).round()}%',
              style: HTextStyle.labelMd,
              tone: HTextTone.brand,
            ),
          ],
        ),
        HSpace.gap2,
        HProgressBar(
          value: progress,
          semanticsLabel: '$stepLabel ${current + 1} $ofLabel ${steps.length}',
        ),
        HSpace.gap3,
        Row(
          children: [
            for (var i = 0; i < steps.length; i++) ...[
              if (i > 0) HSpace.hgap2,
              Expanded(
                child: Semantics(
                  button: _reachable(i) && onStepTap != null,
                  selected: i == current,
                  label: steps[i],
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: _reachable(i) && onStepTap != null && i != current
                        ? () => onStepTap!(i)
                        : null,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedContainer(
                          duration: h.motion.of(h.motion.standard),
                          curve: HMotion.easeOut,
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: i < completed
                                ? c.success
                                : i == current
                                ? c.brand
                                : c.surfaceAlt,
                            border: Border.all(
                              color: i < completed
                                  ? c.success
                                  : i == current
                                  ? c.brand
                                  : c.outline,
                              width: 1.5,
                            ),
                          ),
                          child: Center(
                            child: i < completed
                                ? HIcon(
                                    HIcons.check,
                                    size: HIconSize.sm,
                                    color: c.onSuccess,
                                  )
                                : HText(
                                    '${i + 1}',
                                    style: HTextStyle.labelSm,
                                    color: i == current
                                        ? c.onBrand
                                        : c.textTertiary,
                                  ),
                          ),
                        ),
                        HSpace.hgap2,
                        Flexible(
                          child: HText(
                            steps[i],
                            style: HTextStyle.labelMd,
                            tone: i == current
                                ? HTextTone.primary
                                : _reachable(i)
                                ? HTextTone.secondary
                                : HTextTone.tertiary,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
