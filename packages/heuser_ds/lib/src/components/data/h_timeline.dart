import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/components/feedback/h_status_pill.dart';
import 'package:heuser_ds/src/foundation/h_icon.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/tokens/h_spacing.dart';

/// One timeline entry.
class HTimelineEntry {
  /// Creates an entry.
  const HTimelineEntry({
    required this.title,
    required this.timestamp,
    this.subtitle,
    this.icon,
    this.tone = HTone.neutral,
  });

  /// What happened.
  final String title;

  /// When, already formatted.
  final String timestamp;

  /// Note.
  final String? subtitle;

  /// Glyph in the dot (none → plain dot).
  final IconData? icon;

  /// Dot tone.
  final HTone tone;
}

/// Vertical history: tinted dots on a hairline, newest first.
class HTimeline extends StatelessWidget {
  /// Creates a timeline.
  const HTimeline({required this.entries, super.key});

  /// Entries in display order.
  final List<HTimelineEntry> entries;

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final c = h.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < entries.length; i++)
          _Row(
            entry: entries[i],
            isLast: i == entries.length - 1,
            lineColor: c.outlineSoft,
          ),
      ],
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({
    required this.entry,
    required this.isLast,
    required this.lineColor,
  });
  final HTimelineEntry entry;
  final bool isLast;
  final Color lineColor;

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final (bg, fg) = entry.tone.resolve(h);
    final dotSize = entry.icon == null ? 12.0 : 28.0;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 28,
            child: Column(
              children: [
                SizedBox(
                  height: 28,
                  child: Center(
                    child: Container(
                      width: dotSize,
                      height: dotSize,
                      decoration: BoxDecoration(
                        color: entry.icon == null ? fg : bg,
                        shape: BoxShape.circle,
                        border: entry.icon == null
                            ? Border.all(color: h.colors.surface, width: 2)
                            : null,
                      ),
                      child: entry.icon == null
                          ? null
                          : Center(
                              child: HIcon(
                                entry.icon!,
                                size: HIconSize.sm,
                                color: fg,
                              ),
                            ),
                    ),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        width: 2,
                        child: ColoredBox(color: lineColor),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          HSpace.hgap3,
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: HSpace.x1,
                bottom: isLast ? 0 : HSpace.x5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HText(entry.title, style: HTextStyle.titleMd),
                  const SizedBox(height: 2),
                  HText(
                    entry.timestamp,
                    style: HTextStyle.bodySm,
                    tone: HTextTone.tertiary,
                  ),
                  if (entry.subtitle != null && entry.subtitle!.isNotEmpty) ...[
                    HSpace.gap1,
                    HText(entry.subtitle!, tone: HTextTone.secondary),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
