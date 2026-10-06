import 'package:heuser_erp_mobile/bootstrap.dart';
import 'package:heuser_erp_mobile/core/env/flavor.dart';

/// Entry point for the **prod** flavor.
///
/// flutter run --flavor prod -t lib/main_prod.dart --dart-define-from-file=env/prod.json
Future<void> main() => bootstrap(flavor: Flavor.prod);
