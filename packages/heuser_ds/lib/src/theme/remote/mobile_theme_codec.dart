import 'dart:ui' show Brightness, Color;

import 'package:heuser_ds/src/theme/presets/h_preset.dart';
import 'package:heuser_ds/src/theme/presets/preset_registry.dart';
import 'package:heuser_ds/src/theme/remote/mobile_theme.dart';
import 'package:heuser_ds/src/tokens/h_colors.dart';
import 'package:heuser_ds/src/tokens/h_colors_codec.dart';

/// Lenient decoder for the remote `mobile_theme` payload.
///
/// The app must never crash or go blank because of a theme an admin typed
/// into a JSON editor, so every problem degrades gracefully:
/// - a preset without an `id` (or with an invalid one) is dropped;
/// - a preset missing `light` or `dark` takes the missing side from the
///   built-in preset with the same id, else from the fallback preset;
/// - a role with an invalid hex is dropped (falls back the same way);
/// - an `active_preset` that names nothing known becomes `null`.
abstract final class MobileThemeCodec {
  static final _idRe = RegExp(r'^[a-z0-9_]{2,40}$');

  /// Decodes a JSON object; `null` or a non-object yields [MobileTheme.defaults].
  static MobileTheme decode(Object? json) {
    if (json is! Map) return MobileTheme.defaults;
    final raw = json.cast<Object?, Object?>();

    final presets = <HPreset>[];
    final list = raw['presets'];
    if (list is List) {
      for (final item in list) {
        final p = _decodePreset(item);
        if (p != null) presets.add(p);
      }
    }

    final override = raw['allow_user_override'];

    final policy = MobileTheme(
      activePreset: null,
      allowUserOverride: override is! bool || override,
      presets: presets,
    );
    final active = raw['active_preset'];
    final activeId = active is String && policy.presetById(active) != null
        ? active
        : null;
    return MobileTheme(
      activePreset: activeId,
      allowUserOverride: policy.allowUserOverride,
      presets: presets,
    );
  }

  static HPreset? _decodePreset(Object? item) {
    if (item is! Map) return null;
    final m = item.cast<Object?, Object?>();
    final id = m['id'];
    if (id is! String || !_idRe.hasMatch(id)) return null;
    final base = HPresets.byId(id) ?? HPresets.fallback;
    final light = _decodeScheme(m['light'], base.light, Brightness.light);
    final dark = _decodeScheme(m['dark'], base.dark, Brightness.dark);
    final label = m['label'];
    final description = m['description'];
    return HPreset(
      id: id,
      label: label is String && label.trim().isNotEmpty
          ? label.trim()
          : base.label,
      description: description is String ? description : base.description,
      light: light,
      dark: dark,
      fonts: base.fonts,
    );
  }

  static HColorScheme _decodeScheme(
    Object? raw,
    HColorScheme fallback,
    Brightness brightness,
  ) {
    if (raw is! Map) return fallback.copyWith(brightness: brightness);
    final roles = <String, Color>{};
    for (final entry in raw.entries) {
      final key = entry.key;
      final value = entry.value;
      if (key is! String || !HColorRoles.all.contains(key)) continue;
      if (value is! String) continue;
      final c = HHex.tryDecode(value);
      if (c != null) roles[key] = c;
    }
    return HColorSchemeCodec.fromMap(
      roles,
      fallback: fallback,
      brightness: brightness,
    );
  }

  /// Encodes a preset in the remote format (used by docs and tests).
  static Map<String, Object?> encodePreset(HPreset p) => {
    'id': p.id,
    'label': p.label,
    'description': p.description,
    'light': p.light.toHexMap(),
    'dark': p.dark.toHexMap(),
  };
}
