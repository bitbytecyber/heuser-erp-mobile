import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_draft.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_payload.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_parts.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';

import 'form_fixtures.dart';

void main() {
  group('FormDraft.fromApplication', () {
    test(
      'a new Pakistan address starts in Karachi and takes the account email',
      () {
        final d = FormDraft.fromApplication(
          freshApplication(),
          userEmail: 'me@x.pk',
        );
        expect(d.country, 'PK');
        expect(d.cityText, 'Karachi');
        expect(d.cityOther, 'Karachi');
        expect(d.email, 'me@x.pk');
        expect(d.guardians, hasLength(2));
        expect(d.parentB, isFalse);
        expect(d.emg.same, isTrue);
      },
    );

    test('masks stored numbers and keeps a chosen city', () {
      final app = Application.fromJson({
        'id': 1,
        'updated_at': 'x',
        'profile': {
          'first_name': 'Sara',
          'cnic': '4210111111111',
          'mobile': '+923001112233',
          'email': 'sara@x.pk',
          'country': 'PK',
          'city_id': 9,
          'emergency_contact': {
            'same_as_parent': 'no',
            'name': 'Uncle Bob',
            'mobile': '03001234567',
          },
          'referee': {'name': 'Ms Sana'},
          'anything_else': 'x',
        },
        'city_name': 'Lahore',
        'guardians': [
          {
            'relation': 'Mother',
            'first_name': 'A',
            'last_name': 'B',
            'mobile': '03009998877',
            'cnic': null,
          },
        ],
        'siblings': <Object>[],
        'results': [
          {
            'id': 3,
            'subject': 'Maths',
            'sitting_month': 6,
            'sitting_year': 2026,
            'result_out': true,
            'grade': 'A',
          },
        ],
        'subjects': [
          {'course': 1, 'teacher': 2, 'course_name': 'Physics'},
        ],
        'activities': [
          {'kind': 'sport', 'sport_id': 7, 'name': 'Cricket'},
        ],
        'documents': <Object>[],
      });
      final d = FormDraft.fromApplication(app, userEmail: 'other@x.pk');
      expect(d.cnic, '42101-1111111-1');
      expect(d.mobile, '+92 300 1112233');
      expect(d.email, 'sara@x.pk');
      expect(d.cityId, 9);
      expect(d.cityText, 'Lahore');
      expect(d.emg.same, isFalse);
      expect(d.emg.firstName, 'Uncle');
      expect(d.emg.lastName, 'Bob');
      expect(d.emg.mobile, '0300 1234567');
      expect(d.guardians.first.mobile, '0300 9998877');
      expect(d.hasReferee, isTrue);
      expect(d.more, isTrue);
      expect(d.results.single.id, 3);
      expect(d.subjects.single.teacher, 2);
      expect(d.activities.single.activityKey, 'sport:7');
    });

    test('round-trips through JSON (draft cache)', () {
      final d = completeDraft().copyWith(results: [out('Maths', 'A')]);
      expect(FormDraft.fromJson(d.toJson()), d);
    });
  });

  group('stepPayload', () {
    test('step 1 drops a hidden second parent and employment details', () {
      final d = completeDraft().copyWith(
        guardians: [
          parent.copyWith(work: 'Retired', organisation: 'X'),
          parent,
        ],
        parentB: false,
        sib: true,
        siblings: const [
          Sibling(name: 'Ali', yearOrClass: 'A2'),
          Sibling(),
        ],
      );
      final body = stepPayload(1, d, null);
      final gs = body['guardians'] as List<dynamic>;
      expect(gs, hasLength(1));
      expect((gs.single as Map)['organisation'], '');
      expect(body['siblings'], [
        {'name': 'Ali', 'year_or_class': 'A2'},
      ]);
      expect((body['emergency_contact'] as Map)['same_as_parent'], 'yes');
      expect(body['city_other'], 'Karachi');
      expect(body['level'], 'AS');
    });

    test("step 2 sends each row's own result status and trial flags", () {
      final d = completeDraft().copyWith(
        results: [out('Maths', 'A'), awaited('Urdu', 'B')],
        wantsSportsTrial: true,
        activities: const [
          ActivityRow(kind: 'sport', sportId: 7, name: 'Cricket'),
          ActivityRow(kind: 'sport', name: 'Polo'),
        ],
        qualification: Qualification.matric,
        matricPercentage: '88',
      );
      final body = stepPayload(2, d, options);
      final results = body['results'] as List<dynamic>;
      expect(results.map((r) => [(r as Map)['subject'], r['result_out']]), [
        ['Maths', true],
        ['Urdu', false],
      ]);
      final acts = body['activities'] as List<dynamic>;
      expect((acts[0] as Map)['wants_trial'], isTrue);
      expect((acts[1] as Map)['wants_trial'], isFalse);
      expect(body['qualification'], 'matric');
      expect(body['matric_percentage'], '88');
      expect(body['subjects'], hasLength(3));
    });

    test('private candidate clears the school block', () {
      final body = stepPayload(
        2,
        completeDraft().copyWith(isPrivateCandidate: true),
        null,
      );
      expect(body['school_id'], isNull);
      expect(body['school_campus'], '');
      expect(body['matric_percentage'], isNull);
    });

    test('step 3 is the statement', () {
      expect(stepPayload(3, completeDraft().copyWith(statement: 'hi'), null), {
        'statement': 'hi',
      });
    });
  });
}
