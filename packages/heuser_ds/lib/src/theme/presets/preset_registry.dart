import 'package:heuser_ds/src/theme/presets/h_preset.dart';
import 'package:heuser_ds/src/theme/presets/heuser_classic.dart';
import 'package:heuser_ds/src/theme/presets/more_presets.dart';

/// Built-in presets. Adding one: create the preset file, add it to [builtIn],
/// add its id to the backend `BUILTIN_MOBILE_PRESETS`, regenerate goldens and
/// document it in DESIGN.md.
abstract final class HPresets {
  /// The fallback for everything: unknown ids, broken remote payloads.
  static const HPreset fallback = kHeuserClassic;

  /// All built-in presets in picker order.
  static final List<HPreset> builtIn = List.unmodifiable([
    kHeuserClassic,
    kNavyNight,
    kApricotDawn,
    kMintCalm,
  ]);

  /// Looks up a built-in preset; `null` when unknown.
  static HPreset? byId(String id) {
    for (final p in builtIn) {
      if (p.id == id) return p;
    }
    return null;
  }

  /// Looks up a preset or returns [fallback].
  static HPreset byIdOrFallback(String? id) =>
      id == null ? fallback : (byId(id) ?? fallback);
}
