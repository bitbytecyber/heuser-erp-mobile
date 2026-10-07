part of 'application_form_bloc.dart';

/// The autosave queue of [ApplicationFormBloc]: a debounce timer, the set of
/// dirty steps, and one promise chain so PATCHes never overlap whichever
/// handler asks for them (the web form's `chain` ref).
mixin _SaveQueue on Bloc<ApplicationFormEvent, ApplicationFormState> {
  IntakeRepository get _repo;
  DraftStore get _drafts;
  DateTime Function() get _clock;
  Duration get autosaveDelay;

  final Set<int> _dirty = <int>{};
  Timer? _timer;
  Future<void> _chain = Future.value();
  bool _online = true;

  /// Restarts the typing debounce.
  void _scheduleFlush() {
    _timer?.cancel();
    _timer = Timer(autosaveDelay, () {
      if (!isClosed) add(const ApplicationFormEvent.flushRequested());
    });
  }

  /// Sends one PATCH after every earlier one has finished. The payload is
  /// built when the request actually runs, so it carries the latest draft.
  Future<Result<StepResult>> _patch(int step) {
    final done = Completer<Result<StepResult>>();
    _chain = _chain.then((_) async {
      final r = await _repo.saveStep(
        state.application.id,
        step,
        stepPayload(step, state.draft, state.options),
      );
      done.complete(r);
    });
    return done.future;
  }

  /// Saves every dirty step in ascending order.
  Future<void> _flushDirty(Emitter<ApplicationFormState> emit) async {
    _timer?.cancel();
    final steps = [..._dirty]..sort();
    _dirty.clear();
    for (final step in steps) {
      if (emit.isDone) return;
      await _save(step, emit);
    }
  }

  /// Saves [step] and folds the result into the state. Returns the server's
  /// `missing` list, or `null` when the save failed (state already updated).
  Future<List<String>?> _save(
    int step,
    Emitter<ApplicationFormState> emit,
  ) async {
    emit(state.copyWith(save: SaveStatus.saving));
    final r = await _patch(step);
    if (emit.isDone || isClosed) return null;
    return r.fold<List<String>?>(
      (f) {
        if (f.isConnectivity) {
          // Held back; released by connectivityChanged(online: true).
          _dirty.add(step);
          emit(state.copyWith(save: SaveStatus.offline));
        } else {
          emit(
            state.copyWith(
              save: SaveStatus.error,
              notice: FormNotice.saveFailed(f),
              noticeSeq: state.noticeSeq + 1,
            ),
          );
        }
        unawaited(_persist());
        return null;
      },
      (res) {
        final app = res.application;
        emit(
          state.copyWith(
            application: app,
            formStep: app.formStep,
            draft: _reconcileResults(state.draft, app.results),
            save: _dirty.isEmpty ? SaveStatus.saved : SaveStatus.saving,
          ),
        );
        unawaited(_persist());
        return res.missing;
      },
    );
  }

  /// New result rows get their ids, so the next save updates them in place
  /// instead of recreating them.
  static FormDraft _reconcileResults(FormDraft draft, List<ResultRow> server) {
    var changed = false;
    final rows = <ResultRow>[];
    for (var i = 0; i < draft.results.length; i++) {
      final row = draft.results[i];
      final srv = i < server.length ? server[i] : null;
      if (row.id == null && srv != null && srv.subject == row.subject) {
        rows.add(row.copyWith(id: srv.id));
        changed = true;
      } else {
        rows.add(row);
      }
    }
    return changed ? draft.copyWith(results: rows) : draft;
  }

  /// Mirrors the draft to disk while anything is unsaved; clears it once
  /// the server has everything.
  Future<void> _persist() async {
    final id = state.application.id;
    if (_dirty.isEmpty) {
      await _drafts.clear(id);
      return;
    }
    await _drafts.write(
      id,
      CachedDraft(
        draft: state.draft,
        baseUpdatedAt: state.application.updatedAt,
        savedAt: _clock().toIso8601String(),
        dirtySteps: [..._dirty]..sort(),
      ),
    );
  }
}
