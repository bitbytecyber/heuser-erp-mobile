import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  goldenPresetMatrix(
    'h_field_frame',
    (context) => const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HFieldFrame(
          label: 'Idle',
          helper: 'Helper text',
          child: HText('Value'),
        ),
        HSpace.gap3,
        HFieldFrame(label: 'Focused', focused: true, child: HText('Value')),
        HSpace.gap3,
        HFieldFrame(
          label: 'Error',
          error: 'This field is required',
          required: true,
          child: HText('Value'),
        ),
        HSpace.gap3,
        HFieldFrame(
          label: 'Disabled',
          enabled: false,
          child: HText('Value', tone: HTextTone.tertiary),
        ),
        HSpace.gap3,
        HFieldFrame(
          label: 'With adornments',
          leading: HIcon(HIcons.school, tone: HTextTone.tertiary),
          trailing: HIcon(HIcons.chevronDown, tone: HTextTone.tertiary),
          child: HText('Choose a school', tone: HTextTone.tertiary),
        ),
      ],
    ),
  );
}
