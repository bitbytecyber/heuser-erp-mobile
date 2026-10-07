import 'dart:async';
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_erp_mobile/core/realtime/notifications_socket.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// A socket the test drives: push frames, fail, or close with a code.
class FakeChannel with StreamChannelMixin<dynamic> implements WebSocketChannel {
  final incoming = StreamController<dynamic>();
  final _sink = _FakeSink();
  @override
  int? closeCode;

  @override
  Stream<dynamic> get stream => incoming.stream;

  @override
  WebSocketSink get sink => _sink;

  @override
  String? get closeReason => null;

  @override
  String? get protocol => 'x-session-token';

  @override
  Future<void> get ready => Future.value();

  void closeWith(int code) {
    closeCode = code;
    unawaited(incoming.close());
  }
}

class _FakeSink implements WebSocketSink {
  bool closed = false;

  @override
  Future<void> close([int? closeCode, String? closeReason]) async =>
      closed = true;

  @override
  void add(dynamic data) {}

  @override
  void addError(Object error, [StackTrace? stackTrace]) {}

  @override
  Future<void> addStream(Stream<dynamic> stream) async {}

  @override
  Future<void> get done => Future.value();
}

void main() {
  late List<FakeChannel> opened;
  late NotificationsSocket socket;

  setUp(() {
    opened = [];
    socket = NotificationsSocket(
      uri: Uri.parse('ws://h/ws/notifications/'),
      origin: 'http://h',
      token: () async => 'tok',
      random: Random(1),
      connector: (_, _, _) {
        final ch = FakeChannel();
        opened.add(ch);
        return ch;
      },
    );
  });

  // Real time: the first reconnect waits about a second (backoff(0)).
  const afterBackoff = Duration(milliseconds: 1400);

  test('reconnects once after a transport error', () async {
    await socket.start();
    expect(opened, hasLength(1));
    // An error followed by done is one closure, so one reconnect.
    opened.first.incoming.addError(StateError('connection reset'));
    unawaited(opened.first.incoming.close());
    await Future<void>.delayed(afterBackoff);
    expect(opened, hasLength(2));
    expect(socket.running, isTrue);
    await socket.dispose();
  });

  test('reconnects after a drop, stops for good on 4401', () async {
    await socket.start();
    opened.first.closeWith(1006);
    await Future<void>.delayed(afterBackoff);
    expect(opened, hasLength(2));
    opened.last.closeWith(4401);
    await Future<void>.delayed(const Duration(milliseconds: 50));
    expect(socket.running, isFalse);
    await socket.dispose();
  });

  test('frames become pushes; stop() prevents any reconnect', () async {
    final pushes = <SocketPush>[];
    socket.pushes.listen(pushes.add);
    await socket.start();
    opened.first.incoming.add(
      '{"id":"1","title":"Offer sent","unread_count":2,"link":"/apply/1"}',
    );
    await Future<void>.delayed(Duration.zero);
    expect(pushes.single.unreadCount, 2);
    await socket.stop();
    expect((opened.first.sink as _FakeSink).closed, isTrue);
    opened.first.closeWith(1006);
    await Future<void>.delayed(afterBackoff);
    expect(opened, hasLength(1));
    await socket.dispose();
  });
}
