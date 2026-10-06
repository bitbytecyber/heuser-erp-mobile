import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  goldenPresetMatrix(
    'h_key_value',
    (context) => HCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HKeyValueGroup(
            title: 'About you',
            trailing: HButton.ghost(
              label: 'Edit',
              onPressed: () {},
              size: HButtonSize.sm,
            ),
            children: const [
              HKeyValue(label: 'Full name', value: 'Ayesha Khan'),
              HKeyValue(label: 'Date of birth', value: '14 Mar 2010'),
              HKeyValue(label: 'Religion', value: ''),
            ],
          ),
          HSpace.gap6,
          const HKeyValueGroup(
            title: 'Fees',
            children: [
              HKeyValue(
                label: 'Admission fee',
                value: 'PKR 25,000',
                inline: true,
                valueStyle: HTextStyle.mono,
              ),
              HKeyValue(
                label: 'Security deposit',
                value: 'PKR 50,000',
                inline: true,
                valueStyle: HTextStyle.mono,
              ),
              HKeyValue(
                label: 'Due now',
                value: 'PKR 75,000',
                inline: true,
                valueStyle: HTextStyle.titleMd,
                valueTone: HTextTone.brand,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
