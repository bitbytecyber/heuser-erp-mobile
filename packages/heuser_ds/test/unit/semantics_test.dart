import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_ds/heuser_ds.dart';

// Every interactive component is announced once: its label is not repeated
// by the text inside it, and its role/state flags survive.
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

  final cases = <String, (Widget, String)>{
    'button': (
      HButton.filled(label: 'Book', expand: false, onPressed: () {}),
      'Book',
    ),
    'icon button': (
      HIconButton(
        icon: HIcons.close,
        semanticsLabel: 'Close',
        onPressed: () {},
      ),
      'Close',
    ),
    'chip': (HChip('Sports', onTap: () {}), 'Sports'),
    'switch': (
      HSwitch(
        label: 'App lock',
        description: 'Ask for fingerprint',
        value: true,
        onChanged: (_) {},
      ),
      'App lock\nAsk for fingerprint',
    ),
    'checkbox': (
      HCheckbox(label: 'I agree', value: true, onChanged: (_) {}),
      'I agree',
    ),
    'stepper': (
      const HStepper(
        steps: ['Family', 'Studies', 'Review'],
        current: 1,
        completed: 1,
      ),
      'Step 2 of 3 · Studies',
    ),
  };

  for (final MapEntry(key: name, value: (widget, label)) in cases.entries) {
    testWidgets('$name is announced once', (tester) async {
      final handle = tester.ensureSemantics();
      await pump(tester, widget);
      expect(find.bySemanticsLabel(label), findsOneWidget);
      handle.dispose();
    });
  }

  testWidgets('button keeps its role and focusability', (tester) async {
    final handle = tester.ensureSemantics();
    await pump(
      tester,
      HButton.filled(label: 'Book', expand: false, onPressed: () {}),
    );
    expect(
      tester.getSemantics(find.bySemanticsLabel('Book')),
      isSemantics(isButton: true, isFocusable: true, hasTapAction: true),
    );
    handle.dispose();
  });
}
