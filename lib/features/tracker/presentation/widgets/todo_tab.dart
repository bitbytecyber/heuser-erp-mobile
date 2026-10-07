import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/files/file_pick_service.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart';
import 'package:heuser_erp_mobile/features/documents/domain/doc_rows.dart';
import 'package:heuser_erp_mobile/features/tracker/domain/tracker_rules.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/widgets/interview_task_view.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/widgets/offer_task_view.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/widgets/payment_task_view.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/widgets/task_tile.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/widgets/tracker_format.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/widgets/trials_task_view.dart';

/// The "To do" tab: documents, interview, trials, financial aid, enrolment.
class TodoTab extends StatelessWidget {
  /// Creates the tab.
  const TodoTab({
    required this.application,
    required this.rows,
    required this.repo,
    required this.files,
    required this.onOpenDocuments,
    super.key,
  });

  /// The application.
  final Application application;

  /// Document rows.
  final List<DocRow> rows;

  /// For the booking pickers.
  final IntakeRepository repo;

  /// File picking for proofs of payment.
  final FilePickService files;

  /// Switches to the Documents tab.
  final VoidCallback onOpenDocuments;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context).tracker;
    final a = application;
    if (a.status.isEnded) {
      return HText(t.nothingLeft, tone: HTextTone.secondary);
    }
    final docs = TrackerRules.documentsTask(rows);
    final d = t.docsTask;
    final docsSub = switch (docs.kind) {
      DocsTaskKind.replace => d.replace,
      DocsTaskKind.blocking => d.blocking(n: docs.count),
      DocsTaskKind.toSend => d.toSend(
        names: TrackerFormat.names(
          docs.names,
          (names, n) => d.andMore(names: names, n: n),
        ),
      ),
      DocsTaskKind.allIn => d.allIn,
    };
    final aid = a.financialAid;
    final left = TrackerRules.enrolledLeft(rows);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TaskTile(
          state: docs.kind.todo ? TaskState.todo : TaskState.done,
          icon: HIcons.file,
          title: d.title,
          sub: docsSub,
          action: docs.kind.todo
              ? HButton.filled(
                  label: d.upload,
                  size: HButtonSize.sm,
                  expand: false,
                  onPressed: onOpenDocuments,
                )
              : HButton.outline(
                  label: d.view,
                  size: HButtonSize.sm,
                  expand: false,
                  onPressed: onOpenDocuments,
                ),
        ),
        HSpace.gap3,
        InterviewTaskView(application: a, repo: repo),
        if (a.trials.isNotEmpty) ...[
          HSpace.gap3,
          TrialsTaskView(application: a, repo: repo),
        ],
        if (aid != null) ...[
          HSpace.gap3,
          TaskTile(
            state: aid.submittedAt != null ? TaskState.done : TaskState.todo,
            icon: HIcons.file,
            title: t.aid.title,
            sub: aid.submittedAt != null ? t.aid.sent : t.aid.given,
            children: [
              if (aid.submittedAt == null)
                HText(
                  t.aid.pending,
                  style: HTextStyle.bodySm,
                  tone: HTextTone.secondary,
                ),
            ],
          ),
        ],
        HSpace.gap3,
        OfferTaskView(application: a),
        HSpace.gap3,
        PaymentTaskView(application: a, files: files),
        if (a.status == AppStatus.enrolled) ...[
          HSpace.gap3,
          TaskTile(
            state: TaskState.done,
            icon: HIcons.school,
            title: t.enrolled.title,
            sub: t.enrolled.sub,
            children: [
              HText(
                left.isEmpty
                    ? t.enrolled.none
                    : t.enrolled.left(
                        docs: left.map((x) => x.toLowerCase()).join(', '),
                      ),
                style: HTextStyle.bodySm,
                tone: HTextTone.secondary,
              ),
            ],
          ),
        ],
      ].hStaggered(context),
    );
  }
}
