import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  goldenPresetMatrix(
    'h_scaffold',
    (context) => SizedBox(
      height: 420,
      child: HScaffold(
        appBar: HAppBar(title: 'Scaffold', showBack: true, onBack: () {}),
        body: const Padding(
          padding: HSpace.page,
          child: HText('Body content', tone: HTextTone.secondary),
        ),
        bottomBar: Padding(
          padding: const EdgeInsets.fromLTRB(
            HSpace.gutter,
            HSpace.x2,
            HSpace.gutter,
            HSpace.x3,
          ),
          child: HButton.filled(
            label: 'Continue',
            onPressed: () {},
            size: HButtonSize.lg,
          ),
        ),
      ),
    ),
  );
}
