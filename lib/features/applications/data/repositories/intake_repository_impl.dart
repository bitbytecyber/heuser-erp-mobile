import 'dart:typed_data';

import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/applications/data/datasources/booking_api.dart';
import 'package:heuser_erp_mobile/features/applications/data/datasources/intake_api.dart';
import 'package:heuser_erp_mobile/features/applications/data/datasources/offer_api.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application_summary.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_options.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart';

/// [IntakeRepository] over [IntakeApi], with a session cache for countries
/// and a short one for form options (the web keeps them for 60 s).
class IntakeRepositoryImpl implements IntakeRepository {
  /// Creates the repository.
  IntakeRepositoryImpl(
    this._api,
    this._booking,
    this._offers, {
    DateTime Function()? clock,
  }) : _clock = clock ?? DateTime.now;

  static const _optionsTtl = Duration(minutes: 1);

  final IntakeApi _api;
  final BookingApi _booking;
  final OfferApi _offers;
  final DateTime Function() _clock;
  List<Country>? _countries;
  Future<Result<List<Country>>>? _countriesInFlight;
  final _options = <String, (DateTime, FormOptions)>{};

  @override
  Future<Result<List<AppSummary>>> myApplications() => _api.myApplications();

  @override
  Future<Result<Application>> start({int? copyFamilyFrom}) =>
      _api.start(copyFamilyFrom: copyFamilyFrom);

  @override
  Future<Result<Application>> fetch(int id) => _api.fetch(id);

  @override
  Future<Result<StepResult>> saveStep(
    int id,
    int step,
    Map<String, dynamic> data,
  ) => _api.saveStep(id, step, data);

  @override
  Future<Result<Application>> submit(int id) => _api.submitApplication(id);

  @override
  Future<Result<Application?>> withdraw(int id, {String reason = ''}) =>
      _api.withdrawApplication(id, reason: reason);

  @override
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
  }) => _api.uploadDocument(
    id,
    docType: docType,
    resultId: resultId,
    document: document,
    filePath: filePath,
    fileName: fileName,
    later: later,
    activity: activity,
    activityName: activityName,
  );

  @override
  Future<Result<Application>> removeDocument(int id, int documentId) =>
      _api.removeDocument(id, documentId);

  @override
  Future<Result<Application>> updateResult(
    int id,
    int resultId, {
    String? grade,
    bool? resultOut,
  }) => _api.updateResult(id, resultId, grade: grade, resultOut: resultOut);

  @override
  Future<Result<FormOptions>> formOptions({Level? level}) async {
    final key = level?.wire ?? '';
    final hit = _options[key];
    if (hit != null && _clock().difference(hit.$1) < _optionsTtl) {
      return ok(hit.$2);
    }
    final r = await _api.formOptions(level: level);
    r.fold((_) {}, (o) => _options[key] = (_clock(), o));
    return r;
  }

  @override
  Future<Result<List<SchoolHit>>> searchSchools(String q, {int offset = 0}) =>
      _api.searchSchools(q, offset: offset);

  @override
  Future<Result<List<Country>>> countries() {
    final cached = _countries;
    if (cached != null) return Future.value(ok(cached));
    return _countriesInFlight ??= _api.fetchCountries().then((r) {
      _countriesInFlight = null;
      r.fold((_) {}, (list) => _countries = list);
      return r;
    });
  }

  @override
  Future<Result<List<City>>> searchCities(String country, String q) =>
      _api.searchCities(country, q);

  @override
  Future<Result<List<TimeOption>>> interviewTimes(int id) =>
      _booking.interviewTimes(id);

  @override
  Future<Result<Application>> bookInterview(
    int id,
    String startsAt, {
    bool reschedule = false,
  }) => _booking.bookInterview(id, startsAt, reschedule: reschedule);

  @override
  Future<Result<List<TrialOption>>> trialSessions(int id, int booking) =>
      _booking.sessions(id, booking);

  @override
  Future<Result<Application>> bookTrial(int id, int booking, int session) =>
      _booking.bookTrial(id, booking, session);

  @override
  Future<Result<Application>> acceptOffer(int id, int offer) =>
      _offers.accept(id, offer);

  @override
  Future<Result<Uint8List>> offerPdf(
    int id,
    int offer,
    OfferPdf kind, {
    int? instalment,
  }) => _offers.download(id, offer, kind, instalment: instalment);

  @override
  Future<Result<Application>> submitEvidence(
    int id,
    int instalment, {
    required String filePath,
    required String fileName,
    required String method,
  }) => _offers.submitEvidence(
    id,
    instalment,
    filePath: filePath,
    fileName: fileName,
    method: method,
  );
}
