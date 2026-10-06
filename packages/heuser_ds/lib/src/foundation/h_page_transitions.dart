import 'package:animations/animations.dart';
import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';

/// Route transition builders. The app's router wraps pages in
/// `CustomTransitionPage(transitionsBuilder: HPageTransitions.sharedAxisX)`.
///
/// Conventions: horizontal shared-axis between sibling steps and drill-downs,
/// vertical for sheets-as-pages, fade-through between tabs/portals.
abstract final class HPageTransitions {
  /// Horizontal shared axis (forward/back).
  static Widget sharedAxisX(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) => SharedAxisTransition(
    animation: animation,
    secondaryAnimation: secondaryAnimation,
    transitionType: SharedAxisTransitionType.horizontal,
    fillColor: context.h.colors.surface,
    child: child,
  );

  /// Vertical shared axis (up from the bottom).
  static Widget sharedAxisY(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) => SharedAxisTransition(
    animation: animation,
    secondaryAnimation: secondaryAnimation,
    transitionType: SharedAxisTransitionType.vertical,
    fillColor: context.h.colors.surface,
    child: child,
  );

  /// Fade-through (unrelated destinations, tab switches).
  static Widget fadeThrough(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) => FadeThroughTransition(
    animation: animation,
    secondaryAnimation: secondaryAnimation,
    fillColor: context.h.colors.surface,
    child: child,
  );

  /// Plain fade (overlays, splash hand-off).
  static Widget fade(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) => FadeTransition(opacity: animation, child: child);
}
