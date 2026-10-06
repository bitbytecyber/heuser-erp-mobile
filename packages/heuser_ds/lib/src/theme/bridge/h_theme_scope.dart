import 'package:flutter/material.dart';
import 'package:heuser_ds/src/foundation/h_scroll_behavior.dart';
import 'package:heuser_ds/src/theme/bridge/material_bridge.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/theme/h_theme_data.dart';

/// Installs a theme for a subtree: the [HTheme] for H components, the derived
/// Material [Theme] for engine widgets, default text/icon styles and the
/// system scroll behaviour.
///
/// Use at the app root (inside `MaterialApp.builder`) and at the root of every
/// golden/widget test and Widgetbook use-case. Theme changes cross-fade.
class HThemeScope extends StatelessWidget {
  /// Scopes [child] to [data].
  const HThemeScope({
    required this.data,
    required this.child,
    this.animate = true,
    super.key,
  });

  /// The theme.
  final HThemeData data;

  /// Whether a change of [data] cross-fades (off in goldens).
  final bool animate;

  /// Subtree.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final material = materialThemeFrom(data);
    final scoped = HTheme(
      data: data,
      child: Theme(
        data: material,
        child: ScrollConfiguration(
          behavior: const HScrollBehavior(),
          child: IconTheme(
            data: IconThemeData(color: data.colors.textPrimary, size: 22),
            child: DefaultTextStyle(
              style: data.type.bodyMd.copyWith(color: data.colors.textPrimary),
              child: ColoredBox(color: data.colors.surface, child: child),
            ),
          ),
        ),
      ),
    );
    if (!animate || !data.motion.enabled) return scoped;
    return AnimatedSwitcher(
      duration: data.motion.slow,
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      layoutBuilder: (current, previous) =>
          Stack(fit: StackFit.expand, children: [...previous, ?current]),
      child: KeyedSubtree(
        key: ValueKey('${data.presetId}-${data.colors.brightness.name}'),
        child: scoped,
      ),
    );
  }
}
