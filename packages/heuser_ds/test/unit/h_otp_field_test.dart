import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_ds/heuser_ds.dart';

void main() {
  Future<void> pump(WidgetTester tester, Widget body) async {
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
          child: HScaffold(body: ListView(children: [body])),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('screen readers find one labelled text field, not the cells', (
    tester,
  ) async {
    final handle = tester.ensureSemantics();
    final controller = TextEditingController(text: '12');
    addTearDown(controller.dispose);
    await pump(
      tester,
      HOtpField(
        length: 6,
        controller: controller,
        autofocus: false,
        semanticsLabel: 'Sign-in code',
        onCompleted: (_) {},
      ),
    );
    final field = find.bySemanticsLabel('Sign-in code');
    expect(field, findsOneWidget);
    expect(
      tester.getSemantics(field),
      isSemantics(
        label: 'Sign-in code',
        value: '12',
        isTextField: true,
        isEnabled: true,
      ),
    );
    // The digits drawn in the cells are not separate nodes.
    expect(find.bySemanticsLabel('1'), findsNothing);
    expect(find.bySemanticsLabel('2'), findsNothing);
    handle.dispose();
  });

  Future<String?> paste(
    WidgetTester tester,
    String text, {
    required int length,
    bool alphanumeric = false,
  }) async {
    String? completed;
    await pump(
      tester,
      HOtpField(
        length: length,
        alphanumeric: alphanumeric,
        groupSize: alphanumeric ? 4 : null,
        autofocus: false,
        onCompleted: (v) => completed = v,
      ),
    );
    await tester.enterText(find.byType(TextField), text);
    await tester.pump();
    return completed;
  }

  testWidgets('pasting XXXX-XXXX fills all 8 cells and completes', (
    tester,
  ) async {
    final done = await paste(
      tester,
      'abcd-efgh',
      length: 8,
      alphanumeric: true,
    );
    expect(done, 'ABCDEFGH');
  });

  testWidgets('pasting a spaced 6-digit code completes', (tester) async {
    expect(await paste(tester, '123 456', length: 6), '123456');
  });

  testWidgets('extra characters are dropped after separators', (tester) async {
    expect(await paste(tester, '12-34-56-78', length: 6), '123456');
  });

  testWidgets('swapping the controller out keeps the parent controller alive', (
    tester,
  ) async {
    final parent = TextEditingController();
    addTearDown(parent.dispose);
    await pump(
      tester,
      HOtpField(
        length: 6,
        controller: parent,
        autofocus: false,
        onCompleted: (_) {},
      ),
    );
    await pump(
      tester,
      HOtpField(length: 6, autofocus: false, onCompleted: (_) {}),
    );
    // A disposed ChangeNotifier throws on addListener.
    expect(() => parent.addListener(() {}), returnsNormally);
    expect(tester.takeException(), isNull);

    // And the field still works with its own controller.
    String? done;
    await pump(
      tester,
      HOtpField(length: 6, autofocus: false, onCompleted: (v) => done = v),
    );
    await tester.enterText(find.byType(TextField), '654321');
    await tester.pump();
    expect(done, '654321');
  });

  testWidgets('a swapped-in controller drives the cells', (tester) async {
    await pump(
      tester,
      HOtpField(length: 6, autofocus: false, onCompleted: (_) {}),
    );
    final next = TextEditingController();
    addTearDown(next.dispose);
    String? changed;
    await pump(
      tester,
      HOtpField(
        length: 6,
        controller: next,
        autofocus: false,
        onChanged: (v) => changed = v,
        onCompleted: (_) {},
      ),
    );
    next.text = '12';
    await tester.pump();
    expect(changed, '12');
  });
}
