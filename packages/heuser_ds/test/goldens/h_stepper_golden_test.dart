import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  const steps = ['You & family', 'Your studies', 'Check & send'];
  goldenPresetMatrix(
    'h_stepper',
    (context) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HStepper(steps: steps, current: 0, completed: 0, onStepTap: (_) {}),
        HSpace.gap6,
        HStepper(steps: steps, current: 1, completed: 1, onStepTap: (_) {}),
        HSpace.gap6,
        HStepper(steps: steps, current: 2, completed: 2, onStepTap: (_) {}),
      ],
    ),
  );
}
