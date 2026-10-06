import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_user.dart';
import 'package:heuser_erp_mobile/features/auth/domain/pending_flow.dart';
import 'package:heuser_erp_mobile/features/auth/domain/social_precheck.dart';
import 'package:heuser_erp_mobile/features/me/domain/abilities.dart';

part 'auth_outcome.freezed.dart';

/// What a sign-in attempt produced when it did not fail outright.
@freezed
sealed class AuthOutcome with _$AuthOutcome {
  /// A live session. [fromSnapshot] when the server was unreachable and the
  /// last known user/abilities were restored from disk.
  const factory AuthOutcome.authenticated({
    required AuthUser user,
    required Abilities abilities,
    @Default(false) bool fromSnapshot,
  }) = Authenticated;

  /// No session (cold start without a token, or a verified email that now
  /// needs a normal sign-in).
  const factory AuthOutcome.signedOut(SignOutReason reason) = SignedOut;

  /// A session token was issued but a step is still required.
  const factory AuthOutcome.pending({
    required PendingFlow flow,
    required String email,
  }) = Pending;

  /// The social identity is unknown; the person must choose what to do.
  const factory AuthOutcome.socialChoiceRequired(SocialPrecheck precheck) =
      SocialChoiceRequired;
}

/// Why the app is signed out, for the login page's banner.
enum SignOutReason {
  /// First launch or an explicit sign-out.
  none,

  /// The user tapped sign out.
  userSignedOut,

  /// The server no longer accepts the session.
  serverRejected,

  /// `410 Gone` on the session.
  expired,

  /// Could not reach the backend and nothing was cached.
  offline,
}

/// Session changes pushed by the repository to the auth bloc, regardless of
/// which page triggered them.
@freezed
sealed class SessionEvent with _$SessionEvent {
  /// Signed in.
  const factory SessionEvent.signedIn({
    required AuthUser user,
    required Abilities abilities,
    @Default(false) bool fromSnapshot,
  }) = SessionSignedIn;

  /// Signed out.
  const factory SessionEvent.signedOut(SignOutReason reason) = SessionSignedOut;

  /// Pending step (token issued).
  const factory SessionEvent.pending({
    required PendingFlow flow,
    required String email,
  }) = SessionPending;
}
