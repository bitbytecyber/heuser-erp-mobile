import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application_summary.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/offer.dart';
import 'package:heuser_erp_mobile/features/documents/domain/doc_rows.dart';
import 'package:heuser_erp_mobile/features/tracker/domain/tracker_models.dart';

export 'tracker_models.dart';

/// Rules of the tracker (`components/apply/tracker.tsx`), as pure functions
/// over the application and its document rows. Copy lives in slang; these
/// only decide *which* message and state apply.
abstract final class TrackerRules {
  /// Once an offer exists the applicant can't change results or defer
  /// documents (`intake/api/applicant.py`).
  static bool pastReview(AppStatus s) =>
      s == AppStatus.offered ||
      s == AppStatus.financialVerification ||
      s == AppStatus.readyToEnroll ||
      s == AppStatus.enrolled ||
      s.isEnded;

  /// Uploads are allowed at all (Documents tab).
  static bool canUpload(AppStatus s) => s != AppStatus.enrolled && !s.isEnded;

  /// A result slip can be sent again while checked / verified.
  static bool canResubmit(AppStatus s) => !pastReview(s);

  /// `HStageBar.currentIndex`: `-1` when ended, `length` when enrolled.
  static int stageIndex(Tracker t) {
    if (t.ended != null) return -1;
    if (t.current == 'enrolled') return t.stages.length;
    return t.stages.indexWhere((s) => s.key == t.current);
  }

  /// The one status card at the top of the tracker.
  static StatusCard statusCard(Application a, List<DocRow> rows) {
    final i = a.interview;
    switch (a.status) {
      case AppStatus.withdrawn:
        final at = a.history.where((h) => h.action == 'withdrawn').firstOrNull;
        return StatusCard(StatusKind.withdrawn, at: _date(at?.at));
      case AppStatus.notOffered:
        return const StatusCard(StatusKind.notOffered);
      case AppStatus.closed:
        return const StatusCard(StatusKind.closed);
      case AppStatus.enrolled:
        return const StatusCard(StatusKind.enrolled);
      case AppStatus.readyToEnroll:
        return const StatusCard(StatusKind.readyToEnroll);
      case AppStatus.financialVerification:
        final ev = latestEvidenceState(a);
        return StatusCard(
          ev == 'pending'
              ? StatusKind.paymentChecking
              : ev == 'rejected'
              ? StatusKind.paymentRejected
              : StatusKind.payVoucher,
        );
      case AppStatus.offered:
        return StatusCard(switch (a.offer?.state) {
          'expired' => StatusKind.offerExpired,
          'declined' => StatusKind.offerDeclined,
          _ => StatusKind.offered,
        });
      case AppStatus.sportsTrial:
        return const StatusCard(StatusKind.sportsTrial);
      case AppStatus.interviewed:
      case AppStatus.offerInProgress:
        return const StatusCard(StatusKind.interviewDone);
      case AppStatus.interviewScheduled:
        return StatusCard(StatusKind.interviewBooked, at: _date(i?.startsAt));
      case AppStatus.draft:
      case AppStatus.received:
      case AppStatus.underReview:
      case AppStatus.unknown:
        if (a.interviewReleased && (i == null || i.state == 'cancelled')) {
          return const StatusCard(StatusKind.bookInterview);
        }
        final missing = rows
            .where(
              (r) =>
                  r.stage == DocStage.beforeInterview &&
                  !r.early &&
                  (r.state == DocState.missing || r.state == DocState.later),
            )
            .map((r) => r.title)
            .toList();
        return StatusCard(StatusKind.reviewing, missing: missing);
    }
  }

  /// State of the newest payment proof, or `null`.
  static String? latestEvidenceState(Application a) {
    final all = [
      for (final i in a.offer?.instalments ?? const <Instalment>[])
        ...i.evidence,
    ]..sort((x, y) => y.submittedAt.compareTo(x.submittedAt));
    return all.firstOrNull?.state;
  }

  /// The Documents task line.
  static DocsTask documentsTask(List<DocRow> rows) {
    bool unsent(DocRow r) =>
        r.actionable &&
        (r.state == DocState.missing || r.state == DocState.later);
    if (rows.any((r) => r.state == DocState.replace)) {
      return const DocsTask(DocsTaskKind.replace);
    }
    final blocking = rows
        .where(
          (r) => r.stage == DocStage.beforeInterview && !r.early && unsent(r),
        )
        .toList();
    if (blocking.isNotEmpty) {
      return DocsTask(DocsTaskKind.blocking, count: blocking.length);
    }
    // Still to send, though the interview can be booked without them: the
    // early ones (photo, B-Form) and the slip of every result that is out.
    final toSend = rows
        .where(
          (r) => (r.early || (r.isResult && r.result != null)) && unsent(r),
        )
        .map((r) => r.title)
        .toList();
    if (toSend.isNotEmpty) {
      return DocsTask(DocsTaskKind.toSend, names: toSend);
    }
    return const DocsTask(DocsTaskKind.allIn);
  }

  /// What the Interview task shows.
  static InterviewTask interviewTask(Application a) {
    final i = a.interview;
    final live = i != null && (i.state == 'upcoming' || i.state == 'delayed');
    final fresh =
        i == null ||
        i.state == 'cancelled' ||
        (i.state == 'no_show' && a.interviewRebook);
    if (i != null && (i.state == 'held' || i.state == 'completed')) {
      return InterviewTask(
        i.state == 'held' ? InterviewKind.inProgress : InterviewKind.done,
        at: _date(i.startsAt),
      );
    }
    if (i?.state == 'no_show' && !a.interviewRebook) {
      return const InterviewTask(InterviewKind.missed);
    }
    if (fresh && !a.interviewReleased) {
      return InterviewTask(
        a.documentsCleared
            ? InterviewKind.waitingForTimes
            : InterviewKind.waitingForDocuments,
      );
    }
    if (live) {
      return InterviewTask(
        i.canReschedule
            ? InterviewKind.bookedCanMove
            : InterviewKind.bookedFinal,
        at: _date(i.startsAt),
      );
    }
    return const InterviewTask(InterviewKind.book);
  }

  /// Whether the family may pick a time now (`canBook` in `InterviewTask`):
  /// only while the office has times released, for a fresh booking or the
  /// one move of a live one. Gates loading the times list.
  static bool canBookInterview(Application a) {
    final i = a.interview;
    final live = i != null && (i.state == 'upcoming' || i.state == 'delayed');
    final fresh =
        i == null ||
        i.state == 'cancelled' ||
        (i.state == 'no_show' && a.interviewRebook);
    return a.interviewReleased && (fresh || (live && i.canReschedule));
  }

  /// A trial still waiting for a booking.
  static bool trialOpen(Trial t) =>
      t.state == 'requested' || t.state == 'cancelled';

  /// Documents still to add after enrolment (`EnrolledTask`): every
  /// required one not yet in, the early ones (photo, B-Form) included.
  static List<String> enrolledLeft(List<DocRow> rows) => rows
      .where(
        (r) =>
            r.actionable &&
            r.stage != DocStage.optional &&
            !(r.state == DocState.ready ||
                r.state == DocState.checking ||
                r.state == DocState.verified),
      )
      .map((r) => r.title)
      .toList();

  static DateTime? _date(String? iso) =>
      iso == null ? null : DateTime.tryParse(iso)?.toLocal();
}
