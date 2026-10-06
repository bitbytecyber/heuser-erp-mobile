part of 'auth_bloc.dart';

/// Events of [AuthBloc].
@freezed
sealed class AuthEvent with _$AuthEvent {
  /// Cold start: validate the stored session.
  const factory AuthEvent.started() = AuthStarted;

  /// The repository reported a session change.
  const factory AuthEvent.sessionEventReceived(SessionEvent event) =
      AuthSessionEventReceived;

  /// The user tapped sign out.
  const factory AuthEvent.signOutRequested() = AuthSignOutRequested;

  /// The app came to the foreground (refresh abilities when stale).
  const factory AuthEvent.appResumed() = AuthAppResumed;
}
