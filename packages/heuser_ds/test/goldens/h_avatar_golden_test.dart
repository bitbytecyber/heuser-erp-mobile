import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  goldenPresetMatrix(
    'h_avatar',
    (context) => const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HAvatar(name: 'Ayesha Khan', size: HAvatarSize.sm),
        HAvatar(name: 'Ayesha Khan'),
        HAvatar(name: 'Hussham', size: HAvatarSize.lg),
        HAvatar(name: '', size: HAvatarSize.xl),
      ],
    ),
  );
}
