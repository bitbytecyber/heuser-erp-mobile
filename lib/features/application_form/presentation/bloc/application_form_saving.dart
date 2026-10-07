part of 'application_form_bloc.dart';

/// The autosave queue of [ApplicationFormBloc]: a debounce timer, the set of
/// dirty steps, and one promise chain so PATCHes never overlap whichever
/// handler asks for them (the web form's `chain` ref). A step leaves the
/// dirty set only while its PATCH is in flight and for good once it
/// succeeds; any failure puts it back, so the on-device draft is kept until
/// every step has reached the server.
mixin _SaveQueue on Bloc<ApplicationFormEvent, ApplicationFormState> {
  IntakeRepository get _repo;
  DraftStore get _drafts;
  DateTime Function() get _clock;
  Duration get autosaveDelay;
  Duration get retryDelay;

  final Set<int> _dirty = <int>{};

  /// Steps with a PATCH in flight (a list: two handlers may save the same
  /// step back to back).
  final List<int> _inFlight = <int>[];
  Timer? _timer;
  Timer? _retry;
  int _retryAttempt = 0;
  Future<void> _chain = Future.value();
  Future<void> _disk = Future.value();
  bool _online = true;

  /// Longest wait between two connectivity retries is `retryDelay * 2^5`.
  static const _maxRetryShift = 5;

  /// Restarts the typing debounce.
  void _scheduleFlush() {
    _timer?.cancel();
    _timer = Timer(autosaveDelay, () {
      if (!isClosed) add(const ApplicationFormEvent.flushRequested());
    });
  }

  /// A save could not reach the server although the device looks online
  /// (timeout, unreachable): try again with exponential backoff.
  void _scheduleRetry() {
    if (_retry?.isActive ?? false) return;
    final shift = _retryAttempt < _maxRetryShift
        ? _retryAttempt
        : _maxRetryShift;
    _retryAttempt++;
    _retry = Timer(retryDelay * (1 << shift), () {
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

  /// Saves every dirty step (except [skip]) in ascending order and stops at
  /// the first failure, which is returned (`null`: all reached the server).
  Future<Failure?> _flushDirty(
    Emitter<ApplicationFormState> emit, {
    int? skip,
  }) async {
    _timer?.cancel();
    _retry?.cancel();
    final steps = _dirty.where((s) => s != skip).toList()..sort();
    for (final step in steps) {
      if (emit.isDone) return const Failure.cancelled();
      if (!_dirty.contains(step)) continue; // saved by another handler
      final f = (await _save(step, emit)).failureOrNull;
      if (f != null) return f;
    }
    return null;
  }

  /// Continue / Send: saves the other dirty steps first, then [step], and
  /// surfaces a failure. Returns the server's `missing` list for [step], or
  /// `null` when anything failed (nothing after the failure was sent).
  Future<List<String>?> _saveNow(
    int step,
    Emitter<ApplicationFormState> emit,
  ) async {
    final r = switch (await _flushDirty(emit, skip: step)) {
      null => await _save(step, emit),
      final f => fail<List<String>>(f),
    };
    if (emit.isDone) return null;
    return r.fold<List<String>?>((f) {
      // Non-connectivity failures were already announced by [_save].
      if (f.isConnectivity) emit(_notify(state, FormNotice.saveFailed(f)));
      return null;
    }, (missing) => missing);
  }

  /// [s] carrying the one-shot [notice] for the page's listener.
  ApplicationFormState _notify(ApplicationFormState s, FormNotice notice) =>
      s.copyWith(notice: notice, noticeSeq: s.noticeSeq + 1);

  /// Saves [step] and folds the result into the state. Returns the server's
  /// `missing` list, or the failure (state already updated, step dirty).
  Future<Result<List<String>>> _save(
    int step,
    Emitter<ApplicationFormState> emit,
  ) async {
    _dirty.remove(step);
    _inFlight.add(step);
    emit(state.copyWith(save: SaveStatus.saving));
    final r = await _patch(step);
    _inFlight.remove(step);
    if (r.isLeft()) _dirty.add(step); // retried on the next flush
    if (emit.isDone || isClosed) {
      unawaited(_persist());
      return r.map((res) => res.missing);
    }
    final out = r.fold<Result<List<String>>>(
      (f) {
        if (f.isConnectivity) {
          // Held back; released by connectivityChanged(online: true), or
          // retried with backoff when the device still looks online.
          emit(state.copyWith(save: SaveStatus.offline));
          if (_online) _scheduleRetry();
        } else {
          emit(
            _notify(
              state.copyWith(save: SaveStatus.error),
              FormNotice.saveFailed(f),
            ),
          );
        }
        return fail(f);
      },
      (res) {
        _retryAttempt = 0;
        final app = res.application;
        final idle = _dirty.isEmpty && _inFlight.isEmpty;
        emit(
          state.copyWith(
            application: app,
            formStep: app.formStep,
            draft: _reconcileResults(state.draft, app.results),
            save: idle ? SaveStatus.saved : SaveStatus.saving,
          ),
        );
        return ok(res.missing);
      },
    );
    unawaited(_persist());
    return out;
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
  /// the server has everything. Writes are serialised on one chain and the
  /// snapshot is taken when the write runs, so the last write always holds
  /// the latest state.
  Future<void> _persist() => _onDisk(() {
    final id = state.application.id;
    final unsaved = {..._dirty, ..._inFlight};
    if (unsaved.isEmpty) return _drafts.clear(id);
    return _drafts.write(
      id,
      CachedDraft(
        draft: state.draft,
        baseUpdatedAt: state.application.updatedAt,
        savedAt: _clock().toIso8601String(),
        dirtySteps: unsaved.toList()..sort(),
      ),
    );
  });

  /// Drops the on-device draft, after any write already queued.
  Future<void> _clearDraft(int id) => _onDisk(() => _drafts.clear(id));

  Future<void> _onDisk(Future<void> Function() io) =>
      _disk = _disk.then((_) => io()).onError<Object>((_, _) {});
}
