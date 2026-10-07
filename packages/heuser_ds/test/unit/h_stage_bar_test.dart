import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_ds/heuser_ds.dart';

void main() {
  Future<void> pump(WidgetTester tester, int index) async {
    final data = HThemeData.fromPreset(
      kHeuserClassic,
      dark: false,
      reduceMotion: true,
    );
    await tester.pumpWidget(
      MaterialApp(
        theme: materialThemeFrom(data),
        home: HThemeScope(
          animate: false,
          data: data,
          child: HScaffold(
            body: HStageBar(stages: const [], currentIndex: index),
          ),
        ),
      ),
    );
    await tester.pump();
  }

  testWidgets('an empty stage list renders and updates without throwing', (
    tester,
  ) async {
    await pump(tester, 0);
    expect(tester.takeException(), isNull);
    await pump(tester, 1);
    expect(tester.takeException(), isNull);
  });
}
