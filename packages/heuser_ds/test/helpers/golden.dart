import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

/// Registers one golden that renders [builder] in every built-in preset in
/// both brightnesses (a 2-column grid: light | dark per preset).
///
/// Every exported component has at least one of these
/// (`scripts/check-ds-goldens.sh` checks). Inputs and buttons also call it
/// with `textScale: 1.3` and `2.0`.
void goldenPresetMatrix(
  String name,
  Widget Function(BuildContext context) builder, {
  double width = 360,
  double textScale = 1.0,
  bool skip = false,
}) {
  final suffix = textScale == 1.0 ? '' : '_x${textScale.toStringAsFixed(1)}';
  unawaited(
    goldenTest(
      '$name$suffix',
      fileName: '$name$suffix',
      tags: ['golden'],
      skip: skip,
      textScaleFactor: textScale,
      builder: () => GoldenTestGroup(
        columns: 2,
        children: [
          for (final preset in HPresets.builtIn)
            for (final dark in const [false, true])
              GoldenTestScenario(
                name: '${preset.id} ${dark ? 'dark' : 'light'}',
                child: SizedBox(
                  width: width,
                  child: HThemeScope(
                    animate: false,
                    data: HThemeData.fromPreset(
                      preset,
                      dark: dark,
                      reduceMotion: true,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(HSpace.x4),
                      child: Builder(builder: builder),
                    ),
                  ),
                ),
              ),
        ],
      ),
    ),
  );
}

/// Wraps [child] in the default theme for widget tests.
Widget themed(Widget child, {bool dark = false}) => HThemeScope(
  animate: false,
  data: HThemeData.fromPreset(kHeuserClassic, dark: dark, reduceMotion: true),
  child: Directionality(textDirection: TextDirection.ltr, child: child),
);
