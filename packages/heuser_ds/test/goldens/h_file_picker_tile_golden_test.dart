import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  goldenPresetMatrix(
    'h_file_picker_tile',
    (context) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HFilePickerTile(
          title: 'Passport-style photo',
          hint: 'JPG or PNG, face fully visible',
          state: HFileState.missing,
          onPick: () {},
          onLater: () {},
        ),
        HSpace.gap3,
        const HFilePickerTile(
          title: 'B-Form or CNIC',
          state: HFileState.uploading,
          fileName: 'bform.pdf',
          progress: 0.6,
        ),
        HSpace.gap3,
        HFilePickerTile(
          title: 'Result slip · Mathematics',
          state: HFileState.pending,
          fileName: 'maths-result.jpg',
          onPick: () {},
          onRemove: () {},
          onOpen: () {},
        ),
        HSpace.gap3,
        HFilePickerTile(
          title: 'Overall result statement',
          state: HFileState.approved,
          fileName: 'statement.pdf',
          onOpen: () {},
        ),
        HSpace.gap3,
        HFilePickerTile(
          title: 'Recommendation letter',
          state: HFileState.rejected,
          fileName: 'letter.pdf',
          rejectReason: 'The signature is missing.',
          onPick: () {},
        ),
        HSpace.gap3,
        HFilePickerTile(
          title: 'School leaving certificate',
          hint: 'Needed at enrolment',
          state: HFileState.later,
          onPick: () {},
        ),
      ],
    ),
  );
}
