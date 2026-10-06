import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  goldenPresetMatrix(
    'h_skeleton',
    (context) => const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HSkeleton(
          enabled: true,
          child: HCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HText('Application HEU-00042', style: HTextStyle.titleMd),
                HSpace.gap1,
                HText('Under review · updated 2 days ago'),
                HSpace.gap3,
                HStatusPill('Under review', tone: HTone.brand),
              ],
            ),
          ),
        ),
        HSpace.gap3,
        Row(
          children: [
            HSkeletonBox(width: 48, height: 48, radius: HRadius.pill),
            HSpace.hgap3,
            Expanded(
              child: Column(
                children: [
                  HSkeletonBox(),
                  HSpace.gap2,
                  HSkeletonBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
