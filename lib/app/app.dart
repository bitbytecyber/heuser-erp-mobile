import 'dart:async';

import 'package:flutter/material.dart' show MaterialApp;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/app/theme/theme_cubit.dart';
import 'package:heuser_erp_mobile/app/theme/theme_preference_store.dart';
import 'package:heuser_erp_mobile/core/env/app_env.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/me/presentation/pages/appearance_page.dart';

/// Root widget: theme cubit → Material engine app → `HThemeScope`.
///
/// `MaterialApp` is used only as the engine (navigator, overlays, text
/// editing, localisation delegates); every visible style comes from the H
/// theme through the bridge. The router replaces `home` in M2.
class HeuserApp extends StatefulWidget {
  /// Creates the app.
  const HeuserApp({required this.env, required this.themeStore, super.key});

  /// Compile-time environment.
  final AppEnv env;

  /// Theme persistence.
  final ThemePreferenceStore themeStore;

  @override
  State<HeuserApp> createState() => _HeuserAppState();
}

class _HeuserAppState extends State<HeuserApp> with WidgetsBindingObserver {
  late final ThemeCubit _theme;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    final dispatcher = WidgetsBinding.instance.platformDispatcher;
    _theme = ThemeCubit(
      widget.themeStore,
      platform: dispatcher.platformBrightness,
      reduceMotion: dispatcher.accessibilityFeatures.disableAnimations,
    );
    unawaited(
      _theme.start().whenComplete(() {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => FlutterNativeSplash.remove(),
        );
      }),
    );
  }

  @override
  void didChangePlatformBrightness() {
    _theme.platformChanged(
      platform: WidgetsBinding.instance.platformDispatcher.platformBrightness,
    );
  }

  @override
  void didChangeAccessibilityFeatures() {
    _theme.platformChanged(
      reduceMotion: WidgetsBinding
          .instance
          .platformDispatcher
          .accessibilityFeatures
          .disableAnimations,
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    unawaited(_theme.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _theme,
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) => MaterialApp(
          title: widget.env.appName,
          debugShowCheckedModeBanner: false,
          theme: materialThemeFrom(state.data),
          locale: TranslationProvider.of(context).flutterLocale,
          supportedLocales: AppLocaleUtils.supportedLocales,
          localizationsDelegates: const [],
          builder: (context, child) => HThemeScope(
            data: state.data,
            child: child ?? const SizedBox.shrink(),
          ),
          home: const AppearancePage(),
        ),
      ),
    );
  }
}
