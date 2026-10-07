import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';

/// Pumps [page] the way the app hosts it: translations, the Material engine
/// themed from Heuser Classic, and the H theme scope. [textScale] 2.0 is the
/// large-text accessibility check.
Future<void> pumpPage(
  WidgetTester tester,
  Widget page, {
  double textScale = 1,
  bool dark = false,
}) async {
  final data = HThemeData.fromPreset(
    kHeuserClassic,
    dark: dark,
    reduceMotion: true,
  );
  await tester.pumpWidget(
    TranslationProvider(
      child: MaterialApp(
        theme: materialThemeFrom(data),
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(textScale)),
          child: HThemeScope(animate: false, data: data, child: child!),
        ),
        home: page,
      ),
    ),
  );
  await tester.pumpAndSettle();
}
