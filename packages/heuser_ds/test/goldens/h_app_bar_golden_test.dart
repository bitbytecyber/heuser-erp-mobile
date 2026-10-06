import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  goldenPresetMatrix(
    'h_app_bar',
    (context) => Column(
      children: [
        HAppBar(
          title: 'Your applications',
          subtitle: 'Admissions · 2026–27',
          showBack: false,
          actions: [
            HIconButton(
              icon: HIcons.bell,
              semanticsLabel: 'Notifications',
              onPressed: () {},
              badge: true,
            ),
          ],
        ),
        HSpace.gap2,
        HAppBar(
          title: 'Step 1 of 3',
          showBack: true,
          onBack: () {},
          centerTitle: true,
          actions: [HButton.ghost(label: 'Finish later', onPressed: () {})],
        ),
      ],
    ),
  );
}
