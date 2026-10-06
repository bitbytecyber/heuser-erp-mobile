import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  goldenPresetMatrix(
    'h_otp_field',
    (context) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HOtpField(length: 6, onCompleted: (_) {}, autofocus: false),
        HSpace.gap4,
        HOtpField(
          length: 8,
          groupSize: 4,
          alphanumeric: true,
          onCompleted: (_) {},
          autofocus: false,
        ),
        HSpace.gap4,
        HOtpField(
          length: 6,
          onCompleted: (_) {},
          autofocus: false,
          error: 'That code is not right',
        ),
        HSpace.gap4,
        HOtpField(
          length: 6,
          onCompleted: (_) {},
          autofocus: false,
          enabled: false,
        ),
      ],
    ),
  );
}
