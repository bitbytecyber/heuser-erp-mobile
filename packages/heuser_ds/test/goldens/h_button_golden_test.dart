import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  Widget buttons(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      HButton.filled(label: 'Continue', onPressed: () {}, icon: HIcons.check),
      HSpace.gap2,
      HButton.tonal(label: 'Save draft', onPressed: () {}),
      HSpace.gap2,
      HButton.outline(
        label: 'Finish later',
        onPressed: () {},
        trailingIcon: HIcons.chevronRight,
      ),
      HSpace.gap2,
      Wrap(
        spacing: HSpace.x2,
        runSpacing: HSpace.x2,
        children: [
          HButton.ghost(label: 'Skip', onPressed: () {}),
          HButton.ghost(
            label: 'Resend code',
            onPressed: () {},
            icon: HIcons.refresh,
          ),
        ],
      ),
      HSpace.gap2,
      HButton.danger(label: 'Withdraw application', onPressed: () {}),
      HSpace.gap2,
      HButton.filled(label: 'Submitting…', onPressed: () {}, loading: true),
      HSpace.gap2,
      const HButton.filled(label: 'Disabled', onPressed: null),
      HSpace.gap2,
      Row(
        children: [
          HButton.filled(
            label: 'Small',
            onPressed: () {},
            size: HButtonSize.sm,
            expand: false,
          ),
          HSpace.hgap2,
          Expanded(
            child: HButton.filled(
              label: 'Large CTA',
              onPressed: () {},
              size: HButtonSize.lg,
            ),
          ),
        ],
      ),
    ],
  );

  goldenPresetMatrix('h_button', buttons);
  goldenPresetMatrix('h_button', buttons, textScale: 1.3);
  goldenPresetMatrix('h_button', buttons, textScale: 2);
}
