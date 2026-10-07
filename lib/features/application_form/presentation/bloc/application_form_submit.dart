part of 'application_form_bloc.dart';

/// "Send application" of [ApplicationFormBloc]: statement length, the
/// declaration, a final save of step 3, then `POST submit/`. Server-side
/// gaps jump the form to the first offending step.
mixin _Submit on Bloc<ApplicationFormEvent, ApplicationFormState>, _SaveQueue {
  Future<void> _onSubmit(
    FormSubmitPressed e,
    Emitter<ApplicationFormState> emit,
  ) async {
    final errors = validateStep(3, state.draft, state.options);
    if (errors.isNotEmpty) {
      emit(
        _notify(state.copyWith(errors: errors), const FormNotice.fixMarked()),
      );
      return;
    }
    if (!state.declared) {
      emit(state.copyWith(declarationMissing: true));
      return;
    }
    emit(state.copyWith(sending: true));
    // Every earlier edit must be on the server first: a failed flush aborts
    // the send (the web `send()` does the same when its flush rejects).
    final missing = await _saveNow(3, emit);
    if (emit.isDone) return;
    if (missing == null) {
      emit(state.copyWith(sending: false));
      return;
    }
    if (missing.isNotEmpty) {
      _failWith(serverMissing(missing), emit);
      return;
    }
    final r = await _repo.submit(state.application.id);
    if (emit.isDone) return;
    r.fold(
      (f) {
        if (f is Validation && f.missing.isNotEmpty) {
          _failWith(serverMissing(f.missing), emit);
        } else {
          emit(
            _notify(state.copyWith(sending: false), FormNotice.submitFailed(f)),
          );
        }
      },
      (sent) {
        unawaited(_clearDraft(sent.id));
        emit(
          _notify(
            state.copyWith(application: sent, sending: false),
            FormNotice.submitted(sent),
          ),
        );
      },
    );
  }

  /// Server-side gaps: show them and jump to the first offending step.
  void _failWith(FormErrors errors, Emitter<ApplicationFormState> emit) {
    final step = FormFieldKeys.firstStep(errors) ?? state.step;
    emit(
      _notify(
        state.copyWith(errors: errors, sending: false, step: step),
        const FormNotice.fixMarked(),
      ),
    );
  }
}
