import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_erp_mobile/core/realtime/notifications_socket.dart';
import 'package:heuser_erp_mobile/features/notifications/domain/notifications_repository.dart';

/// The unread badge and the latest live push.
class UnreadState {
  /// Creates the state.
  const UnreadState({this.count = 0, this.push, this.pushSeq = 0});

  /// Unread notifications.
  final int count;

  /// The latest push (a toast shows it once per [pushSeq]).
  final SocketPush? push;

  /// Bumped on every push.
  final int pushSeq;
}

/// Keeps the badge current: fetched on start and resume, then updated live
/// from the notifications socket. Owns the socket's lifetime: it connects
/// with the shell and disconnects when the shell goes away (sign-out).
class UnreadCubit extends Cubit<UnreadState> {
  /// Creates the cubit and starts it.
  UnreadCubit(this._repo, this._socket) : super(const UnreadState()) {
    _sub = _socket.pushes.listen(
      (p) => emit(
        UnreadState(count: p.unreadCount, push: p, pushSeq: state.pushSeq + 1),
      ),
    );
    unawaited(refresh());
    unawaited(_socket.start());
  }

  final NotificationsRepository _repo;
  final NotificationsSocket _socket;
  StreamSubscription<SocketPush>? _sub;

  /// Re-reads the count (resume, after reading in the inbox).
  Future<void> refresh() async {
    final r = await _repo.unreadCount();
    if (isClosed) return;
    r.fold((_) {}, (n) => emit(UnreadState(count: n, pushSeq: state.pushSeq)));
  }

  /// Sets the count locally (mark all read).
  void set(int n) => emit(UnreadState(count: n, pushSeq: state.pushSeq));

  /// Reconnects after the app returns to the foreground.
  Future<void> resumed() async {
    await _socket.start();
    await refresh();
  }

  /// Disconnects while in the background.
  Future<void> paused() => _socket.stop();

  @override
  Future<void> close() async {
    await _sub?.cancel();
    await _socket.stop();
    await super.close();
  }
}
