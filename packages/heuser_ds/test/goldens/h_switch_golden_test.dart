import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  goldenPresetMatrix(
    'h_switch',
    (context) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HSwitch(value: false, onChanged: (_) {}, label: 'Off'),
        HSpace.gap3,
        HSwitch(
          value: true,
          onChanged: (_) {},
          label: 'I am a private candidate',
          description: 'Not enrolled at a school for O-Levels.',
        ),
        HSpace.gap3,
        const HSwitch(value: true, onChanged: null, label: 'Disabled on'),
        HSpace.gap3,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [HSwitch(value: false, onChanged: (_) {})],
        ),
      ],
    ),
  );
}
