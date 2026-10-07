import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/features/notifications/data/models/inbox_item.dart';
import 'package:heuser_erp_mobile/features/notifications/domain/notifications_repository.dart';

part 'notifications_bloc.freezed.dart';

/// Events of [NotificationsBloc].
@freezed
sealed class NotificationsEvent with _$NotificationsEvent {
  /// First page.
  const factory NotificationsEvent.started() = NotificationsStarted;

  /// Pull to refresh, or a live push arrived.
  const factory NotificationsEvent.refreshed() = NotificationsRefreshed;

  /// Next page (end of list reached).
  const factory NotificationsEvent.moreRequested() = NotificationsMoreRequested;

  /// The family tapped an item: mark read + record the click.
  const factory NotificationsEvent.opened(InboxItem item) = NotificationsOpened;

  /// Swipe to dismiss.
  const factory NotificationsEvent.dismissed(int id) = NotificationsDismissed;

  /// "Mark all read".
  const factory NotificationsEvent.allRead() = NotificationsAllRead;
}

/// State of [NotificationsBloc] (a list screen: one class with `copyWith`).
@freezed
abstract class NotificationsState with _$NotificationsState {
  /// Creates the state.
  const factory NotificationsState({
    @Default(<InboxItem>[]) List<InboxItem> items,
    @Default(true) bool loading,
    @Default(false) bool loadingMore,
    @Default(false) bool hasMore,
    @Default(1) int page,
    Failure? failure,
  }) = _NotificationsState;
  const NotificationsState._();

  /// Any unread item on screen.
  bool get anyUnread => items.any((i) => !i.isRead);
}

/// The inbox: paged list, read / dismiss / read-all with optimistic updates.
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  /// Creates the bloc.
  NotificationsBloc(this._repo) : super(const NotificationsState()) {
    // restartable: a newer refresh replaces an older one.
    on<NotificationsStarted>(
      (e, emit) => _first(emit),
      transformer: restartable(),
    );
    on<NotificationsRefreshed>(
      (e, emit) => _first(emit),
      transformer: restartable(),
    );
    // droppable: one page at a time.
    on<NotificationsMoreRequested>(_onMore, transformer: droppable());
    on<NotificationsOpened>(_onOpened);
    on<NotificationsDismissed>(_onDismissed);
    on<NotificationsAllRead>(_onAllRead, transformer: droppable());
  }

  final NotificationsRepository _repo;

  Future<void> _first(Emitter<NotificationsState> emit) async {
    emit(state.copyWith(loading: state.items.isEmpty, failure: null));
    final r = await _repo.page(1);
    if (emit.isDone) return;
    r.fold(
      (f) => emit(state.copyWith(loading: false, failure: f)),
      (p) => emit(
        NotificationsState(
          items: p.items.where((i) => !i.isDismissed).toList(),
          loading: false,
          hasMore: p.hasMore,
        ),
      ),
    );
  }

  Future<void> _onMore(
    NotificationsMoreRequested e,
    Emitter<NotificationsState> emit,
  ) async {
    if (!state.hasMore || state.loading) return;
    emit(state.copyWith(loadingMore: true));
    final next = state.page + 1;
    final r = await _repo.page(next);
    if (emit.isDone) return;
    r.fold((f) => emit(state.copyWith(loadingMore: false, failure: f)), (p) {
      final seen = state.items.map((i) => i.id).toSet();
      emit(
        state.copyWith(
          loadingMore: false,
          page: next,
          hasMore: p.hasMore,
          items: [
            ...state.items,
            ...p.items.where((i) => !i.isDismissed && !seen.contains(i.id)),
          ],
        ),
      );
    });
  }

  Future<void> _onOpened(
    NotificationsOpened e,
    Emitter<NotificationsState> emit,
  ) async {
    if (!e.item.isRead) {
      emit(
        state.copyWith(
          items: [
            for (final i in state.items)
              if (i.id == e.item.id) i.copyWith(isRead: true) else i,
          ],
        ),
      );
      await _repo.markRead(e.item.id);
    }
    await _repo.click(e.item.id);
  }

  Future<void> _onDismissed(
    NotificationsDismissed e,
    Emitter<NotificationsState> emit,
  ) async {
    emit(
      state.copyWith(items: state.items.where((i) => i.id != e.id).toList()),
    );
    await _repo.dismiss(e.id);
  }

  Future<void> _onAllRead(
    NotificationsAllRead e,
    Emitter<NotificationsState> emit,
  ) async {
    emit(
      state.copyWith(
        items: [for (final i in state.items) i.copyWith(isRead: true)],
      ),
    );
    await _repo.markAllRead();
  }
}
