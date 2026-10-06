import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/components/buttons/h_button.dart';
import 'package:heuser_ds/src/foundation/h_icon.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/theme/h_theme_data.dart';
import 'package:heuser_ds/src/tokens/h_motion.dart';
import 'package:heuser_ds/src/tokens/h_radius.dart';
import 'package:heuser_ds/src/tokens/h_spacing.dart';

/// Centred dialog for short decisions. Prefer `HBottomSheet` for anything
/// with a list or more than two actions.
class HDialog extends StatelessWidget {
  /// Creates the dialog body (use [show] / [confirm] to present it).
  const HDialog({
    required this.title,
    this.message,
    this.content,
    this.icon,
    this.iconTone = HTextTone.brand,
    this.actions = const [],
    super.key,
  });

  /// Title.
  final String title;

  /// Body text.
  final String? message;

  /// Custom body (below [message]).
  final Widget? content;

  /// Optional glyph above the title.
  final IconData? icon;

  /// Glyph tone.
  final HTextTone iconTone;

  /// Buttons, stacked vertically (primary first).
  final List<Widget> actions;

  /// Presents [builder] with a scale-fade transition over the overlay barrier.
  static Future<T?> show<T>(
    BuildContext context, {
    required WidgetBuilder builder,
    bool barrierDismissible = true,
  }) {
    final h = context.h;
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: 'Dismiss',
      barrierColor: h.colors.overlay,
      transitionDuration: h.motion.of(h.motion.standard),
      transitionBuilder: (ctx, anim, _, child) {
        final curved = CurvedAnimation(parent: anim, curve: HMotion.enter);
        return FadeTransition(
          opacity: curved,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.94, end: 1).animate(curved),
            child: child,
          ),
        );
      },
      pageBuilder: (ctx, _, _) => _Scoped(
        h: h,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(HSpace.x6),
            child: Builder(builder: builder),
          ),
        ),
      ),
    );
  }

  /// Yes/no confirmation. Resolves `true` when confirmed.
  static Future<bool> confirm(
    BuildContext context, {
    required String title,
    required String confirmLabel,
    String? message,
    String cancelLabel = 'Cancel',
    bool destructive = false,
    IconData? icon,
  }) async {
    final result = await show<bool>(
      context,
      builder: (ctx) => HDialog(
        title: title,
        message: message,
        icon: icon,
        iconTone: destructive ? HTextTone.danger : HTextTone.brand,
        actions: [
          if (destructive)
            HButton.danger(
              label: confirmLabel,
              onPressed: () => Navigator.of(ctx).pop(true),
            )
          else
            HButton.filled(
              label: confirmLabel,
              onPressed: () => Navigator.of(ctx).pop(true),
            ),
          HButton.ghost(
            label: cancelLabel,
            onPressed: () => Navigator.of(ctx).pop(false),
            expand: true,
          ),
        ],
      ),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final c = h.colors;
    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Container(
          padding: const EdgeInsets.all(HSpace.x6),
          decoration: BoxDecoration(
            color: c.surfaceRaised,
            borderRadius: HRadius.lgAll,
            boxShadow: h.elevation.overlay,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (icon != null) ...[
                Center(
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: iconTone == HTextTone.danger
                          ? c.dangerSoft
                          : c.brandSoft,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: HIcon(icon!, size: HIconSize.xl, tone: iconTone),
                    ),
                  ),
                ),
                HSpace.gap4,
              ],
              HText(
                title,
                style: HTextStyle.headlineSm,
                align: TextAlign.center,
              ),
              if (message != null) ...[
                HSpace.gap2,
                HText(
                  message!,
                  tone: HTextTone.secondary,
                  align: TextAlign.center,
                ),
              ],
              ?content,
              if (actions.isNotEmpty) ...[
                HSpace.gap6,
                for (var i = 0; i < actions.length; i++) ...[
                  if (i > 0) HSpace.gap2,
                  actions[i],
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _Scoped extends StatelessWidget {
  const _Scoped({required this.h, required this.child});
  final HThemeData h;
  final Widget child;

  @override
  Widget build(BuildContext context) =>
      HTheme.maybeOf(context) == null ? HTheme(data: h, child: child) : child;
}
