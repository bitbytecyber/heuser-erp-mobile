import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_options.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/offer.dart';
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart';
import 'package:heuser_erp_mobile/features/tracker/domain/offer_rules.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:mocktail/mocktail.dart';

class _Repo extends Mock implements IntakeRepository;

PaymentEvidence ev(String state, String at, {bool? replaceable}) =>
    PaymentEvidence(
      id: at.hashCode,
      state: state,
      submittedAt: at,
      replaceable: replaceable,
    );

void main() {
  final now = DateTime(2026, 10, 7, 12);

  group('offer task', () {
    test('states and deadline', () {
      expect(OfferRules.offerTask(null, now), OfferTaskKind.waiting);
      expect(
        OfferRules.offerTask(const Offer(id: 1, state: 'draft'), now),
        OfferTaskKind.waiting,
      );
      expect(
        OfferRules.offerTask(
          const Offer(id: 1, state: 'sent', deadline: '2026-10-07'),
          now,
        ),
        OfferTaskKind.open,
      );
      expect(
        OfferRules.offerTask(
          const Offer(id: 1, state: 'sent', deadline: '2026-10-06'),
          now,
        ),
        OfferTaskKind.deadlinePassed,
      );
      expect(
        OfferRules.offerTask(const Offer(id: 1, state: 'accepted'), now),
        OfferTaskKind.accepted,
      );
    });

    test('deadline is the end of that day', () {
      expect(
        OfferRules.deadlineEnd(const Offer(id: 1, deadline: '2026-10-07')),
        DateTime(2026, 10, 7, 23, 59, 59),
      );
    });

    test('scholarships and savings', () {
      const offer = Offer(
        id: 1,
        scholarships: [
          OfferScholarship(name: 'Merit', percent: '25.00'),
          OfferScholarship(name: 'Sports', percent: '7.5'),
        ],
        calculation: OfferCalculation(
          lines: [
            OfferLine(component: 'adm', label: 'Admission'),
            OfferLine(component: 'tui', label: 'Tuition', saving: '5000'),
          ],
        ),
      );
      expect(OfferRules.scholarshipSummary(offer), 'Merit 25%, Sports 7.5%');
      expect(OfferRules.savings(offer).single.component, 'tui');
    });

    test('money', () {
      expect(OfferRules.money('125000.00'), 'PKR 125,000');
      expect(OfferRules.money('999'), 'PKR 999');
      expect(OfferRules.money('1234567'), 'PKR 1,234,567');
    });
  });

  group('instalments', () {
    test('kinds follow the newest proof', () {
      expect(
        OfferRules.instalment(const Instalment(id: 1, paid: true)),
        InstalmentKind.paid,
      );
      expect(
        OfferRules.instalment(const Instalment(id: 1)),
        InstalmentKind.due,
      );
      expect(
        OfferRules.instalment(
          Instalment(
            id: 1,
            evidence: [
              ev('rejected', '2026-10-01'),
              ev('pending', '2026-10-02'),
            ],
          ),
        ),
        InstalmentKind.checking,
      );
      expect(
        OfferRules.instalment(
          Instalment(
            id: 1,
            evidence: [
              ev('pending', '2026-10-01'),
              ev('rejected', '2026-10-02'),
            ],
          ),
        ),
        InstalmentKind.rejected,
      );
      expect(
        OfferRules.instalment(
          Instalment(
            id: 1,
            evidence: [ev('pending', '2026-10-02', replaceable: true)],
          ),
        ),
        InstalmentKind.replaceable,
      );
    });

    test('partly paid, numbering, pay-by', () {
      const i = Instalment(
        id: 1,
        paidAmount: '1000',
        remaining: '500',
        dueDate: '2026-10-20',
      );
      expect(OfferRules.partlyPaid(i), isTrue);
      expect(
        OfferRules.numberInstalments(
          const Offer(
            id: 1,
            instalments: [Instalment(id: 1), Instalment(id: 2)],
          ),
        ),
        isTrue,
      );
      expect(
        OfferRules.numberInstalments(
          const Offer(
            id: 1,
            instalments: [
              Instalment(id: 1),
              Instalment(id: 2, kind: 'tuition'),
            ],
          ),
        ),
        isFalse,
      );
      expect(OfferRules.payBy(i, const Offer(id: 1)), DateTime(2026, 10, 20));
      expect(
        OfferRules.payBy(
          const Instalment(id: 1),
          const Offer(id: 1, deadline: '2026-10-09'),
        ),
        DateTime(2026, 10, 9),
      );
    });
  });

  group('tracker bloc offer events', () {
    const app = Application(
      id: 7,
      status: AppStatus.offered,
      offer: Offer(id: 3, state: 'sent'),
    );
    late _Repo repo;
    setUp(() {
      repo = _Repo();
      when(() => repo.formOptions(level: any(named: 'level')))
          .thenAnswer((_) async => ok(const FormOptions()));
    });

    blocTest<TrackerBloc, TrackerState>(
      'accept uses the offer id',
      build: () {
        when(() => repo.acceptOffer(7, 3)).thenAnswer((_) async => ok(app));
        return TrackerBloc(repo, app);
      },
      act: (b) => b.add(const TrackerEvent.offerAccepted()),
      verify: (b) {
        verify(() => repo.acceptOffer(7, 3)).called(1);
        expect(b.state.notice, TrackerNoticeKind.offerAccepted);
      },
    );

    blocTest<TrackerBloc, TrackerState>(
      'evidence is sent with the chosen method',
      build: () {
        when(
          () => repo.submitEvidence(
            7,
            11,
            filePath: 'p',
            fileName: 'n.jpg',
            method: 'bank',
          ),
        ).thenAnswer((_) async => ok(app));
        return TrackerBloc(repo, app);
      },
      act: (b) => b.add(
        const TrackerEvent.evidenceSubmitted(
          instalment: 11,
          method: 'bank',
          filePath: 'p',
          fileName: 'n.jpg',
        ),
      ),
      verify: (b) => expect(b.state.notice, TrackerNoticeKind.evidenceSent),
    );
  });
}
