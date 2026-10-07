import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// A live notification pushed over the socket (`notification_push`).
@immutable
class SocketPush {
  /// Creates the push.
  const SocketPush({
    required this.title,
    required this.preview,
    required this.unreadCount,
    required this.link,
  });

  /// Parses a frame; `null` for anything that is not a push.
  static SocketPush? tryParse(Object? frame) {
    try {
      final json = frame is String ? jsonDecode(frame) : frame;
      if (json is! Map || json['unread_count'] == null) return null;
      return SocketPush(
        title: (json['title'] ?? '').toString(),
        preview: (json['preview'] ?? '').toString(),
        unreadCount: (json['unread_count'] as num).toInt(),
        link: (json['link'] ?? '').toString(),
      );
    } on Object catch (_) {
      return null;
    }
  }

  /// Title.
  final String title;

  /// Short body.
  final String preview;

  /// The badge after this push.
  final int unreadCount;

  /// Deep link (`/apply/42`), or `''`.
  final String link;
}

/// Opens a channel; injectable for tests.
typedef SocketConnector = WebSocketChannel Function(
  Uri uri,
  List<String> protocols,
  Map<String, String> headers,
);

/// The notifications WebSocket (`ws/notifications/`).
///
/// Authenticates with the subprotocols `x-session-token, <token>` (the
/// server echoes `x-session-token`) and an explicit `Origin` (Channels'
/// origin check rejects a socket without one). Reconnects with exponential
/// backoff and jitter; a 4401 close (no valid session) stops it for good
/// until [start] is called again after a new sign-in.
class NotificationsSocket {
  /// Creates the socket. [origin] is the API origin sent as `Origin`.
  NotificationsSocket({
    required this.uri,
    required this.origin,
    required this._token,
    SocketConnector? connector,
    Random? random,
  }) : _connect = connector ?? _ioConnect,
       _random = random ?? Random();

  /// The socket URL.
  final Uri uri;

  /// `Origin` header value.
  final String origin;

  final Future<String?> Function() _token;
  final SocketConnector _connect;
  final Random _random;
  final _pushes = StreamController<SocketPush>.broadcast();

  WebSocketChannel? _channel;
  StreamSubscription<dynamic>? _sub;
  Timer? _retry;
  int _attempt = 0;
  bool _running = false;

  /// Live pushes.
  Stream<SocketPush> get pushes => _pushes.stream;

  /// Whether the socket should be connected.
  bool get running => _running;

  static WebSocketChannel _ioConnect(
    Uri uri,
    List<String> protocols,
    Map<String, String> headers,
  ) => IOWebSocketChannel.connect(
    uri,
    protocols: protocols,
    headers: headers,
    pingInterval: const Duration(seconds: 25),
  );

  /// Connects (idempotent).
  Future<void> start() async {
    if (_running) return;
    _running = true;
    _attempt = 0;
    await _open();
  }

  Future<void> _open() async {
    if (!_running) return;
    final token = await _token();
    if (!_running) return;
    if (token == null || token.isEmpty) {
      _running = false;
      return;
    }
    try {
      final ch = _connect(uri, ['x-session-token', token], {'Origin': origin});
      _channel = ch;
      await _sub?.cancel();
      _sub = ch.stream.listen(
        (frame) {
          _attempt = 0;
          final push = SocketPush.tryParse(frame);
          if (push != null && !_pushes.isClosed) _pushes.add(push);
        },
        onError: (Object e) => debugPrint('NotificationsSocket: $e'),
        onDone: () => _onClosed(ch.closeCode),
        cancelOnError: true,
      );
    } on Object catch (e) {
      debugPrint('NotificationsSocket: connect failed: $e');
      _scheduleRetry();
    }
  }

  void _onClosed(int? code) {
    _channel = null;
    if (!_running) return;
    if (code == 4401) {
      // The session is gone: the auth layer signs out; do not hammer.
      _running = false;
      return;
    }
    _scheduleRetry();
  }

  /// Delay before reconnect attempt [attempt] (1, 2, 4 … 60 s, ±20 %).
  @visibleForTesting
  Duration backoff(int attempt) {
    final base = min(60, pow(2, attempt).toInt());
    final jitter = 0.8 + _random.nextDouble() * 0.4;
    return Duration(milliseconds: (base * 1000 * jitter).round());
  }

  void _scheduleRetry() {
    if (!_running) return;
    _retry?.cancel();
    _retry = Timer(backoff(_attempt++), () => unawaited(_open()));
  }

  /// Disconnects and stops reconnecting (sign-out, app in background).
  Future<void> stop() async {
    _running = false;
    _retry?.cancel();
    await _sub?.cancel();
    _sub = null;
    await _channel?.sink.close();
    _channel = null;
  }

  /// Releases everything.
  Future<void> dispose() async {
    await stop();
    await _pushes.close();
  }
}
