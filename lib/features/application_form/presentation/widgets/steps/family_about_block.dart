import 'package:flutter/services.dart' show AutofillHints, TextInputAction;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/format/format_checks.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_constants.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_draft.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/cubit/countries_cubit.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/draft_fields.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/form_block.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/form_scope.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';
import 'package:heuser_erp_mobile/features/documents/domain/doc_rows.dart';
import 'package:heuser_erp_mobile/features/documents/presentation/widgets/attach_card.dart';

/// Step 1 · "About you": level, names, date of birth, gender, CNIC,
/// religion, mobile, email, dual nationality, picture and B-Form.
class FamilyAboutBlock extends StatelessWidget {
  /// Creates the block.
  const FamilyAboutBlock({
    required this.draft,
    required this.prefilledEmail,
    required this.docByCode,
    super.key,
  });

  /// Current draft.
  final FormDraft draft;

  /// The email came from the sign-in and is unchanged.
  final bool prefilledEmail;

  /// Document row lookup.
  final DocRow? Function(String code) docByCode;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final a = t.form.about;
    final d = draft;
    final now = DateTime.now();
    final countries = context.watch<CountriesCubit>();
    return FormBlock(
      title: a.title,
      children: [
        DraftSegmented<Level>(
          label: a.level,
          required: true,
          value: d.level,
          error: context.fieldError('level'),
          segments: [
            HSegment(value: Level.as_, label: t.applications.levelAS),
            HSegment(value: Level.a2, label: t.applications.levelA2),
          ],
          onChanged: (v) => context.patch((d) => d.copyWith(level: v)),
        ),
        HSpace.gap4,
        DraftTextField(
          label: a.firstName,
          required: true,
          value: d.firstName,
          error: context.fieldError('first_name'),
          autofillHints: const [AutofillHints.givenName],
          onChanged: (v) =>
              context.patchField('first_name', (d) => d.copyWith(firstName: v)),
        ),
        HSpace.gap3,
        DraftTextField(
          label: a.lastName,
          required: true,
          value: d.lastName,
          error: context.fieldError('last_name'),
          autofillHints: const [AutofillHints.familyName],
          onChanged: (v) =>
              context.patchField('last_name', (d) => d.copyWith(lastName: v)),
        ),
        HSpace.gap3,
        HDatePicker(
          label: a.dob,
          required: true,
          value: d.dateOfBirth == null
              ? null
              : DateTime.tryParse(d.dateOfBirth!),
          error: context.fieldError('date_of_birth'),
          firstDate: DateTime(1900),
          lastDate: DateTime(FormRules.dobMaxYear(now), 12, 31),
          initialDate: DateTime(FormRules.dobMaxYear(now) - 4),
          onChanged: (v) => context.patchField(
            'date_of_birth',
            (d) => d.copyWith(dateOfBirth: _iso(v)),
          ),
        ),
        HSpace.gap4,
        DraftSegmented<String>(
          label: a.gender,
          required: true,
          value: d.gender.isEmpty ? null : d.gender,
          error: context.fieldError('gender'),
          segments: [
            HSegment(value: 'male', label: a.male),
            HSegment(value: 'female', label: a.female),
          ],
          onChanged: (v) =>
              context.patchField('gender', (d) => d.copyWith(gender: v)),
        ),
        HSpace.gap4,
        DraftTextField(
          label: a.cnic,
          hint: a.cnicHint,
          required: true,
          format: FieldFormat.cnic,
          value: d.cnic,
          error: context.fieldError('cnic'),
          onChanged: (v) =>
              context.patchField('cnic', (d) => d.copyWith(cnic: v)),
          onFormatError: (f) => context.formatError('cnic', f),
        ),
        HSpace.gap3,
        HSelect<String>(
          label: a.religion,
          hint: a.religionNone,
          value: d.religion.isEmpty ? null : d.religion,
          options: [
            HSelectOption(value: '', label: a.religionNone),
            for (final r in FormRules.religions)
              HSelectOption(value: r, label: r),
          ],
          onChanged: (v) => context.patch((d) => d.copyWith(religion: v)),
        ),
        HSpace.gap3,
        DraftTextField(
          label: a.mobile,
          required: true,
          format: FieldFormat.phone,
          value: d.mobile,
          error: context.fieldError('mobile'),
          leadingIcon: HIcons.phone,
          autofillHints: const [AutofillHints.telephoneNumber],
          onChanged: (v) =>
              context.patchField('mobile', (d) => d.copyWith(mobile: v)),
          onFormatError: (f) => context.formatError('mobile', f),
        ),
        HSpace.gap3,
        DraftTextField(
          label: a.email,
          helper: prefilledEmail ? t.form.prefilled : null,
          format: FieldFormat.email,
          value: d.email,
          error: context.fieldError('email'),
          leadingIcon: HIcons.mail,
          autofillHints: const [AutofillHints.email],
          textInputAction: TextInputAction.done,
          onChanged: (v) =>
              context.patchField('email', (d) => d.copyWith(email: v)),
          onFormatError: (f) => context.formatError('email', f),
        ),
        HSpace.gap4,
        HSwitch(
          label: a.dual,
          description: a.dualSub,
          value: d.dual,
          onChanged: (v) => context.patch((d) => d.copyWith(dual: v)),
        ),
        if (d.dual) ...[
          HSpace.gap3,
          HSelect<String>(
            label: a.otherNationality,
            required: true,
            value: d.otherNationality.isEmpty ? null : d.otherNationality,
            error: context.fieldError('other_nationality'),
            sheetTitle: a.otherNationality,
            searchHint: t.common.search,
            options: [
              for (final c in countries.others)
                HSelectOption(value: c.code, label: c.name),
              if (d.otherNationality.isNotEmpty &&
                  !countries.others.any((c) => c.code == d.otherNationality))
                HSelectOption(
                  value: d.otherNationality,
                  label: d.otherNationality,
                ),
            ],
            onChanged: (v) => context.patchField(
              'other_nationality',
              (d) => d.copyWith(otherNationality: v),
            ),
          ).hFadeInUp(context),
        ],
        HSpace.gap4,
        AttachCard(row: docByCode('photo'), title: a.photo, hint: a.photoHint),
        HSpace.gap2,
        AttachCard(
          row: docByCode('bform_cnic'),
          title: a.bform,
          hint: a.bformHint,
        ),
      ],
    );
  }

  static String _iso(DateTime v) =>
      '${v.year.toString().padLeft(4, '0')}-${v.month.toString().padLeft(2, '0')}-${v.day.toString().padLeft(2, '0')}';
}
