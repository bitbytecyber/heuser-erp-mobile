import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  goldenPresetMatrix(
    'h_status_pill',
    (context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Wrap(
          spacing: HSpace.x2,
          runSpacing: HSpace.x2,
          children: [
            HStatusPill('Draft'),
            HStatusPill('Under review', tone: HTone.brand, icon: HIcons.clock),
            HStatusPill(
              'Approved',
              tone: HTone.success,
              icon: HIcons.checkCircle,
            ),
            HStatusPill('Pending', tone: HTone.warning, icon: HIcons.hourglass),
            HStatusPill('Rejected', tone: HTone.danger, icon: HIcons.error),
            HStatusPill('Released', tone: HTone.info, icon: HIcons.info),
          ],
        ),
        HSpace.gap3,
        const Wrap(
          spacing: HSpace.x2,
          runSpacing: HSpace.x2,
          children: [
            HStatusPill('Enrolled', tone: HTone.success, solid: true),
            HStatusPill('Offer sent', tone: HTone.brand, solid: true),
            HStatusPill('Closed', solid: true),
          ],
        ),
        HSpace.gap4,
        Row(
          children: [
            HBadge(
              count: 3,
              child: HIconButton(
                icon: HIcons.bell,
                semanticsLabel: 'Bell',
                onPressed: () {},
              ),
            ),
            HSpace.hgap4,
            HBadge(
              count: 120,
              child: HIconButton(
                icon: HIcons.mail,
                semanticsLabel: 'Mail',
                onPressed: () {},
              ),
            ),
            HSpace.hgap4,
            const HBadge(),
          ],
        ),
      ],
    ),
  );
}
