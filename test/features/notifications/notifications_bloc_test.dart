import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart' hide fail;
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/notifications/data/models/inbox_item.dart';
import 'package:heuser_erp_mobile/features/notifications/domain/notifications_repository.dart';
import 'package:heuser_erp_mobile/features/notifications/presentation/bloc/notifications_bloc.dart';
import 'package:mocktail/mocktail.dart';

class _Repo extends Mock implements NotificationsRepository;

InboxPage _page(List<InboxItem> items, {bool more = false}) =>
    InboxPage(items: items, hasMore: more, total: items.length);

void main() {
  const a = InboxItem(id: 1, title: 'A');
  const b = InboxItem(id: 2, title: 'B', isRead: true);
  const c = InboxItem(id: 3, title: 'C');
  const failure = Failure.server(status: 500);
  late _Repo repo;

  setUp(() {
    repo = _Repo();
    when(() => repo.markRead(any())).thenAnswer((_) async => ok(null));
    when(() => repo.click(any())).thenAnswer((_) async => ok(null));
    when(() => repo.dismiss(any())).thenAnswer((_) async => ok(null));
    when(() => repo.markAllRead()).thenAnswer((_) async => ok(null));
  });

  group('loading', () {
    blocTest<NotificationsBloc, NotificationsState>(
      'first page failure clears loading and keeps the failure',
      build: () {
        when(() => repo.page(1)).thenAnswer((_) async => fail(failure));
        return NotificationsBloc(repo);
      },
      act: (bloc) => bloc.add(const NotificationsEvent.started()),
      verify: (bloc) {
        expect(bloc.state.loading, isFalse);
        expect(bloc.state.failure, failure);
      },
    );

    blocTest<NotificationsBloc, NotificationsState>(
      'next page failure clears loadingMore and keeps the list',
      build: () {
        when(() => repo.page(2)).thenAnswer((_) async => fail(failure));
        return NotificationsBloc(repo);
      },
      seed: () =>
          const NotificationsState(items: [a], loading: false, hasMore: true),
      act: (bloc) => bloc.add(const NotificationsEvent.moreRequested()),
      verify: (bloc) {
        expect(bloc.state.loadingMore, isFalse);
        expect(bloc.state.items, [a]);
        expect(bloc.state.page, 1);
        expect(bloc.state.failure, failure);
      },
    );

    blocTest<NotificationsBloc, NotificationsState>(
      'a first page that is all dismissed loads on until something shows',
      build: () {
        when(() => repo.page(1)).thenAnswer(
          (_) async => ok(
            _page(const [InboxItem(id: 9, isDismissed: true)], more: true),
          ),
        );
        when(() => repo.page(2)).thenAnswer((_) async => ok(_page([c])));
        return NotificationsBloc(repo);
      },
      act: (bloc) => bloc.add(const NotificationsEvent.started()),
      verify: (bloc) {
        expect(bloc.state.items, [c]);
        expect(bloc.state.page, 2);
        expect(bloc.state.hasMore, isFalse);
      },
    );

    test('a refresh during load-more drops the stale page', () async {
      final page3 = Completer<Result<InboxPage>>();
      var refreshed = false;
      when(() => repo.page(1)).thenAnswer(
        (_) async => ok(_page(refreshed ? [c, a] : [a], more: true)),
      );
      when(() => repo.page(3)).thenAnswer((_) => page3.future);
      final bloc = NotificationsBloc(repo)
        ..emit(
          const NotificationsState(
            items: [a, b],
            loading: false,
            hasMore: true,
            page: 2,
          ),
        )
        ..add(const NotificationsEvent.moreRequested());
      await pumpEventQueue();
      expect(bloc.state.loadingMore, isTrue);

      refreshed = true;
      bloc.add(const NotificationsEvent.refreshed());
      await pumpEventQueue();
      expect(bloc.state.items.map((i) => i.id), [3, 1]);

      page3.complete(ok(_page(const [InboxItem(id: 7)])));
      await pumpEventQueue();
      // Page 3 of the old list must not be appended to the fresh page 1.
      expect(bloc.state.items.map((i) => i.id), [3, 1]);
      expect(bloc.state.page, 1);
      expect(bloc.state.loadingMore, isFalse);
      await bloc.close();
    });
  });

  group('writes', () {
    blocTest<NotificationsBloc, NotificationsState>(
      'opening signals the badge only after mark-read resolves',
      build: () => NotificationsBloc(repo),
      seed: () => const NotificationsState(items: [a], loading: false),
      act: (bloc) => bloc.add(const NotificationsEvent.opened(a)),
      expect: () => [
        isA<NotificationsState>()
            .having((s) => s.items.single.isRead, 'read', isTrue)
            .having((s) => s.readSyncSeq, 'sync', 0),
        isA<NotificationsState>().having((s) => s.readSyncSeq, 'sync', 1),
      ],
    );

    blocTest<NotificationsBloc, NotificationsState>(
      'mark-read failure rolls back and reports',
      build: () {
        when(() => repo.markRead(1)).thenAnswer((_) async => fail(failure));
        return NotificationsBloc(repo);
      },
      seed: () => const NotificationsState(items: [a], loading: false),
      act: (bloc) => bloc.add(const NotificationsEvent.opened(a)),
      verify: (bloc) {
        expect(bloc.state.items.single.isRead, isFalse);
        expect(bloc.state.actionFailure, failure);
        expect(bloc.state.actionFailureSeq, 1);
        verify(() => repo.click(1)).called(1);
      },
    );

    blocTest<NotificationsBloc, NotificationsState>(
      'dismissing an unread item also marks it read',
      build: () => NotificationsBloc(repo),
      seed: () => const NotificationsState(items: [a, b], loading: false),
      act: (bloc) => bloc.add(const NotificationsEvent.dismissed(1)),
      verify: (bloc) {
        expect(bloc.state.items, [b]);
        expect(bloc.state.readSyncSeq, 1);
        verifyInOrder([() => repo.dismiss(1), () => repo.markRead(1)]);
      },
    );

    blocTest<NotificationsBloc, NotificationsState>(
      'dismissing a read item does not touch the count',
      build: () => NotificationsBloc(repo),
      seed: () => const NotificationsState(items: [a, b], loading: false),
      act: (bloc) => bloc.add(const NotificationsEvent.dismissed(2)),
      verify: (bloc) {
        expect(bloc.state.readSyncSeq, 0);
        verifyNever(() => repo.markRead(any()));
      },
    );

    blocTest<NotificationsBloc, NotificationsState>(
      'dismiss failure puts the item back where it was',
      build: () {
        when(() => repo.dismiss(2)).thenAnswer((_) async => fail(failure));
        return NotificationsBloc(repo);
      },
      seed: () => const NotificationsState(items: [a, b, c], loading: false),
      act: (bloc) => bloc.add(const NotificationsEvent.dismissed(2)),
      verify: (bloc) {
        expect(bloc.state.items, [a, b, c]);
        expect(bloc.state.actionFailureSeq, 1);
      },
    );

    blocTest<NotificationsBloc, NotificationsState>(
      'mark-all-read signals the badge once settled',
      build: () => NotificationsBloc(repo),
      seed: () => const NotificationsState(items: [a, b, c], loading: false),
      act: (bloc) => bloc.add(const NotificationsEvent.allRead()),
      verify: (bloc) {
        expect(bloc.state.anyUnread, isFalse);
        expect(bloc.state.readSyncSeq, 1);
      },
    );

    blocTest<NotificationsBloc, NotificationsState>(
      'mark-all-read failure restores the unread ones only',
      build: () {
        when(() => repo.markAllRead()).thenAnswer((_) async => fail(failure));
        return NotificationsBloc(repo);
      },
      seed: () => const NotificationsState(items: [a, b, c], loading: false),
      act: (bloc) => bloc.add(const NotificationsEvent.allRead()),
      verify: (bloc) {
        expect(bloc.state.items.map((i) => i.isRead), [false, true, false]);
        expect(bloc.state.actionFailure, failure);
        // The page set the badge to 0 optimistically: re-read it.
        expect(bloc.state.readSyncSeq, 1);
      },
    );
  });
}
