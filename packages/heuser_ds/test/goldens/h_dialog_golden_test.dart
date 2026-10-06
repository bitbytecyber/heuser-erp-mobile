import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  goldenPresetMatrix(
    'h_dialog',
    (context) => Center(
      child: HDialog(
        title: 'Resume unsaved changes?',
        message: 'You have edits from your last session that were not sent.',
        icon: HIcons.edit,
        actions: [
          HButton.filled(label: 'Resume', onPressed: () {}),
          HButton.ghost(label: 'Discard', onPressed: () {}, expand: true),
        ],
      ),
    ),
  );
}
