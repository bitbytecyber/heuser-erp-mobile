import 'dart:async';

import 'package:flutter/material.dart' show MaterialApp;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/app/di/injection.dart';
import 'package:heuser_erp_mobile/app/router/app_router.dart';
import 'package:heuser_erp_mobile/app/security/app_lock_cubit.dart';
import 'package:heuser_erp_mobile/app/security/app_lock_gate.dart';
import 'package:heuser_erp_mobile/app/theme/theme_cubit.dart';
import 'package:heuser_erp_mobile/app/theme/theme_preference_store.dart';
import 'package:heuser_erp_mobile/core/connectivity/connectivity_banner.dart';
import 'package:heuser_erp_mobile/core/connectivity/connectivity_service.dart';
import 'package:heuser_erp_mobile/core/env/app_env.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/core/security/app_lock_service.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_repository.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:heuser_erp_mobile/features/branding/data/branding_repository.dart';
import 'package:heuser_erp_mobile/features/branding/domain/site_branding.dart';

/// Root widget: session (AuthBloc) + theme (ThemeCubit fed by branding) +
/// router. `MaterialApp.router` is only the engine; every visible style comes
/// from the H theme through the bridge.
class HeuserApp extends StatefulWidget {
  /// Creates the app. Dependencies come from the locator (see `bootstrap`).
  const HeuserApp({required this.env, super.key});

  /// Compile-time environment.
  final AppEnv env;

  @override
  State<HeuserApp> createState() => _HeuserAppState();
}

class _HeuserAppState extends State<HeuserApp> with WidgetsBindingObserver {
  static const _brandingBudget = Duration(milliseconds: 1500);

  late final AuthBloc _auth;
  late final ThemeCubit _theme;
  late final AppLockCubit _lock = AppLockCubit(getIt<AppLockService>());
  late final GoRouter _router;
  late final BrandingRepository _branding = getIt<BrandingRepository>();
  late final ConnectivityService _connectivity = getIt<ConnectivityService>();
  StreamSubscription<SiteBranding>? _brandingSub;
  bool _splashRemoved = false;

  /// The in-app reveal plays once per process: a warm start (the engine
  /// outlived its activity) goes straight to the app.
  static bool _revealPlayed = false;
  final bool _playReveal = !_revealPlayed;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    final dispatcher = WidgetsBinding.instance.platformDispatcher;
    _theme = ThemeCubit(
      getIt<ThemePreferenceStore>(),
      platform: dispatcher.platformBrightness,
      reduceMotion: dispatcher.accessibilityFeatures.disableAnimations,
    );
    _auth = AuthBloc(getIt<AuthRepository>())..add(const AuthEvent.started());
    _router = buildAppRouter(_auth);
    _brandingSub = _branding.stream.listen(
      (b) => unawaited(_theme.remoteUpdated(b.mobileTheme)),
    );
    unawaited(_startTheme());
  }

  Future<void> _startTheme() async {
    await _theme.start();
    final cached = await _branding.loadCached();
    if (cached.mobileTheme != null) {
      await _theme.remoteUpdated(cached.mobileTheme);
    }
    unawaited(_branding.refresh(budget: _brandingBudget));
  }

  void _removeSplashOnce() {
    if (_splashRemoved) return;
    setState(() => _splashRemoved = true);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => FlutterNativeSplash.remove(),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) return;
    _auth.add(const AuthEvent.appResumed());
    unawaited(_connectivity.refresh());
    unawaited(_branding.refresh());
  }

  @override
  void didChangePlatformBrightness() => _theme.platformChanged(
    platform: WidgetsBinding.instance.platformDispatcher.platformBrightness,
  );

  @override
  void didChangeAccessibilityFeatures() => _theme.platformChanged(
    reduceMotion: WidgetsBinding
        .instance
        .platformDispatcher
        .accessibilityFeatures
        .disableAnimations,
  );

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    unawaited(_brandingSub?.cancel());
    _router.dispose();
    unawaited(_auth.close());
    unawaited(_theme.close());
    unawaited(_lock.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _auth),
        BlocProvider.value(value: _theme),
        BlocProvider.value(value: _lock),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listenWhen: (_, s) => s is! AuthUnknown,
        listener: (_, s) {
          _removeSplashOnce();
          if (s is AuthUnauthenticated) unawaited(_lock.signedOut());
        },
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) => MaterialApp.router(
            title: widget.env.appName,
            debugShowCheckedModeBanner: false,
            theme: materialThemeFrom(state.data),
            routerConfig: _router,
            locale: TranslationProvider.of(context).flutterLocale,
            supportedLocales: AppLocaleUtils.supportedLocales,
            builder: (context, child) => ConnectivityScope(
              service: _connectivity,
              child: HThemeScope(
                data: state.data,
                child: HSplashReveal(
                  ready: _splashRemoved,
                  play: _playReveal,
                  onDone: () => _revealPlayed = true,
                  child: AppLockGate(child: child ?? const SizedBox.shrink()),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
