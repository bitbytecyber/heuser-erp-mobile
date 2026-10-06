import 'package:heuser_erp_mobile/bootstrap.dart';
import 'package:heuser_erp_mobile/core/env/flavor.dart';

/// Entry point for the **dev** flavor.
///
/// flutter run --flavor dev -t lib/main_dev.dart --dart-define-from-file=env/dev.json
Future<void> main() => bootstrap(flavor: Flavor.dev);
