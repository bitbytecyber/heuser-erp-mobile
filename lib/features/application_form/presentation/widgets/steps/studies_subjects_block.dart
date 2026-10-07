import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_constants.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_draft.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/form_block.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/form_scope.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/text_prompt_sheet.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_options.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_parts.dart';

/// Step 2 · "A-Level subjects you'd like": 3–5 chips, a teacher where there
/// is a choice, and the optional future study field.
class StudiesSubjectsBlock extends StatelessWidget {
  /// Creates the block.
  const StudiesSubjectsBlock({
    required this.draft,
    required this.options,
    super.key,
  });

  /// Current draft.
  final FormDraft draft;

  /// Form options (subjects per level).
  final FormOptions? options;

  void _toggle(BuildContext context, SubjectOption o) {
    final d = draft;
    final picked = d.subjects.any((x) => x.course == o.course);
    if (picked) {
      context.patch(
        (d) => d.copyWith(
          subjects: d.subjects.where((x) => x.course != o.course).toList(),
        ),
      );
      return;
    }
    if (d.subjects.length >= FormRules.maxSubjects) return;
    final teacher = o.teachers.length == 1 ? o.teachers.single.id : 0;
    context.patch(
      (d) => d.copyWith(
        subjects: [
          ...d.subjects,
          SubjectPick(course: o.course, teacher: teacher),
        ],
      ),
    );
    if (d.subjects.length + 1 >= FormRules.minSubjects) {
      context.clearError('subjects');
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final s = t.form.subjects;
    final d = draft;
    final opts = options?.subjects ?? const <SubjectOption>[];
    final n = d.subjects.length;
    final counter = n >= FormRules.maxSubjects
        ? s.counterMax(n: n, max: FormRules.maxSubjects)
        : s.counter(
            n: n,
            min: FormRules.minSubjects,
            max: FormRules.maxSubjects,
          );
    return FormBlock(
      title: s.title,
      required: true,
      note: s.note,
      trailing: HStatusPill(
        counter,
        tone: n >= FormRules.minSubjects ? HTone.success : HTone.neutral,
      ),
      children: [
        if (options == null)
          const Center(child: HSpinner())
        else if (opts.isEmpty)
          HText(s.noneOpen, style: HTextStyle.bodySm, tone: HTextTone.tertiary)
        else
          Wrap(
            spacing: HSpace.x2,
            runSpacing: HSpace.x2,
            children: [
              for (final o in opts)
                HChip(
                  o.teachers.length > 1
                      ? '${o.name} · ${s.teachers(n: o.teachers.length)}'
                      : o.name,
                  selected: d.subjects.any((x) => x.course == o.course),
                  enabled:
                      d.subjects.any((x) => x.course == o.course) ||
                      n < FormRules.maxSubjects,
                  onTap: () => _toggle(context, o),
                ),
            ],
          ),
        FormErrorLine(context.fieldError('subjects')),
        if (d.subjects.isNotEmpty) ...[
          HSpace.gap4,
          HText(
            s.teacherNote,
            style: HTextStyle.bodySm,
            tone: HTextTone.secondary,
          ),
          HSpace.gap3,
          for (final pick in d.subjects)
            if (options?.subject(pick.course) case final o?) ...[
              _TeacherRow(pick: pick, option: o),
              HSpace.gap3,
            ],
        ],
        HSpace.gap2,
        HSearchSelect<String>(
          label: s.future,
          helper: s.futureHint,
          hint: s.futurePlaceholder,
          leadingIcon: HIcons.sparkle,
          value: d.futureStudy.isEmpty ? null : d.futureStudy,
          labels: HSearchLabels(
            searchHint: t.common.search,
            noResults: t.common.noMatches,
            notListed: t.form.notListed,
            error: t.common.tryAgainLoad,
            retry: t.common.retry,
          ),
          fetchPage: (q, offset) async {
            if (offset > 0) return const [];
            final lq = q.trim().toLowerCase();
            return FormRules.studyFields
                .where((f) => lq.isEmpty || f.toLowerCase().contains(lq))
                .toList();
          },
          labelOf: (f) => f,
          onChanged: (v) => context.patch((d) => d.copyWith(futureStudy: v)),
          onOther: () => unawaited(() async {
            final v = await TextPromptSheet.show(
              context,
              title: s.future,
              hint: s.futurePlaceholder,
              confirmLabel: t.common.done,
              cancelLabel: t.common.cancel,
              initial: d.futureStudy,
            );
            if (v == null || !context.mounted) return;
            context.patch((d) => d.copyWith(futureStudy: v));
          }()),
        ),
      ],
    );
  }
}

class _TeacherRow extends StatelessWidget {
  const _TeacherRow({required this.pick, required this.option});

  final SubjectPick pick;
  final SubjectOption option;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final s = t.form.subjects;
    final o = option;
    final key = 'teacher.${o.course}';
    if (o.teachers.length <= 1) {
      final only = o.teachers.firstOrNull;
      return Row(
        children: [
          Expanded(child: HText(o.name, style: HTextStyle.titleSm)),
          HText(
            only != null ? s.taughtBy(name: only.name) : s.assigned,
            style: HTextStyle.bodySm,
            tone: HTextTone.secondary,
          ),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HText(o.name, style: HTextStyle.titleSm),
        HSpace.gap2,
        HSegmented<int>(
          segments: [
            for (final te in o.teachers) HSegment(value: te.id, label: te.name),
          ],
          value: pick.teacher == 0 ? null : pick.teacher,
          onChanged: (id) => context.patchField(
            key,
            (d) => d.copyWith(
              subjects: [
                for (final x in d.subjects)
                  if (x.course == o.course) x.copyWith(teacher: id) else x,
              ],
            ),
          ),
        ),
        FormErrorLine(context.fieldError(key)),
      ],
    );
  }
}
