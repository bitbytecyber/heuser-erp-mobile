import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_erp_mobile/core/format/format_checks.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_constants.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_errors.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_validation.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_parts.dart';

import 'form_fixtures.dart';

void main() {
  group('step 1 validation', () {
    test('passes a complete step', () {
      expect(validateStep(1, completeDraft(), null), isEmpty);
    });

    test("asks for the parent's CNIC, as the sample form does", () {
      final e = validateStep(
        1,
        completeDraft().copyWith(
          guardians: [
            parent.copyWith(cnic: ''),
            const Guardian(),
          ],
        ),
        null,
      );
      expect(e['pA.cnic'], const FormError.required('parent.cnic'));
    });

    test('accepts a mobile from any country, rejects a landline', () {
      FormError? mobile(String v) =>
          validateStep(1, completeDraft().copyWith(mobile: v), null)['mobile'];
      expect(mobile('+923001112233'), isNull);
      expect(mobile('+447911123456'), isNull);
      expect(mobile('0300 12'), const FormError.format(FieldFormat.phone));
      expect(
        mobile('(0232) 3123123'),
        const FormError.format(FieldFormat.phone),
      );
    });

    test('rejects a malformed own CNIC', () {
      final e = validateStep(1, completeDraft().copyWith(cnic: '12345'), null);
      expect(e['cnic'], const FormError.format(FieldFormat.cnic));
    });

    test('second parent and emergency contact are checked only when shown', () {
      final hidden = completeDraft().copyWith(parentB: false);
      expect(validateStep(1, hidden, null), isEmpty);
      final shown = completeDraft().copyWith(parentB: true);
      expect(validateStep(1, shown, null).keys, contains('pB.first_name'));
      final emg = completeDraft().copyWith(
        emg: completeDraft().emg.copyWith(same: false),
      );
      expect(validateStep(1, emg, null).keys, contains('emg.mobile'));
    });
  });

  group('step 2 results: each subject can be out or awaited', () {
    final five = ['Maths', 'Physics', 'English', 'Urdu', 'Islamiyat'];

    test('accepts five results that are all out with grades', () {
      final d = completeDraft().copyWith(
        results: five.map((s) => out(s, 'A')).toList(),
      );
      expect(validateStep(2, d, options)['results'], isNull);
    });

    test('accepts a mix of out and awaited', () {
      final d = completeDraft().copyWith(
        results: [
          out('Maths', 'A*'),
          out('Physics', 'A'),
          awaited('Urdu', 'B'),
          awaited('Islamiyat'),
        ],
      );
      expect(validateStep(2, d, options)['results'], isNull);
    });

    test('needs at least one subject', () {
      expect(FormRules.minResults, 1);
      expect(
        validateStep(2, completeDraft(), options)['results'],
        const FormError.required('results'),
      );
    });

    test('needs a grade for every result that is out', () {
      final d = completeDraft().copyWith(
        results: [out('Maths', ''), out('Physics', 'A')],
      );
      expect(
        validateStep(2, d, options)['results'],
        const FormError.required('results'),
      );
    });

    test('needs the school years unless a private candidate', () {
      final d = completeDraft().copyWith(
        results: [out('Maths', 'A')],
        studiedFrom: null,
      );
      expect(validateStep(2, d, options)['studied_from'], isNotNull);
      expect(
        validateStep(
          2,
          d.copyWith(isPrivateCandidate: true),
          options,
        )['studied_from'],
        isNull,
      );
    });

    test('needs at least three subjects and a teacher for each', () {
      final d = completeDraft().copyWith(
        results: [out('Maths', 'A')],
        subjects: const [
          SubjectPick(course: 1, teacher: 1),
          SubjectPick(course: 2),
        ],
      );
      final e = validateStep(2, d, options);
      expect(e['subjects'], const FormError.required('subjects'));
      expect(e['teacher.2'], const FormError.teacher('Chemistry'));
    });
  });

  group('step 3 and helpers', () {
    test('statement needs 80–300 words', () {
      final short = completeDraft().copyWith(
        statement: List.filled(79, 'w').join(' '),
      );
      expect(
        validateStep(3, short, null)['statement'],
        const FormError.statementShort(),
      );
      final ok = completeDraft().copyWith(
        statement: List.filled(80, 'w').join(' '),
      );
      expect(validateStep(3, ok, null), isEmpty);
      final long = completeDraft().copyWith(
        statement: List.filled(301, 'w').join(' '),
      );
      expect(
        validateStep(3, long, null)['statement'],
        const FormError.statementLong(),
      );
    });

    test('shows any month and year, not only exam sessions', () {
      expect(FormRules.sessionLabel(6, 2026), 'Jun 2026');
      expect(FormRules.sessionLabel(1, 2024), 'Jan 2024');
      expect(FormRules.sessionLabel(null, 2026), '');
    });

    test('counts words', () {
      expect(FormRules.wordCount('  one two\nthree  '), 3);
      expect(FormRules.wordCount(''), 0);
    });

    test('maps server missing keys to form fields', () {
      expect(serverMissing(['guardians', 'results', 'pB.cnic']), {
        'pA.first_name': const FormError.required('guardians'),
        'results': const FormError.required('results'),
        'pB.cnic': const FormError.required('parent.cnic'),
      });
    });

    test('first offending step', () {
      expect(
        FormFieldKeys.firstStep({
          'statement': const FormError.statementShort(),
        }),
        3,
      );
      expect(
        FormFieldKeys.firstStep({
          'results': const FormError.required('results'),
          'pA.cnic': const FormError.required('parent.cnic'),
        }),
        1,
      );
      expect(FormFieldKeys.stepOf('teacher.4'), 2);
    });
  });
}
