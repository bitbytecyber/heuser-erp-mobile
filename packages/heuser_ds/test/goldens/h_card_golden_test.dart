import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  goldenPresetMatrix(
    'h_card',
    (context) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const HHeroCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HText('Good morning, Ayesha', style: HTextStyle.headlineMd),
              HSpace.gap1,
              HText(
                'Your application HEU-00042 is under review.',
                tone: HTextTone.secondary,
              ),
            ],
          ),
        ),
        HSpace.gap3,
        HCard(
          onTap: () {},
          child: const Row(
            children: [
              Expanded(
                child: HText(
                  'Raised, tappable card',
                  style: HTextStyle.titleMd,
                ),
              ),
              HIcon(HIcons.chevronRight, tone: HTextTone.tertiary),
            ],
          ),
        ),
        HSpace.gap3,
        const HCard(
          elevation: HCardElevation.flat,
          child: HText('Flat card with outline'),
        ),
        HSpace.gap3,
        const HCard(
          elevation: HCardElevation.floating,
          child: HText('Floating card'),
        ),
        HSpace.gap3,
        const HHeroCard(
          inverse: true,
          child: HText(
            'Inverse hero',
            style: HTextStyle.titleLg,
            tone: HTextTone.inverse,
          ),
        ),
      ],
    ),
  );
}
