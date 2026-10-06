import 'package:heuser_erp_mobile/bootstrap.dart';
import 'package:heuser_erp_mobile/core/env/flavor.dart';

/// Entry point for the **staging** flavor.
///
/// flutter run --flavor staging -t lib/main_staging.dart --dart-define-from-file=env/staging.json
Future<void> main() => bootstrap(flavor: Flavor.staging);
