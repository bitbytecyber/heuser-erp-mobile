import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_erp_mobile/core/security/app_lock_service.dart';

/// State of the app lock.
class AppLockState {
  /// Creates the state.
  const AppLockState({
    this.supported = false,
    this.enabled = false,
    this.locked = false,
    this.busy = false,
  });

  /// The device can authenticate.
  final bool supported;

  /// The family turned the lock on.
  final bool enabled;

  /// The app is covered until they authenticate.
  final bool locked;

  /// A prompt is showing.
  final bool busy;

  /// Copy with changes.
  AppLockState copyWith({
    bool? supported,
    bool? enabled,
    bool? locked,
    bool? busy,
  }) => AppLockState(
    supported: supported ?? this.supported,
    enabled: enabled ?? this.enabled,
    locked: locked ?? this.locked,
    busy: busy ?? this.busy,
  );
}

/// The optional app lock: locks on cold start and after [grace] in the
/// background; unlocking asks for fingerprint / face / device PIN.
/// Owned by the root app (like the theme), not by a route.
class AppLockCubit extends Cubit<AppLockState> {
  /// Creates the cubit and loads the saved setting.
  AppLockCubit(
    this._service, {
    this.grace = const Duration(seconds: 30),
    DateTime Function()? clock,
  }) : _clock = clock ?? DateTime.now,
       super(const AppLockState()) {
    unawaited(_load());
  }

  /// How long the app may sit in the background before it locks.
  final Duration grace;

  final AppLockService _service;
  final DateTime Function() _clock;
  DateTime? _pausedAt;

  Future<void> _load() async {
    final supported = await _service.supported();
    final enabled = supported && await _service.enabled();
    if (isClosed) return;
    emit(AppLockState(supported: supported, enabled: enabled, locked: enabled));
  }

  /// The app went to the background.
  void paused() => _pausedAt = _clock();

  /// The app came back: lock if it was away longer than [grace].
  void resumed() {
    final at = _pausedAt;
    _pausedAt = null;
    if (!state.enabled || state.busy || at == null) return;
    if (_clock().difference(at) >= grace) emit(state.copyWith(locked: true));
  }

  /// Shows the system prompt; unlocks on success.
  Future<void> unlock(String reason) async {
    if (state.busy) return;
    emit(state.copyWith(busy: true));
    final ok = await _service.authenticate(reason);
    if (isClosed) return;
    // The prompt itself backgrounds the app on some devices: do not re-lock.
    _pausedAt = null;
    emit(state.copyWith(busy: false, locked: !ok && state.locked));
  }

  /// Turns the lock on (after a successful prompt) or off.
  Future<bool> setEnabled({required bool value, required String reason}) async {
    if (value) {
      emit(state.copyWith(busy: true));
      final ok = await _service.authenticate(reason);
      _pausedAt = null;
      if (isClosed) return false;
      if (!ok) {
        emit(state.copyWith(busy: false));
        return false;
      }
    }
    await _service.setEnabled(value: value);
    if (isClosed) return false;
    emit(state.copyWith(enabled: value, busy: false, locked: false));
    return true;
  }

  /// Signed out: nothing to protect, and the next account starts unlocked.
  Future<void> signedOut() async {
    await _service.setEnabled(value: false);
    if (isClosed) return;
    emit(state.copyWith(enabled: false, locked: false));
  }
}
