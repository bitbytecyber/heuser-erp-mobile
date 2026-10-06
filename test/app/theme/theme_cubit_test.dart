import 'dart:ui';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/app/theme/theme_cubit.dart';
import 'package:heuser_erp_mobile/app/theme/theme_preference.dart';
import 'package:heuser_erp_mobile/app/theme/theme_preference_store.dart';

void main() {
  group('ThemeCubit', () {
    blocTest<ThemeCubit, ThemeState>(
      'start loads the cached policy and preference',
      build: () => ThemeCubit(
        InMemoryThemeStore(
          pref: const ThemePreference(
            presetId: 'mint_calm',
            mode: HThemeMode.dark,
          ),
          remote: {'active_preset': 'navy_night', 'allow_user_override': true},
        ),
      ),
      act: (c) => c.start(),
      verify: (c) {
        expect(c.state.source, ThemeSource.cache);
        expect(c.state.resolved.preset.id, 'mint_calm');
        expect(c.state.data.isDark, isTrue);
      },
    );

    blocTest<ThemeCubit, ThemeState>(
      'remoteUpdated re-resolves and caches',
      build: () => ThemeCubit(InMemoryThemeStore()),
      act: (c) => c.remoteUpdated({
        'active_preset': 'apricot_dawn',
        'allow_user_override': false,
      }),
      verify: (c) {
        expect(c.state.source, ThemeSource.network);
        expect(c.state.resolved.preset.id, 'apricot_dawn');
        expect(c.state.resolved.userCanOverride, isFalse);
      },
    );

    test('choosePreset and chooseMode persist', () async {
      final store = InMemoryThemeStore();
      final cubit = ThemeCubit(store);
      await cubit.choosePreset('mint_calm');
      await cubit.chooseMode(HThemeMode.dark);
      expect((await store.readPreference()).presetId, 'mint_calm');
      expect((await store.readPreference()).mode, HThemeMode.dark);
      expect(cubit.state.data.isDark, isTrue);
      await cubit.choosePreset(null);
      expect((await store.readPreference()).presetId, isNull);
      expect(cubit.state.resolved.preset.id, 'heuser_classic');
      await cubit.close();
    });

    test('platformChanged flips brightness under system mode', () {
      final cubit = ThemeCubit(InMemoryThemeStore())
        ..platformChanged(platform: Brightness.dark);
      expect(cubit.state.data.isDark, isTrue);
      cubit.platformChanged(reduceMotion: true);
      expect(cubit.state.data.motion.enabled, isFalse);
    });
  });
}
