import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/theme/h_theme_data.dart';

/// Provides [HThemeData] to the subtree. Read it with `context.h`.
///
/// Prefer `HThemeScope` (in the Material bridge) at the app root and in
/// tests: it also configures the Material engine widgets. Use [HTheme]
/// directly only to override tokens for a subtree (e.g. an inverse card).
class HTheme extends InheritedWidget {
  /// Provides [data] to [child].
  const HTheme({required this.data, required super.child, super.key});

  /// The theme.
  final HThemeData data;

  /// The nearest theme, or `null` outside an [HTheme].
  static HThemeData? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<HTheme>()?.data;

  /// The nearest theme. Throws with a clear message outside an [HTheme],
  /// which is always a wiring bug (missing `HThemeScope`).
  static HThemeData of(BuildContext context) {
    final data = maybeOf(context);
    assert(
      data != null,
      'No HTheme found above this widget. Wrap the app (or test) in HThemeScope.',
    );
    return data!;
  }

  @override
  bool updateShouldNotify(HTheme oldWidget) => oldWidget.data != data;
}

/// `context.h` — the idiomatic way to read tokens inside a widget.
extension HThemeContext on BuildContext {
  /// The nearest [HThemeData].
  HThemeData get h => HTheme.of(this);
}
