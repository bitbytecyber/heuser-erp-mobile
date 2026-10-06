import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  goldenPresetMatrix(
    'h_tabs',
    (context) => Column(
      children: [
        HTabs(
          tabs: const [
            HTab('To do', badgeCount: 2),
            HTab('Documents'),
            HTab('Application'),
            HTab('History'),
          ],
          index: 0,
          onChanged: (_) {},
        ),
        HSpace.gap4,
        HTabs(
          tabs: const [HTab('Catalogue'), HTab('My loans', badgeCount: 1)],
          index: 1,
          onChanged: (_) {},
        ),
      ],
    ),
  );
}
