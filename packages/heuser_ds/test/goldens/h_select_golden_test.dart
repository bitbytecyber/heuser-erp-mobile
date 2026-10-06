import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  const options = [
    HSelectOption(value: 'father', label: 'Father'),
    HSelectOption(value: 'mother', label: 'Mother'),
    HSelectOption(
      value: 'guardian',
      label: 'Guardian',
      subtitle: 'Legal guardian',
    ),
  ];
  goldenPresetMatrix(
    'h_select',
    (context) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HSelect<String>(
          options: options,
          value: null,
          onChanged: (_) {},
          label: 'Relation',
          required: true,
        ),
        HSpace.gap3,
        HSelect<String>(
          options: options,
          value: 'mother',
          onChanged: (_) {},
          label: 'Relation',
          leadingIcon: HIcons.family,
        ),
        HSpace.gap3,
        HSelect<String>(
          options: options,
          value: null,
          onChanged: (_) {},
          label: 'With error',
          error: 'Choose a relation',
        ),
        HSpace.gap3,
        const HSelect<String>(
          options: options,
          value: 'father',
          onChanged: null,
          label: 'Disabled',
        ),
        HSpace.gap4,
        const HText(
          'Options sheet',
          style: HTextStyle.labelMd,
          tone: HTextTone.secondary,
        ),
        HSpace.gap2,
        HBottomSheet(
          title: 'Relation',
          child: Column(
            children: [
              for (final o in options)
                HListTile(
                  title: o.label,
                  subtitle: o.subtitle,
                  showChevron: false,
                  trailing: o.value == 'mother'
                      ? const HIcon(HIcons.check, tone: HTextTone.brandStrong)
                      : null,
                  onTap: () {},
                ),
            ],
          ),
        ),
      ],
    ),
  );
}
