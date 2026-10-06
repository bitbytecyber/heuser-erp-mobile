import 'dart:ui' show Brightness;

/// User-selectable colour mode.
enum HThemeMode {
  /// Follow the OS.
  system,

  /// Always light.
  light,

  /// Always dark.
  dark;

  /// Whether the dark scheme applies for the given platform brightness.
  bool resolveDark(Brightness platform) => switch (this) {
    HThemeMode.system => platform == Brightness.dark,
    HThemeMode.light => false,
    HThemeMode.dark => true,
  };

  /// Parses a stored value; unknown → [system].
  static HThemeMode parse(String? raw) => HThemeMode.values.firstWhere(
    (m) => m.name == raw,
    orElse: () => HThemeMode.system,
  );
}
