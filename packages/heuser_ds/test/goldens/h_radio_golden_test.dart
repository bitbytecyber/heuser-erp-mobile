import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  goldenPresetMatrix(
    'h_radio',
    (context) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HRadio<String>(
          value: 'as',
          groupValue: 'as',
          onChanged: (_) {},
          label: 'AS Level',
          description: 'First year of A-Levels',
        ),
        HSpace.gap3,
        HRadio<String>(
          value: 'a2',
          groupValue: 'as',
          onChanged: (_) {},
          label: 'A2 Level',
        ),
        HSpace.gap3,
        const HRadio<String>(
          value: 'x',
          groupValue: 'as',
          onChanged: null,
          label: 'Disabled',
        ),
      ],
    ),
  );
}
