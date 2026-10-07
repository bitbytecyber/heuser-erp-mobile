import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  // At rest the indicator is hidden: the golden pins that the wrapper adds
  // no chrome of its own around the list.
  goldenPresetMatrix(
    'h_refreshable',
    (context) => SizedBox(
      height: 160,
      child: HRefreshable.list(
        onRefresh: () async {},
        children: const [
          HListTile(title: 'Application received', subtitle: 'Today'),
          HListTile(title: 'Interview booked', subtitle: 'Yesterday'),
        ],
      ),
    ),
  );
}
