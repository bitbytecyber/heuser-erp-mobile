import 'package:flutter/material.dart' show Scaffold;
import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';

/// Page frame: surface background, optional `HAppBar`-style top bar, body
/// and an optional bottom bar pinned above the keyboard/safe area (the
/// place for the primary CTA). Wraps Material's `Scaffold` only for its
/// keyboard-inset and overlay plumbing.
class HScaffold extends StatelessWidget {
  /// Creates a scaffold.
  const HScaffold({
    required this.body,
    this.appBar,
    this.bottomBar,
    this.bottomNav,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
    this.safeAreaBody = true,
    super.key,
  });

  /// Content.
  final Widget body;

  /// Top bar (typically `HAppBar`).
  final Widget? appBar;

  /// Pinned bottom content (CTA row). Receives safe-area padding.
  final Widget? bottomBar;

  /// Bottom navigation (typically `HNavBar`); drawn below [bottomBar].
  final Widget? bottomNav;

  /// Page background; defaults to `surface`.
  final Color? backgroundColor;

  /// Shrink body for the keyboard.
  final bool resizeToAvoidBottomInset;

  /// Apply a safe area to the body's sides and bottom when no bars exist.
  final bool safeAreaBody;

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final hasBottom = bottomBar != null || bottomNav != null;
    return Scaffold(
      backgroundColor: backgroundColor ?? h.colors.surface,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Column(
        children: [
          ?appBar,
          Expanded(
            child: safeAreaBody
                ? SafeArea(top: appBar == null, bottom: !hasBottom, child: body)
                : body,
          ),
          if (bottomBar != null)
            ColoredBox(
              color: backgroundColor ?? h.colors.surface,
              child: SafeArea(
                top: false,
                bottom: bottomNav == null,
                child: bottomBar!,
              ),
            ),
          ?bottomNav,
        ],
      ),
    );
  }
}
