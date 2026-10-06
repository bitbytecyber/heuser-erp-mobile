import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  goldenPresetMatrix(
    'h_empty_state',
    (context) => Column(
      children: [
        HEmptyState(
          icon: HIcons.school,
          title: 'No applications yet',
          message: 'Start your application for the Class of 2029.',
          actionLabel: 'Start application',
          onAction: () {},
        ),
        const HCard(
          child: HEmptyState(
            compact: true,
            icon: HIcons.offline,
            tone: HTone.warning,
            title: 'You are offline',
            message: 'We will retry automatically.',
          ),
        ),
      ],
    ),
  );
}
