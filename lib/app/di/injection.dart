import 'package:get_it/get_it.dart';
import 'package:heuser_erp_mobile/app/di/injection.config.dart';
import 'package:heuser_erp_mobile/core/env/app_env.dart';
import 'package:injectable/injectable.dart';

/// The service locator. Widgets never call it directly; routes obtain
/// dependencies through it when creating blocs.
final GetIt getIt = GetIt.instance;

/// Registers everything. [env] is the compile-time environment resolved in
/// `bootstrap.dart`; it is registered first so modules can depend on it.
@InjectableInit()
Future<void> configureDependencies(AppEnv env) async {
  if (!getIt.isRegistered<AppEnv>()) getIt.registerSingleton<AppEnv>(env);
  getIt.init();
}
