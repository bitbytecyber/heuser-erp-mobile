import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/tokens/h_spacing.dart';

/// Label + value pair for read-only summaries (application review, offer
/// details). Stacks by default; [inline] puts them on one row.
class HKeyValue extends StatelessWidget {
  /// Creates a pair.
  const HKeyValue({
    required this.label,
    required this.value,
    this.inline = false,
    this.valueStyle = HTextStyle.bodyLg,
    this.valueTone = HTextTone.primary,
    this.emptyPlaceholder = '—',
    super.key,
  });

  /// Label.
  final String label;

  /// Value; empty renders [emptyPlaceholder].
  final String value;

  /// Single row layout.
  final bool inline;

  /// Value style.
  final HTextStyle valueStyle;

  /// Value tone.
  final HTextTone valueTone;

  /// Shown for an empty value.
  final String emptyPlaceholder;

  @override
  Widget build(BuildContext context) {
    final shown = value.trim().isEmpty ? emptyPlaceholder : value;
    final tone = value.trim().isEmpty ? HTextTone.tertiary : valueTone;
    if (inline) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: HText(label, tone: HTextTone.secondary)),
          HSpace.hgap3,
          Expanded(
            flex: 3,
            child: HText(
              shown,
              style: valueStyle,
              tone: tone,
              align: TextAlign.end,
            ),
          ),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HText(label, style: HTextStyle.labelMd, tone: HTextTone.secondary),
        const SizedBox(height: 2),
        HText(shown, style: valueStyle, tone: tone),
      ],
    );
  }
}

/// A titled group of [HKeyValue]s with consistent spacing.
class HKeyValueGroup extends StatelessWidget {
  /// Creates a group.
  const HKeyValueGroup({
    required this.title,
    required this.children,
    this.trailing,
    super.key,
  });

  /// Section title.
  final String title;

  /// Rows.
  final List<Widget> children;

  /// Optional trailing widget in the title row (e.g. an edit button).
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(child: HText(title, style: HTextStyle.titleMd)),
            ?trailing,
          ],
        ),
        HSpace.gap3,
        for (var i = 0; i < children.length; i++) ...[
          if (i > 0) HSpace.gap3,
          children[i],
        ],
      ],
    );
  }
}
