import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  goldenPresetMatrix(
    'h_timeline',
    (context) => const HTimeline(
      entries: [
        HTimelineEntry(
          title: 'Interview booked',
          timestamp: 'Today, 10:12',
          subtitle: 'Tue 14 Oct, 11:00 with Ms Salman',
          icon: HIcons.calendar,
          tone: HTone.brand,
        ),
        HTimelineEntry(
          title: 'Documents approved',
          timestamp: 'Yesterday',
          icon: HIcons.checkCircle,
          tone: HTone.success,
        ),
        HTimelineEntry(
          title: 'Photo needs a clearer copy',
          timestamp: '3 Oct',
          subtitle: 'The face must be fully visible.',
          icon: HIcons.warning,
          tone: HTone.warning,
        ),
        HTimelineEntry(title: 'Application received', timestamp: '1 Oct'),
      ],
    ),
  );
}
