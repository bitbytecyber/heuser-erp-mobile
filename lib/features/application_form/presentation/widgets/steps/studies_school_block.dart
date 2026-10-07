import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_constants.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_draft.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/draft_fields.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/form_block.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/form_scope.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/text_prompt_sheet.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_options.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart';

/// Step 2 · "Current school": catalogue search (paged) or a typed name,
/// campus, years, private candidate, qualification.
class StudiesSchoolBlock extends StatelessWidget {
  /// Creates the block.
  const StudiesSchoolBlock({
    required this.draft,
    required this.repo,
    super.key,
  });

  /// Current draft.
  final FormDraft draft;

  /// School search.
  final IntakeRepository repo;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final s = t.form.school;
    final d = draft;
    final now = DateTime.now();
    final untilYears = {...FormRules.toYears(now), ?d.studiedUntil}.toList()
      ..sort();
    return FormBlock(
      title: s.title,
      children: [
        if (!d.isPrivateCandidate) ...[
          HSearchSelect<SchoolHit>(
            label: s.name,
            required: true,
            hint: s.nameHint,
            leadingIcon: HIcons.school,
            value: d.schoolId != null
                ? SchoolHit(id: d.schoolId!, name: d.schoolText)
                : null,
            otherLabel: d.schoolId == null && d.schoolOther.isNotEmpty
                ? d.schoolOther
                : null,
            error: context.fieldError('school'),
            labels: HSearchLabels(
              searchHint: t.common.search,
              noResults: t.common.noMatches,
              notListed: s.notListed,
              error: t.common.tryAgainLoad,
              retry: t.common.retry,
            ),
            fetchPage: (q, offset) async {
              final r = await repo.searchSchools(q, offset: offset);
              return r.fold<List<SchoolHit>>(
                (f) => throw Exception(f.toString()),
                (list) => list,
              );
            },
            labelOf: (h) => h.name,
            subtitleOf: (h) => h.city,
            onChanged: (h) => context.patchField(
              'school',
              (d) => d.copyWith(
                schoolId: h.id,
                schoolText: h.name,
                schoolOther: '',
              ),
            ),
            onOther: () => unawaited(_typeSchool(context)),
          ),
          HSpace.gap3,
          DraftTextField(
            label: s.campus,
            hint: s.campusHint,
            required: true,
            value: d.schoolCampus,
            error: context.fieldError('school_campus'),
            onChanged: (v) => context.patchField(
              'school_campus',
              (d) => d.copyWith(schoolCampus: v),
            ),
          ),
          HSpace.gap3,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: HSelect<int>(
                  label: s.from,
                  required: true,
                  hint: s.year,
                  value: d.studiedFrom,
                  error: context.fieldError('studied_from'),
                  options: [
                    for (final y in FormRules.fromYears(now))
                      HSelectOption(value: y, label: '$y'),
                  ],
                  onChanged: (v) => context.patchField(
                    'studied_from',
                    (d) => d.copyWith(studiedFrom: v),
                  ),
                ),
              ),
              HSpace.hgap3,
              Expanded(
                child: HSelect<int>(
                  label: s.until,
                  required: true,
                  hint: s.year,
                  value: d.studiedUntil,
                  error: context.fieldError('studied_until'),
                  options: [
                    for (final y in untilYears)
                      HSelectOption(value: y, label: '$y'),
                  ],
                  onChanged: (v) => context.patchField(
                    'studied_until',
                    (d) => d.copyWith(studiedUntil: v),
                  ),
                ),
              ),
            ],
          ),
          HSpace.gap4,
        ],
        HCheckbox(
          label: s.private,
          value: d.isPrivateCandidate,
          onChanged: (v) =>
              context.patch((d) => d.copyWith(isPrivateCandidate: v)),
        ),
        HSpace.gap4,
        DraftChipGroup<Qualification>(
          label: s.qualification,
          required: true,
          value: d.qualification,
          options: [
            HSegment(value: Qualification.oLevel, label: s.oLevel),
            HSegment(value: Qualification.matric, label: s.matric),
            HSegment(value: Qualification.igcse, label: s.igcse),
            HSegment(value: Qualification.akuEb, label: s.akuEb),
            HSegment(value: Qualification.other, label: s.other),
          ],
          onChanged: (v) => context.patch((d) => d.copyWith(qualification: v)),
        ),
        if (d.qualification == Qualification.other) ...[
          HSpace.gap3,
          DraftTextField(
            label: s.whichQualification,
            hint: s.whichHint,
            required: true,
            value: d.qualificationOther,
            error: context.fieldError('qualification_other'),
            onChanged: (v) => context.patchField(
              'qualification_other',
              (d) => d.copyWith(qualificationOther: v),
            ),
          ).hFadeInUp(context),
        ],
        if (d.qualification == Qualification.matric) ...[
          HSpace.gap3,
          DraftTextField(
            label: s.percentage,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            value: d.matricPercentage,
            onChanged: (v) =>
                context.patch((d) => d.copyWith(matricPercentage: v)),
          ).hFadeInUp(context),
        ],
      ],
    );
  }

  Future<void> _typeSchool(BuildContext context) async {
    final t = Translations.of(context);
    final name = await TextPromptSheet.show(
      context,
      title: t.form.school.name,
      hint: t.form.school.manualHint,
      confirmLabel: t.common.done,
      cancelLabel: t.common.cancel,
      initial: draft.schoolId == null ? draft.schoolOther : '',
      maxLength: 120,
      validate: (v) => v.isEmpty ? t.form.errors.req.school : null,
    );
    if (name == null || !context.mounted) return;
    context.patchField(
      'school',
      (d) => d.copyWith(schoolId: null, schoolText: name, schoolOther: name),
    );
  }
}
