import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_erp_mobile/core/files/document_opener.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/features/applications/data/datasources/offer_api.dart';
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart';

/// Which PDF downloads are in flight, plus the last failure.
class DownloadsState {
  /// Creates the state.
  const DownloadsState({this.busy = const {}, this.failure, this.seq = 0});

  /// Keys of downloads in flight (`letter`, `challan:12`…).
  final Set<String> busy;

  /// The last failure, reported once per [seq].
  final Failure? failure;

  /// Bumped on every failure so listeners fire once.
  final int seq;
}

/// Downloads offer PDFs and opens them in the system viewer.
class DownloadsCubit extends Cubit<DownloadsState> {
  /// Creates the cubit for application [applicationId].
  DownloadsCubit({
    required this._repo,
    required this._opener,
    required this.applicationId,
    required this.reference,
  }) : super(const DownloadsState());

  final IntakeRepository _repo;
  final DocumentOpener _opener;

  /// Application id.
  final int applicationId;

  /// Reference for the file name (`HEU-00042-letter.pdf`).
  final String reference;

  /// Key of a download (for the busy spinner).
  static String keyOf(OfferPdf kind, int? instalment) =>
      instalment == null ? kind.name : '${kind.name}:$instalment';

  /// Downloads and opens one PDF.
  Future<void> open(
    int offer,
    OfferPdf kind, {
    int? instalment,
    int? sequence,
  }) async {
    final key = keyOf(kind, instalment);
    if (state.busy.contains(key)) return;
    emit(DownloadsState(busy: {...state.busy, key}, seq: state.seq));
    final r = await _repo.offerPdf(
      applicationId,
      offer,
      kind,
      instalment: instalment,
    );
    if (isClosed) return;
    final name = sequence != null
        ? '$reference-voucher-$sequence.pdf'
        : '$reference-${kind.name}.pdf';
    final failure = await r.fold<Future<Failure?>>((f) async => f, (
      bytes,
    ) async {
      final ok = await _opener.open(bytes, name);
      return ok ? null : const Failure.unknown();
    });
    if (isClosed) return;
    final busy = {...state.busy}..remove(key);
    emit(
      failure == null
          ? DownloadsState(busy: busy, seq: state.seq)
          : DownloadsState(busy: busy, failure: failure, seq: state.seq + 1),
    );
  }
}
