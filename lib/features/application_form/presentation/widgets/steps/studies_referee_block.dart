import 'package:flutter/services.dart' show TextInputAction;
import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/format/format_checks.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_draft.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/draft_fields.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/form_block.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/form_scope.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_parts.dart';
import 'package:heuser_erp_mobile/features/documents/domain/doc_rows.dart';
import 'package:heuser_erp_mobile/features/documents/presentation/widgets/attach_card.dart';

/// Step 2 · "Referee" (optional): a teacher who can recommend the applicant.
class StudiesRefereeBlock extends StatelessWidget {
  /// Creates the block.
  const StudiesRefereeBlock({
    required this.draft,
    required this.docByCode,
    super.key,
  });

  /// Current draft.
  final FormDraft draft;

  /// Document row lookup.
  final DocRow? Function(String code) docByCode;

  void _set(
    BuildContext context,
    String field,
    Referee Function(Referee r) update,
  ) => context.patchField(
    'referee.$field',
    (d) => d.copyWith(referee: update(d.referee)),
  );

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final r = t.form.referee;
    final d = draft;
    return FormBlock(
      title: r.title,
      optional: true,
      optionalLabel: t.form.optional,
      note: r.note,
      children: [
        HSwitch(
          label: r.toggle,
          description: r.sub,
          value: d.hasReferee,
          onChanged: (v) => context.patch((d) => d.copyWith(hasReferee: v)),
        ),
        if (d.hasReferee)
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HSpace.gap4,
              DraftTextField(
                label: r.name,
                hint: r.nameHint,
                value: d.referee.name,
                onChanged: (v) =>
                    _set(context, 'name', (r) => r.copyWith(name: v)),
              ),
              HSpace.gap3,
              DraftTextField(
                label: r.email,
                helper: r.emailHint,
                format: FieldFormat.email,
                value: d.referee.email,
                error: context.fieldError('referee.email'),
                leadingIcon: HIcons.mail,
                onChanged: (v) =>
                    _set(context, 'email', (r) => r.copyWith(email: v)),
                onFormatError: (f) => context.formatError('referee.email', f),
              ),
              HSpace.gap3,
              DraftTextField(
                label: r.organisation,
                hint: r.organisationHint,
                value: d.referee.organisation,
                onChanged: (v) => _set(
                  context,
                  'organisation',
                  (r) => r.copyWith(organisation: v),
                ),
              ),
              HSpace.gap3,
              DraftTextField(
                label: r.designation,
                hint: r.designationHint,
                value: d.referee.designation,
                textInputAction: TextInputAction.done,
                onChanged: (v) => _set(
                  context,
                  'designation',
                  (r) => r.copyWith(designation: v),
                ),
              ),
              HSpace.gap4,
              AttachCard(
                row: docByCode('recommendation'),
                title: r.letter,
                hint: r.letterHint,
              ),
            ],
          ).hFadeInUp(context),
      ],
    );
  }
}
