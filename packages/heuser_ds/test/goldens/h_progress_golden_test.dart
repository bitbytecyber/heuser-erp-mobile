import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  goldenPresetMatrix(
    'h_progress',
    (context) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Row(
          children: [
            HSpinner(),
            HSpace.hgap3,
            HSpinner(size: 28, strokeWidth: 3),
          ],
        ),
        HSpace.gap4,
        const HProgressBar(value: 0.33, semanticsLabel: 'Step 1 of 3'),
        HSpace.gap3,
        const HProgressBar(value: 0.66, height: 10),
        HSpace.gap3,
        HProgressBar(
          value: 1,
          color: context.h.colors.success,
          trackColor: context.h.colors.successSoft,
        ),
      ],
    ),
  );
}
