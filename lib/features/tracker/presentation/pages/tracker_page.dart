import 'dart:async';

import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/files/document_opener.dart';
import 'package:heuser_erp_mobile/core/files/file_pick_service.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/cubit/countries_cubit.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart';
import 'package:heuser_erp_mobile/features/documents/domain/doc_rows.dart';
import 'package:heuser_erp_mobile/features/documents/domain/doc_rows_input.dart';
import 'package:heuser_erp_mobile/features/documents/presentation/cubit/documents_cubit.dart';
import 'package:heuser_erp_mobile/features/documents/presentation/widgets/doc_labels.dart';
import 'package:heuser_erp_mobile/features/tracker/domain/tracker_rules.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/cubit/downloads_cubit.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/pages/tracker_feedback.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/pages/tracker_live_refresh.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/widgets/status_card_view.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/widgets/todo_tab.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/widgets/tracker_format.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/widgets/tracker_tabs.dart';

/// A sent application (`Tracker` in `tracker.tsx`): greeting and reference,
/// stage bar, status card and the tabs To do / Documents / Application /
/// History.
class TrackerPage extends StatelessWidget {
  /// Creates the page.
  const TrackerPage({
    required this.application,
    required this.repo,
    required this.files,
    required this.opener,
    required this.collegeName,
    this.onChanged,
    this.pushLinks = const Stream.empty(),
    super.key,
  });

  /// The application as loaded.
  final Application application;

  /// Intake repository.
  final IntakeRepository repo;

  /// File picking for uploads.
  final FilePickService files;

  /// Opens downloaded PDFs.
  final DocumentOpener opener;

  /// College name for the copy.
  final String collegeName;

  /// Links of live pushes (refreshes this page when one is about it).
  final Stream<String> pushLinks;

  /// Called with every fresh copy (keeps the list in sync).
  final ValueChanged<Application>? onChanged;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) =>
            TrackerBloc(repo, application)..add(const TrackerEvent.started()),
      ),
      BlocProvider(
        create: (_) => DocumentsCubit(
          repo: repo,
          files: files,
          applicationId: application.id,
        ),
      ),
      BlocProvider(create: (_) => CountriesCubit(repo)),
      BlocProvider(
        create: (_) => DownloadsCubit(
          repo: repo,
          opener: opener,
          applicationId: application.id,
          reference: application.reference ?? 'application',
        ),
      ),
    ],
    child: TrackerFeedback(
      onChanged: onChanged,
      child: TrackerLiveRefresh(
        pushLinks: pushLinks,
        child: _TrackerView(repo: repo, files: files, collegeName: collegeName),
      ),
    ),
  );
}

class _TrackerView extends StatefulWidget {
  const _TrackerView({
    required this.repo,
    required this.files,
    required this.collegeName,
  });

  final IntakeRepository repo;
  final FilePickService files;
  final String collegeName;

  @override
  State<_TrackerView> createState() => _TrackerViewState();
}

class _TrackerViewState extends State<_TrackerView> {
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final state = context.watch<TrackerBloc>().state;
    final a = state.application;
    final rows = buildDocRows(
      DocRowsInput(
        types: state.options?.documentTypes ?? const [],
        slots: a.documents,
        results: a.results,
        qualification: a.profile.qualification,
        predicted: a.results.isNotEmpty && a.results.every((r) => !r.resultOut),
        refereeName: a.profile.referee.name,
        hasActivities: a.activities.isNotEmpty,
        sent: true,
        titles: DocLabels.titles(t),
      ),
    );
    final first = a.profile.firstName.trim();
    return HScaffold(
      appBar: HAppBar(
        title: a.fullName.isEmpty ? t.applications.title : a.fullName,
        backLabel: t.common.back,
        actions: [
          if (state.refreshing)
            const Padding(padding: EdgeInsets.all(HSpace.x3), child: HSpinner())
          else
            HIconButton(
              icon: HIcons.refresh,
              semanticsLabel: t.common.retry,
              onPressed: () => context.read<TrackerBloc>().add(
                const TrackerEvent.refreshed(),
              ),
            ),
        ],
      ),
      body: HRefreshable(
        semanticsLabel: t.common.loading,
        onRefresh: () async {
          final bloc = context.read<TrackerBloc>()
            ..add(const TrackerEvent.refreshed());
          await bloc.stream
              .firstWhere((s) => !s.refreshing)
              .timeout(
                const Duration(seconds: 15),
                onTimeout: () => bloc.state,
              );
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: HSpace.page,
          children: [
            HHeroCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HText(
                    first.isEmpty
                        ? t.tracker.hiThere
                        : t.tracker.hi(name: first),
                    style: HTextStyle.headlineMd,
                  ),
                  HSpace.gap1,
                  HText(t.tracker.lede, tone: HTextTone.secondary),
                  if (a.reference != null) ...[
                    HSpace.gap3,
                    Row(
                      children: [
                        HStatusPill(
                          '${t.tracker.reference} ${a.reference}',
                          tone: HTone.brand,
                        ),
                        HSpace.hgap2,
                        HButton.ghost(
                          label: t.tracker.copy,
                          icon: HIcons.copy,
                          size: HButtonSize.sm,
                          onPressed: () {
                            unawaited(
                              Clipboard.setData(
                                ClipboardData(text: a.reference!),
                              ),
                            );
                            HToast.success(context, t.tracker.copied);
                          },
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            HSpace.gap4,
            if (a.tracker.stages.isNotEmpty) ...[
              HCard(
                child: HStageBar(
                  stages: [
                    for (final s in a.tracker.stages)
                      HStage(key: s.key, label: s.label),
                  ],
                  currentIndex: TrackerRules.stageIndex(a.tracker),
                  semanticsLabel: TrackerFormat.stageSummary(t, [
                    for (final s in a.tracker.stages) s.label,
                  ], TrackerRules.stageIndex(a.tracker)),
                ),
              ),
              HSpace.gap3,
            ],
            StatusCardView(
              card: TrackerRules.statusCard(a, rows),
              collegeName: widget.collegeName,
            ),
            HSpace.gap4,
            HTabs(
              tabs: [
                HTab(t.tracker.tabs.todo),
                HTab(t.tracker.tabs.docs),
                HTab(t.tracker.tabs.form),
                HTab(t.tracker.tabs.history),
              ],
              index: _tab,
              onChanged: (i) => setState(() => _tab = i),
            ),
            HSpace.gap4,
            AnimatedSwitcher(
              duration: context.h.motion.of(context.h.motion.standard),
              child: KeyedSubtree(
                key: ValueKey(_tab),
                child: switch (_tab) {
                  0 => TodoTab(
                    application: a,
                    rows: rows,
                    repo: widget.repo,
                    files: widget.files,
                    onOpenDocuments: () => setState(() => _tab = 1),
                  ),
                  1 => DocumentsTab(application: a, rows: rows),
                  2 => ApplicationTab(
                    application: a,
                    options: state.options,
                    collegeName: widget.collegeName,
                  ),
                  _ => HistoryTab(application: a),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
