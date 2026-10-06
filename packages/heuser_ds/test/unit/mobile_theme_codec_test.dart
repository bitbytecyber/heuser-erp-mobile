import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_ds/heuser_ds.dart';

void main() {
  group('HHex', () {
    test('decodes #RRGGBB and #RRGGBBAA, rejects garbage', () {
      expect(HHex.tryDecode('#881A21'), const Color(0xFF881A21));
      expect(HHex.tryDecode('881a21'), const Color(0xFF881A21));
      expect(HHex.tryDecode('#000F1D80'), const Color(0x80000F1D));
      expect(HHex.tryDecode('#12'), isNull);
      expect(HHex.tryDecode('red'), isNull);
    });

    test('round-trips through encode', () {
      for (final c in kHeuserClassicLight.toMap().values) {
        expect(HHex.tryDecode(HHex.encode(c)), c);
      }
    });
  });

  group('MobileThemeCodec', () {
    test('null / non-object → defaults', () {
      expect(MobileThemeCodec.decode(null).allowUserOverride, isTrue);
      expect(MobileThemeCodec.decode('x').presets, isEmpty);
      expect(MobileThemeCodec.decode(null).activePreset, isNull);
    });

    test('active_preset must name a known preset', () {
      final t = MobileThemeCodec.decode({'active_preset': 'navy_night'});
      expect(t.activePreset, 'navy_night');
      final bad = MobileThemeCodec.decode({'active_preset': 'nope'});
      expect(bad.activePreset, isNull);
    });

    test('remote preset overrides a built-in and fills gaps from it', () {
      final t = MobileThemeCodec.decode({
        'active_preset': 'mint_calm',
        'allow_user_override': false,
        'presets': [
          {
            'id': 'mint_calm',
            'label': 'Mint (school)',
            'light': {
              'brand': '#123456',
              'bogus': '#000000',
              'surface': 'nope',
            },
          },
        ],
      });
      expect(t.allowUserOverride, isFalse);
      expect(t.activePreset, 'mint_calm');
      final p = t.presetById('mint_calm')!;
      expect(p.label, 'Mint (school)');
      expect(p.light.brand, const Color(0xFF123456));
      // invalid hex → fallback from built-in mint
      expect(p.light.surface, kMintCalm.light.surface);
      // dark side missing entirely → built-in dark
      expect(p.dark.brand, kMintCalm.dark.brand);
      expect(p.dark.brightness, Brightness.dark);
    });

    test('a brand-new remote preset falls back to Heuser Classic for gaps', () {
      final t = MobileThemeCodec.decode({
        'presets': [
          {
            'id': 'school_blue',
            'light': {'brand': '#2A5C9A'},
            'dark': {'brand': '#9EC2F0'},
          },
        ],
      });
      final p = t.presetById('school_blue')!;
      expect(p.light.brand, const Color(0xFF2A5C9A));
      expect(p.light.surface, kHeuserClassicLight.surface);
      expect(p.dark.surface, kHeuserClassicDark.surface);
      expect(t.availablePresets.map((p) => p.id), contains('school_blue'));
    });

    test('presets with bad ids are dropped', () {
      final t = MobileThemeCodec.decode({
        'presets': [
          {'id': 'Bad Id', 'light': <String, Object?>{}},
          {'light': <String, Object?>{}},
          'nonsense',
        ],
      });
      expect(t.presets, isEmpty);
    });

    test('encodePreset produces something decode accepts unchanged', () {
      final json = MobileThemeCodec.encodePreset(kApricotDawn);
      final t = MobileThemeCodec.decode({
        'presets': [json],
      });
      final p = t.presetById('apricot_dawn')!;
      expect(p.light.toHexMap(), kApricotDawn.light.toHexMap());
      expect(p.dark.toHexMap(), kApricotDawn.dark.toHexMap());
    });
  });
}
