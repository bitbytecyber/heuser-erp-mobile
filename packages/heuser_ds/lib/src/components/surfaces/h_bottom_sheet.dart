import 'package:flutter/material.dart' show showModalBottomSheet;
import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/components/buttons/h_icon_button.dart';
import 'package:heuser_ds/src/foundation/h_icons.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/theme/h_theme_data.dart';
import 'package:heuser_ds/src/tokens/h_radius.dart';
import 'package:heuser_ds/src/tokens/h_spacing.dart';

/// Modal bottom sheet with the system's rounded top, drag handle, optional
/// title row and safe-area padding. Confirmations, pickers and option lists
/// use this instead of dialogs.
class HBottomSheet extends StatelessWidget {
  /// Creates the sheet body (use [show] to present it).
  const HBottomSheet({
    required this.child,
    this.title,
    this.showClose = true,
    this.padding = const EdgeInsets.fromLTRB(
      HSpace.x4,
      0,
      HSpace.x4,
      HSpace.x4,
    ),
    this.closeLabel = 'Close',
    this.scrollBody = true,
    super.key,
  });

  /// Content.
  final Widget child;

  /// Title in the header row.
  final String? title;

  /// Shows the close button when a title is present.
  final bool showClose;

  /// Content padding.
  final EdgeInsetsGeometry padding;

  /// Accessible label of the close button.
  final String closeLabel;

  /// Wrap [child] in a scroll view. Set `false` when [child] scrolls itself
  /// (paged lists); it then gets the remaining height.
  final bool scrollBody;

  /// Presents [builder] as a modal sheet and resolves with its result.
  static Future<T?> show<T>(
    BuildContext context, {
    required WidgetBuilder builder,
    bool isDismissible = true,
    bool isScrollControlled = true,
    bool useRootNavigator = true,
  }) {
    final h = context.h;
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: isDismissible,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      backgroundColor: const Color(0x00000000),
      barrierColor: h.colors.overlay,
      useSafeArea: true,
      builder: (ctx) => _Scoped(
        h: h,
        child: Builder(builder: builder),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final c = h.colors;
    return Container(
      decoration: BoxDecoration(
        color: c.surfaceRaised,
        borderRadius: HRadius.sheet,
        boxShadow: h.elevation.overlay,
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(
                  top: HSpace.x2 + 2,
                  bottom: HSpace.x2,
                ),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: c.outlineSoft,
                  borderRadius: HRadius.pillAll,
                ),
              ),
            ),
            if (title != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  HSpace.x4,
                  HSpace.x1,
                  HSpace.x2,
                  HSpace.x2,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: HText(title!, style: HTextStyle.headlineSm),
                    ),
                    if (showClose)
                      HIconButton(
                        icon: HIcons.close,
                        semanticsLabel: closeLabel,
                        size: 36,
                        onPressed: () => Navigator.of(context).maybePop(),
                      ),
                  ],
                ),
              ),
            Flexible(
              child: scrollBody
                  ? SingleChildScrollView(padding: padding, child: child)
                  : Padding(padding: padding, child: child),
            ),
          ],
        ),
      ),
    );
  }
}

/// Re-installs the theme inside the sheet route (which is built under the
/// root navigator, possibly above the app's own `HThemeScope`).
class _Scoped extends StatelessWidget {
  const _Scoped({required this.h, required this.child});
  final HThemeData h;
  final Widget child;

  @override
  Widget build(BuildContext context) =>
      HTheme.maybeOf(context) == null ? HTheme(data: h, child: child) : child;
}
