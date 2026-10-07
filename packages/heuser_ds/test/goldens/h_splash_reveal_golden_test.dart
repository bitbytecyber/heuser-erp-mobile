import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  // Before the app is ready the launch navy and lockup cover everything,
  // identically in every preset (it must match the native splash).
  goldenPresetMatrix(
    'h_splash_reveal',
    (context) => const SizedBox(
      height: 200,
      child: HSplashReveal(ready: false, child: HText('App underneath')),
    ),
  );
}
