import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_erp_mobile/core/format/format_checks.dart';
import 'package:heuser_erp_mobile/core/format/masks.dart';

void main() {
  group('masks', () {
    test('cnic masks progressively to #####-#######-#', () {
      expect(Masks.cnic('421'), '421');
      expect(Masks.cnic('4210112'), '42101-12');
      expect(Masks.cnic('4210112345678'), '42101-1234567-8');
      expect(Masks.cnic('42101-1234567-89'), '42101-1234567-8');
    });

    test('phone masks local and international numbers', () {
      expect(Masks.phone('03001234567'), '0300 1234567');
      expect(Masks.phone('0300'), '0300');
      expect(Masks.phone('+923001234567'), '+92 300 1234567');
      expect(Masks.phone('923001234567'), '+92 300 1234567');
      expect(Masks.phone('+'), '+');
    });
  });

  group('format checks', () {
    test('empty always passes', () {
      for (final f in FieldFormat.values) {
        expect(FormatChecks.ok(f, '  '), isTrue);
      }
    });

    test('cnic needs 13 digits', () {
      expect(FormatChecks.ok(FieldFormat.cnic, '42101-1234567-8'), isTrue);
      expect(FormatChecks.ok(FieldFormat.cnic, '12345'), isFalse);
    });

    test('email shape', () {
      expect(FormatChecks.ok(FieldFormat.email, 'a@b.co'), isTrue);
      expect(FormatChecks.ok(FieldFormat.email, 'a@b'), isFalse);
    });

    test('accepts a mobile from any country, in either format', () {
      expect(FormatChecks.ok(FieldFormat.phone, '0300 1112233'), isTrue);
      expect(FormatChecks.ok(FieldFormat.phone, '+923001112233'), isTrue);
      expect(FormatChecks.ok(FieldFormat.phone, '+447911123456'), isTrue);
      expect(FormatChecks.ok(FieldFormat.phone, '0300 12'), isFalse);
      // A landline cannot receive the SMS codes.
      expect(FormatChecks.ok(FieldFormat.phone, '(0232) 3123123'), isFalse);
    });

    test('showPhone: Pakistani national, others international', () {
      expect(FormatChecks.showPhone('+923001112233'), '0300 1112233');
      expect(FormatChecks.showPhone('+447911123456'), '+447911123456');
      expect(FormatChecks.showPhone('garbage'), 'garbage');
      expect(FormatChecks.showPhone(null), '');
    });
  });
}
