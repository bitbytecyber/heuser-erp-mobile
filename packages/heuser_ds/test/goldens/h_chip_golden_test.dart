import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  for (final scale in const [1.0, 1.3, 2.0]) {
    goldenPresetMatrix('h_chip', _build, textScale: scale);
  }
}

Widget _build(BuildContext context) => Wrap(
  spacing: HSpace.x2,
  runSpacing: HSpace.x2,
  children: [
    HChip('Mathematics', onTap: () {}),
    HChip('Physics', selected: true, onTap: () {}),
    HChip('Chemistry', icon: HIcons.studies, onTap: () {}),
    HChip('Mr Khan', onDelete: () {}),
    HChip('Selected + delete', selected: true, onDelete: () {}),
    const HChip('Disabled', enabled: false),
  ],
);
