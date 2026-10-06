import 'dart:async';

import 'package:alchemist/alchemist.dart';

/// Golden configuration for the design system.
///
/// Only CI goldens are generated and compared: they obscure fonts (Ahem
/// blocks) so Windows, macOS and the Codemagic runner produce identical
/// pixels, and they are what `make goldens` / `make update-goldens` touch.
/// Platform goldens (real fonts, only for looking at) are off so a Windows
/// run never writes a file that CI would then reject.
Future<void> testExecutable(FutureOr<void> Function() testMain) {
  return AlchemistConfig.runWithConfig(
    config: const AlchemistConfig(
      platformGoldensConfig: PlatformGoldensConfig(enabled: false),
      ciGoldensConfig: CiGoldensConfig(renderShadows: true),
    ),
    run: () => Future.sync(testMain),
  );
}
