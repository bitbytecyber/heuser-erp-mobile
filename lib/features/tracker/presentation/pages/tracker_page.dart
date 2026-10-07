import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_draft.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/cubit/countries_cubit.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/steps/review_details.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_options.dart';
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart';

/// The sent application (M3 slice of M4's tracker): status, stage bar and
/// the read-only review. To-do, documents, interview, offer and history
/// tabs arrive in M4.
class TrackerPage extends StatelessWidget {
  /// Creates the page.
  const TrackerPage({
    required this.application,
    required this.repo,
    required this.collegeName,
    this.options,
    super.key,
  });

  /// The application.
  final Application application;

  /// For country names.
  final IntakeRepository repo;

  /// College name for the copy.
  final String collegeName;

  /// Options when already loaded.
  final FormOptions? options;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final a = application;
    final draft = FormDraft.fromApplication(a);
    final stages = a.tracker.stages;
    return BlocProvider(
      create: (_) => CountriesCubit(repo),
      child: Builder(
        builder: (context) => HScaffold(
          appBar: HAppBar(
            title: a.fullName.isEmpty ? t.applications.title : a.fullName,
            subtitle: a.reference,
            backLabel: t.common.back,
          ),
          body: ListView(
            padding: HSpace.page,
            children: [
              HHeroCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HStatusPill(
                      a.tracker.ended ?? a.statusLabel,
                      tone: a.status.isEnded ? HTone.danger : HTone.brand,
                      solid: true,
                    ),
                    HSpace.gap3,
                    HText(
                      t.applications.sentTitle,
                      style: HTextStyle.headlineMd,
                    ),
                    HSpace.gap1,
                    HText(t.applications.sentBody, tone: HTextTone.secondary),
                  ],
                ),
              ),
              HSpace.gap4,
              if (stages.isNotEmpty)
                HCard(
                  child: HStageBar(
                    stages: [
                      for (final s in stages)
                        HStage(key: s.key, label: s.label),
                    ],
                    currentIndex: a.tracker.currentIndex,
                  ),
                ),
              HSpace.gap3,
              HCard(
                child: Row(
                  children: [
                    const HIcon(HIcons.info, tone: HTextTone.info),
                    HSpace.hgap2,
                    Expanded(
                      child: HText(
                        t.applications.trackerSoon,
                        style: HTextStyle.bodySm,
                        tone: HTextTone.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              HSpace.gap4,
              Builder(
                builder: (context) => ReviewDetails(
                  draft: draft,
                  options: options,
                  countryName: context.watch<CountriesCubit>().nameOf,
                  collegeName: collegeName,
                  readOnly: true,
                ),
              ),
            ].hStaggered(context),
          ),
        ),
      ),
    );
  }
}
