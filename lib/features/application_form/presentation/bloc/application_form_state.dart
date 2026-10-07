part of 'application_form_bloc.dart';

/// Autosave indicator in the top bar.
enum SaveStatus {
  /// Everything on the server.
  saved,

  /// Edits pending or a PATCH in flight.
  saving,

  /// The last save failed (not connectivity).
  error,

  /// Edits held back until the device is online again.
  offline,
}

/// One-shot signals for the page's `BlocListener` (toasts, navigation).
@freezed
sealed class FormNotice with _$FormNotice {
  /// A save failed for a non-connectivity reason.
  const factory FormNotice.saveFailed(Failure failure) = FormNoticeSaveFailed;

  /// Client or server validation found gaps (marked in red).
  const factory FormNotice.fixMarked() = FormNoticeFixMarked;

  /// Submission failed.
  const factory FormNotice.submitFailed(Failure failure) =
      FormNoticeSubmitFailed;

  /// Saved; leave to the applications list.
  const factory FormNotice.leave() = FormNoticeLeave;

  /// The application was sent.
  const factory FormNotice.submitted(Application application) =
      FormNoticeSubmitted;
}

/// State of [ApplicationFormBloc]. One class with `copyWith`, as the bloc
/// rules allow for a form with many orthogonal fields.
@freezed
abstract class ApplicationFormState with _$ApplicationFormState {
  /// Creates the state.
  const factory ApplicationFormState({
    required Application application,
    required FormDraft draft,
    @Default(1) int step,
    @Default(1) int formStep,
    @Default(<String, FormError>{}) FormErrors errors,
    @Default(SaveStatus.saved) SaveStatus save,
    FormOptions? options,
    @Default(false) bool sending,
    @Default(false) bool declared,
    @Default(false) bool declarationMissing,
    CachedDraft? resumable,
    FormNotice? notice,
    @Default(0) int noticeSeq,
  }) = _ApplicationFormState;
  const ApplicationFormState._();

  /// Step [n] is done (the server has opened the next one).
  bool isDone(int n) => n < formStep;

  /// Step [n] can be jumped to from the rail.
  bool isReachable(int n) => isDone(n) || n == step || (n > 1 && isDone(n - 1));

  /// Statement word count.
  int get words => draft.statementWords;

  /// Error for [key], if any.
  FormError? error(String key) => errors[key];
}
