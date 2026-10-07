import 'dart:async';

import 'package:flutter/services.dart' show AutofillHints, TextCapitalization;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_draft.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/cubit/countries_cubit.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/draft_fields.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/form_block.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/form_scope.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/text_prompt_sheet.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_options.dart';
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart';

/// Step 1 · "Where you live": address, country, city (catalogue or typed).
class FamilyAddressBlock extends StatelessWidget {
  /// Creates the block.
  const FamilyAddressBlock({
    required this.draft,
    required this.repo,
    super.key,
  });

  /// Current draft.
  final FormDraft draft;

  /// City search (the picker fetches pages itself).
  final IntakeRepository repo;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final a = t.form.address;
    final d = draft;
    final countries = context.watch<CountriesCubit>();
    final cityValue = d.cityId != null
        ? City(id: d.cityId!, name: d.cityText)
        : null;
    return FormBlock(
      title: a.title,
      children: [
        DraftTextField(
          label: a.address,
          hint: a.addressHint,
          required: true,
          value: d.address,
          error: context.fieldError('address'),
          autofillHints: const [AutofillHints.streetAddressLine1],
          textCapitalization: TextCapitalization.sentences,
          onChanged: (v) =>
              context.patchField('address', (d) => d.copyWith(address: v)),
        ),
        HSpace.gap3,
        HSelect<String>(
          label: a.country,
          required: true,
          value: d.country.isEmpty ? null : d.country,
          error: context.fieldError('country'),
          sheetTitle: a.country,
          searchHint: t.common.search,
          leadingIcon: HIcons.location,
          options: [
            for (final c in countries.state)
              HSelectOption(value: c.code, label: c.name),
            if (d.country.isNotEmpty &&
                !countries.state.any((c) => c.code == d.country))
              HSelectOption(value: d.country, label: d.country),
          ],
          onChanged: (code) => context.patchField('country', (d) {
            // A city picked for the old country no longer applies; keep the typed name.
            if (code != d.country && d.cityId != null) {
              return d.copyWith(
                country: code,
                cityId: null,
                cityOther: d.cityText.trim(),
              );
            }
            return d.copyWith(country: code);
          }),
        ),
        HSpace.gap3,
        HSearchSelect<City>(
          label: a.city,
          required: true,
          value: cityValue,
          otherLabel: d.cityId == null && d.cityText.isNotEmpty
              ? d.cityText
              : null,
          error: context.fieldError('city'),
          hint: t.common.search,
          labels: HSearchLabels(
            searchHint: t.common.search,
            noResults: t.common.noMatches,
            notListed: t.form.notListed,
            error: t.common.tryAgainLoad,
            retry: t.common.retry,
          ),
          fetchPage: (q, offset) async {
            if (offset > 0) return const [];
            final r = await repo.searchCities(d.country, q);
            return r.fold<List<City>>(
              (f) => throw Exception(f.toString()),
              (list) => list,
            );
          },
          labelOf: (c) => c.name,
          onChanged: (c) => context.patchField(
            'city',
            (d) => d.copyWith(cityId: c.id, cityText: c.name, cityOther: ''),
          ),
          onOther: () => unawaited(_typeCity(context)),
        ),
      ],
    );
  }

  Future<void> _typeCity(BuildContext context) async {
    final t = Translations.of(context);
    final name = await TextPromptSheet.show(
      context,
      title: t.form.address.city,
      hint: t.form.typeNameHint,
      confirmLabel: t.common.done,
      cancelLabel: t.common.cancel,
      initial: draft.cityId == null ? draft.cityText : '',
      validate: (v) => v.isEmpty ? t.form.errors.req.city : null,
    );
    if (name == null || !context.mounted) return;
    context.patchField(
      'city',
      (d) => d.copyWith(cityId: null, cityText: name, cityOther: name),
    );
  }
}
