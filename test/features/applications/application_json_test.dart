import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';

/// Captured from the local backend (`GET /api/v1/intake/me/applications/{id}/`).
Map<String, dynamic> _fixture() => jsonDecode(
  File('test/fixtures/applications/application_offered.json')
      .readAsStringSync(),
) as Map<String, dynamic>;

void main() {
  test('a real application payload parses', () {
    final a = Application.fromJson(_fixture());
    expect(a.id, isPositive);
    expect(a.profile.firstName, isNotEmpty);
  });

  test('matric percentage arrives as a number (DRF encodes Decimal)', () {
    for (final (raw, shown) in [(88.5, '88.5'), (88.0, '88'), ('72', '72')]) {
      final json = _fixture();
      (json['profile'] as Map<String, dynamic>)['matric_percentage'] = raw;
      expect(Application.fromJson(json).profile.matricPercentage, shown);
    }
  });
}
