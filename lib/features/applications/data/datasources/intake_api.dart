import 'package:dio/dio.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/core/network/safe_call.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application_summary.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_options.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';

/// Applicant endpoints of `/api/v1/intake/me/…` (`lib/api/endpoints/intake.ts`
/// on the web). Rule breaks arrive as `400 {code, detail, details}` and are
/// mapped to `Failure.validation` by `safeCall`; a switched-off module is
/// `503 module_disabled`.
class IntakeApi {
  /// Creates the api.
  IntakeApi(this._dio);

  final Dio _dio;

  /// `intake/me/applications/`
  static const me = 'api/v1/intake/me/applications/';

  /// `intake/me/applications/options/`
  static const options = '${me}options/';

  /// `intake/me/applications/schools/`
  static const schools = '${me}schools/';

  /// `intake/me/applications/countries/`
  static const countries = '${me}countries/';

  /// `intake/me/applications/cities/`
  static const cities = '${me}cities/';

  /// Schools per page; a full page means there may be more.
  static const schoolPage = 30;

  /// `intake/me/applications/{id}/`
  static String application(int id) => '$me$id/';

  /// `…/{id}/step/{n}/`
  static String step(int id, int step) => '$me$id/step/$step/';

  /// `…/{id}/submit/`
  static String submit(int id) => '$me$id/submit/';

  /// `…/{id}/withdraw/`
  static String withdraw(int id) => '$me$id/withdraw/';

  /// `…/{id}/documents/`
  static String documents(int id) => '$me$id/documents/';

  /// `…/{id}/documents/{doc}/`
  static String document(int id, int documentId) =>
      '$me$id/documents/$documentId/';

  /// `…/{id}/results/{result}/`
  static String result(int id, int resultId) => '$me$id/results/$resultId/';

  /// `GET me/applications/`
  Future<Result<List<AppSummary>>> myApplications() => safeCall(() async {
    final r = await _dio.get<List<dynamic>>(me);
    return _list(r.data, AppSummary.fromJson);
  });

  /// `POST me/applications/` (optionally copying the family block).
  Future<Result<Application>> start({int? copyFamilyFrom}) =>
      safeCall(() async {
        final r = await _dio.post<Map<String, dynamic>>(
          me,
          data: copyFamilyFrom != null
              ? {'copy_family_from': copyFamilyFrom}
              : <String, dynamic>{},
        );
        return Application.fromJson(r.data ?? const {});
      });

  /// `GET me/applications/{id}/`
  Future<Result<Application>> fetch(int id) => safeCall(() async {
    final r = await _dio.get<Map<String, dynamic>>(application(id));
    return Application.fromJson(r.data ?? const {});
  });

  /// `PATCH me/applications/{id}/step/{n}/` → `{missing, application}`.
  Future<Result<StepResult>> saveStep(
    int id,
    int stepNumber,
    Map<String, dynamic> data,
  ) => safeCall(() async {
    final r = await _dio.patch<Map<String, dynamic>>(
      step(id, stepNumber),
      data: data,
    );
    return StepResult.fromJson(r.data ?? const {});
  });

  /// `POST me/applications/{id}/submit/`
  Future<Result<Application>> submitApplication(int id) => safeCall(() async {
    final r = await _dio.post<Map<String, dynamic>>(
      submit(id),
      data: {'declaration': true},
    );
    return Application.fromJson(r.data ?? const {});
  });

  /// `POST me/applications/{id}/withdraw/`. A draft is deleted (204, no
  /// body) → `null`; a sent application comes back as withdrawn.
  Future<Result<Application?>> withdrawApplication(
    int id, {
    String reason = '',
  }) => safeCall(() async {
    final r = await _dio.post<dynamic>(withdraw(id), data: {'reason': reason});
    final body = r.data;
    if (body is Map && body.isNotEmpty) {
      return Application.fromJson(Map<String, dynamic>.from(body));
    }
    return null;
  });

  /// `POST me/applications/{id}/documents/` (multipart). Pass [filePath] to
  /// upload, [later] to defer, [document] to replace an existing slot,
  /// [activity]/[activityName] for a certificate.
  Future<Result<Application>> uploadDocument(
    int id, {
    required int docType,
    int? resultId,
    int? document,
    String? filePath,
    String? fileName,
    bool later = false,
    String? activity,
    String? activityName,
  }) => safeCall(() async {
    final form = FormData.fromMap({
      'doc_type': '$docType',
      'activity': ?activity,
      'activity_name': ?activityName,
      if (resultId != null) 'result': '$resultId',
      if (document != null) 'document': '$document',
      if (later) 'later': '1',
      if (filePath != null)
        'file': await MultipartFile.fromFile(filePath, filename: fileName),
    });
    final r = await _dio.post<Map<String, dynamic>>(
      documents(id),
      data: form,
      options: Options(sendTimeout: const Duration(seconds: 60)),
    );
    return Application.fromJson(r.data ?? const {});
  });

  /// `DELETE me/applications/{id}/documents/{doc}/`
  Future<Result<Application>> removeDocument(int id, int documentId) =>
      safeCall(() async {
        final r = await _dio.delete<Map<String, dynamic>>(
          document(id, documentId),
        );
        return Application.fromJson(r.data ?? const {});
      });

  /// `PATCH me/applications/{id}/results/{result}/`
  Future<Result<Application>> updateResult(
    int id,
    int resultId, {
    String? grade,
    bool? resultOut,
  }) => safeCall(() async {
    final r = await _dio.patch<Map<String, dynamic>>(
      result(id, resultId),
      data: {'grade': ?grade, 'result_out': ?resultOut},
    );
    return Application.fromJson(r.data ?? const {});
  });

  /// `GET me/applications/options/?level=`
  Future<Result<FormOptions>> formOptions({Level? level}) => safeCall(() async {
    final r = await _dio.get<Map<String, dynamic>>(
      options,
      queryParameters: {if (level != null) 'level': level.wire},
    );
    return FormOptions.fromJson(r.data ?? const {});
  });

  /// `GET me/applications/schools/?q=&offset=`
  Future<Result<List<SchoolHit>>> searchSchools(String q, {int offset = 0}) =>
      safeCall(() async {
        final r = await _dio.get<List<dynamic>>(
          schools,
          queryParameters: {'q': q, 'offset': offset},
        );
        return _list(r.data, SchoolHit.fromJson);
      });

  /// `GET me/applications/countries/`
  Future<Result<List<Country>>> fetchCountries() => safeCall(() async {
    final r = await _dio.get<List<dynamic>>(countries);
    return _list(r.data, Country.fromJson);
  });

  /// `GET me/applications/cities/?country=&q=`
  Future<Result<List<City>>> searchCities(String country, String q) =>
      safeCall(() async {
        final r = await _dio.get<List<dynamic>>(
          cities,
          queryParameters: {'country': country, 'q': q},
        );
        return _list(r.data, City.fromJson);
      });

  static List<T> _list<T>(
    List<dynamic>? data,
    T Function(Map<String, dynamic>) from,
  ) => [
    for (final e in data ?? const [])
      if (e is Map) from(Map<String, dynamic>.from(e)),
  ];
}
