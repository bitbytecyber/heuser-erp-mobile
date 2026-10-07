import 'package:flutter/services.dart' show TextCapitalization, TextInputAction;
import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/format/format_checks.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_draft.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/draft_fields.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/form_block.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/form_scope.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_parts.dart';

/// Step 1 · "Emergency contact".
class FamilyEmergencyBlock extends StatelessWidget {
  /// Creates the block.
  const FamilyEmergencyBlock({required this.draft, super.key});

  /// Current draft.
  final FormDraft draft;

  void _set(
    BuildContext context,
    String field,
    Emergency Function(Emergency e) update,
  ) => context.patchField('emg.$field', (d) => d.copyWith(emg: update(d.emg)));

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final e = t.form.emergency;
    final d = draft;
    final relA = d.guardians[0].relation;
    final emg = d.emg;
    return FormBlock(
      title: e.title,
      note: e.note,
      children: [
        HCheckbox(
          label: relA.isEmpty
              ? e.sameAsFirst
              : e.sameAs(relation: relA.toLowerCase()),
          value: emg.same,
          onChanged: (v) =>
              context.patch((d) => d.copyWith(emg: d.emg.copyWith(same: v))),
        ),
        if (!emg.same)
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HSpace.gap4,
              DraftTextField(
                label: e.firstName,
                required: true,
                value: emg.firstName,
                error: context.fieldError('emg.first_name'),
                onChanged: (v) => _set(
                  context,
                  'first_name',
                  (e) => e.copyWith(firstName: v),
                ),
              ),
              HSpace.gap3,
              DraftTextField(
                label: e.lastName,
                required: true,
                value: emg.lastName,
                error: context.fieldError('emg.last_name'),
                onChanged: (v) =>
                    _set(context, 'last_name', (e) => e.copyWith(lastName: v)),
              ),
              HSpace.gap3,
              DraftTextField(
                label: e.relation,
                hint: e.relationHint,
                required: true,
                value: emg.relation,
                error: context.fieldError('emg.relation'),
                onChanged: (v) =>
                    _set(context, 'relation', (e) => e.copyWith(relation: v)),
              ),
              HSpace.gap3,
              DraftTextField(
                label: e.mobile,
                required: true,
                format: FieldFormat.phone,
                value: emg.mobile,
                error: context.fieldError('emg.mobile'),
                leadingIcon: HIcons.phone,
                onChanged: (v) =>
                    _set(context, 'mobile', (e) => e.copyWith(mobile: v)),
                onFormatError: (f) => context.formatError('emg.mobile', f),
              ),
              HSpace.gap3,
              DraftTextField(
                label: e.cnic,
                hint: t.form.about.cnicHint,
                format: FieldFormat.cnic,
                value: emg.cnic,
                error: context.fieldError('emg.cnic'),
                onChanged: (v) =>
                    _set(context, 'cnic', (e) => e.copyWith(cnic: v)),
                onFormatError: (f) => context.formatError('emg.cnic', f),
              ),
              HSpace.gap3,
              DraftTextField(
                label: e.email,
                format: FieldFormat.email,
                value: emg.email,
                error: context.fieldError('emg.email'),
                leadingIcon: HIcons.mail,
                textInputAction: TextInputAction.done,
                onChanged: (v) =>
                    _set(context, 'email', (e) => e.copyWith(email: v)),
                onFormatError: (f) => context.formatError('emg.email', f),
              ),
            ],
          ).hFadeInUp(context),
      ],
    );
  }
}

/// Step 1 · siblings at the college (optional).
class FamilySiblingsBlock extends StatelessWidget {
  /// Creates the block.
  const FamilySiblingsBlock({
    required this.draft,
    required this.collegeName,
    super.key,
  });

  /// Current draft.
  final FormDraft draft;

  /// College name for the copy.
  final String collegeName;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final s = t.form.siblings;
    final d = draft;
    return HCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HSwitch(
            label: s.toggle(name: collegeName),
            description: s.sub,
            value: d.sib,
            onChanged: (v) => context.patch((d) => d.copyWith(sib: v)),
          ),
          if (d.sib) ...[
            HSpace.gap4,
            for (var i = 0; i < d.siblings.length; i++) ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: DraftTextField(
                      label: s.name,
                      value: d.siblings[i].name,
                      onChanged: (v) =>
                          _setSibling(context, i, (x) => x.copyWith(name: v)),
                    ),
                  ),
                  HSpace.hgap2,
                  HIconButton(
                    icon: HIcons.close,
                    semanticsLabel: t.common.remove,
                    onPressed: () => context.patch((d) {
                      final rest = [...d.siblings]..removeAt(i);
                      return d.copyWith(
                        siblings: rest.isEmpty ? const [Sibling()] : rest,
                      );
                    }),
                  ),
                ],
              ),
              HSpace.gap3,
              DraftTextField(
                label: s.year(name: collegeName),
                hint: s.yearHint,
                value: d.siblings[i].yearOrClass,
                textCapitalization: TextCapitalization.characters,
                onChanged: (v) =>
                    _setSibling(context, i, (x) => x.copyWith(yearOrClass: v)),
              ),
              HSpace.gap4,
            ],
            HButton.tonal(
              label: s.addAnother,
              icon: HIcons.add,
              expand: false,
              size: HButtonSize.sm,
              onPressed: () => context.patch(
                (d) => d.copyWith(siblings: [...d.siblings, const Sibling()]),
              ),
            ),
          ],
        ],
      ),
    );
  }

  static void _setSibling(
    BuildContext context,
    int i,
    Sibling Function(Sibling s) update,
  ) {
    context.patch((d) {
      final list = [...d.siblings];
      list[i] = update(list[i]);
      return d.copyWith(siblings: list);
    });
  }
}
