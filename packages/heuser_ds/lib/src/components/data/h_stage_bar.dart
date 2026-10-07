import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/foundation/h_icon.dart';
import 'package:heuser_ds/src/foundation/h_icons.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/tokens/h_motion.dart';
import 'package:heuser_ds/src/tokens/h_spacing.dart';

/// One stage of the admissions tracker.
class HStage {
  /// Creates a stage.
  const HStage({required this.key, required this.label});

  /// Backend key (`received`, `under_review`, …).
  final String key;

  /// Label.
  final String label;
}

/// Horizontal stage tracker: done (green check), now (brand, ring), next
/// (outline). [currentIndex] `-1` = ended, `== stages.length` = all done.
/// Scrolls horizontally and starts scrolled to the current stage; grows
/// with the text scale so two-line labels never clip.
///
/// Screen readers hear [semanticsLabel] (e.g. "Stage 3 of 8: Interview")
/// instead of eight separate dots.
class HStageBar extends StatefulWidget {
  /// Creates a stage bar.
  const HStageBar({
    required this.stages,
    required this.currentIndex,
    this.semanticsLabel,
    super.key,
  });

  /// One sentence describing the progress, read instead of the dots.
  final String? semanticsLabel;

  /// Stages in order.
  final List<HStage> stages;

  /// Index rule: `-1` ended; `stages.length` everything done.
  final int currentIndex;

  @override
  State<HStageBar> createState() => _HStageBarState();
}

class _HStageBarState extends State<HStageBar> {
  final _controller = ScrollController();
  static const _itemWidth = 96.0;
  static const _dotBox = 36.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollToCurrent(animate: false),
    );
  }

  @override
  void didUpdateWidget(HStageBar old) {
    super.didUpdateWidget(old);
    if (old.currentIndex != widget.currentIndex) {
      _scrollToCurrent(animate: true);
    }
  }

  void _scrollToCurrent({required bool animate}) {
    if (!mounted || !_controller.hasClients || widget.stages.isEmpty) return;
    final i = widget.currentIndex.clamp(0, widget.stages.length - 1);
    final target = (i * _itemWidth - _itemWidth).clamp(
      0.0,
      _controller.position.maxScrollExtent,
    );
    if (animate && context.h.motion.enabled) {
      _controller.animateTo(
        target,
        duration: context.h.motion.slow,
        curve: HMotion.easeOut,
      );
    } else {
      _controller.jumpTo(target);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final c = h.colors;
    final ended = widget.currentIndex < 0;
    final label = h.type.labelSm;
    final labelLines = MediaQuery.textScalerOf(context)
        .scale((label.fontSize ?? 12) * (label.height ?? 1.3) * 2);
    final bar = SizedBox(
      height: _dotBox + HSpace.x1 + labelLines + HSpace.x1,
      child: ListView.builder(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: HSpace.x2),
        itemCount: widget.stages.length,
        itemBuilder: (context, i) {
          final done = !ended && i < widget.currentIndex;
          final now = !ended && i == widget.currentIndex;
          final dotColor = done ? c.success : (now ? c.brand : c.surfaceAlt);
          final lineBefore = i == 0
              ? null
              : (done || now ? c.success : c.outlineSoft);
          final lineAfter = i == widget.stages.length - 1
              ? null
              : (done ? c.success : c.outlineSoft);
          return SizedBox(
            width: _itemWidth,
            child: Column(
              children: [
                SizedBox(
                  height: _dotBox,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 2,
                              child: lineBefore == null
                                  ? null
                                  : ColoredBox(color: lineBefore),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 2,
                              child: lineAfter == null
                                  ? null
                                  : ColoredBox(color: lineAfter),
                            ),
                          ),
                        ],
                      ),
                      AnimatedContainer(
                        duration: h.motion.of(h.motion.standard),
                        curve: HMotion.easeOut,
                        width: now ? 30 : 24,
                        height: now ? 30 : 24,
                        decoration: BoxDecoration(
                          color: dotColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: done
                                ? c.success
                                : (now ? c.brandSoft : c.outline),
                            width: now ? 4 : 1.5,
                          ),
                        ),
                        child: Center(
                          child: done
                              ? HIcon(
                                  HIcons.check,
                                  size: HIconSize.sm,
                                  color: c.onSuccess,
                                )
                              : ended && i == 0
                              ? HIcon(
                                  HIcons.close,
                                  size: HIconSize.sm,
                                  color: c.textTertiary,
                                )
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
                HSpace.gap1,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: HSpace.x1),
                  child: HText(
                    widget.stages[i].label,
                    style: HTextStyle.labelSm,
                    tone: now
                        ? HTextTone.primary
                        : (done ? HTextTone.secondary : HTextTone.tertiary),
                    align: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
    final text = widget.semanticsLabel;
    if (text == null) return bar;
    return Semantics(
      container: true,
      label: text,
      child: ExcludeSemantics(child: bar),
    );
  }
}
