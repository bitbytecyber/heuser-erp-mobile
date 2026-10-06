import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/components/buttons/h_button.dart';
import 'package:heuser_ds/src/components/feedback/h_status_pill.dart';
import 'package:heuser_ds/src/foundation/h_animate.dart';
import 'package:heuser_ds/src/foundation/h_icon.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/tokens/h_spacing.dart';

/// Empty, error and "nothing to do" states: icon in a soft circle, title,
/// message and an optional action.
class HEmptyState extends StatelessWidget {
  /// Creates an empty state.
  const HEmptyState({
    required this.title,
    this.message,
    this.icon,
    this.illustration,
    this.tone = HTone.brand,
    this.actionLabel,
    this.onAction,
    this.compact = false,
    super.key,
  });

  /// Title.
  final String title;

  /// Supporting text.
  final String? message;

  /// Glyph (ignored when [illustration] is set).
  final IconData? icon;

  /// Custom illustration (e.g. a Rive animation).
  final Widget? illustration;

  /// Tone of the icon circle.
  final HTone tone;

  /// Action button label.
  final String? actionLabel;

  /// Action handler.
  final VoidCallback? onAction;

  /// Smaller spacing for inline use inside cards.
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final (bg, fg) = tone.resolve(h);
    final size = compact ? 56.0 : 80.0;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: compact ? HSpace.x4 : HSpace.x10,
        horizontal: HSpace.x4,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (illustration != null)
            illustration!
          else if (icon != null)
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
              child: Center(
                child: HIcon(
                  icon!,
                  size: compact ? HIconSize.lg : HIconSize.xl,
                  color: fg,
                ),
              ),
            ).hPop(context),
          if (illustration != null || icon != null) HSpace.gap4,
          HText(
            title,
            style: compact ? HTextStyle.titleMd : HTextStyle.headlineSm,
            align: TextAlign.center,
          ),
          if (message != null) ...[
            HSpace.gap2,
            HText(message!, tone: HTextTone.secondary, align: TextAlign.center),
          ],
          if (actionLabel != null && onAction != null) ...[
            HSpace.gap6,
            HButton.tonal(
              label: actionLabel!,
              onPressed: onAction,
              expand: false,
            ),
          ],
        ],
      ),
    );
  }
}
