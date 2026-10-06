import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// Everything that can go wrong at an async boundary, as one sealed type.
///
/// Repositories return `Result<T>` (`Either<Failure, T>`), never throw. The
/// user-facing copy for each case lives in `core/i18n/failure_messages.dart`;
/// only [Validation.message] carries server text, because the server's own
/// wording for a validation problem is the useful one.
@freezed
sealed class Failure with _$Failure {
  const Failure._();

  /// The device has no transport (airplane mode, radios off).
  const factory Failure.noConnection({Uri? uri}) = NoConnection;

  /// Transport exists but the backend could not be reached (DNS, captive
  /// portal, TLS, server down).
  const factory Failure.unreachable({Uri? uri}) = Unreachable;

  /// Connect / send / receive timeout.
  const factory Failure.timeout({Uri? uri}) = Timeout;

  /// 401 on `/api/v1/*`, or a 403 whose body says `UNAUTHENTICATED`: no live
  /// session. Handled globally by the auth layer.
  const factory Failure.unauthenticated({String? message}) = Unauthenticated;

  /// 403 with any other body: a capability denial on a live session.
  const factory Failure.forbidden({String? message}) = Forbidden;

  /// 404.
  const factory Failure.notFound({String? message}) = NotFound;

  /// 400 / 422. Admissions errors arrive as `{code, detail, details}`;
  /// allauth errors as `{errors: [{code, message, param}]}`; DRF field errors
  /// as `{field: [messages]}`. All are folded into this shape.
  const factory Failure.validation({
    required String code,
    String? message,
    Map<String, dynamic>? details,
    @Default(<String>[]) List<String> missing,
    @Default(<String, String>{}) Map<String, String> fieldErrors,
  }) = Validation;

  /// 409.
  const factory Failure.conflict({String? message}) = Conflict;

  /// 429.
  const factory Failure.rateLimited() = RateLimited;

  /// 503 `{code: "module_disabled"}`: the admissions module is switched off.
  const factory Failure.moduleDisabled({required String code}) = ModuleDisabled;

  /// Other 5xx.
  const factory Failure.server({int? status}) = Server;

  /// The request was cancelled by us.
  const factory Failure.cancelled() = Cancelled;

  /// Anything that could not be classified.
  const factory Failure.unknown({Object? cause}) = Unknown;

  /// About *reaching* the backend rather than what it said. Only these
  /// justify "check your internet" copy and feed the offline banner.
  bool get isConnectivity => switch (this) {
    NoConnection() || Unreachable() || Timeout() => true,
    _ => false,
  };

  /// Retrying could plausibly succeed.
  bool get isTransient => isConnectivity || this is Server;

  /// A problem with the session or permissions.
  bool get isAuth => this is Unauthenticated || this is Forbidden;
}
