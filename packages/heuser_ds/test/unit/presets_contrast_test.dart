import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_ds/heuser_ds.dart';

double _lum(Color c) {
  double ch(double v) =>
      v <= 0.03928 ? v / 12.92 : math.pow((v + 0.055) / 1.055, 2.4).toDouble();
  return 0.2126 * ch(c.r) + 0.7152 * ch(c.g) + 0.0722 * ch(c.b);
}

double contrast(Color a, Color b) {
  final la = _lum(a);
  final lb = _lum(b);
  return (math.max(la, lb) + 0.05) / (math.min(la, lb) + 0.05);
}

void main() {
  for (final preset in HPresets.builtIn) {
    for (final scheme in [preset.light, preset.dark]) {
      final name = '${preset.id} ${scheme.brightness.name}';
      group(name, () {
        test('text roles reach 4.5:1 on surfaces', () {
          for (final surface in [
            scheme.surface,
            scheme.surfaceAlt,
            scheme.surfaceRaised,
          ]) {
            expect(
              contrast(scheme.textPrimary, surface),
              greaterThanOrEqualTo(4.5),
              reason: 'textPrimary',
            );
            expect(
              contrast(scheme.textSecondary, surface),
              greaterThanOrEqualTo(4.5),
              reason: 'textSecondary',
            );
          }
          expect(
            contrast(scheme.textInverse, scheme.surfaceInverse),
            greaterThanOrEqualTo(4.5),
          );
        });

        test('on-colours reach 4.5:1 on their fills', () {
          expect(
            contrast(scheme.onBrand, scheme.brand),
            greaterThanOrEqualTo(4.5),
            reason: 'onBrand',
          );
          expect(
            contrast(scheme.onAccent, scheme.accent),
            greaterThanOrEqualTo(4.5),
            reason: 'onAccent',
          );
          expect(
            contrast(scheme.onSuccess, scheme.success),
            greaterThanOrEqualTo(4.5),
            reason: 'onSuccess',
          );
          expect(
            contrast(scheme.onWarning, scheme.warning),
            greaterThanOrEqualTo(4.5),
            reason: 'onWarning',
          );
          expect(
            contrast(scheme.onDanger, scheme.danger),
            greaterThanOrEqualTo(4.5),
            reason: 'onDanger',
          );
          expect(
            contrast(scheme.onInfo, scheme.info),
            greaterThanOrEqualTo(4.5),
            reason: 'onInfo',
          );
        });

        test(
          'status colours are readable on their soft tints and on surface',
          () {
            expect(
              contrast(scheme.brandStrong, scheme.brandSoft),
              greaterThanOrEqualTo(4.5),
              reason: 'brandStrong/brandSoft',
            );
            expect(
              contrast(scheme.success, scheme.successSoft),
              greaterThanOrEqualTo(3),
              reason: 'success/successSoft',
            );
            expect(
              contrast(scheme.warning, scheme.warningSoft),
              greaterThanOrEqualTo(3),
              reason: 'warning/warningSoft',
            );
            expect(
              contrast(scheme.danger, scheme.dangerSoft),
              greaterThanOrEqualTo(3),
              reason: 'danger/dangerSoft',
            );
            expect(
              contrast(scheme.info, scheme.infoSoft),
              greaterThanOrEqualTo(3),
              reason: 'info/infoSoft',
            );
            expect(
              contrast(scheme.brand, scheme.surface),
              greaterThanOrEqualTo(3),
              reason: 'brand/surface',
            );
          },
        );
      });
    }
  }

  test('preset ids are unique and valid', () {
    final ids = HPresets.builtIn.map((p) => p.id).toList();
    expect(ids.toSet().length, ids.length);
    for (final id in ids) {
      expect(RegExp(r'^[a-z0-9_]{2,40}$').hasMatch(id), isTrue, reason: id);
    }
    expect(HPresets.byId('heuser_classic'), same(kHeuserClassic));
    expect(HPresets.byIdOrFallback('missing'), same(kHeuserClassic));
  });
}
