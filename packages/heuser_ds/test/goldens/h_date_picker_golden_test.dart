import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  goldenPresetMatrix(
    'h_date_picker',
    (context) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HDatePicker(
          value: null,
          onChanged: (_) {},
          label: 'Date of birth',
          required: true,
        ),
        HSpace.gap3,
        HDatePicker(
          value: DateTime(2010, 3, 14),
          onChanged: (_) {},
          label: 'Date of birth',
        ),
        HSpace.gap3,
        HDatePicker(
          value: null,
          onChanged: (_) {},
          label: 'With error',
          error: 'You must be at least 12',
        ),
        HSpace.gap3,
        HDatePicker(
          value: DateTime(2024, 6),
          onChanged: null,
          label: 'Disabled',
        ),
      ],
    ),
  );
}
