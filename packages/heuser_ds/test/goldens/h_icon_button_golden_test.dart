import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  goldenPresetMatrix(
    'h_icon_button',
    (context) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HIconButton(
          icon: HIcons.bell,
          semanticsLabel: 'Notifications',
          onPressed: () {},
          badge: true,
        ),
        HIconButton(
          icon: HIcons.edit,
          semanticsLabel: 'Edit',
          onPressed: () {},
          variant: HIconButtonVariant.tonal,
        ),
        HIconButton(
          icon: HIcons.add,
          semanticsLabel: 'Add',
          onPressed: () {},
          variant: HIconButtonVariant.filled,
        ),
        HIconButton(
          icon: HIcons.share,
          semanticsLabel: 'Share',
          onPressed: () {},
          variant: HIconButtonVariant.outline,
        ),
        const HIconButton(
          icon: HIcons.delete,
          semanticsLabel: 'Delete',
          onPressed: null,
          variant: HIconButtonVariant.tonal,
        ),
      ],
    ),
  );
}
