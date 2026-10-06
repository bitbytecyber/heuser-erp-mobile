import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/components/data/h_list_tile.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/tokens/h_spacing.dart';

/// One line of a fee table.
class HFeeRow {
  /// Creates a row.
  const HFeeRow({
    required this.label,
    required this.amount,
    this.note,
    this.emphasis = false,
    this.tone = HTextTone.primary,
  });

  /// Label (e.g. "Admission fee").
  final String label;

  /// Formatted amount (e.g. "PKR 25,000", "−10 %").
  final String amount;

  /// Small note under the label (e.g. "monthly").
  final String? note;

  /// Bold row.
  final bool emphasis;

  /// Amount tone (success for scholarships, brand for totals).
  final HTextTone tone;
}

/// Offer fee breakdown: rows with right-aligned tabular amounts, hairlines,
/// and an emphasised total.
class HFeeTable extends StatelessWidget {
  /// Creates a table.
  const HFeeTable({
    required this.rows,
    this.total,
    this.totalLabel = 'Due now',
    super.key,
  });

  /// Line items.
  final List<HFeeRow> rows;

  /// Formatted total; omitted when `null`.
  final String? total;

  /// Total label.
  final String totalLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < rows.length; i++) ...[
          if (i > 0) const HDivider(),
          _Line(row: rows[i]),
        ],
        if (total != null) ...[
          const HDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: HSpace.x3),
            child: Row(
              children: [
                Expanded(child: HText(totalLabel, style: HTextStyle.titleMd)),
                HText(
                  total!,
                  style: HTextStyle.headlineSm,
                  tone: HTextTone.brand,
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class _Line extends StatelessWidget {
  const _Line({required this.row});
  final HFeeRow row;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: HSpace.x3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HText(
                  row.label,
                  style: row.emphasis ? HTextStyle.titleMd : HTextStyle.bodyMd,
                ),
                if (row.note != null) ...[
                  const SizedBox(height: 2),
                  HText(
                    row.note!,
                    style: HTextStyle.bodySm,
                    tone: HTextTone.tertiary,
                  ),
                ],
              ],
            ),
          ),
          HSpace.hgap3,
          HText(
            row.amount,
            style: row.emphasis ? HTextStyle.titleMd : HTextStyle.mono,
            tone: row.tone,
          ),
        ],
      ),
    );
  }
}
