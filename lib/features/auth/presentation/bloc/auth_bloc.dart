import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_outcome.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_repository.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_user.dart';
import 'package:heuser_erp_mobile/features/auth/domain/pending_flow.dart';
import 'package:heuser_erp_mobile/features/me/domain/abilities.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

/// Root session state. Reacts to the repository's [SessionEvent]s so every
/// sign-in path (password, code, social, cold start) lands here, and the
/// router's `redirect` reads it.
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  /// Creates the bloc.
  AuthBloc(this._repo) : super(const AuthState.unknown()) {
    on<AuthStarted>(_onStarted);
    on<AuthSessionEventReceived>(_onSessionEvent);
    on<AuthSignOutRequested>(_onSignOut);
    on<AuthAppResumed>(_onResumed);
    _sub = _repo.events.listen((e) => add(AuthEvent.sessionEventReceived(e)));
  }

  static const _resumeRefreshAfter = Duration(minutes: 10);

  final AuthRepository _repo;
  StreamSubscription<SessionEvent>? _sub;
  DateTime? _lastAbilitiesRefresh;

  Future<void> _onStarted(AuthStarted event, Emitter<AuthState> emit) async {
    // The repository emits the resulting SessionEvent itself; the outcome is
    // only used for the offline-without-snapshot case, which has no event.
    final result = await _repo.restoreSession();
    result.fold((_) {
      if (state is AuthUnknown) {
        emit(
          const AuthState.unauthenticated(reason: SignOutReason.serverRejected),
        );
      }
    }, (_) {});
  }

  void _onSessionEvent(
    AuthSessionEventReceived event,
    Emitter<AuthState> emit,
  ) {
    switch (event.event) {
      case SessionSignedIn(:final user, :final abilities, :final fromSnapshot):
        _lastAbilitiesRefresh = fromSnapshot ? null : DateTime.now();
        emit(
          AuthState.authenticated(
            user: user,
            abilities: abilities,
            portal: abilities.portal,
            fromSnapshot: fromSnapshot,
          ),
        );
      case SessionSignedOut(:final reason):
        emit(AuthState.unauthenticated(reason: reason));
      case SessionPending(:final flow, :final email):
        emit(AuthState.pending(flow: flow, email: email));
    }
  }

  Future<void> _onSignOut(
    AuthSignOutRequested event,
    Emitter<AuthState> emit,
  ) => _repo.signOut();

  Future<void> _onResumed(AuthAppResumed event, Emitter<AuthState> emit) async {
    final current = state;
    if (current is! AuthAuthenticated) return;
    final last = _lastAbilitiesRefresh;
    if (!current.fromSnapshot &&
        last != null &&
        DateTime.now().difference(last) < _resumeRefreshAfter) {
      return;
    }
    final result = await _repo.refreshAbilities();
    if (isClosed) return;
    result.fold((_) {}, (abilities) {
      _lastAbilitiesRefresh = DateTime.now();
      final now = state;
      if (now is AuthAuthenticated) {
        emit(
          now.copyWith(
            abilities: abilities,
            portal: abilities.portal,
            fromSnapshot: false,
          ),
        );
      }
    });
  }

  @override
  Future<void> close() async {
    await _sub?.cancel();
    return await super.close();
  }
}
