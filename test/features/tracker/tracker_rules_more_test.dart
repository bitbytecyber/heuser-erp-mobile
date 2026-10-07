import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/offer.dart';
import 'package:heuser_erp_mobile/features/documents/domain/doc_rows.dart';
import 'package:heuser_erp_mobile/features/tracker/domain/offer_rules.dart';
import 'package:heuser_erp_mobile/features/tracker/domain/tracker_rules.dart';

DocRow _row(
  String title, {
  DocState state = DocState.missing,
  DocStage stage = DocStage.beforeInterview,
  bool early = false,
  bool actionable = true,
}) => DocRow(
  key: title,
  code: title,
  docType: 1,
  title: title,
  sub: '',
  stage: stage,
  early: early,
  group: DocGroup.later,
  state: state,
  actionable: actionable,
);

Application _app({
  Interview? interview,
  bool released = true,
  bool rebook = false,
  Offer? offer,
}) => Application(
  id: 1,
  status: AppStatus.underReview,
  interview: interview,
  interviewReleased: released,
  interviewRebook: rebook,
  offer: offer,
);

void main() {
  group('enrolledLeft (EnrolledTask)', () {
    test('lists every required row not in, early ones included', () {
      final left = TrackerRules.enrolledLeft([
        _row('Photo', early: true),
        _row('B-Form', early: true, state: DocState.later),
        _row('Result slip', state: DocState.replace),
        _row('Leaving certificate', state: DocState.ready),
        _row('Matric', state: DocState.checking),
        _row('CNIC', state: DocState.verified),
        _row('Award', stage: DocStage.optional),
        _row('Referee', actionable: false),
      ]);
      expect(left, ['Photo', 'B-Form', 'Result slip']);
    });

    test('nothing left', () {
      expect(
        TrackerRules.enrolledLeft([_row('Photo', state: DocState.verified)]),
        isEmpty,
      );
    });
  });

  test('latestEvidenceState picks the newest proof across instalments', () {
    expect(TrackerRules.latestEvidenceState(_app()), isNull);
    final a = _app(
      offer: const Offer(
        id: 1,
        instalments: [
          Instalment(
            id: 1,
            evidence: [
              PaymentEvidence(
                id: 1,
                state: 'rejected',
                submittedAt: '2026-10-01T09:00:00Z',
              ),
            ],
          ),
          Instalment(
            id: 2,
            evidence: [
              PaymentEvidence(id: 2, submittedAt: '2026-10-03T09:00:00Z'),
              PaymentEvidence(
                id: 3,
                state: 'rejected',
                submittedAt: '2026-09-30T09:00:00Z',
              ),
            ],
          ),
        ],
      ),
    );
    expect(TrackerRules.latestEvidenceState(a), 'pending');
  });

  test('trialOpen', () {
    expect(
      TrackerRules.trialOpen(const Trial(id: 1, state: 'requested')),
      isTrue,
    );
    expect(
      TrackerRules.trialOpen(const Trial(id: 1, state: 'cancelled')),
      isTrue,
    );
    expect(
      TrackerRules.trialOpen(const Trial(id: 1, state: 'booked')),
      isFalse,
    );
    expect(
      TrackerRules.trialOpen(const Trial(id: 1, state: 'skipped')),
      isFalse,
    );
  });

  group('canBookInterview (web canBook)', () {
    const upcoming = Interview(id: 1, state: 'upcoming', canReschedule: true);
    test('fresh booking only while times are released', () {
      expect(TrackerRules.canBookInterview(_app()), isTrue);
      expect(TrackerRules.canBookInterview(_app(released: false)), isFalse);
      expect(
        TrackerRules.canBookInterview(
          _app(interview: const Interview(id: 1, state: 'cancelled')),
        ),
        isTrue,
      );
    });

    test('a live booking can move once, and only while released', () {
      expect(TrackerRules.canBookInterview(_app(interview: upcoming)), isTrue);
      expect(
        TrackerRules.canBookInterview(
          _app(interview: upcoming, released: false),
        ),
        isFalse,
      );
      expect(
        TrackerRules.canBookInterview(
          _app(interview: const Interview(id: 1, state: 'delayed')),
        ),
        isFalse,
      );
    });

    test('no-show books again only when the office allows it', () {
      const missed = Interview(id: 1, state: 'no_show');
      expect(TrackerRules.canBookInterview(_app(interview: missed)), isFalse);
      expect(
        TrackerRules.canBookInterview(_app(interview: missed, rebook: true)),
        isTrue,
      );
      expect(
        TrackerRules.canBookInterview(
          _app(interview: const Interview(id: 1, state: 'completed')),
        ),
        isFalse,
      );
    });
  });

  test('OfferRules.shown: only an offer the family can see', () {
    expect(OfferRules.shown(_app()), isFalse);
    expect(
      OfferRules.shown(_app(offer: const Offer(id: 1, state: 'draft'))),
      isFalse,
    );
    expect(
      OfferRules.shown(_app(offer: const Offer(id: 1, state: 'sent'))),
      isTrue,
    );
    expect(
      OfferRules.shown(_app(offer: const Offer(id: 1, state: 'accepted'))),
      isTrue,
    );
    expect(
      OfferRules.shown(
        _app(
          offer: const Offer(id: 1, state: 'sent', deadline: '2020-01-01'),
        ),
      ),
      isTrue,
    );
  });
}
