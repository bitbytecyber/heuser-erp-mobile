import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:heuser_erp_mobile/app/app.dart';
import 'package:heuser_erp_mobile/app/theme/theme_preference_store.dart';
import 'package:heuser_erp_mobile/core/env/app_env.dart';
import 'package:heuser_erp_mobile/core/env/flavor.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Shared startup for every `main_<flavor>.dart`.
///
/// Order matters and is documented in ARCHITECTURE.md "Bootstrap":
/// 1. bind + hold the native splash (the first frame stays hidden);
/// 2. resolve the compile-time environment (fails fast on a bad define);
/// 3. run the app inside a guarded zone so uncaught errors reach the crash
///    reporter once it exists.
Future<void> bootstrap({required Flavor flavor}) async {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);

  if (kReleaseMode) {
    // Keep release logs quiet; the logger decides what is worth keeping.
    debugPrint = (message, {wrapWidth}) {};
  }

  final env = AppEnv.fromDefines(expected: flavor);

  await runZonedGuarded<Future<void>>(
    () async {
      final themeStore = SharedPrefsThemeStore(SharedPreferencesAsync());
      runApp(
        TranslationProvider(
          child: HeuserApp(env: env, themeStore: themeStore),
        ),
      );
    },
    (error, stack) {
      // Replaced by the crash reporter in M2; never swallow silently.
      debugPrint('Uncaught zone error: $error\n$stack');
    },
  );
}
