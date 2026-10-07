import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_ds/heuser_ds.dart';

void main() {
  testWidgets('the toast action is a 48 dp button', (tester) async {
    final handle = tester.ensureSemantics();
    final data = HThemeData.fromPreset(
      kHeuserClassic,
      dark: false,
      reduceMotion: true,
    );
    var undone = 0;
    await tester.pumpWidget(
      MaterialApp(
        theme: materialThemeFrom(data),
        home: HThemeScope(
          animate: false,
          data: data,
          child: HScaffold(
            body: Builder(
              builder: (context) => GestureDetector(
                onTap: () => HToast.show(
                  context,
                  'Deleted',
                  actionLabel: 'Undo',
                  onAction: () => undone++,
                ),
                child: const Text('go'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('go'));
    await tester.pumpAndSettle();

    final action = find.bySemanticsLabel('Undo');
    expect(action, findsOneWidget);
    expect(tester.getSemantics(action), isSemantics(isButton: true));
    final size = tester.getSize(find.byType(HPressable).last);
    expect(size.width, greaterThanOrEqualTo(48));
    expect(size.height, greaterThanOrEqualTo(48));

    await tester.tap(action);
    await tester.pumpAndSettle();
    expect(undone, 1);
    expect(find.text('Deleted'), findsNothing);
    handle.dispose();
  });
}
