import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heuser_erp_mobile/core/files/file_pick_service.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart';
import 'package:heuser_erp_mobile/features/documents/domain/doc_rows.dart';

part 'documents_cubit.freezed.dart';

/// One-shot outcomes for the page (toasts, handing the application on).
@freezed
sealed class DocsNotice with _$DocsNotice {
  /// A file was added (or a slot deferred); [application] is the fresh copy.
  const factory DocsNotice.uploaded({
    required Application application,
    required String title,
    required bool withFile,
  }) = DocsUploaded;

  /// A file was taken back.
  const factory DocsNotice.removed({
    required Application application,
    required String title,
  }) = DocsRemoved;

  /// The upload failed.
  const factory DocsNotice.uploadFailed(Failure failure) = DocsUploadFailed;

  /// The removal failed.
  const factory DocsNotice.removeFailed(Failure failure) = DocsRemoveFailed;
}

/// State of [DocumentsCubit]: which row is busy, plus the last notice.
@freezed
abstract class DocumentsState with _$DocumentsState {
  /// Creates the state.
  const factory DocumentsState({
    String? pending,
    DocsNotice? notice,
    @Default(0) int noticeSeq,
  }) = _DocumentsState;
  const DocumentsState._();

  /// Any upload or removal in flight.
  bool get busy => pending != null;
}

/// Uploads, defers and removes documents of one application
/// (`documents-list.tsx` `DocsProvider`). The owning page feeds the returned
/// application into its bloc.
class DocumentsCubit extends Cubit<DocumentsState> {
  /// Creates the cubit for [applicationId].
  DocumentsCubit({
    required this._repo,
    required this._files,
    required int applicationId,
  }) : _id = applicationId,
       super(const DocumentsState());

  final IntakeRepository _repo;
  final FilePickService _files;
  final int _id;

  /// Picks a file from [source] and uploads it into [row] (replacing its
  /// current copy when the slot exists).
  Future<void> upload(DocRow row, FileSource source) async {
    final f = await _files.pick(source);
    if (f == null || isClosed) return;
    await _run(
      key: row.key,
      title: row.title,
      withFile: true,
      call: () => _repo.uploadDocument(
        _id,
        docType: row.docType,
        resultId: row.result,
        document: row.docId,
        filePath: f.path,
        fileName: f.name,
      ),
    );
  }

  /// Marks [row] as "later".
  Future<void> later(DocRow row) => _run(
    key: row.key,
    title: row.title,
    withFile: false,
    call: () => _repo.uploadDocument(
      _id,
      docType: row.docType,
      resultId: row.result,
      document: row.docId,
      later: true,
    ),
  );

  /// Adds a brand-new slot for [docType] (extra combined statements).
  Future<void> uploadNew(
    int docType,
    FileSource source, {
    required String title,
  }) async {
    final f = await _files.pick(source);
    if (f == null || isClosed) return;
    await _run(
      key: 'new:$docType',
      title: title,
      withFile: true,
      call: () => _repo.uploadDocument(
        _id,
        docType: docType,
        filePath: f.path,
        fileName: f.name,
      ),
    );
  }

  /// A certificate for one sport / activity (a new slot each time).
  Future<void> uploadCertificate(
    int docType,
    FileSource source, {
    required String activity,
    required String activityName,
    required String title,
  }) async {
    final f = await _files.pick(source);
    if (f == null || isClosed) return;
    await _run(
      key: 'cert:$activity',
      title: title,
      withFile: true,
      call: () => _repo.uploadDocument(
        _id,
        docType: docType,
        filePath: f.path,
        fileName: f.name,
        activity: activity,
        activityName: activityName,
      ),
    );
  }

  /// Takes back an unchecked file.
  Future<void> remove(DocRow row) async {
    final docId = row.docId;
    if (docId == null || state.busy) return;
    emit(state.copyWith(pending: row.key));
    final r = await _repo.removeDocument(_id, docId);
    if (isClosed) return;
    r.fold(
      (f) => _notify(DocsNotice.removeFailed(f)),
      (a) => _notify(DocsNotice.removed(application: a, title: row.title)),
    );
  }

  Future<void> _run({
    required String key,
    required String title,
    required bool withFile,
    required Future<Result<Application>> Function() call,
  }) async {
    if (state.busy) return;
    emit(state.copyWith(pending: key));
    final r = await call();
    if (isClosed) return;
    r.fold(
      (f) => _notify(DocsNotice.uploadFailed(f)),
      (a) => _notify(
        DocsNotice.uploaded(application: a, title: title, withFile: withFile),
      ),
    );
  }

  void _notify(DocsNotice n) =>
      emit(DocumentsState(notice: n, noticeSeq: state.noticeSeq + 1));
}
