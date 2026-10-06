import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/connectivity/connectivity_service.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';

/// Slim strip at the top of the shell while the backend is unreachable.
/// Reads the shared [ConnectivityService] through [ConnectivityScope].
class ConnectivityBanner extends StatefulWidget {
  /// Creates the banner.
  const ConnectivityBanner({super.key});

  @override
  State<ConnectivityBanner> createState() => _ConnectivityBannerState();
}

class _ConnectivityBannerState extends State<ConnectivityBanner> {
  StreamSubscription<NetworkStatus>? _sub;
  NetworkStatus _status = NetworkStatus.online;
  ConnectivityService? _service;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final service = ConnectivityScope.maybeOf(context);
    if (identical(service, _service)) return;
    unawaited(_sub?.cancel());
    _service = service;
    _status = service?.status ?? NetworkStatus.online;
    _sub = service?.statusStream.listen((s) {
      if (mounted) setState(() => _status = s);
    });
  }

  @override
  void dispose() {
    unawaited(_sub?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final t = Translations.of(context);
    final offline = _status != NetworkStatus.online;
    return AnimatedSize(
      duration: h.motion.of(h.motion.standard),
      curve: HMotion.easeOut,
      alignment: Alignment.topCenter,
      child: offline
          ? ColoredBox(
              color: h.colors.warningSoft,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: HSpace.x4,
                    vertical: HSpace.x2,
                  ),
                  child: Row(
                    children: [
                      const HIcon(
                        HIcons.offline,
                        size: HIconSize.sm,
                        tone: HTextTone.warning,
                      ),
                      HSpace.hgap2,
                      Expanded(
                        child: HText(
                          t.common.offline,
                          style: HTextStyle.bodySm,
                          tone: HTextTone.warning,
                        ),
                      ),
                      HButton.ghost(
                        label: t.common.retry,
                        size: HButtonSize.sm,
                        onPressed: () => _service?.retryNow(),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : const SizedBox(width: double.infinity),
    );
  }
}

/// Provides the [ConnectivityService] to the tree.
class ConnectivityScope extends InheritedWidget {
  /// Creates the scope.
  const ConnectivityScope({
    required this.service,
    required super.child,
    super.key,
  });

  /// The service.
  final ConnectivityService service;

  /// Nearest service, or `null`.
  static ConnectivityService? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ConnectivityScope>()?.service;

  @override
  bool updateShouldNotify(ConnectivityScope oldWidget) =>
      oldWidget.service != service;
}
