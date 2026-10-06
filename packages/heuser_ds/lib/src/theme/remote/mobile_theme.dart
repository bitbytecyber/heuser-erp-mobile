import 'package:heuser_ds/src/theme/presets/h_preset.dart';
import 'package:heuser_ds/src/theme/presets/preset_registry.dart';

/// The admin's theme policy for the mobile app, as served in the
/// `mobile_theme` block of `GET /api/v1/site-branding/`:
///
/// ```json
/// {
///   "active_preset": "heuser_classic",
///   "allow_user_override": true,
///   "presets": [{"id": "...", "label": "...", "light": {...}, "dark": {...}}]
/// }
/// ```
///
/// Decoded leniently by `MobileThemeCodec`; this type is always valid.
class MobileTheme {
  /// Creates a policy.
  const MobileTheme({
    required this.activePreset,
    required this.allowUserOverride,
    required this.presets,
  });

  /// Policy used when the backend has nothing configured or is unreachable.
  static const MobileTheme defaults = MobileTheme(
    activePreset: null,
    allowUserOverride: true,
    presets: [],
  );

  /// Preset the admin selected; `null` means "the app default".
  final String? activePreset;

  /// Whether users may choose a different preset in Appearance.
  final bool allowUserOverride;

  /// Remote presets (new ids, or overrides of built-in ids).
  final List<HPreset> presets;

  /// Built-in presets with remote ones layered on top (same id wins remotely).
  List<HPreset> get availablePresets {
    final byId = {for (final p in HPresets.builtIn) p.id: p};
    for (final p in presets) {
      byId[p.id] = p;
    }
    return List.unmodifiable(byId.values);
  }

  /// Looks up a preset among [availablePresets].
  HPreset? presetById(String id) {
    for (final p in availablePresets) {
      if (p.id == id) return p;
    }
    return null;
  }
}
