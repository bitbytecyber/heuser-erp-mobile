import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  final now = DateTime(2026, 10, 7, 12);
  goldenPresetMatrix(
    'h_countdown',
    (context) => Wrap(
      spacing: HSpace.x2,
      runSpacing: HSpace.x2,
      children: [
        HCountdown(
          deadline: now.add(const Duration(days: 12, hours: 3)),
          now: now,
          prefix: 'Respond in ',
        ),
        HCountdown(
          deadline: now.add(const Duration(hours: 20, minutes: 5)),
          now: now,
        ),
        HCountdown(deadline: now.add(const Duration(minutes: 45)), now: now),
        HCountdown(deadline: now.subtract(const Duration(hours: 1)), now: now),
      ],
    ),
  );

  test('formatTimeLeft', () {
    expect(
      formatTimeLeft(now.add(const Duration(days: 2, hours: 5)), now),
      '2d 5h',
    );
    expect(formatTimeLeft(now.add(const Duration(days: 2)), now), '2d');
    expect(
      formatTimeLeft(now.add(const Duration(hours: 3, minutes: 7)), now),
      '3h 7m',
    );
    expect(formatTimeLeft(now.add(const Duration(minutes: 9)), now), '9m');
    expect(
      formatTimeLeft(now.subtract(const Duration(seconds: 1)), now),
      isNull,
    );
  });
}
