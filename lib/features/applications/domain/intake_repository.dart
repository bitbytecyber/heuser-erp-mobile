import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application_summary.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_options.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';

/// What the applicant can do with their applications. The intake payloads
/// are the contract shared with the web portal, so the DTOs in
/// `data/models` are the entities (see architecture-rules "DTO vs entity").
abstract interface class IntakeRepository {
  /// Own applications, newest first as the backend orders them.
  Future<Result<List<AppSummary>>> myApplications();

  /// Starts a draft, optionally copying the family block of another one.
  Future<Result<Application>> start({int? copyFamilyFrom});

  /// One application in full.
  Future<Result<Application>> fetch(int id);

  /// Saves a step; the result lists what is still missing.
  Future<Result<StepResult>> saveStep(
    int id,
    int step,
    Map<String, dynamic> data,
  );

  /// Sends the application (`400 missing_fields` when incomplete).
  Future<Result<Application>> submit(int id);

  /// Withdraws; a draft is deleted and resolves to `null`.
  Future<Result<Application?>> withdraw(int id, {String reason});

  /// Uploads, defers or replaces a document.
  Future<Result<Application>> uploadDocument(
    int id, {
    required int docType,
    int? resultId,
    int? document,
    String? filePath,
    String? fileName,
    bool later,
    String? activity,
    String? activityName,
  });

  /// Takes back an unchecked upload.
  Future<Result<Application>> removeDocument(int id, int documentId);

  /// Updates a result row after submission.
  Future<Result<Application>> updateResult(
    int id,
    int resultId, {
    String? grade,
    bool? resultOut,
  });

  /// Subjects, sports and document types for a level (cached briefly).
  Future<Result<FormOptions>> formOptions({Level? level});

  /// School catalogue search, 30 per page by offset.
  Future<Result<List<SchoolHit>>> searchSchools(String q, {int offset});

  /// Every country (cached for the session).
  Future<Result<List<Country>>> countries();

  /// Cities of a country matching [q].
  Future<Result<List<City>>> searchCities(String country, String q);

  /// Interview times open to the applicant.
  Future<Result<List<TimeOption>>> interviewTimes(int id);

  /// Books or (with [reschedule]) moves the interview.
  Future<Result<Application>> bookInterview(
    int id,
    String startsAt, {
    bool reschedule,
  });

  /// Sessions open for a trial booking.
  Future<Result<List<TrialOption>>> trialSessions(int id, int booking);

  /// Books a trial session.
  Future<Result<Application>> bookTrial(int id, int booking, int session);
}
