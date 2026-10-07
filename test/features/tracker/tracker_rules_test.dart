import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application_summary.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_options.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/offer.dart';
import 'package:heuser_erp_mobile/features/documents/domain/doc_rows.dart';
import 'package:heuser_erp_mobile/features/tracker/domain/slot_days.dart';
import 'package:heuser_erp_mobile/features/tracker/domain/slot_mapping.dart';
import 'package:heuser_erp_mobile/features/tracker/domain/tracker_rules.dart';

Application app({
  AppStatus status = AppStatus.underReview,
  Interview? interview,
  bool released = false,
  bool cleared = false,
  bool rebook = false,
  Offer? offer,
}) => Application(
  id: 1,
  status: status,
  interview: interview,
  interviewReleased: released,
  documentsCleared: cleared,
  interviewRebook: rebook,
  offer: offer,
);

DocRow row(
  String code, {
  DocState state = DocState.missing,
  DocStage stage = DocStage.optional,
  bool early = false,
  bool isResult = false,
  int? result,
}) => DocRow(
  key: code,
  code: code,
  docType: 1,
  title: code,
  sub: '',
  stage: stage,
  early: early,
  group: DocGroup.later,
  state: state,
  isResult: isResult,
  result: result,
);

void main() {
  group('stage index', () {
    const stages = [
      TrackerStage(key: 'received'),
      TrackerStage(key: 'under_review'),
      TrackerStage(key: 'enrolled'),
    ];
    test('current, ended, enrolled', () {
      expect(
        TrackerRules.stageIndex(
          const Tracker(stages: stages, current: 'under_review'),
        ),
        1,
      );
      expect(
        TrackerRules.stageIndex(
          const Tracker(stages: stages, ended: 'Withdrawn'),
        ),
        -1,
      );
      expect(
        TrackerRules.stageIndex(
          const Tracker(stages: stages, current: 'enrolled'),
        ),
        3,
      );
    });
  });

  group('status card', () {
    test('reviewing lists documents needed before the interview', () {
      final c = TrackerRules.statusCard(app(), [
        row('photo', stage: DocStage.beforeInterview),
        row('bform', stage: DocStage.beforeInterview, state: DocState.ready),
        row('mid_term'),
      ]);
      expect(c.kind, StatusKind.reviewing);
      expect(c.missing, ['photo']);
    });

    test('times released and no interview → book', () {
      expect(
        TrackerRules.statusCard(app(released: true), const []).kind,
        StatusKind.bookInterview,
      );
    });

    test('payment proof states', () {
      Offer withEvidence(String state) => Offer(
        id: 1,
        instalments: [
          Instalment(
            id: 1,
            evidence: [
              const PaymentEvidence(
                id: 1,
                state: 'approved',
                submittedAt: '2026-10-01',
              ),
              PaymentEvidence(id: 2, state: state, submittedAt: '2026-10-02'),
            ],
          ),
        ],
      );
      StatusKind kind(String s) => TrackerRules.statusCard(
        app(status: AppStatus.financialVerification, offer: withEvidence(s)),
        const [],
      ).kind;
      expect(kind('pending'), StatusKind.paymentChecking);
      expect(kind('rejected'), StatusKind.paymentRejected);
    });

    test('offer variants', () {
      StatusKind kind(String s) => TrackerRules.statusCard(
        app(
          status: AppStatus.offered,
          offer: Offer(id: 1, state: s),
        ),
        const [],
      ).kind;
      expect(kind('expired'), StatusKind.offerExpired);
      expect(kind('declined'), StatusKind.offerDeclined);
      expect(kind('sent'), StatusKind.offered);
    });
  });

  group('documents task', () {
    test('replace wins, then blocking, then to send, else all in', () {
      expect(
        TrackerRules.documentsTask([row('a', state: DocState.replace)]).kind,
        DocsTaskKind.replace,
      );
      final blocking = TrackerRules.documentsTask([
        row('a', stage: DocStage.beforeInterview),
        row('b', stage: DocStage.beforeInterview),
      ]);
      expect(blocking.kind, DocsTaskKind.blocking);
      expect(blocking.count, 2);
      final toSend = TrackerRules.documentsTask([
        row('photo', early: true),
        row('slip', isResult: true, result: 4),
        row('optional_thing'),
      ]);
      expect(toSend.kind, DocsTaskKind.toSend);
      expect(toSend.names, ['photo', 'slip']);
      expect(
        TrackerRules.documentsTask([
          row('photo', early: true, state: DocState.ready),
        ]).kind,
        DocsTaskKind.allIn,
      );
    });
  });

  group('interview task', () {
    InterviewKind kind(Application a) => TrackerRules.interviewTask(a).kind;
    Interview iv(String state, {bool move = true}) => Interview(
      id: 1,
      state: state,
      startsAt: '2026-10-10T05:00:00Z',
      canReschedule: move,
    );

    test('locked until times are released', () {
      expect(kind(app()), InterviewKind.waitingForDocuments);
      expect(kind(app(cleared: true)), InterviewKind.waitingForTimes);
      expect(kind(app(released: true)), InterviewKind.book);
    });

    test('booked, moved once, done, missed, rebook', () {
      expect(
        kind(app(released: true, interview: iv('upcoming'))),
        InterviewKind.bookedCanMove,
      );
      expect(
        kind(app(released: true, interview: iv('upcoming', move: false))),
        InterviewKind.bookedFinal,
      );
      expect(kind(app(interview: iv('completed'))), InterviewKind.done);
      expect(kind(app(interview: iv('no_show'))), InterviewKind.missed);
      expect(
        kind(app(released: true, rebook: true, interview: iv('no_show'))),
        InterviewKind.book,
      );
      expect(
        kind(app(released: true, interview: iv('cancelled'))),
        InterviewKind.book,
      );
    });
  });

  group('slots', () {
    test('group by day, keep the booked time visible', () {
      final items = interviewSlots(
        const [
          TimeOption(
            startsAt: '2026-10-11T05:00:00Z',
            places: 2,
            booked: 1,
            total: 3,
          ),
          TimeOption(startsAt: '2026-10-10T06:00:00Z', places: 1, total: 1),
          TimeOption(startsAt: '2026-10-10T05:00:00Z', booked: 1, total: 1),
        ],
        const Interview(
          id: 1,
          state: 'upcoming',
          startsAt: '2026-10-12T05:00:00Z',
        ),
      );
      expect(items, hasLength(4));
      expect(items.last.mine, isTrue);
      expect(items.last.key, '');
      final days = groupSlotsByDay(items);
      expect(days, hasLength(3));
      expect(days.first.free, 1);
      final open = initiallyOpenDays(days);
      expect(open, containsAll([days.first.date, days.last.date]));
    });

    test('trial sessions carry their id', () {
      final s = trialSlots(const [
        TrialOption(id: 9, startsAt: '2026-10-10T05:00:00Z', placesLeft: 3),
      ]);
      expect(s.single.key, '9');
      expect(s.single.left, 3);
    });
  });

  test('past review and uploads', () {
    expect(TrackerRules.pastReview(AppStatus.underReview), isFalse);
    expect(TrackerRules.pastReview(AppStatus.offered), isTrue);
    expect(TrackerRules.canUpload(AppStatus.enrolled), isFalse);
    expect(TrackerRules.canUpload(AppStatus.offered), isTrue);
  });
}
