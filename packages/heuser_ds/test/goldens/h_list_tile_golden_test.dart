import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  goldenPresetMatrix(
    'h_list_tile',
    (context) => HCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          HListTile(
            icon: HIcons.calendar,
            title: 'Interview',
            subtitle: 'Pick a time that suits you',
            onTap: () {},
          ),
          const HDivider(indent: HSpace.x4),
          HListTile(
            icon: HIcons.file,
            tone: HTone.success,
            title: 'Documents',
            subtitle: 'All approved',
            trailing: const HStatusPill('Done', tone: HTone.success),
            onTap: () {},
          ),
          const HDivider(indent: HSpace.x4),
          const HListTile(
            icon: HIcons.payment,
            tone: HTone.neutral,
            title: 'Payment',
            subtitle: 'Locked until you accept the offer',
            enabled: false,
            trailing: HIcon(HIcons.lock, tone: HTextTone.tertiary),
          ),
          const HDivider(indent: HSpace.x4),
          HListTile(
            title: 'No icon, switch trailing',
            trailing: HSwitch(value: true, onChanged: (_) {}),
          ),
        ],
      ),
    ),
  );
}
