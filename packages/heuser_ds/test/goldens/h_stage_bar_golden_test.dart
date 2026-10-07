import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  const stages = [
    HStage(key: 'received', label: 'Received'),
    HStage(key: 'under_review', label: 'Under review'),
    HStage(key: 'interview_scheduled', label: 'Interview booked'),
    HStage(key: 'interviewed', label: 'Interviewed'),
    HStage(key: 'offered', label: 'Offer'),
    HStage(key: 'financial_verification', label: 'Payment'),
    HStage(key: 'enrolled', label: 'Enrolled'),
  ];
  goldenPresetMatrix(
    'h_stage_bar',
    (context) => const Column(
      children: [
        HStageBar(stages: stages, currentIndex: 0),
        HSpace.gap3,
        HStageBar(stages: stages, currentIndex: 2),
        HSpace.gap3,
        HStageBar(stages: stages, currentIndex: 7),
        HSpace.gap3,
        HStageBar(stages: stages, currentIndex: -1),
      ],
    ),
    width: 420,
  );
  // Large text: the bar grows so two-line labels never clip.
  goldenPresetMatrix(
    'h_stage_bar',
    (context) => const HStageBar(stages: stages, currentIndex: 2),
    width: 420,
    textScale: 2,
  );
}
