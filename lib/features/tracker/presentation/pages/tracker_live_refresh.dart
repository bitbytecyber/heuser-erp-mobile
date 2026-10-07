import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_erp_mobile/features/notifications/domain/notification_link.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/bloc/tracker_bloc.dart';

/// Keeps the open tracker current: re-fetches the application when a live
/// push links to it (an office decision, a booking, a payment check) and when
/// the app returns to the foreground. [pushLinks] is wired by the router from
/// the notifications socket, so the tracker does not depend on that feature's
/// presentation layer.
class TrackerLiveRefresh extends StatefulWidget {
  /// Creates the wrapper.
  const TrackerLiveRefresh({
    required this.pushLinks,
    required this.child,
    super.key,
  });

  /// The `link` of every live push.
  final Stream<String> pushLinks;

  /// The page.
  final Widget child;

  /// Whether [link] points at application [applicationId].
  static bool isAbout(String link, int applicationId) {
    final parsed = AppLink.parse(link);
    return parsed is ApplicationLink && parsed.id == applicationId;
  }

  @override
  State<TrackerLiveRefresh> createState() => _TrackerLiveRefreshState();
}

class _TrackerLiveRefreshState extends State<TrackerLiveRefresh> {
  late final AppLifecycleListener _lifecycle;
  StreamSubscription<String>? _pushes;

  @override
  void initState() {
    super.initState();
    _lifecycle = AppLifecycleListener(onResume: _refresh);
    _listen();
  }

  @override
  void didUpdateWidget(TrackerLiveRefresh old) {
    super.didUpdateWidget(old);
    if (old.pushLinks != widget.pushLinks) _listen();
  }

  void _listen() {
    unawaited(_pushes?.cancel());
    _pushes = widget.pushLinks.listen((link) {
      if (!mounted) return;
      final id = context.read<TrackerBloc>().state.application.id;
      if (TrackerLiveRefresh.isAbout(link, id)) _refresh();
    });
  }

  @override
  void dispose() {
    unawaited(_pushes?.cancel());
    _lifecycle.dispose();
    super.dispose();
  }

  void _refresh() {
    if (!mounted) return;
    context.read<TrackerBloc>().add(const TrackerEvent.refreshed());
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
