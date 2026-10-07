import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/features/notifications/domain/notification_link.dart';
import 'package:heuser_erp_mobile/features/notifications/presentation/cubit/unread_cubit.dart';

/// Shell-level effects of the live socket: a toast for every push (with an
/// "Open" action when it links somewhere), and the socket paused while the
/// app is in the background and resumed (with a fresh count) on return.
class LiveNotifications extends StatefulWidget {
  /// Creates the wrapper.
  const LiveNotifications({
    required this.child,
    required this.onOpenLink,
    required this.openLabel,
    super.key,
  });

  /// The shell.
  final Widget child;

  /// Opens a push's destination.
  final ValueChanged<AppLink> onOpenLink;

  /// Localised "Open".
  final String openLabel;

  @override
  State<LiveNotifications> createState() => _LiveNotificationsState();
}

class _LiveNotificationsState extends State<LiveNotifications> {
  late final AppLifecycleListener _lifecycle = AppLifecycleListener(
    onResume: () => unawaited(context.read<UnreadCubit>().resumed()),
    onPause: () => unawaited(context.read<UnreadCubit>().paused()),
  );

  @override
  void initState() {
    super.initState();
    _lifecycle; // ignore: unnecessary_statements, creates the listener
  }

  @override
  void dispose() {
    _lifecycle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocListener<UnreadCubit, UnreadState>(
    listenWhen: (a, b) => a.pushSeq != b.pushSeq && b.push != null,
    listener: (context, s) {
      final p = s.push!;
      final link = AppLink.parse(p.link);
      unawaited(HHaptics.selection());
      HToast.show(
        context,
        p.preview.isEmpty ? p.title : '${p.title}: ${p.preview}',
        tone: HTone.brand,
        icon: HIcons.bell,
        duration: HToast.long,
        actionLabel: link == null ? null : widget.openLabel,
        onAction: link == null ? null : () => widget.onOpenLink(link),
      );
    },
    child: widget.child,
  );
}
