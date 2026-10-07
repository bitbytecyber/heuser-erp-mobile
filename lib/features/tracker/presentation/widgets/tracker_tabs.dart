import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_draft.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/cubit/countries_cubit.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/steps/review_details.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_options.dart';
import 'package:heuser_erp_mobile/features/documents/domain/doc_rows.dart';
import 'package:heuser_erp_mobile/features/documents/presentation/widgets/docs_list.dart';
import 'package:heuser_erp_mobile/features/tracker/domain/tracker_rules.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/widgets/results_update.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/widgets/tracker_format.dart';

/// The Documents tab: results still to come, then the documents list.
class DocumentsTab extends StatelessWidget {
  /// Creates the tab.
  const DocumentsTab({
    required this.application,
    required this.rows,
    super.key,
  });

  /// The application.
  final Application application;

  /// Document rows.
  final List<DocRow> rows;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context).tracker;
    final s = application.status;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (!TrackerRules.pastReview(s)) ...[
          ResultsUpdate(results: application.results),
          HSpace.gap3,
        ],
        HCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HText(
                t.docsHint,
                style: HTextStyle.bodySm,
                tone: HTextTone.secondary,
              ),
              HSpace.gap3,
              DocsList(
                rows: rows,
                canUpload: TrackerRules.canUpload(s),
                canResubmit: TrackerRules.canResubmit(s),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// The Application tab: a read-only copy of what was sent.
class ApplicationTab extends StatelessWidget {
  /// Creates the tab.
  const ApplicationTab({
    required this.application,
    required this.options,
    required this.collegeName,
    super.key,
  });

  /// The application.
  final Application application;

  /// Form options (subject names).
  final FormOptions? options;

  /// College name for the copy.
  final String collegeName;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context).tracker;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HText(t.formHint, style: HTextStyle.bodySm, tone: HTextTone.secondary),
        HSpace.gap3,
        ReviewDetails(
          draft: FormDraft.fromApplication(application),
          options: options,
          countryName: context.watch<CountriesCubit>().nameOf,
          collegeName: collegeName,
          readOnly: true,
        ),
      ],
    );
  }
}

/// The History tab: newest first.
class HistoryTab extends StatelessWidget {
  /// Creates the tab.
  const HistoryTab({required this.application, super.key});

  /// The application.
  final Application application;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context).tracker;
    final items = [...application.history]
      ..sort((a, b) => b.at.compareTo(a.at));
    if (items.isEmpty) {
      return HText(t.historyEmpty, tone: HTextTone.secondary);
    }
    return HCard(
      child: HTimeline(
        entries: [
          for (final h in items)
            HTimelineEntry(
              title: h.note.isNotEmpty
                  ? h.note
                  : TrackerFormat.humanize(h.action),
              timestamp: TrackerFormat.history(h.at),
              tone: HTone.brand,
            ),
        ],
      ),
    );
  }
}
