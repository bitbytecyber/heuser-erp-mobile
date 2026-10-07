import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart' hide fail;
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:mocktail/mocktail.dart';

class _Repo extends Mock implements IntakeRepository;

void main() {
  const app = Application(id: 7, status: AppStatus.underReview);
  const stale = Application(id: 7, status: AppStatus.received);
  const booked = Application(id: 7, status: AppStatus.interviewScheduled);
  const trial = Application(id: 7, status: AppStatus.sportsTrial);
  late _Repo repo;

  setUp(() => repo = _Repo());

  blocTest<TrackerBloc, TrackerState>(
    'refresh failure clears refreshing and signals once',
    build: () {
      when(() => repo.fetch(7))
          .thenAnswer((_) async => fail(const Failure.timeout()));
      return TrackerBloc(repo, app);
    },
    act: (b) => b.add(const TrackerEvent.refreshed()),
    verify: (b) {
      expect(b.state.refreshing, isFalse);
      expect(b.state.failure, const Failure.timeout());
      expect(b.state.notice, TrackerNoticeKind.failed);
      expect(b.state.noticeSeq, 1);
      expect(b.state.application, app);
    },
  );

  test('a refresh that started before an action cannot undo it', () async {
    final get = Completer<Result<Application>>();
    when(() => repo.fetch(7)).thenAnswer((_) => get.future);
    when(() => repo.bookInterview(7, 'T', reschedule: false))
        .thenAnswer((_) async => ok(booked));
    final bloc = TrackerBloc(repo, app)..add(const TrackerEvent.refreshed());
    await pumpEventQueue();
    bloc.add(const TrackerEvent.interviewBooked('T', reschedule: false));
    await pumpEventQueue();
    expect(bloc.state.application, booked);

    // The GET was answered before the booking landed on the server.
    get.complete(ok(stale));
    await pumpEventQueue();
    expect(bloc.state.application, booked);
    expect(bloc.state.refreshing, isFalse);
    await bloc.close();
  });

  test('a copy from the documents cubit also wins over an older GET', () async {
    final get = Completer<Result<Application>>();
    when(() => repo.fetch(7)).thenAnswer((_) => get.future);
    final bloc = TrackerBloc(repo, app)..add(const TrackerEvent.refreshed());
    await pumpEventQueue();
    bloc.add(const TrackerEvent.applicationUpdated(booked));
    await pumpEventQueue();
    get.complete(ok(stale));
    await pumpEventQueue();
    expect(bloc.state.application, booked);
    await bloc.close();
  });

  test('a later refresh applies again', () async {
    when(() => repo.fetch(7)).thenAnswer((_) async => ok(trial));
    final bloc = TrackerBloc(repo, app)
      ..add(const TrackerEvent.applicationUpdated(booked));
    await pumpEventQueue();
    bloc.add(const TrackerEvent.refreshed());
    await pumpEventQueue();
    expect(bloc.state.application, trial);
    await bloc.close();
  });

  test('busy stays up until the last overlapping action settles', () async {
    final book = Completer<Result<Application>>();
    final result = Completer<Result<Application>>();
    when(() => repo.bookInterview(7, 'T', reschedule: false))
        .thenAnswer((_) => book.future);
    when(() => repo.updateResult(7, 5, grade: 'A', resultOut: true))
        .thenAnswer((_) => result.future);
    final bloc = TrackerBloc(repo, app)
      ..add(const TrackerEvent.interviewBooked('T', reschedule: false))
      ..add(const TrackerEvent.resultUpdated(resultId: 5, grade: 'A'));
    await pumpEventQueue();
    expect(bloc.state.busy, isTrue);

    book.complete(ok(booked));
    await pumpEventQueue();
    expect(bloc.state.busy, isTrue);
    expect(bloc.state.notice, TrackerNoticeKind.interviewBooked);

    result.complete(fail(const Failure.server()));
    await pumpEventQueue();
    expect(bloc.state.busy, isFalse);
    expect(bloc.state.notice, TrackerNoticeKind.failed);
    expect(bloc.state.application, booked);
    await bloc.close();
  });
}
