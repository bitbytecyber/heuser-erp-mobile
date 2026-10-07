import 'package:flutter/material.dart';
import 'package:heuser_ds/src/foundation/h_haptics.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';

/// Pull to refresh for a scrollable [child], styled from the theme: a brand
/// arc on the raised surface, a light haptic when the refresh starts.
/// Material's indicator is the engine (drag physics, overscroll).
///
/// The [child] must be scrollable even when short — pass a `ListView` with
/// `physics: AlwaysScrollableScrollPhysics()` or use [HRefreshable.list].
class HRefreshable extends StatelessWidget {
  /// Wraps [child].
  const HRefreshable({
    required this.onRefresh,
    required this.child,
    this.semanticsLabel,
    super.key,
  });

  /// A `ListView` that can always be pulled, around [children].
  HRefreshable.list({
    required this.onRefresh,
    required List<Widget> children,
    EdgeInsetsGeometry? padding,
    this.semanticsLabel,
    super.key,
  }) : child = ListView(
         padding: padding,
         physics: const AlwaysScrollableScrollPhysics(),
         children: children,
       );

  /// Called when pulled; the indicator spins until it completes.
  final Future<void> Function() onRefresh;

  /// The scrollable.
  final Widget child;

  /// Screen-reader label while refreshing.
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final c = context.h.colors;
    return RefreshIndicator(
      color: c.brand,
      backgroundColor: c.surfaceRaised,
      strokeWidth: 2.6,
      displacement: 32,
      semanticsLabel: semanticsLabel,
      onRefresh: () async {
        await HHaptics.selection();
        await onRefresh();
      },
      child: child,
    );
  }
}
