import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_outcome.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_user.dart';
import 'package:heuser_erp_mobile/features/me/domain/abilities.dart';

/// Everything the app can do with a session. Implemented over the allauth
/// app client; every method returns a [Result] and never throws.
abstract class AuthRepository {
  /// Session changes, for the auth bloc.
  Stream<SessionEvent> get events;

  /// The user known right now (may come from the offline snapshot).
  AuthUser? get currentUser;

  /// Abilities known right now ([Abilities.none] when signed out).
  Abilities get abilities;

  /// Re-fetches abilities (resume, after sign-in).
  Future<Result<Abilities>> refreshAbilities();

  /// Whether a token is held (not whether it is still valid).
  Future<bool> hasSession();

  /// Cold start: validate the stored token with the server. Transport failure
  /// with a snapshot → [AuthOutcome.authenticated] from the snapshot.
  Future<Result<AuthOutcome>> restoreSession();

  /// Email + password.
  Future<Result<AuthOutcome>> login({
    required String email,
    required String password,
  });

  /// Email + password signup (allauth answers with a pending `verify_email`).
  Future<Result<AuthOutcome>> signup({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
    String? cnic,
    String? phone,
  });

  /// Email verification code (6 characters).
  Future<Result<AuthOutcome>> verifyEmail(String code);

  /// Sends a new verification code to the pending address.
  Future<Result<void>> resendVerification();

  /// Second factor.
  Future<Result<AuthOutcome>> mfaAuthenticate(String code);

  /// Emails a login code.
  Future<Result<AuthOutcome>> requestLoginCode(String email);

  /// Confirms an emailed login code.
  Future<Result<AuthOutcome>> confirmLoginCode(String code);

  /// Google sign-in: provider → precheck → (choice) → provider/token.
  Future<Result<AuthOutcome>> loginWithGoogle();

  /// Apple sign-in (iOS).
  Future<Result<AuthOutcome>> loginWithApple();

  /// "Apply for admission" after an unknown social identity: creates the
  /// applicant and signs in.
  Future<Result<AuthOutcome>> createApplicantAndSignIn(String pendingToken);

  /// Emails a password-reset link.
  Future<Result<void>> requestPasswordReset(String email);

  /// Sets a new password with the emailed key.
  Future<Result<void>> resetPassword({
    required String key,
    required String password,
  });

  /// Changes (or sets a first) password.
  Future<Result<void>> changePassword({
    required String newPassword,
    String? currentPassword,
  });

  /// Re-reads the session user from the server.
  Future<Result<AuthUser>> refreshUser();

  /// The server rejected the token we hold (reported by the interceptor).
  Future<void> handleSessionRejected();

  /// Signs out: local wipe first, then best-effort server calls.
  Future<void> signOut();
}
