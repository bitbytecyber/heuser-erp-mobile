import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  goldenPresetMatrix(
    'h_checkbox',
    (context) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HCheckbox(value: false, onChanged: (_) {}, label: 'Unchecked'),
        HSpace.gap3,
        HCheckbox(
          value: true,
          onChanged: (_) {},
          label: 'I confirm the information is true',
          description: 'The declaration is required before you can send.',
        ),
        HSpace.gap3,
        HCheckbox(
          value: false,
          onChanged: (_) {},
          label: 'With error',
          error: 'You must accept the declaration',
        ),
        HSpace.gap3,
        const HCheckbox(
          value: true,
          onChanged: null,
          label: 'Disabled checked',
        ),
      ],
    ),
  );
}
