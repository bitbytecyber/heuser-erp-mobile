import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  goldenPresetMatrix(
    'h_bottom_sheet',
    (context) => HBottomSheet(
      title: 'Withdraw application?',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const HText(
            'This cannot be undone. The admissions office will be told.',
            tone: HTextTone.secondary,
          ),
          HSpace.gap4,
          HButton.danger(label: 'Withdraw', onPressed: () {}),
          HSpace.gap2,
          HButton.ghost(
            label: 'Keep my application',
            onPressed: () {},
            expand: true,
          ),
        ],
      ),
    ),
  );
}
