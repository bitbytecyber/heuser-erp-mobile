part of 'application_form_bloc.dart';

/// Events of [ApplicationFormBloc].
@freezed
sealed class ApplicationFormEvent with _$ApplicationFormEvent {
  /// Load options and look for a cached draft.
  const factory ApplicationFormEvent.started() = FormStarted;

  /// A field changed: [update] is applied to the draft, the current step is
  /// marked dirty and an autosave is scheduled.
  const factory ApplicationFormEvent.draftChanged(
    FormDraft Function(FormDraft draft) update,
  ) = FormDraftChanged;

  /// Save every dirty step now (debounce fired, step change, leave).
  const factory ApplicationFormEvent.flushRequested() = FormFlushRequested;

  /// Jump to a reachable step (the rail).
  const factory ApplicationFormEvent.stepRequested(int step) =
      FormStepRequested;

  /// "Continue": validate, save, move on when nothing is missing.
  const factory ApplicationFormEvent.continuePressed() = FormContinuePressed;

  /// "Back": previous step, or leave from step 1.
  const factory ApplicationFormEvent.backPressed() = FormBackPressed;

  /// "Finish later": save and leave.
  const factory ApplicationFormEvent.finishLaterPressed() =
      FormFinishLaterPressed;

  /// The declaration checkbox.
  const factory ApplicationFormEvent.declarationChanged({required bool value}) =
      FormDeclarationChanged;

  /// "Send application".
  const factory ApplicationFormEvent.submitPressed() = FormSubmitPressed;

  /// A document upload replaced the application (the draft is kept).
  const factory ApplicationFormEvent.applicationUpdated(
    Application application,
  ) = FormApplicationUpdated;

  /// The user answered "Resume unsaved changes?".
  const factory ApplicationFormEvent.resumeDecided({required bool resume}) =
      FormResumeDecided;

  /// Connectivity changed; `true` flushes anything held back offline.
  const factory ApplicationFormEvent.connectivityChanged({
    required bool online,
  }) = FormConnectivityChanged;

  /// Clears a field error as the user types.
  const factory ApplicationFormEvent.errorCleared(String key) =
      FormErrorCleared;

  /// Sets a field error from a widget-side check (format on blur).
  const factory ApplicationFormEvent.errorSet(String key, FormError error) =
      FormErrorSet;
}
