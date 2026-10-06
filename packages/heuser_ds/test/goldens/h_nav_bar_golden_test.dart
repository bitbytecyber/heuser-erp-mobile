import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  goldenPresetMatrix(
    'h_nav_bar',
    (context) => Column(
      children: [
        HNavBar(
          items: const [
            HNavItem(icon: HIcons.home, label: 'Applications'),
            HNavItem(icon: HIcons.bell, label: 'Notifications', badgeCount: 3),
            HNavItem(icon: HIcons.person, label: 'Profile'),
          ],
          index: 0,
          onChanged: (_) {},
        ),
        HSpace.gap4,
        HNavBar(
          items: const [
            HNavItem(icon: HIcons.home, label: 'Home'),
            HNavItem(icon: HIcons.calendar, label: 'Timetable'),
            HNavItem(icon: HIcons.studies, label: 'Results'),
            HNavItem(icon: HIcons.bell, label: 'Alerts', badgeCount: 120),
            HNavItem(icon: HIcons.person, label: 'Me'),
          ],
          index: 3,
          onChanged: (_) {},
        ),
      ],
    ),
  );
}
