import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/components/feedback/h_status_pill.dart';
import 'package:heuser_ds/src/foundation/h_haptics.dart';
import 'package:heuser_ds/src/foundation/h_icon.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/tokens/h_motion.dart';
import 'package:heuser_ds/src/tokens/h_radius.dart';
import 'package:heuser_ds/src/tokens/h_spacing.dart';

/// One destination of [HNavBar].
class HNavItem {
  /// Creates an item.
  const HNavItem({
    required this.icon,
    required this.label,
    this.badgeCount = 0,
  });

  /// Glyph.
  final IconData icon;

  /// Label.
  final String label;

  /// Unread count shown as a badge (0 hides it).
  final int badgeCount;
}

/// Bottom navigation: the active item gets an animated pill behind its icon.
class HNavBar extends StatelessWidget {
  /// Creates a nav bar.
  const HNavBar({
    required this.items,
    required this.index,
    required this.onChanged,
    super.key,
  }) : assert(items.length >= 2 && items.length <= 5, '2–5 items');

  /// Destinations.
  final List<HNavItem> items;

  /// Selected index.
  final int index;

  /// Selection handler.
  final ValueChanged<int> onChanged;

  /// Minimum bar height excluding the safe area; the bar grows with the
  /// text scale.
  static const double height = 64;

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final c = h.colors;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: c.surfaceRaised,
        border: Border(top: BorderSide(color: c.divider)),
        boxShadow: h.elevation.floating,
      ),
      child: SafeArea(
        top: false,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: height),
          // Every item takes the tallest item's height (full-height targets).
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var i = 0; i < items.length; i++)
                  Expanded(
                    child: _NavButton(
                      item: items[i],
                      selected: i == index,
                      onTap: () {
                        if (i == index) return;
                        unawaited(HHaptics.selection());
                        onChanged(i);
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.item,
    required this.selected,
    required this.onTap,
  });
  final HNavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final c = h.colors;
    return Semantics(
      button: true,
      selected: selected,
      label: item.badgeCount > 0
          ? '${item.label}, ${item.badgeCount}'
          : item.label,
      excludeSemantics: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: HSpace.x1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: h.motion.of(h.motion.standard),
                curve: HMotion.easeOut,
                width: selected ? 56 : 40,
                height: 32,
                decoration: BoxDecoration(
                  color: selected ? c.brandSoft : const Color(0x00000000),
                  borderRadius: HRadius.pillAll,
                ),
                child: Center(
                  child: HBadge(
                    count: item.badgeCount,
                    child: HIcon(
                      item.icon,
                      size: HIconSize.lg,
                      color: selected ? c.navIndicator : c.textSecondary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: HSpace.x1),
              HText(
                item.label,
                style: HTextStyle.labelMd,
                color: selected ? c.navIndicator : c.textSecondary,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
