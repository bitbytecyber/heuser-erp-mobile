import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/components/buttons/h_icon_button.dart';
import 'package:heuser_ds/src/foundation/h_icons.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/tokens/h_spacing.dart';

/// Top bar: optional back button, title (+ subtitle), trailing actions.
/// Transparent over the page surface; no elevation. Height 56 + status bar.
class HAppBar extends StatelessWidget {
  /// Creates an app bar.
  const HAppBar({
    this.title,
    this.subtitle,
    this.titleWidget,
    this.leading,
    this.showBack,
    this.onBack,
    this.actions = const [],
    this.centerTitle = false,
    this.backLabel = 'Back',
    super.key,
  });

  /// Title text.
  final String? title;

  /// Small line under the title.
  final String? subtitle;

  /// Custom title widget (overrides [title]).
  final Widget? titleWidget;

  /// Custom leading widget (overrides the back button).
  final Widget? leading;

  /// Force the back button on/off; defaults to "can pop".
  final bool? showBack;

  /// Back handler; defaults to `Navigator.maybePop`.
  final VoidCallback? onBack;

  /// Trailing widgets (usually [HIconButton]s).
  final List<Widget> actions;

  /// Centre the title.
  final bool centerTitle;

  /// Accessible label of the back button.
  final String backLabel;

  /// Bar height excluding the status bar.
  static const double height = 56;

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final canPop = showBack ?? Navigator.of(context).canPop();
    final lead =
        leading ??
        (canPop
            ? HIconButton(
                icon: HIcons.back,
                semanticsLabel: backLabel,
                onPressed: onBack ?? () => Navigator.of(context).maybePop(),
              )
            : null);
    final titleColumn =
        titleWidget ??
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: centerTitle
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            if (title != null)
              HText(title!, style: HTextStyle.titleLg, maxLines: 1),
            if (subtitle != null)
              HText(
                subtitle!,
                style: HTextStyle.bodySm,
                tone: HTextTone.secondary,
                maxLines: 1,
              ),
          ],
        );
    return ColoredBox(
      color: h.colors.surface,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: HSpace.x2),
            child: Row(
              children: [
                if (lead != null) lead else const SizedBox(width: HSpace.x2),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: lead == null ? HSpace.x1 : HSpace.x2,
                    ),
                    child: Align(
                      alignment: centerTitle
                          ? Alignment.center
                          : Alignment.centerLeft,
                      child: titleColumn,
                    ),
                  ),
                ),
                ...actions,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
