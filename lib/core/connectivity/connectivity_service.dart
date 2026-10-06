import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

/// What the app believes about its ability to talk to the backend.
enum NetworkStatus {
  /// Transport present and the last request that reached a verdict succeeded.
  online,

  /// No transport at all.
  offline,

  /// Transport present but the backend could not be reached.
  apiUnreachable,
}

/// Single source of truth for connectivity (ported from sms-flutter).
///
/// Two inputs: `connectivity_plus` says whether a *transport* exists (never
/// proof the backend works: a captive portal still reports wifi); real Dio
/// outcomes, pushed in by `NetworkErrorInterceptor`, are the authority on
/// reachability. The service only reflects state; it never blocks requests.
class ConnectivityService {
  /// [onChanged] and [probe] let tests drive the transport without the
  /// platform channel; production passes neither.
  factory ConnectivityService({
    Connectivity? connectivity,
    Stream<List<ConnectivityResult>>? onChanged,
    Future<List<ConnectivityResult>> Function()? probe,
  }) {
    final plugin = (onChanged == null || probe == null)
        ? (connectivity ?? Connectivity())
        : null;
    return ConnectivityService._(
      onChanged ?? plugin!.onConnectivityChanged,
      probe ?? plugin!.checkConnectivity,
    );
  }

  ConnectivityService._(this._onChanged, this._probe);

  final Stream<List<ConnectivityResult>> _onChanged;
  final Future<List<ConnectivityResult>> Function() _probe;
  final _controller = StreamController<NetworkStatus>.broadcast();
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  /// Optimistic until the first probe lands so a cold start never flashes the banner.
  bool _hasTransport = true;
  bool _apiReachable = true;
  NetworkStatus _status = NetworkStatus.online;

  /// Current status.
  NetworkStatus get status => _status;

  /// Anything but online.
  bool get isOffline => _status != NetworkStatus.online;

  /// Whether the *device* has no transport (used by the failure mapper).
  bool get deviceOffline => !_hasTransport;

  /// Status changes.
  Stream<NetworkStatus> get statusStream => _controller.stream;

  /// Reads the current transport and starts listening for changes.
  Future<void> initialize() async {
    _subscription ??= _onChanged.listen(
      _applyTransport,
      onError: (Object error) =>
          debugPrint('ConnectivityService: transport stream error: $error'),
    );
    await refresh();
  }

  /// Re-reads the transport (on resume, and after an unreachable verdict).
  Future<void> refresh() async {
    try {
      _applyTransport(await _probe());
    } on Object catch (error) {
      debugPrint('ConnectivityService: probe failed: $error');
    }
  }

  /// A request got a status code, any status code.
  void reportApiSuccess() {
    _apiReachable = true;
    _hasTransport = true;
    _emit();
  }

  /// A request failed before producing any response.
  void reportApiUnreachable() {
    _apiReachable = false;
    _emit();
    unawaited(refresh());
  }

  /// The user asked to retry (banner action).
  Future<void> retryNow() async {
    _apiReachable = true;
    await refresh();
    _emit();
  }

  void _applyTransport(List<ConnectivityResult> results) {
    final hasTransport =
        results.isNotEmpty && results.any((r) => r != ConnectivityResult.none);
    if (hasTransport && !_hasTransport) _apiReachable = true;
    _hasTransport = hasTransport;
    _emit();
  }

  void _emit() {
    final next = !_hasTransport
        ? NetworkStatus.offline
        : (_apiReachable ? NetworkStatus.online : NetworkStatus.apiUnreachable);
    if (next == _status) return;
    debugPrint('ConnectivityService: ${_status.name} → ${next.name}');
    _status = next;
    if (!_controller.isClosed) _controller.add(next);
  }

  /// Releases the subscription.
  Future<void> dispose() async {
    await _subscription?.cancel();
    _subscription = null;
    await _controller.close();
  }
}
