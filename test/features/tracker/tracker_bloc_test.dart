import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart' hide fail;
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_options.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:mocktail/mocktail.dart';

class _Repo extends Mock implements IntakeRepository;

void main() {
  const app = Application(id: 7, status: AppStatus.underReview);
  const booked = Application(id: 7, status: AppStatus.interviewScheduled);
  late _Repo repo;

  setUp(() {
    repo = _Repo();
    when(() => repo.formOptions(level: any(named: 'level')))
        .thenAnswer((_) async => ok(const FormOptions()));
  });

  blocTest<TrackerBloc, TrackerState>(
    'started loads options',
    build: () => TrackerBloc(repo, app),
    act: (b) => b.add(const TrackerEvent.started()),
    verify: (b) => expect(b.state.options, const FormOptions()),
  );

  blocTest<TrackerBloc, TrackerState>(
    'booking replaces the application and signals success',
    build: () {
      when(() => repo.bookInterview(7, 'T', reschedule: false))
          .thenAnswer((_) async => ok(booked));
      return TrackerBloc(repo, app);
    },
    act: (b) =>
        b.add(const TrackerEvent.interviewBooked('T', reschedule: false)),
    verify: (b) {
      expect(b.state.application.status, AppStatus.interviewScheduled);
      expect(b.state.notice, TrackerNoticeKind.interviewBooked);
      expect(b.state.busy, isFalse);
    },
  );

  blocTest<TrackerBloc, TrackerState>(
    'a moved interview says so',
    build: () {
      when(() => repo.bookInterview(7, 'T', reschedule: true))
          .thenAnswer((_) async => ok(booked));
      return TrackerBloc(repo, app);
    },
    act: (b) =>
        b.add(const TrackerEvent.interviewBooked('T', reschedule: true)),
    verify: (b) => expect(b.state.notice, TrackerNoticeKind.interviewMoved),
  );

  blocTest<TrackerBloc, TrackerState>(
    'slot taken → failure notice, application unchanged',
    build: () {
      when(() => repo.bookTrial(7, 3, 9)).thenAnswer(
        (_) async => fail(
          const Failure.validation(code: 'slot_taken', message: 'Taken.'),
        ),
      );
      return TrackerBloc(repo, app);
    },
    act: (b) => b.add(const TrackerEvent.trialBooked(booking: 3, session: 9)),
    verify: (b) {
      expect(b.state.notice, TrackerNoticeKind.failed);
      expect(b.state.failure, isA<Validation>());
      expect(b.state.application, app);
    },
  );

  blocTest<TrackerBloc, TrackerState>(
    'result update marks it out',
    build: () {
      when(() => repo.updateResult(7, 5, grade: 'A', resultOut: true))
          .thenAnswer((_) async => ok(app));
      return TrackerBloc(repo, app);
    },
    act: (b) =>
        b.add(const TrackerEvent.resultUpdated(resultId: 5, grade: 'A')),
    verify: (b) {
      verify(() => repo.updateResult(7, 5, grade: 'A', resultOut: true))
          .called(1);
      expect(b.state.notice, TrackerNoticeKind.resultSaved);
    },
  );

  blocTest<TrackerBloc, TrackerState>(
    'refresh fetches the application',
    build: () {
      when(() => repo.fetch(7)).thenAnswer((_) async => ok(booked));
      return TrackerBloc(repo, app);
    },
    act: (b) => b.add(const TrackerEvent.refreshed()),
    verify: (b) {
      expect(b.state.application, booked);
      expect(b.state.refreshing, isFalse);
    },
  );
}
