import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/draft_store.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_draft.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_errors.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_payload.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_validation.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_options.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_parts.dart';
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart';

part 'application_form_bloc.freezed.dart';
part 'application_form_event.dart';
part 'application_form_saving.dart';
part 'application_form_state.dart';
part 'application_form_submit.dart';

/// The three-step form (`components/apply/application-form.tsx`): autosave
/// while typing, client checks on Continue, then the server's own list of
/// what is still missing. PATCHes are serialised (one at a time, ascending
/// dirty-step order) and held back while offline; see [_SaveQueue].
class ApplicationFormBloc
    extends Bloc<ApplicationFormEvent, ApplicationFormState>
    with _SaveQueue, _Submit {
  /// Creates the bloc for [application]. [online] (connectivity) releases
  /// held-back saves; [autosaveDelay] is the typing debounce; [retryDelay]
  /// the first wait before re-sending a save that timed out while online.
  ApplicationFormBloc({
    required this._repo,
    required this._drafts,
    required Application application,
    String? userEmail,
    Stream<bool>? online,
    this.autosaveDelay = const Duration(milliseconds: 900),
    this.retryDelay = const Duration(seconds: 2),
    DateTime Function()? clock,
  }) : _clock = clock ?? DateTime.now,
       super(
         ApplicationFormState(
           application: application,
           draft: FormDraft.fromApplication(application, userEmail: userEmail),
           step: application.formStep.clamp(1, 3),
           formStep: application.formStep,
         ),
       ) {
    on<FormStarted>(_onStarted);
    on<FormDraftChanged>(_onDraftChanged);
    on<FormErrorCleared>(_onErrorCleared);
    on<FormErrorSet>(
      (e, emit) =>
          emit(state.copyWith(errors: {...state.errors, e.key: e.error})),
    );
    // sequential: flushes never overlap each other.
    on<FormFlushRequested>(_onFlush, transformer: sequential());
    on<FormStepRequested>(_onStepRequested);
    // droppable: a double tap on Continue / Send / Back is one press.
    on<FormContinuePressed>(_onContinue, transformer: droppable());
    on<FormBackPressed>(_onBack, transformer: droppable());
    on<FormFinishLaterPressed>(_onFinishLater, transformer: droppable());
    on<FormSubmitPressed>(_onSubmit, transformer: droppable());
    on<FormDeclarationChanged>(_onDeclaration);
    on<FormApplicationUpdated>(_onApplicationUpdated);
    on<FormResumeDecided>(_onResumeDecided);
    on<FormConnectivityChanged>(_onConnectivity);
    _onlineSub = online?.listen(
      (o) => add(ApplicationFormEvent.connectivityChanged(online: o)),
    );
  }

  /// Typing debounce before a PATCH.
  @override
  final Duration autosaveDelay;

  /// First backoff step after a save could not reach the server.
  @override
  final Duration retryDelay;

  @override
  final IntakeRepository _repo;
  @override
  final DraftStore _drafts;
  @override
  final DateTime Function() _clock;
  StreamSubscription<bool>? _onlineSub;

  Future<void> _onStarted(
    FormStarted e,
    Emitter<ApplicationFormState> emit,
  ) async {
    await _loadOptions(emit);
    final cached = await _drafts.read(state.application.id);
    if (emit.isDone || cached == null) return;
    final fresh = cached.baseUpdatedAt == state.application.updatedAt;
    if (fresh && cached.dirtySteps.isNotEmpty) {
      emit(state.copyWith(resumable: cached));
    } else {
      // Older than the server copy (edited elsewhere) or nothing unsaved.
      await _clearDraft(state.application.id);
    }
  }

  /// Options for the draft's level. A response for a level the draft no
  /// longer has (quick A→B→A switches) is dropped.
  Future<void> _loadOptions(Emitter<ApplicationFormState> emit) async {
    final level = state.draft.level;
    final r = await _repo.formOptions(level: level);
    if (emit.isDone || state.draft.level != level) return;
    r.fold((_) {}, (o) => emit(state.copyWith(options: o)));
  }

  Future<void> _onDraftChanged(
    FormDraftChanged e,
    Emitter<ApplicationFormState> emit,
  ) async {
    final before = state.draft;
    final draft = e.update(before);
    _dirty.add(state.step);
    emit(
      state.copyWith(
        draft: draft,
        save: _online ? SaveStatus.saving : SaveStatus.offline,
      ),
    );
    unawaited(_persist());
    if (_online) _scheduleFlush();
    if (draft.level != before.level) await _loadOptions(emit);
  }

  void _onErrorCleared(FormErrorCleared e, Emitter<ApplicationFormState> emit) {
    if (!state.errors.containsKey(e.key)) return;
    emit(state.copyWith(errors: {...state.errors}..remove(e.key)));
  }

  Future<void> _onFlush(
    FormFlushRequested e,
    Emitter<ApplicationFormState> emit,
  ) async {
    // A failure keeps its step dirty for the next flush (or the retry).
    await _flushDirty(emit);
  }

  void _onStepRequested(
    FormStepRequested e,
    Emitter<ApplicationFormState> emit,
  ) {
    if (!state.isReachable(e.step)) return;
    add(const ApplicationFormEvent.flushRequested());
    emit(state.copyWith(step: e.step, errors: const {}));
  }

  Future<void> _onContinue(
    FormContinuePressed e,
    Emitter<ApplicationFormState> emit,
  ) async {
    final st = state.step;
    if (st >= 3) return;
    final errors = validateStep(st, state.draft, state.options);
    if (errors.isNotEmpty) {
      emit(
        _notify(state.copyWith(errors: errors), const FormNotice.fixMarked()),
      );
      return;
    }
    final missing = await _saveNow(st, emit);
    if (missing == null || emit.isDone) return;
    if (missing.isNotEmpty) {
      emit(
        _notify(
          state.copyWith(errors: serverMissing(missing)),
          const FormNotice.fixMarked(),
        ),
      );
      return;
    }
    emit(state.copyWith(errors: const {}, step: st + 1));
  }

  Future<void> _onBack(
    FormBackPressed e,
    Emitter<ApplicationFormState> emit,
  ) async {
    if (state.step > 1) {
      add(const ApplicationFormEvent.flushRequested());
      emit(state.copyWith(step: state.step - 1, errors: const {}));
      return;
    }
    await _flushDirty(emit);
    if (!emit.isDone) emit(_notify(state, const FormNotice.leave()));
  }

  Future<void> _onFinishLater(
    FormFinishLaterPressed e,
    Emitter<ApplicationFormState> emit,
  ) async {
    await _flushDirty(emit);
    if (!emit.isDone) emit(_notify(state, const FormNotice.leave()));
  }

  void _onDeclaration(
    FormDeclarationChanged e,
    Emitter<ApplicationFormState> emit,
  ) => emit(state.copyWith(declared: e.value, declarationMissing: false));

  void _onApplicationUpdated(
    FormApplicationUpdated e,
    Emitter<ApplicationFormState> emit,
  ) => emit(state.copyWith(application: e.application));

  Future<void> _onResumeDecided(
    FormResumeDecided e,
    Emitter<ApplicationFormState> emit,
  ) async {
    final cached = state.resumable;
    if (cached == null) return;
    if (!e.resume) {
      await _clearDraft(state.application.id);
      if (!emit.isDone) emit(state.copyWith(resumable: null));
      return;
    }
    _dirty.addAll(cached.dirtySteps);
    final levelChanged = cached.draft.level != state.draft.level;
    emit(
      state.copyWith(
        draft: cached.draft,
        resumable: null,
        save: _online ? SaveStatus.saving : SaveStatus.offline,
      ),
    );
    if (_online) add(const ApplicationFormEvent.flushRequested());
    if (levelChanged) await _loadOptions(emit);
  }

  void _onConnectivity(
    FormConnectivityChanged e,
    Emitter<ApplicationFormState> emit,
  ) {
    _online = e.online;
    // Offline: wait for the device to come back instead of backing off.
    _retry?.cancel();
    _retryAttempt = 0;
    if (e.online && _dirty.isNotEmpty) {
      emit(state.copyWith(save: SaveStatus.saving));
      add(const ApplicationFormEvent.flushRequested());
    }
  }

  @override
  Future<void> close() async {
    _timer?.cancel();
    _retry?.cancel();
    await _onlineSub?.cancel();
    // Leaving mid-edit: fire what is pending; the cache keeps it regardless.
    final pending = [..._dirty]..sort();
    for (final step in pending) {
      unawaited(_patch(step));
    }
    await super.close();
  }
}
