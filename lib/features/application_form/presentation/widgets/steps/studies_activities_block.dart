import 'dart:async';

import 'package:flutter/services.dart' show TextCapitalization;
import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_constants.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_draft.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/draft_fields.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/form_block.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/form_scope.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/steps/activity_detail.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/text_prompt_sheet.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_options.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_parts.dart';
import 'package:heuser_erp_mobile/features/documents/domain/doc_rows.dart';

/// Step 2 · "Beyond the classroom": sports and other activities as chips,
/// a line of detail each, certificates, the sports-trial and "anything else"
/// toggles.
class StudiesActivitiesBlock extends StatelessWidget {
  /// Creates the block.
  const StudiesActivitiesBlock({
    required this.draft,
    required this.options,
    required this.rows,
    super.key,
  });

  /// Current draft.
  final FormDraft draft;

  /// Form options (sports catalogue, certificate type).
  final FormOptions? options;

  /// Document rows (certificates per activity).
  final List<DocRow> rows;

  void _setAll(BuildContext context, List<ActivityRow> acts) =>
      context.patch((d) => d.copyWith(activities: acts));

  void _remove(BuildContext context, ActivityRow row) =>
      _setAll(context, draft.activities.where((a) => a != row).toList());

  void _update(BuildContext context, ActivityRow row, ActivityRow next) =>
      _setAll(context, [
        for (final a in draft.activities)
          if (a == row) next else a,
      ]);

  void _toggleSport(BuildContext context, SportOption c) {
    final row = draft.sports.where((a) => a.sportId == c.id).firstOrNull;
    if (row != null) {
      _remove(context, row);
    } else {
      _setAll(context, [
        ...draft.activities,
        ActivityRow(
          kind: 'sport',
          sportId: c.id,
          name: c.name,
          level: 'School',
        ),
      ]);
    }
  }

  void _toggleActivity(BuildContext context, String name) {
    final row = draft.otherActivities.where((a) => a.name == name).firstOrNull;
    if (row != null) {
      _remove(context, row);
    } else {
      _setAll(context, [
        ...draft.activities,
        ActivityRow(kind: 'activity', name: name),
      ]);
    }
  }

  Future<void> _addOther(BuildContext context, {required bool sport}) async {
    final t = Translations.of(context);
    final b = t.form.beyond;
    final raw = await TextPromptSheet.show(
      context,
      title: sport ? b.sports : b.activities,
      hint: sport ? b.otherSport : b.otherActivity,
      confirmLabel: t.common.add,
      cancelLabel: t.common.cancel,
      maxLength: sport ? 40 : 50,
      validate: (v) => FormRules.capFirst(v).length < 2
          ? (sport ? b.typeSport : b.typeActivity)
          : null,
    );
    if (raw == null || !context.mounted) return;
    final name = FormRules.capFirst(raw);
    final lower = name.toLowerCase();
    if (sport) {
      final catalogue = options?.sports ?? const <SportOption>[];
      final cat = catalogue
          .where((c) => c.name.toLowerCase() == lower)
          .firstOrNull;
      final mine = draft.sports
          .where((a) => a.name.toLowerCase() == lower)
          .firstOrNull;
      if (cat != null || mine != null) {
        if (cat != null && !draft.sports.any((a) => a.sportId == cat.id)) {
          _toggleSport(context, cat);
        }
        HToast.show(context, b.alreadyListed(name: cat?.name ?? mine!.name));
        return;
      }
      _setAll(context, [
        ...draft.activities,
        ActivityRow(kind: 'sport', name: name, level: 'School'),
      ]);
    } else {
      final known =
          FormRules.activities
              .where((a) => a.toLowerCase() == lower)
              .firstOrNull ??
          draft.otherActivities
              .where((a) => a.name.toLowerCase() == lower)
              .firstOrNull
              ?.name;
      if (known != null) {
        if (!draft.otherActivities.any((a) => a.name == known)) {
          _toggleActivity(context, known);
        }
        HToast.show(context, b.alreadyListed(name: known));
        return;
      }
      _setAll(context, [
        ...draft.activities,
        ActivityRow(kind: 'activity', name: name),
      ]);
    }
    HToast.show(context, b.added(name: name), icon: HIcons.checkCircle);
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final b = t.form.beyond;
    final d = draft;
    final catalogue = options?.sports ?? const <SportOption>[];
    final certType = options?.documentType('certificate')?.id;
    final customSports = d.sports.where(
      (a) => a.sportId == null || !catalogue.any((c) => c.id == a.sportId),
    );
    final customActs = d.otherActivities.where(
      (a) => !FormRules.activities.contains(a.name),
    );
    int certs(ActivityRow a) => rows
        .where((r) => r.code == 'certificate' && r.activity == a.activityKey)
        .length;
    return FormBlock(
      title: b.title,
      note: b.note,
      children: [
        FormSubTitle(b.sports),
        Wrap(
          spacing: HSpace.x2,
          runSpacing: HSpace.x2,
          children: [
            for (final c in catalogue)
              HChip(
                c.name,
                selected: d.sports.any((a) => a.sportId == c.id),
                onTap: () => _toggleSport(context, c),
              ),
            for (final a in customSports)
              HChip(a.name, selected: true, onTap: () => _remove(context, a)),
            HChip(
              b.other,
              icon: HIcons.add,
              onTap: () => unawaited(_addOther(context, sport: true)),
            ),
          ],
        ),
        for (final a in d.sports) ...[
          HSpace.gap3,
          ActivityDetail(
            row: a,
            levelLabel: b.level(name: a.name),
            hint: b.sportDetailsHint,
            certType: certType,
            certCount: certs(a),
            onChanged: (n) => _update(context, a, n),
          ),
        ],
        HSpace.gap4,
        const HDivider(),
        HSpace.gap4,
        FormSubTitle(b.activities),
        Wrap(
          spacing: HSpace.x2,
          runSpacing: HSpace.x2,
          children: [
            for (final name in FormRules.activities)
              HChip(
                name,
                selected: d.otherActivities.any((a) => a.name == name),
                onTap: () => _toggleActivity(context, name),
              ),
            for (final a in customActs)
              HChip(a.name, selected: true, onTap: () => _remove(context, a)),
            HChip(
              b.other,
              icon: HIcons.add,
              onTap: () => unawaited(_addOther(context, sport: false)),
            ),
          ],
        ),
        for (final a in d.otherActivities) ...[
          HSpace.gap3,
          ActivityDetail(
            row: a,
            hint: b.activityDetailsHint,
            certType: certType,
            certCount: certs(a),
            onChanged: (n) => _update(context, a, n),
          ),
        ],
        HSpace.gap4,
        const HDivider(),
        HSpace.gap3,
        HSwitch(
          label: b.trial,
          description: b.trialSub,
          value: d.wantsSportsTrial,
          onChanged: (v) =>
              context.patch((d) => d.copyWith(wantsSportsTrial: v)),
        ),
        HSpace.gap3,
        HSwitch(
          label: b.more,
          description: b.moreSub,
          value: d.more,
          onChanged: (v) => context.patch((d) => d.copyWith(more: v)),
        ),
        if (d.more) ...[
          HSpace.gap3,
          DraftTextField(
            label: b.moreLabel,
            value: d.anythingElse,
            maxLines: 5,
            minLines: 3,
            textCapitalization: TextCapitalization.sentences,
            onChanged: (v) => context.patch((d) => d.copyWith(anythingElse: v)),
          ).hFadeInUp(context),
        ],
      ],
    );
  }
}
