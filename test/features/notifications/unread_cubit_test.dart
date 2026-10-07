import 'dart:async';

import 'package:flutter_test/flutter_test.dart' hide fail;
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/core/realtime/notifications_socket.dart';
import 'package:heuser_erp_mobile/features/notifications/domain/notifications_repository.dart';
import 'package:heuser_erp_mobile/features/notifications/presentation/cubit/unread_cubit.dart';
import 'package:mocktail/mocktail.dart';

class _Repo extends Mock implements NotificationsRepository;

class _Socket extends Mock implements NotificationsSocket;

void main() {
  late _Repo repo;
  late _Socket socket;
  late StreamController<SocketPush> pushes;

  setUp(() {
    repo = _Repo();
    socket = _Socket();
    pushes = StreamController<SocketPush>.broadcast();
    when(() => socket.pushes).thenAnswer((_) => pushes.stream);
    when(() => socket.start()).thenAnswer((_) async {});
    when(() => socket.stop()).thenAnswer((_) async {});
    when(() => repo.unreadCount()).thenAnswer((_) async => ok(4));
  });

  tearDown(() => pushes.close());

  test('reads the count and connects on creation', () async {
    final cubit = UnreadCubit(repo, socket);
    await pumpEventQueue();
    expect(cubit.state.count, 4);
    verify(() => socket.start()).called(1);
    await cubit.close();
  });

  test('a push sets the count and bumps the sequence', () async {
    final cubit = UnreadCubit(repo, socket);
    await pumpEventQueue();
    const push = SocketPush(
      title: 'Interview booked',
      preview: '',
      unreadCount: 5,
      link: 'https://erp.heuser.edu.pk/apply/applications/1',
    );
    pushes.add(push);
    await pumpEventQueue();
    expect(cubit.state.count, 5);
    expect(cubit.state.push, push);
    expect(cubit.state.pushSeq, 1);
    // A later re-read keeps the sequence (no second toast).
    await cubit.refresh();
    expect(cubit.state.pushSeq, 1);
    expect(cubit.state.push, isNull);
    await cubit.close();
  });

  test('a failed re-read keeps the last count', () async {
    final cubit = UnreadCubit(repo, socket);
    await pumpEventQueue();
    when(() => repo.unreadCount())
        .thenAnswer((_) async => fail(const Failure.timeout()));
    await cubit.refresh();
    expect(cubit.state.count, 4);
    await cubit.close();
  });

  test('set, resume and pause', () async {
    final cubit = UnreadCubit(repo, socket);
    await pumpEventQueue();
    cubit.set(0);
    expect(cubit.state.count, 0);
    await cubit.resumed();
    expect(cubit.state.count, 4);
    verify(() => socket.start()).called(2);
    await cubit.paused();
    verify(() => socket.stop()).called(1);
    await cubit.close();
  });

  test('closing stops the socket; a late count is ignored', () async {
    final pending = Completer<Result<int>>();
    when(() => repo.unreadCount()).thenAnswer((_) => pending.future);
    final cubit = UnreadCubit(repo, socket);
    await cubit.close();
    verify(() => socket.stop()).called(1);
    pending.complete(ok(9));
    await pumpEventQueue();
    expect(cubit.state.count, 0);
  });
}
