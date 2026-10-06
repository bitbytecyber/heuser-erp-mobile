import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/app/theme/theme_preference.dart';
import 'package:heuser_erp_mobile/app/theme/theme_resolver.dart';

void main() {
  group('resolveTheme', () {
    test('defaults → Heuser Classic, follows platform brightness', () {
      final r = resolveTheme(
        remote: MobileTheme.defaults,
        pref: ThemePreference.none,
        platform: Brightness.dark,
      );
      expect(r.preset.id, 'heuser_classic');
      expect(r.data.isDark, isTrue);
      expect(r.userCanOverride, isTrue);
      expect(r.available.length, HPresets.builtIn.length);
    });

    test('admin active preset applies when the user chose nothing', () {
      final remote = MobileThemeCodec.decode({'active_preset': 'navy_night'});
      final r = resolveTheme(
        remote: remote,
        pref: ThemePreference.none,
        platform: Brightness.light,
      );
      expect(r.preset.id, 'navy_night');
    });

    test('user override wins when allowed', () {
      final remote = MobileThemeCodec.decode({
        'active_preset': 'navy_night',
        'allow_user_override': true,
      });
      final r = resolveTheme(
        remote: remote,
        pref: const ThemePreference(
          presetId: 'mint_calm',
          mode: HThemeMode.light,
        ),
        platform: Brightness.dark,
      );
      expect(r.preset.id, 'mint_calm');
      expect(r.data.isDark, isFalse);
    });

    test('user override ignored when the admin enforces', () {
      final remote = MobileThemeCodec.decode({
        'active_preset': 'navy_night',
        'allow_user_override': false,
      });
      final r = resolveTheme(
        remote: remote,
        pref: const ThemePreference(presetId: 'mint_calm'),
        platform: Brightness.light,
      );
      expect(r.preset.id, 'navy_night');
      expect(r.userCanOverride, isFalse);
    });

    test('a stale user preset id falls back to the admin choice', () {
      final remote = MobileThemeCodec.decode({'active_preset': 'apricot_dawn'});
      final r = resolveTheme(
        remote: remote,
        pref: const ThemePreference(presetId: 'removed'),
        platform: Brightness.light,
      );
      expect(r.preset.id, 'apricot_dawn');
    });

    test('reduce motion propagates', () {
      final r = resolveTheme(
        remote: MobileTheme.defaults,
        pref: ThemePreference.none,
        platform: Brightness.light,
        reduceMotion: true,
      );
      expect(r.data.motion.enabled, isFalse);
    });
  });

  group('ThemePreference', () {
    test('json round trip and lenient parse', () {
      const p = ThemePreference(presetId: 'mint_calm', mode: HThemeMode.dark);
      expect(ThemePreference.fromJson(p.toJson()), p);
      expect(ThemePreference.fromJson('garbage'), ThemePreference.none);
      expect(
        ThemePreference.fromJson(const {'mode': 'nope'}).mode,
        HThemeMode.system,
      );
    });
  });
}
