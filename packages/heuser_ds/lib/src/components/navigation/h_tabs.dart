import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/components/feedback/h_status_pill.dart';
import 'package:heuser_ds/src/foundation/h_haptics.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/tokens/h_motion.dart';
import 'package:heuser_ds/src/tokens/h_radius.dart';
import 'package:heuser_ds/src/tokens/h_spacing.dart';

/// One tab.
class HTab {
  /// Creates a tab.
  const HTab(this.label, {this.badgeCount = 0});

  /// Label.
  final String label;

  /// Count badge (0 hides it).
  final int badgeCount;
}

/// Equal-width tabs with a sliding underline (2–4 tabs). The tracker's
/// To do / Documents / Application / History bar.
class HTabs extends StatelessWidget {
  /// Creates tabs.
  const HTabs({
    required this.tabs,
    required this.index,
    required this.onChanged,
    super.key,
  });

  /// Tabs.
  final List<HTab> tabs;

  /// Selected index.
  final int index;

  /// Selection handler.
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final c = h.colors;
    final n = tabs.length;
    final alignX = n == 1 ? 0.0 : -1 + 2 * index / (n - 1);
    return SizedBox(
      height: 44,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(height: 1, child: ColoredBox(color: c.divider)),
          ),
          Positioned.fill(
            child: AnimatedAlign(
              duration: h.motion.of(h.motion.standard),
              curve: HMotion.easeOut,
              alignment: Alignment(alignX, 1),
              child: FractionallySizedBox(
                widthFactor: 1 / n,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: HSpace.x2),
                  child: Container(
                    height: 3,
                    decoration: BoxDecoration(
                      color: c.navIndicator,
                      borderRadius: HRadius.pillAll,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              for (var i = 0; i < n; i++)
                Expanded(
                  child: Semantics(
                    button: true,
                    selected: i == index,
                    label: tabs[i].label,
                    excludeSemantics: true,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: i == index
                          ? null
                          : () {
                              unawaited(HHaptics.selection());
                              onChanged(i);
                            },
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: HText(
                                tabs[i].label,
                                style: HTextStyle.labelLg,
                                tone: i == index
                                    ? HTextTone.primary
                                    : HTextTone.secondary,
                                maxLines: 1,
                              ),
                            ),
                            if (tabs[i].badgeCount > 0) ...[
                              HSpace.hgap1,
                              HBadge(
                                count: tabs[i].badgeCount,
                                tone: i == index ? HTone.brand : HTone.neutral,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
