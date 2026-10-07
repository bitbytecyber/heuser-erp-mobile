import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart' hide fail;
import 'package:heuser_erp_mobile/core/files/file_pick_service.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart';
import 'package:heuser_erp_mobile/features/documents/domain/doc_rows.dart';
import 'package:heuser_erp_mobile/features/documents/presentation/cubit/documents_cubit.dart';
import 'package:mocktail/mocktail.dart';

class _Repo extends Mock implements IntakeRepository;

class _Files extends Mock implements FilePickService;

const _app = Application(id: 7, cycle: '2026', updatedAt: 'x');
const _file = PickedFile(path: '/tmp/a.pdf', name: 'a.pdf');
const _boom = Failure.server(status: 500);

const _row = DocRow(
  key: 'cnic',
  code: 'cnic',
  docType: 3,
  title: 'CNIC',
  sub: '',
  stage: DocStage.beforeInterview,
  group: DocGroup.beforeInterview,
  state: DocState.ready,
  docId: 55,
);

void main() {
  late _Repo repo;
  late _Files files;

  setUpAll(() => registerFallbackValue(FileSource.document));

  setUp(() {
    repo = _Repo();
    files = _Files();
    when(() => files.pick(any())).thenAnswer((_) async => _file);
  });

  DocumentsCubit build() =>
      DocumentsCubit(repo: repo, files: files, applicationId: 7);

  void uploadAnswers(Result<Application> r) => when(
    () => repo.uploadDocument(
      any(),
      docType: any(named: 'docType'),
      resultId: any(named: 'resultId'),
      document: any(named: 'document'),
      filePath: any(named: 'filePath'),
      fileName: any(named: 'fileName'),
      later: any(named: 'later'),
      activity: any(named: 'activity'),
      activityName: any(named: 'activityName'),
    ),
  ).thenAnswer((_) async => r);

  blocTest<DocumentsCubit, DocumentsState>(
    'upload picks a file, marks the row busy, then reports it',
    build: () {
      uploadAnswers(ok(_app));
      return build();
    },
    act: (c) => c.upload(_row, FileSource.camera),
    expect: () => [
      const DocumentsState(pending: 'cnic'),
      const DocumentsState(
        notice: DocsNotice.uploaded(
          application: _app,
          title: 'CNIC',
          withFile: true,
        ),
        noticeSeq: 1,
      ),
    ],
    verify: (_) => verify(
      () => repo.uploadDocument(
        7,
        docType: 3,
        document: 55,
        filePath: '/tmp/a.pdf',
        fileName: 'a.pdf',
      ),
    ).called(1),
  );

  blocTest<DocumentsCubit, DocumentsState>(
    'a failed upload reports it and clears the busy row',
    build: () {
      uploadAnswers(fail(_boom));
      return build();
    },
    act: (c) => c.uploadNew(9, FileSource.document, title: 'Statement'),
    expect: () => [
      const DocumentsState(pending: 'new:9'),
      const DocumentsState(
        notice: DocsNotice.uploadFailed(_boom),
        noticeSeq: 1,
      ),
    ],
    verify: (c) => expect(c.state.busy, isFalse),
  );

  blocTest<DocumentsCubit, DocumentsState>(
    'a cancelled pick uploads nothing',
    build: () {
      when(() => files.pick(any())).thenAnswer((_) async => null);
      return build();
    },
    act: (c) => c.uploadCertificate(
      4,
      FileSource.gallery,
      activity: 'sport:7',
      activityName: 'Cricket',
      title: 'Cricket',
    ),
    expect: () => <DocumentsState>[],
  );

  blocTest<DocumentsCubit, DocumentsState>(
    'a certificate goes to a new slot with its activity',
    build: () {
      uploadAnswers(ok(_app));
      return build();
    },
    act: (c) => c.uploadCertificate(
      4,
      FileSource.gallery,
      activity: 'sport:7',
      activityName: 'Cricket',
      title: 'Cricket',
    ),
    verify: (c) {
      expect(c.state.notice, isA<DocsUploaded>());
      verify(
        () => repo.uploadDocument(
          7,
          docType: 4,
          filePath: '/tmp/a.pdf',
          fileName: 'a.pdf',
          activity: 'sport:7',
          activityName: 'Cricket',
        ),
      ).called(1);
    },
  );

  blocTest<DocumentsCubit, DocumentsState>(
    'later defers the slot without a file',
    build: () {
      uploadAnswers(ok(_app));
      return build();
    },
    act: (c) => c.later(_row),
    verify: (c) {
      expect(
        c.state.notice,
        const DocsNotice.uploaded(
          application: _app,
          title: 'CNIC',
          withFile: false,
        ),
      );
      verify(
        () => repo.uploadDocument(7, docType: 3, document: 55, later: true),
      ).called(1);
      verifyNever(() => files.pick(any()));
    },
  );

  blocTest<DocumentsCubit, DocumentsState>(
    'remove reports success and failure, clearing the busy row each time',
    build: () {
      var calls = 0;
      when(() => repo.removeDocument(7, 55))
          .thenAnswer((_) async => ++calls == 1 ? ok(_app) : fail(_boom));
      return build();
    },
    act: (c) async {
      await c.remove(_row);
      await c.remove(_row);
    },
    expect: () => [
      const DocumentsState(pending: 'cnic'),
      const DocumentsState(
        notice: DocsNotice.removed(application: _app, title: 'CNIC'),
        noticeSeq: 1,
      ),
      const DocumentsState(
        pending: 'cnic',
        notice: DocsNotice.removed(application: _app, title: 'CNIC'),
        noticeSeq: 1,
      ),
      const DocumentsState(
        notice: DocsNotice.removeFailed(_boom),
        noticeSeq: 2,
      ),
    ],
  );

  blocTest<DocumentsCubit, DocumentsState>(
    'remove does nothing for a slot without a file',
    build: build,
    act: (c) => c.remove(_row.copyWith(docId: null)),
    expect: () => <DocumentsState>[],
  );

  test('while one row is busy, other actions are ignored', () async {
    final pending = Completer<Result<Application>>();
    when(
      () => repo.uploadDocument(
        any(),
        docType: any(named: 'docType'),
        resultId: any(named: 'resultId'),
        document: any(named: 'document'),
        later: any(named: 'later'),
      ),
    ).thenAnswer((_) => pending.future);
    final c = build();
    final first = c.later(_row);
    await Future<void>.value();
    expect(c.state.pending, 'cnic');

    await c.upload(_row, FileSource.camera);
    await c.remove(_row);
    verifyNever(() => files.pick(any()));
    verifyNever(() => repo.removeDocument(any(), any()));

    pending.complete(ok(_app));
    await first;
    expect(c.state.busy, isFalse);
    expect(c.state.notice, isA<DocsUploaded>());
    await c.close();
  });
}
