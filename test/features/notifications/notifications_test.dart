import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart' hide fail;
import 'package:heuser_erp_mobile/core/network/envelope.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/core/realtime/notifications_socket.dart';
import 'package:heuser_erp_mobile/features/notifications/data/models/inbox_item.dart';
import 'package:heuser_erp_mobile/features/notifications/domain/notification_link.dart';
import 'package:heuser_erp_mobile/features/notifications/domain/notifications_repository.dart';
import 'package:heuser_erp_mobile/features/notifications/presentation/bloc/notifications_bloc.dart';
import 'package:mocktail/mocktail.dart';

class _Repo extends Mock implements NotificationsRepository;

void main() {
  group('links', () {
    test('application, list and unknown', () {
      expect(AppLink.parse('/apply/42'), const ApplicationLink(42));
      expect(
        AppLink.parse('https://sis.example.com/apply/7?tab=docs'),
        const ApplicationLink(7),
      );
      expect(AppLink.parse('/apply'), const ApplicationsLink());
      expect(AppLink.parse('/dashboard/finance'), isNull);
      expect(AppLink.parse(''), isNull);
    });
  });

  test('envelope', () {
    expect(
      unwrapEnvelope({
        'ok': true,
        'data': {'a': 1},
      }),
      {'a': 1},
    );
    expect(unwrapEnvelope({'a': 1}), {'a': 1});
    expect(unwrapEnvelope(null), isEmpty);
  });

  group('socket', () {
    test('frames parse into pushes', () {
      final p = SocketPush.tryParse(
        '{"id":"x","title":"Interview booked","preview":"Wed","unread_count":3,"link":"/apply/1"}',
      );
      expect(p?.unreadCount, 3);
      expect(p?.link, '/apply/1');
      expect(SocketPush.tryParse('{"type":"ping"}'), isNull);
      expect(SocketPush.tryParse('not json'), isNull);
    });

    test('connects with the token subprotocol and an Origin', () async {
      Uri? uri;
      List<String>? protocols;
      Map<String, String>? headers;
      final socket = NotificationsSocket(
        uri: Uri.parse('ws://h:8091/ws/notifications/'),
        origin: 'http://h:8090',
        token: () async => 'tok',
        connector: (u, p, h) {
          uri = u;
          protocols = p;
          headers = h;
          throw StateError('stop here');
        },
      );
      await socket.start();
      expect(uri.toString(), 'ws://h:8091/ws/notifications/');
      expect(protocols, ['x-session-token', 'tok']);
      expect(headers, {'Origin': 'http://h:8090'});
      await socket.dispose();
    });

    test('no token: does not connect', () async {
      var calls = 0;
      final socket = NotificationsSocket(
        uri: Uri.parse('ws://h/ws/notifications/'),
        origin: 'http://h',
        token: () async => null,
        connector: (_, _, _) {
          calls++;
          throw StateError('x');
        },
      );
      await socket.start();
      expect(calls, 0);
      expect(socket.running, isFalse);
      await socket.dispose();
    });

    test('backoff doubles up to a minute with jitter', () {
      final socket = NotificationsSocket(
        uri: Uri.parse('ws://h/'),
        origin: 'http://h',
        token: () async => null,
        random: Random(1),
      );
      final first = socket.backoff(0).inMilliseconds;
      expect(first, inInclusiveRange(800, 1200));
      expect(socket.backoff(3).inMilliseconds, inInclusiveRange(6400, 9600));
      expect(socket.backoff(10).inMilliseconds, inInclusiveRange(48000, 72000));
    });
  });

  group('inbox bloc', () {
    const a = InboxItem(id: 1, title: 'A');
    const b = InboxItem(id: 2, title: 'B', isRead: true);
    const gone = InboxItem(id: 3, title: 'C', isDismissed: true);
    late _Repo repo;
    setUp(() {
      repo = _Repo();
      when(() => repo.page(1)).thenAnswer(
        (_) async =>
            ok(const InboxPage(items: [a, b, gone], hasMore: true, total: 4)),
      );
      when(() => repo.page(2)).thenAnswer(
        (_) async => ok(
          const InboxPage(
            items: [b, InboxItem(id: 4)],
            hasMore: false,
            total: 4,
          ),
        ),
      );
      when(() => repo.markRead(any())).thenAnswer((_) async => ok(null));
      when(() => repo.click(any())).thenAnswer((_) async => ok(null));
      when(() => repo.dismiss(any())).thenAnswer((_) async => ok(null));
      when(() => repo.markAllRead()).thenAnswer((_) async => ok(null));
    });

    blocTest<NotificationsBloc, NotificationsState>(
      'first page hides dismissed; more pages append without duplicates',
      build: () => NotificationsBloc(repo),
      act: (bloc) async {
        bloc.add(const NotificationsEvent.started());
        await Future<void>.delayed(Duration.zero);
        bloc.add(const NotificationsEvent.moreRequested());
      },
      wait: const Duration(milliseconds: 20),
      verify: (bloc) {
        expect(bloc.state.items.map((i) => i.id), [1, 2, 4]);
        expect(bloc.state.hasMore, isFalse);
        expect(bloc.state.page, 2);
      },
    );

    blocTest<NotificationsBloc, NotificationsState>(
      'opening marks read and records the click',
      build: () => NotificationsBloc(repo),
      seed: () => const NotificationsState(items: [a, b], loading: false),
      act: (bloc) => bloc.add(const NotificationsEvent.opened(a)),
      verify: (bloc) {
        expect(bloc.state.items.first.isRead, isTrue);
        verify(() => repo.markRead(1)).called(1);
        verify(() => repo.click(1)).called(1);
      },
    );

    blocTest<NotificationsBloc, NotificationsState>(
      'dismiss removes; mark all read',
      build: () => NotificationsBloc(repo),
      seed: () => const NotificationsState(items: [a, b], loading: false),
      act: (bloc) => bloc
        ..add(const NotificationsEvent.dismissed(2))
        ..add(const NotificationsEvent.allRead()),
      verify: (bloc) {
        expect(bloc.state.items.map((i) => i.id), [1]);
        expect(bloc.state.anyUnread, isFalse);
        verify(() => repo.dismiss(2)).called(1);
        verify(() => repo.markAllRead()).called(1);
      },
    );
  });
}
