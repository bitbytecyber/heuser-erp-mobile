import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  for (final scale in const [1.0, 1.3, 2.0]) {
    goldenPresetMatrix('h_segmented', _build, textScale: scale);
  }
}

Widget _build(BuildContext context) => Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    HSegmented<String>(
      segments: const [
        HSegment(value: 'AS', label: 'AS Level'),
        HSegment(value: 'A2', label: 'A2 Level'),
      ],
      value: 'AS',
      onChanged: (_) {},
    ),
    HSpace.gap3,
    HSegmented<String>(
      segments: const [
        HSegment(value: 'online', label: 'Online', icon: HIcons.payment),
        HSegment(value: 'bank', label: 'Bank', icon: HIcons.file),
        HSegment(value: 'cash', label: 'Cash'),
      ],
      value: 'bank',
      onChanged: (_) {},
    ),
    HSpace.gap3,
    const HSegmented<int>(
      segments: [
        HSegment(value: 1, label: 'One'),
        HSegment(value: 2, label: 'Two'),
      ],
      value: 2,
      onChanged: null,
    ),
    HSpace.gap3,
    // Nothing chosen yet: no indicator.
    HSegmented<String>(
      segments: const [
        HSegment(value: 'male', label: 'Male'),
        HSegment(value: 'female', label: 'Female'),
      ],
      value: null,
      onChanged: (_) {},
    ),
  ],
);
