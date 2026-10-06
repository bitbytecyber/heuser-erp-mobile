import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  Widget fields(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const HTextField(
        label: 'Email',
        hint: 'you@example.com',
        leadingIcon: HIcons.mail,
        required: true,
      ),
      HSpace.gap3,
      const HTextField(
        label: 'Password',
        obscureText: true,
        initialValue: 'secret123',
      ),
      HSpace.gap3,
      HTextField(
        label: 'CNIC / B-Form',
        initialValue: '42101-1234567-1',
        inputFormatters: [HMasks.cnic()],
        helper: '13 digits',
      ),
      HSpace.gap3,
      const HTextField(
        label: 'Mobile',
        initialValue: '0300',
        error: 'Enter a valid mobile number',
      ),
      HSpace.gap3,
      const HTextField(
        label: 'Disabled',
        initialValue: 'Read only',
        enabled: false,
      ),
      HSpace.gap3,
      const HTextField(
        label: 'Personal statement',
        hint: 'Tell us about yourself…',
        maxLines: 4,
        maxLength: 300,
      ),
    ],
  );

  goldenPresetMatrix('h_text_field', fields);
  goldenPresetMatrix('h_text_field', fields, textScale: 1.3);
  goldenPresetMatrix('h_text_field', fields, textScale: 2);
}
