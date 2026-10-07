import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_ds/heuser_ds.dart';

void main() {
  testWidgets('the sheet sits above the keyboard', (tester) async {
    const keyboard = 300.0;
    tester.view.viewInsets = const FakeViewPadding(bottom: keyboard);
    addTearDown(tester.view.resetViewInsets);
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
            body: Builder(
              builder: (context) => GestureDetector(
                onTap: () => HBottomSheet.show<void>(
                  context,
                  builder: (_) => const HBottomSheet(
                    title: 'Search',
                    child: HTextField(label: 'Search', key: Key('search')),
                  ),
                ),
                child: const Text('open'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    final screen = tester.view.physicalSize / tester.view.devicePixelRatio;
    final keyboardTop = screen.height - keyboard / tester.view.devicePixelRatio;
    expect(
      tester.getRect(find.byKey(const Key('search'))).bottom,
      lessThanOrEqualTo(keyboardTop),
    );
  });
}
