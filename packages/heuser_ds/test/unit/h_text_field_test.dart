import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_ds/heuser_ds.dart';

void main() {
  testWidgets('keyboard Next skips the show/hide button to the next field', (
    tester,
  ) async {
    final second = FocusNode();
    addTearDown(second.dispose);
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
            body: Column(
              children: [
                const HTextField(
                  label: 'Password',
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                ),
                HTextField(label: 'Confirm', focusNode: second),
              ],
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.byType(TextField).first);
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.next);
    await tester.pump();
    expect(second.hasFocus, isTrue);
  });
}
