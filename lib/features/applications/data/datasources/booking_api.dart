import 'package:dio/dio.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/core/network/safe_call.dart';
import 'package:heuser_erp_mobile/features/applications/data/datasources/intake_api.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_options.dart';

/// Interview and sports-trial booking for the applicant
/// (`me/applications/{id}/times|book|trials/…`). Errors such as
/// `slot_taken`, `not_released`, `already_booked` arrive as
/// `Failure.validation` with the server's sentence.
class BookingApi {
  /// Creates the api.
  BookingApi(this._dio);

  final Dio _dio;

  /// `…/{id}/times/`
  static String times(int id) => '${IntakeApi.me}$id/times/';

  /// `…/{id}/book/`
  static String book(int id) => '${IntakeApi.me}$id/book/';

  /// `…/{id}/trials/{booking}/sessions/`
  static String trialSessions(int id, int booking) =>
      '${IntakeApi.me}$id/trials/$booking/sessions/';

  /// `…/{id}/trials/{booking}/book/`
  static String trialBook(int id, int booking) =>
      '${IntakeApi.me}$id/trials/$booking/book/';

  /// Interview times open to this applicant.
  Future<Result<List<TimeOption>>> interviewTimes(int id) => safeCall(() async {
    final r = await _dio.get<List<dynamic>>(times(id));
    return [
      for (final e in r.data ?? const [])
        if (e is Map) TimeOption.fromJson(Map<String, dynamic>.from(e)),
    ];
  });

  /// Books (or, with [reschedule], moves) the interview to [startsAt].
  Future<Result<Application>> bookInterview(
    int id,
    String startsAt, {
    bool reschedule = false,
  }) => safeCall(() async {
    final r = await _dio.post<Map<String, dynamic>>(
      book(id),
      data: {'starts_at': startsAt, 'reschedule': reschedule},
    );
    return Application.fromJson(r.data ?? const {});
  });

  /// Sessions open for one trial booking.
  Future<Result<List<TrialOption>>> sessions(int id, int booking) =>
      safeCall(() async {
        final r = await _dio.get<List<dynamic>>(trialSessions(id, booking));
        return [
          for (final e in r.data ?? const [])
            if (e is Map) TrialOption.fromJson(Map<String, dynamic>.from(e)),
        ];
      });

  /// Books [session] for the trial [booking].
  Future<Result<Application>> bookTrial(int id, int booking, int session) =>
      safeCall(() async {
        final r = await _dio.post<Map<String, dynamic>>(
          trialBook(id, booking),
          data: {'session': session},
        );
        return Application.fromJson(r.data ?? const {});
      });
}
