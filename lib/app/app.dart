import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:heuser_erp_mobile/core/env/app_env.dart';

/// Root widget. M0 placeholder: proves flavors, env and the splash hand-off.
/// Replaced in M1 by the themed shell (HTheme + router).
class HeuserApp extends StatefulWidget {
  const HeuserApp({required this.env, super.key});

  final AppEnv env;

  @override
  State<HeuserApp> createState() => _HeuserAppState();
}

class _HeuserAppState extends State<HeuserApp> {
  static const _navy = Color(0xFF000F1D);
  static const _ink = Color(0xFFECEEF4);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => FlutterNativeSplash.remove(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final env = widget.env;
    return WidgetsApp(
      color: _navy,
      title: env.appName,
      builder: (context, _) => ColoredBox(
        color: _navy,
        child: Center(
          child: Text(
            '${env.appName}\n${env.flavor.name} → ${env.apiBaseUrl}',
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
            style: const TextStyle(color: _ink, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
