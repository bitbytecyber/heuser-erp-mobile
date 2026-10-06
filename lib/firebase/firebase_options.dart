import 'package:firebase_core/firebase_core.dart';
import 'package:heuser_erp_mobile/core/env/flavor.dart';

/// Firebase options per flavor.
///
/// Returns `null` until the project has been configured, in which case
/// Firebase is skipped at startup (crash reporting, analytics and push are
/// simply off and the app logs a warning). To configure, run once per flavor
/// on a machine logged into the Firebase CLI:
///
/// ```sh
/// flutterfire configure --project=<firebase-project> \
///   --out=lib/firebase/firebase_options_dev.dart \
///   --android-package-name=com.heusercollege.erp.dev \
///   --ios-bundle-id=com.heusercollege.erp.dev
/// ```
///
/// then return `DefaultFirebaseOptions.currentPlatform` from the matching
/// arm below. See RELEASE.md "Firebase per flavor".
FirebaseOptions? firebaseOptionsFor(Flavor flavor) {
  switch (flavor) {
    case Flavor.dev:
    case Flavor.staging:
    case Flavor.prod:
      return null;
  }
}
