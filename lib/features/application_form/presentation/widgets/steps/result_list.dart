import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_constants.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/form_block.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/form_scope.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/text_prompt_sheet.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_parts.dart';

/// One of the two grade lists (`ResultList` on the web): results already out
/// (the grade), or papers still to sit (the sitting and an optional expected
/// grade). A subject already in either list is not offered again; one waiting
/// in the other list moves across instead of being refused.
class ResultList extends StatelessWidget {
  /// Creates the list.
  const ResultList({
    required this.out,
    required this.results,
    required this.onToast,
    super.key,
  });

  /// `true` for "results out".
  final bool out;

  /// Every result row (both lists).
  final List<ResultRow> results;

  /// Shows a short hint after an add.
  final ValueChanged<String> onToast;

  bool _same(String a, String b) => a.toLowerCase() == b.toLowerCase();

  List<(int, ResultRow)> get _mine => [
    for (var i = 0; i < results.length; i++)
      if (results[i].resultOut == out) (i, results[i]),
  ];

  bool _inThis(String name) => _mine.any((e) => _same(e.$2.subject, name));

  void _setResults(BuildContext context, List<ResultRow> rows) =>
      context.patchField('results', (d) => d.copyWith(results: rows));

  void _setRow(
    BuildContext context,
    int i,
    ResultRow Function(ResultRow r) update,
  ) {
    final rows = [...results];
    rows[i] = update(rows[i]);
    _setResults(context, rows);
  }

  void _add(BuildContext context, String subject) {
    final year = DateTime.now().year;
    final at = results.indexWhere((r) => _same(r.subject, subject));
    final fresh = ResultRow(
      subject: subject,
      sittingMonth: out ? 6 : 10,
      sittingYear: year,
      resultOut: out,
    );
    if (at >= 0) {
      _setRow(context, at, (r) => fresh.copyWith(id: r.id));
    } else {
      _setResults(context, [...results, fresh]);
    }
  }

  Future<void> _addCustom(BuildContext context) async {
    final t = Translations.of(context).form.grades;
    final name = await TextPromptSheet.show(
      context,
      title: t.addAnother,
      hint: t.customHint,
      confirmLabel: Translations.of(context).common.add,
      cancelLabel: Translations.of(context).common.cancel,
      maxLength: 60,
      validate: (v) {
        final n = FormRules.titleCase(v);
        if (n.length < 2) return t.typeSubject;
        if (_inThis(n)) return t.alreadyListed(name: n);
        return null;
      },
    );
    if (name == null || !context.mounted) return;
    final n = FormRules.titleCase(name);
    _add(context, n);
    onToast(out ? t.addedGrade(name: n) : t.addedSitting(name: n));
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final g = t.form.grades;
    final mine = _mine;
    final quick = FormRules.quick.where((q) => !_inThis(q)).toList();
    final more = FormRules.olSubjects.where((q) => !_inThis(q)).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FormSubTitle(
          out ? g.outTitle : g.awaitedTitle,
          note: out ? g.outNote : g.awaitedNote,
        ),
        if (mine.isEmpty)
          HText(
            out ? g.outEmpty : g.awaitedEmpty,
            style: HTextStyle.bodySm,
            tone: HTextTone.tertiary,
          )
        else
          for (final (i, r) in mine) ...[
            _ResultRowTile(
              row: r,
              onChanged: (u) => _setRow(context, i, u),
              onRemove: () => _setResults(context, [...results]..removeAt(i)),
            ),
            HSpace.gap3,
          ],
        if (quick.isNotEmpty) ...[
          HSpace.gap2,
          HText(
            g.quickAdd,
            style: HTextStyle.labelMd,
            tone: HTextTone.secondary,
          ),
          HSpace.gap2,
          Wrap(
            spacing: HSpace.x2,
            runSpacing: HSpace.x2,
            children: [
              for (final q in quick)
                HChip('+ $q', onTap: () => _add(context, q)),
            ],
          ),
        ],
        HSpace.gap3,
        HSelect<String>(
          hint: g.addAnother,
          value: null,
          sheetTitle: g.addAnother,
          searchHint: t.common.search,
          leadingIcon: HIcons.add,
          options: [
            for (final x in more) HSelectOption(value: x, label: x),
            HSelectOption(
              value: '__custom',
              label: g.customOption,
              icon: HIcons.edit,
            ),
          ],
          onChanged: (v) {
            if (v == '__custom') {
              unawaited(_addCustom(context));
            } else {
              _add(context, v);
            }
          },
        ),
      ],
    );
  }
}

class _ResultRowTile extends StatelessWidget {
  const _ResultRowTile({
    required this.row,
    required this.onChanged,
    required this.onRemove,
  });

  final ResultRow row;
  final ValueChanged<ResultRow Function(ResultRow r)> onChanged;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final g = t.form.grades;
    final r = row;
    final offered = r.resultOut ? FormRules.grades : FormRules.predictedGrades;
    final grades = r.grade.isNotEmpty && !offered.contains(r.grade)
        ? [...offered, r.grade]
        : offered;
    return HCard(
      elevation: HCardElevation.flat,
      padding: const EdgeInsets.all(HSpace.x3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(child: HText(r.subject, style: HTextStyle.titleSm)),
              if (!FormRules.olSubjects.contains(r.subject))
                HStatusPill(g.addedByYou),
              HIconButton(
                icon: HIcons.close,
                size: 36,
                semanticsLabel: g.removeSubject(name: r.subject),
                onPressed: onRemove,
              ),
            ],
          ),
          HSpace.gap2,
          Row(
            children: [
              Expanded(
                child: HSelect<int>(
                  hint: g.month,
                  value: r.sittingMonth,
                  options: [
                    for (var m = 1; m <= 12; m++)
                      HSelectOption(
                        value: m,
                        label: FormRules.sittingMonths[m - 1],
                      ),
                  ],
                  onChanged: (v) =>
                      onChanged((r) => r.copyWith(sittingMonth: v)),
                ),
              ),
              HSpace.hgap2,
              Expanded(
                child: HSelect<int>(
                  hint: g.year,
                  value: r.sittingYear,
                  options: [
                    for (final y in FormRules.sittingYears())
                      HSelectOption(value: y, label: '$y'),
                  ],
                  onChanged: (v) =>
                      onChanged((r) => r.copyWith(sittingYear: v)),
                ),
              ),
            ],
          ),
          HSpace.gap2,
          Wrap(
            spacing: HSpace.x2,
            runSpacing: HSpace.x2,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              if (!r.resultOut)
                HText(
                  g.expected,
                  style: HTextStyle.labelMd,
                  tone: HTextTone.tertiary,
                ),
              for (final gr in grades)
                HChip(
                  gr,
                  selected: r.grade == gr,
                  onTap: () => onChanged(
                    (r) => r.copyWith(
                      grade: !r.resultOut && r.grade == gr ? '' : gr,
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
