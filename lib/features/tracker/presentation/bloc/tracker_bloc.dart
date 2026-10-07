import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_options.dart';
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart';

part 'tracker_bloc.freezed.dart';

/// Events of [TrackerBloc].
@freezed
sealed class TrackerEvent with _$TrackerEvent {
  /// Load form options (document types for the rows).
  const factory TrackerEvent.started() = TrackerStarted;

  /// Pull to refresh / resume / a push about this application.
  const factory TrackerEvent.refreshed() = TrackerRefreshed;

  /// Another cubit (documents) returned a fresh application.
  const factory TrackerEvent.applicationUpdated(Application application) =
      TrackerApplicationUpdated;

  /// Book or move the interview.
  const factory TrackerEvent.interviewBooked(
    String startsAt, {
    required bool reschedule,
  }) = TrackerInterviewBooked;

  /// Book a trial session.
  const factory TrackerEvent.trialBooked({
    required int booking,
    required int session,
  }) = TrackerTrialBooked;

  /// A result came out (or a grade is corrected).
  const factory TrackerEvent.resultUpdated({
    required int resultId,
    required String grade,
  }) = TrackerResultUpdated;
}

/// One-shot outcomes for the page.
enum TrackerNoticeKind {
  /// Interview booked.
  interviewBooked,

  /// Interview moved.
  interviewMoved,

  /// Trial booked.
  trialBooked,

  /// Result saved.
  resultSaved,

  /// An action failed ([TrackerState.failure]).
  failed,
}

/// State of [TrackerBloc].
@freezed
abstract class TrackerState with _$TrackerState {
  /// Creates the state.
  const factory TrackerState({
    required Application application,
    FormOptions? options,
    @Default(false) bool refreshing,
    @Default(false) bool busy,
    Failure? failure,
    TrackerNoticeKind? notice,
    @Default(0) int noticeSeq,
  }) = _TrackerState;
}

/// The tracker of one sent application: keeps it fresh and runs the
/// family's actions (bookings, result updates). Every action returns the
/// whole application, which replaces the one in state.
class TrackerBloc extends Bloc<TrackerEvent, TrackerState> {
  /// Creates the bloc.
  TrackerBloc(this._repo, Application application)
    : super(TrackerState(application: application)) {
    on<TrackerStarted>(_onStarted);
    // droppable: one refresh at a time; extra pulls are ignored.
    on<TrackerRefreshed>(_onRefreshed, transformer: droppable());
    on<TrackerApplicationUpdated>(
      (e, emit) => emit(state.copyWith(application: e.application)),
    );
    // droppable: a double tap books once.
    on<TrackerInterviewBooked>(
      (e, emit) => _run(
        emit,
        () => _repo.bookInterview(
          state.application.id,
          e.startsAt,
          reschedule: e.reschedule,
        ),
        e.reschedule
            ? TrackerNoticeKind.interviewMoved
            : TrackerNoticeKind.interviewBooked,
      ),
      transformer: droppable(),
    );
    on<TrackerTrialBooked>(
      (e, emit) => _run(
        emit,
        () => _repo.bookTrial(state.application.id, e.booking, e.session),
        TrackerNoticeKind.trialBooked,
      ),
      transformer: droppable(),
    );
    on<TrackerResultUpdated>(
      (e, emit) => _run(
        emit,
        () => _repo.updateResult(
          state.application.id,
          e.resultId,
          grade: e.grade,
          resultOut: true,
        ),
        TrackerNoticeKind.resultSaved,
      ),
      transformer: droppable(),
    );
  }

  final IntakeRepository _repo;

  Future<void> _onStarted(TrackerStarted e, Emitter<TrackerState> emit) async {
    final r = await _repo.formOptions(level: state.application.level);
    if (emit.isDone) return;
    r.fold((_) {}, (o) => emit(state.copyWith(options: o)));
  }

  Future<void> _onRefreshed(
    TrackerRefreshed e,
    Emitter<TrackerState> emit,
  ) async {
    emit(state.copyWith(refreshing: true));
    final r = await _repo.fetch(state.application.id);
    if (emit.isDone) return;
    r.fold(
      (f) => emit(
        state.copyWith(
          refreshing: false,
          failure: f,
          notice: TrackerNoticeKind.failed,
          noticeSeq: state.noticeSeq + 1,
        ),
      ),
      (a) => emit(state.copyWith(refreshing: false, application: a)),
    );
  }

  Future<void> _run(
    Emitter<TrackerState> emit,
    Future<Result<Application>> Function() call,
    TrackerNoticeKind ok,
  ) async {
    emit(state.copyWith(busy: true, failure: null));
    final r = await call();
    if (emit.isDone) return;
    r.fold(
      (f) => emit(
        state.copyWith(
          busy: false,
          failure: f,
          notice: TrackerNoticeKind.failed,
          noticeSeq: state.noticeSeq + 1,
        ),
      ),
      (a) => emit(
        state.copyWith(
          busy: false,
          application: a,
          notice: ok,
          noticeSeq: state.noticeSeq + 1,
        ),
      ),
    );
  }
}
