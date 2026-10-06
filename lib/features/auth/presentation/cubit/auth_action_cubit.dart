import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_outcome.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_repository.dart';
import 'package:heuser_erp_mobile/features/auth/domain/social_precheck.dart';

part 'auth_action_cubit.freezed.dart';

/// State of one auth action (login, signup, verify…). Successful sign-ins
/// are observed by the root `AuthBloc` through the repository's event stream;
/// this cubit only reports the local outcome for the page (spinner, errors,
/// the social-choice detour, "email sent").
@freezed
sealed class AuthActionState with _$AuthActionState {
  /// Nothing running.
  const factory AuthActionState.idle() = AuthActionIdle;

  /// Running; buttons disabled.
  const factory AuthActionState.busy() = AuthActionBusy;

  /// Failed; the page shows [failure] (field errors from `Validation`).
  const factory AuthActionState.failed(Failure failure) = AuthActionFailed;

  /// Unknown social identity: show the choice page.
  const factory AuthActionState.needsChoice(SocialPrecheck precheck) =
      AuthActionNeedsChoice;

  /// Completed. [outcome] is `null` for actions without a session outcome
  /// (reset email sent, code resent).
  const factory AuthActionState.done({AuthOutcome? outcome}) = AuthActionDone;
}

/// Drives the auth pages. One instance per page.
class AuthActionCubit extends Cubit<AuthActionState> {
  /// Creates the cubit.
  AuthActionCubit(this._repo) : super(const AuthActionState.idle());

  final AuthRepository _repo;

  /// Resets to idle (after showing an error).
  void reset() => emit(const AuthActionState.idle());

  Future<void> _run(Future<Result<AuthOutcome>> Function() action) async {
    if (state is AuthActionBusy) return;
    emit(const AuthActionState.busy());
    final r = await action();
    if (isClosed) return;
    r.fold(
      (f) => emit(
        f is Cancelled
            ? const AuthActionState.idle()
            : AuthActionState.failed(f),
      ),
      (o) => emit(switch (o) {
        SocialChoiceRequired(:final precheck) => AuthActionState.needsChoice(
          precheck,
        ),
        _ => AuthActionState.done(outcome: o),
      }),
    );
  }

  Future<void> _runVoid(Future<Result<void>> Function() action) async {
    if (state is AuthActionBusy) return;
    emit(const AuthActionState.busy());
    final r = await action();
    if (isClosed) return;
    r.fold(
      (f) => emit(AuthActionState.failed(f)),
      (_) => emit(const AuthActionState.done()),
    );
  }

  /// Email + password.
  Future<void> login(String email, String password) =>
      _run(() => _repo.login(email: email, password: password));

  /// Signup.
  Future<void> signup({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
    String? cnic,
    String? phone,
  }) => _run(
    () => _repo.signup(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      cnic: cnic,
      phone: phone,
    ),
  );

  /// Verify the emailed code.
  Future<void> verifyEmail(String code) => _run(() => _repo.verifyEmail(code));

  /// Resend the code.
  Future<void> resendVerification() => _runVoid(_repo.resendVerification);

  /// Second factor.
  Future<void> mfa(String code) => _run(() => _repo.mfaAuthenticate(code));

  /// Request an emailed login code.
  Future<void> requestLoginCode(String email) =>
      _run(() => _repo.requestLoginCode(email));

  /// Confirm the login code.
  Future<void> confirmLoginCode(String code) =>
      _run(() => _repo.confirmLoginCode(code));

  /// Google.
  Future<void> google() => _run(_repo.loginWithGoogle);

  /// Apple.
  Future<void> apple() => _run(_repo.loginWithApple);

  /// "Apply for admission" after an unknown social identity.
  Future<void> applyWithSocial(String pendingToken) =>
      _run(() => _repo.createApplicantAndSignIn(pendingToken));

  /// Forgot password.
  Future<void> requestPasswordReset(String email) =>
      _runVoid(() => _repo.requestPasswordReset(email));

  /// Reset with key.
  Future<void> resetPassword({required String key, required String password}) =>
      _runVoid(() => _repo.resetPassword(key: key, password: password));

  /// Change password.
  Future<void> changePassword({
    required String newPassword,
    String? currentPassword,
  }) => _runVoid(
    () => _repo.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    ),
  );
}
