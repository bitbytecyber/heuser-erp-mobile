import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
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

    /// Bumped when a write that changes read flags (open, dismiss, mark all
    /// read) has settled on the server: the page re-reads the badge then.
    @Default(0) int readSyncSeq,

    /// The last failed write (its optimistic change was rolled back).
    Failure? actionFailure,

    /// Bumped with every [actionFailure] so the page toasts it once.
    @Default(0) int actionFailureSeq,
  }) = _NotificationsState;
  const NotificationsState._();

  /// Any unread item on screen.
  bool get anyUnread => items.any((i) => !i.isRead);
}

/// The inbox: paged list, read / dismiss / read-all with optimistic updates
/// that roll back on failure.
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
    // Concurrent: each write touches its own item and rolls back by id.
    on<NotificationsOpened>(_onOpened);
    on<NotificationsDismissed>(_onDismissed);
    // droppable: a double tap marks once.
    on<NotificationsAllRead>(_onAllRead, transformer: droppable());
  }

  final NotificationsRepository _repo;

  /// Pages fetched in one go while every item on them is hidden.
  static const _maxPagesPerLoad = 5;

  /// Bumped by every first-page load: a next page fetched under an older
  /// generation belongs to a list that no longer exists.
  int _generation = 0;
  bool _firstInFlight = false;

  Future<void> _first(Emitter<NotificationsState> emit) async {
    final gen = ++_generation;
    _firstInFlight = true;
    emit(state.copyWith(loading: state.items.isEmpty, failure: null));
    final r = await _fetch(1, <int>{});
    if (gen == _generation) _firstInFlight = false;
    if (emit.isDone) return;
    r.fold(
      (f) =>
          emit(state.copyWith(loading: false, loadingMore: false, failure: f)),
      (c) => emit(
        NotificationsState(
          items: c.items,
          loading: false,
          hasMore: c.hasMore,
          page: c.page,
          readSyncSeq: state.readSyncSeq,
          actionFailureSeq: state.actionFailureSeq,
        ),
      ),
    );
  }

  Future<void> _onMore(
    NotificationsMoreRequested e,
    Emitter<NotificationsState> emit,
  ) async {
    if (!state.hasMore || state.loading || _firstInFlight) return;
    final gen = _generation;
    emit(state.copyWith(loadingMore: true));
    final r = await _fetch(
      state.page + 1,
      state.items.map((i) => i.id).toSet(),
    );
    if (emit.isDone) return;
    if (gen != _generation) {
      // A refresh replaced the list meanwhile: this page is stale.
      emit(state.copyWith(loadingMore: false));
      return;
    }
    r.fold(
      (f) => emit(state.copyWith(loadingMore: false, failure: f)),
      (c) => emit(
        state.copyWith(
          loadingMore: false,
          page: c.page,
          hasMore: c.hasMore,
          items: [...state.items, ...c.items],
        ),
      ),
    );
  }

  /// Fetches from [page] on, going past pages whose items are all dismissed
  /// or already shown (up to [_maxPagesPerLoad]), so a hidden page never
  /// leaves the list empty or stalled.
  Future<Result<_Chunk>> _fetch(int page, Set<int> seen) async {
    final items = <InboxItem>[];
    for (var p = page; ; p++) {
      final r = await _repo.page(p);
      final f = r.failureOrNull;
      if (f != null) return fail(f);
      final got = r.valueOrNull!;
      items.addAll(got.items.where((i) => !i.isDismissed && seen.add(i.id)));
      final last = p - page + 1 >= _maxPagesPerLoad;
      if (items.isNotEmpty || !got.hasMore || last) {
        return ok(_Chunk(items, p, hasMore: got.hasMore));
      }
    }
  }

  List<InboxItem> _withRead(Set<int> ids, {required bool read}) => [
    for (final i in state.items)
      if (ids.contains(i.id)) i.copyWith(isRead: read) else i,
  ];

  void _failed(Emitter<NotificationsState> emit, Failure f) => emit(
    state.copyWith(
      actionFailure: f,
      actionFailureSeq: state.actionFailureSeq + 1,
      // The badge may have been set optimistically: re-read it.
      readSyncSeq: state.readSyncSeq + 1,
    ),
  );

  Future<void> _onOpened(
    NotificationsOpened e,
    Emitter<NotificationsState> emit,
  ) async {
    final id = e.item.id;
    if (!e.item.isRead) {
      emit(state.copyWith(items: _withRead({id}, read: true)));
      final r = await _repo.markRead(id);
      if (emit.isDone) return;
      final f = r.failureOrNull;
      if (f != null) {
        emit(state.copyWith(items: _withRead({id}, read: false)));
        _failed(emit, f);
      } else {
        emit(state.copyWith(readSyncSeq: state.readSyncSeq + 1));
      }
    }
    // Analytics only: a failed click record is not worth telling anyone.
    await _repo.click(id);
  }

  Future<void> _onDismissed(
    NotificationsDismissed e,
    Emitter<NotificationsState> emit,
  ) async {
    final index = state.items.indexWhere((i) => i.id == e.id);
    if (index < 0) return;
    final item = state.items[index];
    emit(
      state.copyWith(items: state.items.where((i) => i.id != e.id).toList()),
    );
    final r = await _repo.dismiss(e.id);
    if (emit.isDone) return;
    final f = r.failureOrNull;
    if (f != null) {
      final items = [...state.items];
      if (!items.any((i) => i.id == e.id)) {
        items.insert(index.clamp(0, items.length), item);
      }
      emit(state.copyWith(items: items));
      _failed(emit, f);
      return;
    }
    // The server's dismiss leaves `is_read` alone, so an unread item would
    // keep counting in the badge: read it too.
    if (!item.isRead) {
      await _repo.markRead(e.id);
      if (emit.isDone) return;
      emit(state.copyWith(readSyncSeq: state.readSyncSeq + 1));
    }
  }

  Future<void> _onAllRead(
    NotificationsAllRead e,
    Emitter<NotificationsState> emit,
  ) async {
    final unread = {
      for (final i in state.items)
        if (!i.isRead) i.id,
    };
    emit(state.copyWith(items: _withRead(unread, read: true)));
    final r = await _repo.markAllRead();
    if (emit.isDone) return;
    final f = r.failureOrNull;
    if (f != null) {
      emit(state.copyWith(items: _withRead(unread, read: false)));
      _failed(emit, f);
    } else {
      emit(state.copyWith(readSyncSeq: state.readSyncSeq + 1));
    }
  }
}

/// Visible items fetched up to [page].
class _Chunk {
  const _Chunk(this.items, this.page, {required this.hasMore});

  final List<InboxItem> items;
  final int page;
  final bool hasMore;
}
