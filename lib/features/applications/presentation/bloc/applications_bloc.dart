import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application_summary.dart';
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart';

part 'applications_bloc.freezed.dart';

/// Events of [ApplicationsBloc].
@freezed
sealed class ApplicationsEvent with _$ApplicationsEvent {
  /// First load.
  const factory ApplicationsEvent.started() = ApplicationsStarted;

  /// Pull to refresh / resume (`force` skips the freshness check).
  const factory ApplicationsEvent.refreshed({@Default(false) bool force}) =
      ApplicationsRefreshed;

  /// "Start an application", optionally copying the family block.
  const factory ApplicationsEvent.startRequested({int? copyFamilyFrom}) =
      ApplicationsStartRequested;

  /// Delete a draft / withdraw a sent application.
  const factory ApplicationsEvent.withdrawRequested(int id) =
      ApplicationsWithdrawRequested;

  /// The page consumed the one-shot notice.
  const factory ApplicationsEvent.noticeConsumed() = ApplicationsNoticeConsumed;
}

/// One-shot outcomes for the page.
@freezed
sealed class ApplicationsNotice with _$ApplicationsNotice {
  /// A draft was created: open it.
  const factory ApplicationsNotice.started(Application application) =
      ApplicationsNoticeStarted;

  /// Withdrawn / deleted.
  const factory ApplicationsNotice.withdrawn({required bool wasDraft}) =
      ApplicationsNoticeWithdrawn;

  /// An action failed.
  const factory ApplicationsNotice.failed(Failure failure) =
      ApplicationsNoticeFailed;
}

/// State of [ApplicationsBloc].
@freezed
abstract class ApplicationsState with _$ApplicationsState {
  /// Creates the state.
  const factory ApplicationsState({
    @Default(true) bool loading,
    @Default(<AppSummary>[]) List<AppSummary> items,
    Failure? failure,
    @Default(false) bool busy,
    ApplicationsNotice? notice,
    @Default(0) int noticeSeq,
    DateTime? loadedAt,
  }) = _ApplicationsState;
  const ApplicationsState._();

  /// Admissions switched off (`503 module_disabled`).
  bool get closed => failure is ModuleDisabled;

  /// Loaded at least once.
  bool get hasData => loadedAt != null;
}

/// The applications list: load, start, withdraw.
class ApplicationsBloc extends Bloc<ApplicationsEvent, ApplicationsState> {
  /// Creates the bloc.
  ApplicationsBloc(this._repo, {DateTime Function()? clock})
    : _clock = clock ?? DateTime.now,
      super(const ApplicationsState()) {
    // restartable: a refresh supersedes an in-flight load.
    on<ApplicationsStarted>(
      (e, emit) => _load(emit),
      transformer: restartable(),
    );
    on<ApplicationsRefreshed>(_onRefreshed, transformer: restartable());
    // droppable: one start / withdraw at a time.
    on<ApplicationsStartRequested>(_onStart, transformer: droppable());
    on<ApplicationsWithdrawRequested>(_onWithdraw, transformer: droppable());
    on<ApplicationsNoticeConsumed>(
      (e, emit) => emit(state.copyWith(notice: null)),
    );
  }

  static const _fresh = Duration(seconds: 30);

  final IntakeRepository _repo;
  final DateTime Function() _clock;

  Future<void> _onRefreshed(
    ApplicationsRefreshed e,
    Emitter<ApplicationsState> emit,
  ) async {
    final at = state.loadedAt;
    if (!e.force && at != null && _clock().difference(at) < _fresh) return;
    await _load(emit);
  }

  Future<void> _load(Emitter<ApplicationsState> emit) async {
    emit(state.copyWith(loading: true, failure: null));
    final r = await _repo.myApplications();
    if (emit.isDone) return;
    r.fold(
      (f) => emit(state.copyWith(loading: false, failure: f)),
      (items) => emit(
        state.copyWith(loading: false, items: items, loadedAt: _clock()),
      ),
    );
  }

  Future<void> _onStart(
    ApplicationsStartRequested e,
    Emitter<ApplicationsState> emit,
  ) async {
    emit(state.copyWith(busy: true));
    final r = await _repo.start(copyFamilyFrom: e.copyFamilyFrom);
    if (emit.isDone) return;
    r.fold(
      (f) => emit(
        _notify(state.copyWith(busy: false), ApplicationsNotice.failed(f)),
      ),
      (a) => emit(
        _notify(state.copyWith(busy: false), ApplicationsNotice.started(a)),
      ),
    );
  }

  Future<void> _onWithdraw(
    ApplicationsWithdrawRequested e,
    Emitter<ApplicationsState> emit,
  ) async {
    final wasDraft =
        state.items.where((a) => a.id == e.id).firstOrNull?.status.isDraft ??
        true;
    emit(state.copyWith(busy: true));
    final r = await _repo.withdraw(e.id);
    if (emit.isDone) return;
    await r.fold(
      (f) async => emit(
        _notify(state.copyWith(busy: false), ApplicationsNotice.failed(f)),
      ),
      (_) async {
        emit(
          _notify(
            state.copyWith(
              busy: false,
              items: state.items.where((a) => a.id != e.id).toList(),
            ),
            ApplicationsNotice.withdrawn(wasDraft: wasDraft),
          ),
        );
        await _load(emit);
      },
    );
  }

  ApplicationsState _notify(ApplicationsState s, ApplicationsNotice n) =>
      s.copyWith(notice: n, noticeSeq: s.noticeSeq + 1);
}
