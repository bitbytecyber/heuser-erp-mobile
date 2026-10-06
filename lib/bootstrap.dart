import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:heuser_erp_mobile/app/app.dart';
import 'package:heuser_erp_mobile/app/di/injection.dart';
import 'package:heuser_erp_mobile/core/connectivity/connectivity_service.dart';
import 'package:heuser_erp_mobile/core/env/app_env.dart';
import 'package:heuser_erp_mobile/core/env/flavor.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/core/network/user_agent.dart';

/// Shared startup for every `main_<flavor>.dart` (ARCHITECTURE.md "Bootstrap"):
/// 1. bind and hold the native splash (the first frame stays hidden);
/// 2. resolve the compile-time environment (fails fast on a bad define);
/// 3. register dependencies (nothing network-bound);
/// 4. run the app inside a guarded zone. The app itself then checks the
///    stored session and the cached branding before releasing the splash.
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
      await configureDependencies(env);
      unawaited(getIt<ConnectivityService>().initialize());
      unawaited(
        HeuserUserAgent.resolve().then((ua) {
          if (ua != null) getIt<Dio>().options.headers['User-Agent'] = ua;
        }),
      );
      runApp(TranslationProvider(child: HeuserApp(env: env)));
    },
    (error, stack) {
      // Replaced by the crash reporter in M6; never swallow silently.
      debugPrint('Uncaught zone error: $error\n$stack');
    },
  );
}
