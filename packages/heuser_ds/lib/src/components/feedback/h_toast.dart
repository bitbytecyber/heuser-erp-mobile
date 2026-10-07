import 'dart:async';

import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform;
import 'package:flutter/semantics.dart' show SemanticsService;
import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/components/buttons/h_pressable.dart';
import 'package:heuser_ds/src/components/feedback/h_status_pill.dart';
import 'package:heuser_ds/src/foundation/h_icon.dart';
import 'package:heuser_ds/src/foundation/h_icons.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/theme/h_theme_data.dart';
import 'package:heuser_ds/src/tokens/h_motion.dart';
import 'package:heuser_ds/src/tokens/h_radius.dart';
import 'package:heuser_ds/src/tokens/h_spacing.dart';

/// Transient top-of-screen message. One at a time; showing the same message
/// twice in a row is a no-op so retry storms do not stack toasts.
abstract final class HToast {
  static OverlayEntry? _entry;
  static Timer? _timer;
  static String? _lastMessage;

  /// How long a plain toast stays.
  static const Duration short = Duration(seconds: 3);

  /// How long a toast with an action (e.g. "Open") stays.
  static const Duration long = Duration(seconds: 5);

  /// Shows [message] for [duration]. [tone] picks the icon and colour.
  static void show(
    BuildContext context,
    String message, {
    HTone tone = HTone.neutral,
    IconData? icon,
    Duration duration = short,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    if (_entry != null && _lastMessage == message) return;
    dismiss();
    final overlay = Overlay.of(context, rootOverlay: true);
    final h = context.h;
    _lastMessage = message;
    final entry = OverlayEntry(
      builder: (_) => _ToastView(
        h: h,
        message: message,
        tone: tone,
        icon: icon,
        actionLabel: actionLabel,
        onAction: () {
          onAction?.call();
          dismiss();
        },
        onDismiss: dismiss,
      ),
    );
    _entry = entry;
    overlay.insert(entry);
    _timer = Timer(duration, dismiss);
  }

  /// Convenience: success tone.
  static void success(BuildContext context, String message) =>
      show(context, message, tone: HTone.success, icon: HIcons.checkCircle);

  /// Convenience: danger tone.
  static void error(BuildContext context, String message) =>
      show(context, message, tone: HTone.danger, icon: HIcons.error);

  /// Removes the current toast, if any.
  static void dismiss() {
    _timer?.cancel();
    _timer = null;
    _entry?.remove();
    _entry = null;
    _lastMessage = null;
  }
}

class _ToastView extends StatefulWidget {
  const _ToastView({
    required this.h,
    required this.message,
    required this.tone,
    required this.icon,
    required this.actionLabel,
    required this.onAction,
    required this.onDismiss,
  });

  final HThemeData h;
  final String message;
  final HTone tone;
  final IconData? icon;
  final String? actionLabel;
  final VoidCallback onAction;
  final VoidCallback onDismiss;

  @override
  State<_ToastView> createState() => _ToastViewState();
}

class _ToastViewState extends State<_ToastView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: widget.h.motion.of(widget.h.motion.standard),
  )..forward();
  late final CurvedAnimation _curved = CurvedAnimation(
    parent: _c,
    curve: HMotion.enter,
  );
  bool _announced = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Android reads the live region below; iOS VoiceOver ignores live
    // regions, so the message is announced explicitly there.
    if (_announced || defaultTargetPlatform != TargetPlatform.iOS) return;
    _announced = true;
    unawaited(
      SemanticsService.sendAnnouncement(
        View.of(context),
        widget.message,
        Directionality.maybeOf(context) ?? TextDirection.ltr,
      ),
    );
  }

  @override
  void dispose() {
    _curved.dispose();
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = widget.h;
    final c = h.colors;
    final (bg, fg) = widget.tone == HTone.neutral
        ? (c.surfaceInverse, c.textInverse)
        : widget.tone.resolve(h);
    return HTheme(
      data: h,
      child: Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              HSpace.x4,
              HSpace.x2,
              HSpace.x4,
              0,
            ),
            child: FadeTransition(
              opacity: _curved,
              child: SlideTransition(
                position: Tween(
                  begin: const Offset(0, -0.4),
                  end: Offset.zero,
                ).animate(_curved),
                child: Dismissible(
                  key: const ValueKey('h_toast'),
                  direction: DismissDirection.up,
                  onDismissed: (_) => widget.onDismiss(),
                  child: Semantics(
                    container: true,
                    liveRegion: true,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: HSpace.x4,
                        vertical: HSpace.x3,
                      ),
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: HRadius.mdAll,
                        boxShadow: h.elevation.overlay,
                      ),
                      child: Row(
                        children: [
                          if (widget.icon != null) ...[
                            HIcon(widget.icon!, color: fg),
                            HSpace.hgap3,
                          ],
                          Expanded(
                            child: HText(
                              widget.message,
                              color: fg,
                              maxLines: 3,
                            ),
                          ),
                          if (widget.actionLabel != null) ...[
                            HSpace.hgap3,
                            // Its own node, so it is a button and not
                            // merged into the announced message.
                            Semantics(
                              container: true,
                              child: HPressable(
                                onPressed: widget.onAction,
                                semanticsLabel: widget.actionLabel,
                                excludeChildSemantics: true,
                                builder: (context, _) => ConstrainedBox(
                                  // 48 dp touch target around a short label.
                                  constraints: const BoxConstraints(
                                    minWidth: 48,
                                    minHeight: 48,
                                  ),
                                  child: Center(
                                    widthFactor: 1,
                                    child: HText(
                                      widget.actionLabel!,
                                      style: HTextStyle.labelLg,
                                      color: fg,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
