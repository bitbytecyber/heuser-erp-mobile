import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/core/network/safe_call.dart';
import 'package:heuser_erp_mobile/features/applications/data/datasources/intake_api.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';

/// The PDFs an offer comes with.
enum OfferPdf {
  /// Offer letter.
  letter,

  /// Fee details.
  details,

  /// Fee voucher (per instalment).
  challan,

  /// Tuition voucher.
  tuition,

  /// Terms and conditions.
  terms,
}

/// The family's side of an offer: accept it, download its PDFs, send proof
/// of payment per instalment (`me/applications/{id}/offer|instalments/…`).
class OfferApi {
  /// Creates the api.
  OfferApi(this._dio);

  final Dio _dio;

  /// `…/{id}/offer/{offer}/respond/`
  static String respond(int id, int offer) =>
      '${IntakeApi.me}$id/offer/$offer/respond/';

  /// `…/{id}/offer/{offer}/pdf/{kind}/`
  static String pdf(int id, int offer, OfferPdf kind) =>
      '${IntakeApi.me}$id/offer/$offer/pdf/${kind.name}/';

  /// `…/{id}/instalments/{instalment}/evidence/`
  static String evidence(int id, int instalment) =>
      '${IntakeApi.me}$id/instalments/$instalment/evidence/';

  /// Accepts the offer (there is no declining from the app, as on the web).
  Future<Result<Application>> accept(int id, int offer) => safeCall(() async {
    final r = await _dio.post<Map<String, dynamic>>(
      respond(id, offer),
      data: {'accept': true, 'reason': ''},
    );
    return Application.fromJson(r.data ?? const {});
  });

  /// One offer PDF as bytes; vouchers take the [instalment] id.
  Future<Result<Uint8List>> download(
    int id,
    int offer,
    OfferPdf kind, {
    int? instalment,
  }) => safeCall(() async {
    final r = await _dio.get<List<int>>(
      pdf(id, offer, kind),
      queryParameters: {'instalment': ?instalment},
      options: Options(
        responseType: ResponseType.bytes,
        receiveTimeout: const Duration(seconds: 60),
      ),
    );
    return Uint8List.fromList(r.data ?? const []);
  });

  /// Sends proof of payment for one instalment (multipart).
  Future<Result<Application>> submitEvidence(
    int id,
    int instalment, {
    required String filePath,
    required String fileName,
    required String method,
    String note = '',
  }) => safeCall(() async {
    final form = FormData.fromMap({
      'method': method,
      if (note.isNotEmpty) 'note': note,
      'file': await MultipartFile.fromFile(filePath, filename: fileName),
    });
    final r = await _dio.post<Map<String, dynamic>>(
      evidence(id, instalment),
      data: form,
      options: Options(sendTimeout: const Duration(seconds: 60)),
    );
    return Application.fromJson(r.data ?? const {});
  });
}
