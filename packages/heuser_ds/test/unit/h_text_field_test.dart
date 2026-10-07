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

  Future<void> pumpField(WidgetTester tester, HTextField field) async {
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
          child: HScaffold(body: field),
        ),
      ),
    );
  }

  testWidgets('swapping a parent controller/focus node out never disposes it', (
    tester,
  ) async {
    final controller = TextEditingController(text: 'kept');
    final focus = FocusNode();
    addTearDown(controller.dispose);
    addTearDown(focus.dispose);
    await pumpField(
      tester,
      HTextField(label: 'Name', controller: controller, focusNode: focus),
    );
    await pumpField(tester, const HTextField(label: 'Name'));
    expect(tester.takeException(), isNull);
    // A disposed ChangeNotifier throws on addListener.
    expect(() => controller.addListener(() {}), returnsNormally);
    expect(() => focus.addListener(() {}), returnsNormally);
    // The internal controller starts from the text that was showing.
    expect(find.text('kept'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'typed');
    expect(find.text('typed'), findsOneWidget);
  });

  testWidgets('a swapped-in controller and focus node take over', (
    tester,
  ) async {
    await pumpField(tester, const HTextField(label: 'Name'));
    final controller = TextEditingController(text: 'from parent');
    final focus = FocusNode();
    addTearDown(controller.dispose);
    addTearDown(focus.dispose);
    await pumpField(
      tester,
      HTextField(label: 'Name', controller: controller, focusNode: focus),
    );
    expect(tester.takeException(), isNull);
    expect(find.text('from parent'), findsOneWidget);
    await tester.tap(find.byType(TextField));
    await tester.pump();
    expect(focus.hasFocus, isTrue);
    await tester.enterText(find.byType(TextField), 'edited');
    expect(controller.text, 'edited');
  });
}
