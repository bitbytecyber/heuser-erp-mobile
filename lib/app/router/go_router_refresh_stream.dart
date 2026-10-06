import 'dart:async';

import 'package:flutter/foundation.dart';

/// Turns a stream (the auth bloc's) into a [Listenable] for GoRouter's
/// `refreshListenable`, so every session change re-runs the redirect.
class GoRouterRefreshStream extends ChangeNotifier {
  /// Subscribes to [stream].
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _sub = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _sub;

  @override
  void dispose() {
    unawaited(_sub.cancel());
    super.dispose();
  }
}
