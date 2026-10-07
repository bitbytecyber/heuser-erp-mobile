import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_draft.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/form_block.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/form_scope.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/steps/result_list.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_options.dart';
import 'package:heuser_erp_mobile/features/documents/domain/doc_rows.dart';
import 'package:heuser_erp_mobile/features/documents/presentation/cubit/documents_cubit.dart';
import 'package:heuser_erp_mobile/features/documents/presentation/widgets/attach_card.dart';
import 'package:heuser_erp_mobile/features/documents/presentation/widgets/doc_labels.dart';
import 'package:heuser_erp_mobile/features/documents/presentation/widgets/file_source_sheet.dart';

/// Step 2 · "Your grades": the two result lists, then the result documents
/// (combined statements and / or one file per subject) and the mid-term report.
class StudiesResultsBlock extends StatelessWidget {
  /// Creates the block.
  const StudiesResultsBlock({
    required this.draft,
    required this.options,
    required this.rows,
    super.key,
  });

  /// Current draft.
  final FormDraft draft;

  /// Form options (document types).
  final FormOptions? options;

  /// Document rows.
  final List<DocRow> rows;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final g = t.form.grades;
    final d = draft;
    final predicted = d.predicted;
    final resultRows = rows
        .where((r) => r.code == 'result' && r.actionable)
        .toList();
    final placeholder = rows.where((r) => r.code == 'result').firstOrNull;
    final overallRows = rows
        .where((r) => r.code == 'result_overall' && r.actionable)
        .toList();
    final overallType = options?.documentType('result_overall')?.id;
    bool ready(DocRow r) =>
        r.state == DocState.ready ||
        r.state == DocState.checking ||
        r.state == DocState.verified;
    final combinedSent = overallRows
        .where((r) => r.docId != null && ready(r))
        .length;
    final titles = DocLabels.titles(t);
    return FormBlock(
      title: g.title,
      required: true,
      note: g.note,
      children: [
        ResultList(
          out: true,
          results: d.results,
          onToast: (m) => HToast.show(context, m, icon: HIcons.checkCircle),
        ),
        HSpace.gap4,
        ResultList(
          out: false,
          results: d.results,
          onToast: (m) => HToast.show(context, m, icon: HIcons.checkCircle),
        ),
        FormErrorLine(context.fieldError('results')),
        if (placeholder != null || overallType != null) ...[
          HSpace.gap4,
          HCard(
            elevation: HCardElevation.flat,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: HText(
                        titles.resultTitle(d.qualification),
                        style: HTextStyle.titleMd,
                      ),
                    ),
                    HStatusPill(g.orLater, tone: HTone.warning),
                  ],
                ),
                HSpace.gap1,
                HText(
                  predicted ? g.resultPredicted : g.resultAttachHint,
                  style: HTextStyle.bodySm,
                  tone: HTextTone.secondary,
                ),
                if (overallType != null) ...[
                  HSpace.gap3,
                  HText(
                    combinedSent > 1 ? g.combinedPlural : g.combined,
                    style: HTextStyle.labelMd,
                    tone: HTextTone.secondary,
                  ),
                  HSpace.gap2,
                  for (final row in overallRows) ...[
                    AttachCard(row: row, title: row.title, hint: row.sub),
                    HSpace.gap2,
                  ],
                  if (overallRows.any((r) => r.docId != null))
                    _AddCombined(docType: overallType),
                ],
                if (!predicted && resultRows.isNotEmpty) ...[
                  HSpace.gap3,
                  if (combinedSent == 0)
                    Center(
                      child: HText(
                        g.or,
                        style: HTextStyle.labelMd,
                        tone: HTextTone.tertiary,
                      ),
                    ),
                  HSpace.gap2,
                  HText(
                    combinedSent > 0 ? g.awaitingSubjects : g.perSubject,
                    style: HTextStyle.labelMd,
                    tone: HTextTone.secondary,
                  ),
                  HSpace.gap2,
                  for (final row in resultRows) ...[
                    AttachCard(
                      row: row,
                      title: row.title.split(' · ').skip(1).join(' · '),
                      hint: row.sub,
                    ),
                    HSpace.gap2,
                  ],
                ],
              ],
            ),
          ),
        ],
        HSpace.gap2,
        AttachCard(
          row: rows
              .where((r) => r.code == 'mid_term' && r.actionable)
              .firstOrNull,
          title: g.midTerm,
          hint: g.midTermHint,
        ),
      ],
    );
  }
}

class _AddCombined extends StatelessWidget {
  const _AddCombined({required this.docType});

  final int docType;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final pending = context.select<DocumentsCubit, String?>(
      (c) => c.state.pending,
    );
    final cubit = context.read<DocumentsCubit>();
    return HButton.outline(
      size: HButtonSize.sm,
      expand: false,
      icon: HIcons.attach,
      label: t.form.grades.addCombined,
      loading: pending == 'new:$docType',
      onPressed: pending != null
          ? null
          : () => unawaited(() async {
              final source = await FileSourceSheet.show(context);
              if (source == null) return;
              await cubit.uploadNew(docType, source, title: t.documents.result);
            }()),
    );
  }
}
