import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  for (final scale in const [1.0, 1.3, 2.0]) {
    goldenPresetMatrix('h_nav_bar', _build, textScale: scale);
  }
}

Widget _build(BuildContext context) => Column(
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
);
