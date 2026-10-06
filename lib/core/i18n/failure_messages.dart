import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';

/// The one place a [Failure] becomes words. Server text is used only for
/// validation problems, where the server's wording is the useful one.
String failureMessage(Failure f, Translations t) => switch (f) {
  NoConnection() => t.errors.noConnection,
  Unreachable() => t.errors.unreachable,
  Timeout() => t.errors.timeout,
  Unauthenticated() => t.errors.sessionExpired,
  Forbidden(:final message) => message ?? t.errors.forbidden,
  NotFound() => t.errors.notFound,
  Validation(:final message) => message ?? t.errors.invalid,
  Conflict(:final message) => message ?? t.errors.conflict,
  RateLimited() => t.errors.rateLimited,
  ModuleDisabled() => t.errors.moduleDisabled,
  Server() => t.errors.server,
  Cancelled() => '',
  Unknown() => t.common.somethingWentWrong,
};

/// Field-level message for [field], if the failure carries one.
String? fieldError(Failure? f, String field) => switch (f) {
  Validation(:final fieldErrors) => fieldErrors[field],
  _ => null,
};
