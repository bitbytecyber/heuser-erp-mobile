import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/documents.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_parts.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';
import 'package:heuser_erp_mobile/features/documents/domain/doc_rows.dart';
import 'package:heuser_erp_mobile/features/documents/domain/doc_rows_input.dart';

const _photo = DocumentType(
  id: 1,
  code: 'photo',
  name: 'Photo',
  hint: 'Passport size',
  stage: DocStage.beforeInterview,
  blocksInterview: true,
);
const _bform = DocumentType(
  id: 2,
  code: 'b_form',
  name: 'B-Form',
  hint: 'NADRA',
  stage: DocStage.beforeInterview,
  blocksInterview: false,
);
const _result = DocumentType(
  id: 3,
  code: 'result',
  name: 'Result',
  stage: DocStage.afterResults,
  perSubject: true,
);
const _overall = DocumentType(
  id: 4,
  code: 'result_overall',
  name: 'Combined statement',
  stage: DocStage.afterResults,
);
const _ibcc = DocumentType(id: 5, code: 'ibcc', name: 'IBCC');
const _reco = DocumentType(id: 6, code: 'recommendation', name: 'Letter');
const _cert = DocumentType(id: 7, code: 'certificate', name: 'Certificate');
const _medical = DocumentType(id: 8, code: 'medical_certificate', name: 'Med');
const _cnic = DocumentType(
  id: 9,
  code: 'parent_cnic',
  name: 'Parent CNIC',
  stage: DocStage.atEnrolment,
);

DocSlot _slot(
  int id,
  DocumentType dt, {
  int? result,
  DocSlotState state = DocSlotState.pending,
  List<String> files = const ['https://x/media/photo.jpg'],
  List<VersionState>? versionStates,
  String reason = '',
  String name = '',
}) => DocSlot(
  id: id,
  docType: dt.id,
  code: dt.code,
  name: name,
  result: result,
  state: state,
  reason: reason,
  versions: [
    for (var i = 0; i < files.length; i++)
      DocVersion(
        id: id * 10 + i,
        file: files[i],
        state: versionStates?[i] ?? VersionState.pending,
        uploadedAt: '2026-10-0${i + 1}',
      ),
  ],
);

List<DocRow> _build({
  List<DocumentType> types = const [_photo, _bform],
  List<DocSlot> slots = const [],
  List<ResultRow> results = const [],
  Qualification qualification = Qualification.oLevel,
  bool predicted = false,
  String referee = '',
  bool activities = false,
  bool sent = false,
}) => buildDocRows(
  DocRowsInput(
    types: types,
    slots: slots,
    results: results,
    qualification: qualification,
    predicted: predicted,
    refereeName: referee,
    hasActivities: activities,
    sent: sent,
  ),
);

void main() {
  group('state', () {
    test('missing, ready before sending, checking after', () {
      expect(_build().first.state, DocState.missing);
      final slot = _slot(11, _photo);
      expect(_build(slots: [slot]).first.state, DocState.ready);
      expect(_build(slots: [slot], sent: true).first.state, DocState.checking);
    });

    test('approved is verified, rejected asks for a replacement', () {
      final ok = _slot(11, _photo, state: DocSlotState.approved);
      expect(_build(slots: [ok]).first.state, DocState.verified);
      final bad = _slot(
        11,
        _photo,
        state: DocSlotState.rejected,
        reason: 'Blurry.',
      );
      final row = _build(slots: [bad]).first;
      expect(row.state, DocState.replace);
      expect(row.sub, endsWith(' Blurry.'));
      expect(row.reason, 'Blurry.');
    });

    test('a dropped "later" slot reads as missing', () {
      final later = _slot(11, _photo, state: DocSlotState.later, files: []);
      expect(_build(slots: [later]).first.state, DocState.missing);
    });
  });

  group('grouping', () {
    test('only blocking before-interview docs stay in that group', () {
      final rows = _build(types: const [_bform, _photo, _cnic]);
      expect(rows.map((r) => r.code), ['photo', 'b_form', 'parent_cnic']);
      final bform = rows[1];
      expect(bform.early, isTrue);
      expect(bform.stage, DocStage.optional);
      expect(bform.group, DocGroup.later);
      expect(rows.last.group, DocGroup.enrolment);
    });
  });

  group('conditional rows', () {
    test('ibcc only for matric, letter only with a referee', () {
      expect(_build(types: const [_ibcc]), isEmpty);
      expect(
        _build(types: const [_ibcc], qualification: Qualification.matric),
        hasLength(1),
      );
      expect(_build(types: const [_reco]), isEmpty);
      expect(_build(types: const [_reco], referee: 'Mr Khan'), hasLength(1));
    });

    test('medical certificate only once the office asked for it', () {
      expect(_build(types: const [_medical]), isEmpty);
      final asked = _slot(80, _medical, state: DocSlotState.missing, files: []);
      expect(_build(types: const [_medical], slots: [asked]), hasLength(1));
    });

    test('an existing slot keeps a row even when its condition is gone', () {
      final sent = _slot(60, _reco);
      expect(_build(types: const [_reco], slots: [sent]), hasLength(1));
    });

    test('one certificate row per sent certificate, named after it', () {
      expect(_build(types: const [_cert]), isEmpty);
      final placeholder = _build(types: const [_cert], activities: true);
      expect(placeholder.single.title, 'Certificate');
      final rows = _build(
        types: const [_cert],
        activities: true,
        slots: [
          _slot(71, _cert, name: 'Cricket'),
          _slot(72, _cert, name: 'Debate'),
        ],
      );
      expect(rows.map((r) => r.title), ['Cricket', 'Debate']);
      expect(rows.map((r) => r.key), ['slot:71', 'slot:72']);
      expect(rows.every((r) => r.group == DocGroup.certificates), isTrue);
    });
  });

  group('per-subject results', () {
    const maths = ResultRow(id: 1, subject: 'Maths', resultOut: true);
    const physics = ResultRow(id: 2, subject: 'Physics');

    test('one row per subject whose result is out', () {
      final rows = _build(types: const [_result], results: [maths, physics]);
      expect(rows.single.title, 'CAIE result · Maths');
      expect(rows.single.isResult, isTrue);
    });

    test('a disabled placeholder when nothing is out yet', () {
      final rows = _build(
        types: const [_result],
        results: [physics],
        predicted: true,
      );
      expect(rows.single.actionable, isFalse);
      expect(rows.single.sub, const DocTitles().subPredicted);
    });

    test('a combined statement covers subjects whose result is out', () {
      final rows = _build(
        types: const [_result, _overall],
        results: [maths, physics],
        slots: [_slot(40, _overall)],
      );
      expect(rows.map((r) => r.title), [
        'CAIE result · Physics',
        'Combined statement',
      ]);
      expect(rows.first.sub, const DocTitles().subAwaiting);
    });

    test('matric names the result card', () {
      final rows = _build(
        types: const [_result],
        results: [maths],
        qualification: Qualification.matric,
      );
      expect(rows.single.title, startsWith('Matric result card'));
    });
  });

  group('files and versions', () {
    test('shows the file name for documents, the hint for images', () {
      final pdf = _slot(11, _bform, files: ['https://x/media/My%20Form.pdf']);
      final row = _build(types: const [_bform], slots: [pdf]).single;
      expect(row.file, 'My Form.pdf');
      expect(row.sub, 'My Form.pdf');
      expect(row.isImage, isFalse);

      final img = _slot(12, _photo, files: ['https://x/media/me.JPG?sig=1']);
      final photo = _build(types: const [_photo], slots: [img]).single;
      expect(photo.isImage, isTrue);
      expect(photo.sub, 'Passport size');
    });

    test('earlier copies are listed, newest first after the current', () {
      final slot = _slot(
        11,
        _photo,
        files: ['https://x/c.jpg', 'https://x/b.jpg', 'https://x/a.jpg'],
        versionStates: const [
          VersionState.pending,
          VersionState.rejected,
          VersionState.rejected,
        ],
      );
      final row = _build(types: const [_photo], slots: [slot]).single;
      expect(row.earlier.map((e) => e.file), ['b.jpg', 'a.jpg']);
      expect(row.removable, isFalse);
    });

    test('removable only before sending and while every copy is pending', () {
      final slot = _slot(11, _photo);
      expect(_build(slots: [slot]).first.removable, isTrue);
      expect(_build(slots: [slot], sent: true).first.removable, isFalse);
    });
  });
}
