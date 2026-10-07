import 'package:flutter/services.dart' show TextInputAction;
import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/format/format_checks.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_constants.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_draft.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/draft_fields.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/form_block.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/form_scope.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_parts.dart';

/// Step 1 · "Parents": one guardian is enough; a second can be added.
class FamilyParentsBlock extends StatelessWidget {
  /// Creates the block.
  const FamilyParentsBlock({required this.draft, super.key});

  /// Current draft.
  final FormDraft draft;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final p = t.form.parents;
    final d = draft;
    return FormBlock(
      title: p.title,
      note: p.note,
      children: [
        _Person(
          prefix: 'pA',
          index: 0,
          title: p.first,
          guardian: d.guardians[0],
        ),
        HSpace.gap4,
        if (d.parentB)
          _Person(
            prefix: 'pB',
            index: 1,
            title: p.second,
            guardian: d.guardians[1],
            onRemove: () => context.patch((d) => d.copyWith(parentB: false)),
          ).hFadeInUp(context)
        else
          HButton.tonal(
            label: p.addSecond,
            icon: HIcons.add,
            expand: false,
            size: HButtonSize.sm,
            onPressed: () => context.patch((d) => d.copyWith(parentB: true)),
          ),
      ],
    );
  }
}

class _Person extends StatelessWidget {
  const _Person({
    required this.prefix,
    required this.index,
    required this.title,
    required this.guardian,
    this.onRemove,
  });

  final String prefix;
  final int index;
  final String title;
  final Guardian guardian;
  final VoidCallback? onRemove;

  void _set(
    BuildContext context,
    String field,
    Guardian Function(Guardian g) update,
  ) {
    context.patchField('$prefix.$field', (d) {
      final gs = [...d.guardians];
      gs[index] = update(gs[index]);
      return d.copyWith(guardians: gs);
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final p = t.form.parents;
    final g = guardian;
    String? err(String f) => context.fieldError('$prefix.$f');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(child: HText(title, style: HTextStyle.titleSm)),
            if (onRemove != null)
              HButton.ghost(
                label: t.common.remove,
                size: HButtonSize.sm,
                onPressed: onRemove,
              ),
          ],
        ),
        HSpace.gap2,
        DraftSegmented<String>(
          label: p.relation,
          required: true,
          value: g.relation.isEmpty ? null : g.relation,
          error: err('relation'),
          segments: [
            for (final r in FormRules.relations) HSegment(value: r, label: r),
          ],
          onChanged: (v) =>
              _set(context, 'relation', (g) => g.copyWith(relation: v)),
        ),
        HSpace.gap4,
        DraftTextField(
          label: p.firstName,
          required: true,
          value: g.firstName,
          error: err('first_name'),
          onChanged: (v) =>
              _set(context, 'first_name', (g) => g.copyWith(firstName: v)),
        ),
        HSpace.gap3,
        DraftTextField(
          label: p.lastName,
          required: true,
          value: g.lastName,
          error: err('last_name'),
          onChanged: (v) =>
              _set(context, 'last_name', (g) => g.copyWith(lastName: v)),
        ),
        HSpace.gap3,
        DraftTextField(
          label: p.cnic,
          hint: t.form.about.cnicHint,
          required: true,
          format: FieldFormat.cnic,
          value: g.cnic,
          error: err('cnic'),
          onChanged: (v) => _set(context, 'cnic', (g) => g.copyWith(cnic: v)),
          onFormatError: (f) => context.formatError('$prefix.cnic', f),
        ),
        HSpace.gap3,
        DraftTextField(
          label: p.mobile,
          required: true,
          format: FieldFormat.phone,
          value: g.mobile,
          error: err('mobile'),
          leadingIcon: HIcons.phone,
          onChanged: (v) =>
              _set(context, 'mobile', (g) => g.copyWith(mobile: v)),
          onFormatError: (f) => context.formatError('$prefix.mobile', f),
        ),
        HSpace.gap3,
        DraftTextField(
          label: p.email,
          required: true,
          format: FieldFormat.email,
          value: g.email,
          error: err('email'),
          leadingIcon: HIcons.mail,
          textInputAction: TextInputAction.done,
          onChanged: (v) => _set(context, 'email', (g) => g.copyWith(email: v)),
          onFormatError: (f) => context.formatError('$prefix.email', f),
        ),
        HSpace.gap3,
        HSelect<String>(
          label: p.marital,
          hint: t.common.choose,
          value: g.maritalStatus.isEmpty ? null : g.maritalStatus,
          options: [
            for (final m in FormRules.maritalStatuses)
              HSelectOption(value: m, label: m),
          ],
          onChanged: (v) =>
              _set(context, 'marital', (g) => g.copyWith(maritalStatus: v)),
        ),
        HSpace.gap4,
        DraftChipGroup<String>(
          label: p.work,
          optionalLabel: t.form.optional,
          value: g.work.isEmpty ? null : g.work,
          options: [
            for (final e in FormRules.workOptions.entries)
              HSegment(value: e.key, label: e.value),
          ],
          onChanged: (v) => _set(context, 'work', (g) => g.copyWith(work: v)),
        ),
        if (g.isEmployed) ...[
          HSpace.gap3,
          DraftTextField(
            label: p.organisation,
            value: g.organisation,
            onChanged: (v) =>
                _set(context, 'org', (g) => g.copyWith(organisation: v)),
          ),
          HSpace.gap3,
          DraftTextField(
            label: p.designation,
            value: g.designation,
            onChanged: (v) =>
                _set(context, 'desig', (g) => g.copyWith(designation: v)),
          ),
        ],
      ],
    );
  }
}
