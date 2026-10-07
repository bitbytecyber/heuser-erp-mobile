import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_ds/heuser_ds.dart';

Widget _app({required bool ready, bool play = true, bool motion = true}) =>
    Directionality(
      textDirection: TextDirection.ltr,
      child: HThemeScope(
        animate: false,
        data: HThemeData.fromPreset(
          kHeuserClassic,
          dark: false,
          reduceMotion: !motion,
        ),
        child: HSplashReveal(
          ready: ready,
          play: play,
          child: const HText('app'),
        ),
      ),
    );

bool _covered(WidgetTester t) => find
    .byWidgetPredicate(
      (w) => w is ColoredBox && w.color == HSplashReveal.launchColor,
    )
    .evaluate()
    .isNotEmpty;

void main() {
  testWidgets('covers the app until ready, then reveals it', (t) async {
    await t.pumpWidget(_app(ready: false));
    expect(_covered(t), isTrue);
    await t.pump(const Duration(seconds: 2));
    expect(_covered(t), isTrue);

    await t.pumpWidget(_app(ready: true));
    await t.pump(HSplashReveal.duration ~/ 2);
    expect(_covered(t), isTrue);
    await t.pumpAndSettle();
    expect(_covered(t), isFalse);
    expect(find.text('app'), findsOneWidget);
  });

  testWidgets('warm start shows the app straight away', (t) async {
    await t.pumpWidget(_app(ready: false, play: false));
    expect(_covered(t), isFalse);
  });

  testWidgets('reduced motion skips the animation', (t) async {
    await t.pumpWidget(_app(ready: false, motion: false));
    expect(_covered(t), isTrue);
    await t.pumpWidget(_app(ready: true, motion: false));
    await t.pump();
    expect(_covered(t), isFalse);
  });
}
