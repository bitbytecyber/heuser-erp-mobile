import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/bloc/application_form_bloc.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/cubit/countries_cubit.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/form_block.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/steps/family_about_block.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/steps/family_address_block.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/steps/family_contact_block.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/steps/family_parents_block.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/steps/review_details.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/steps/review_statement_block.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/steps/studies_activities_block.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/steps/studies_referee_block.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/steps/studies_results_block.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/steps/studies_school_block.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/steps/studies_subjects_block.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart';
import 'package:heuser_erp_mobile/features/documents/domain/doc_rows.dart';
import 'package:heuser_erp_mobile/features/documents/domain/doc_rows_input.dart';
import 'package:heuser_erp_mobile/features/documents/presentation/widgets/doc_labels.dart';
import 'package:heuser_erp_mobile/features/documents/presentation/widgets/docs_list.dart';

/// The scrolling body of one step: lede, required legend, blocks.
class FormStepView extends StatelessWidget {
  /// Creates the view for [step].
  const FormStepView({
    required this.step,
    required this.repo,
    required this.collegeName,
    required this.userEmail,
    super.key,
  });

  /// 1–3.
  final int step;

  /// For the pickers (schools, cities).
  final IntakeRepository repo;

  /// College name for the copy.
  final String collegeName;

  /// Signed-in email (prefilled tag).
  final String? userEmail;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final state = context.watch<ApplicationFormBloc>().state;
    final d = state.draft;
    final rows = buildDocRows(
      DocRowsInput(
        types: state.options?.documentTypes ?? const [],
        slots: state.application.documents,
        results: d.results,
        qualification: d.qualification,
        predicted: d.predicted,
        refereeName: d.referee.name,
        hasActivities: d.activities.isNotEmpty,
        sent: false,
        titles: DocLabels.titles(t),
      ),
    );
    DocRow? byCode(String code) =>
        rows.where((r) => r.code == code && r.actionable).firstOrNull;
    final lede = switch (step) {
      1 => t.form.lede.family,
      2 => t.form.lede.studies,
      _ => t.form.lede.review,
    };
    final blocks = switch (step) {
      1 => [
        FamilyAboutBlock(
          draft: d,
          prefilledEmail: userEmail != null && d.email == userEmail,
          docByCode: byCode,
        ),
        FamilyAddressBlock(draft: d, repo: repo),
        FamilyParentsBlock(draft: d),
        FamilyEmergencyBlock(draft: d),
        FamilySiblingsBlock(draft: d, collegeName: collegeName),
      ],
      2 => [
        StudiesSchoolBlock(draft: d, repo: repo),
        StudiesResultsBlock(draft: d, options: state.options, rows: rows),
        StudiesSubjectsBlock(draft: d, options: state.options),
        StudiesRefereeBlock(draft: d, docByCode: byCode),
        StudiesActivitiesBlock(draft: d, options: state.options, rows: rows),
      ],
      _ => [
        ReviewStatementBlock(draft: d, collegeName: collegeName),
        _DocumentsBlock(rows: rows, beforeCount: _beforeCount(state)),
        FormBlock(
          title: t.form.review.title,
          children: [
            ReviewDetails(
              draft: d,
              options: state.options,
              countryName: context.read<CountriesCubit>().nameOf,
              collegeName: collegeName,
              onEdit: (n) => context.read<ApplicationFormBloc>().add(
                ApplicationFormEvent.stepRequested(n),
              ),
            ),
          ],
        ),
        ReviewDeclaration(
          declared: state.declared,
          missing: state.declarationMissing,
          collegeName: collegeName,
          onChanged: (v) => context.read<ApplicationFormBloc>().add(
            ApplicationFormEvent.declarationChanged(value: v),
          ),
        ),
      ],
    };
    return ListView(
      key: PageStorageKey<int>(step),
      padding: HSpace.page,
      children: [
        HText(lede, tone: HTextTone.secondary),
        HSpace.gap1,
        HText(
          t.form.requiredLegend,
          style: HTextStyle.bodySm,
          tone: HTextTone.tertiary,
        ),
        HSpace.gap4,
        for (final b in blocks) ...[b, HSpace.gap3],
        HSpace.gap6,
      ],
    );
  }

  static int _beforeCount(ApplicationFormState s) =>
      (s.options?.documentTypes ?? const [])
          .where(
            (d) =>
                d.stage == DocStage.beforeInterview &&
                d.blocksInterview != false,
          )
          .length;
}

class _DocumentsBlock extends StatelessWidget {
  const _DocumentsBlock({required this.rows, required this.beforeCount});

  final List<DocRow> rows;
  final int beforeCount;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context).form.documentsBlock;
    return FormBlock(
      title: t.title,
      note: beforeCount == 0
          ? t.none
          : beforeCount == 1
          ? t.neededOne
          : t.needed(n: beforeCount),
      children: [DocsList(rows: rows)],
    );
  }
}
