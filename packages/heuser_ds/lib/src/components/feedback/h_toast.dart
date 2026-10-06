import 'dart:async';

import 'package:flutter/widgets.dart';
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

  /// Shows [message] for [duration]. [tone] picks the icon and colour.
  static void show(
    BuildContext context,
    String message, {
    HTone tone = HTone.neutral,
    IconData? icon,
    Duration duration = const Duration(seconds: 3),
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

  @override
  void dispose() {
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
    final curved = CurvedAnimation(parent: _c, curve: HMotion.enter);
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
              opacity: curved,
              child: SlideTransition(
                position: Tween(
                  begin: const Offset(0, -0.4),
                  end: Offset.zero,
                ).animate(curved),
                child: Dismissible(
                  key: const ValueKey('h_toast'),
                  direction: DismissDirection.up,
                  onDismissed: (_) => widget.onDismiss(),
                  child: Semantics(
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
                            GestureDetector(
                              onTap: widget.onAction,
                              behavior: HitTestBehavior.opaque,
                              child: HText(
                                widget.actionLabel!,
                                style: HTextStyle.labelLg,
                                color: fg,
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
