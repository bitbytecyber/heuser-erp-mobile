import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heuser_erp_mobile/core/format/format_checks.dart';

part 'form_errors.freezed.dart';

/// A problem with one field, keyed by the web form's field keys
/// (`first_name`, `pA.mobile`, `emg.cnic`, `teacher.12`, `results`…).
/// Copy lives in slang (`formErrorText`), so the domain stays language-free.
@freezed
sealed class FormError with _$FormError {
  /// Required and empty; [field] picks the message (`REQ` on the web).
  const factory FormError.required(String field) = FormRequired;

  /// Present but malformed.
  const factory FormError.format(FieldFormat format) = FormFormat;

  /// A subject without a teacher picked.
  const factory FormError.teacher(String subject) = FormTeacher;

  /// Statement under 80 words.
  const factory FormError.statementShort() = FormStatementShort;

  /// Statement over 300 words.
  const factory FormError.statementLong() = FormStatementLong;

  /// Server text, shown as is.
  const factory FormError.server(String message) = FormServer;
}

/// Field key → error.
typedef FormErrors = Map<String, FormError>;

/// Field keys that live on each step, so a server `missing` list can point
/// the form at the first offending step.
abstract final class FormFieldKeys {
  /// Keys of step 2 (everything else that is not step 3 is step 1).
  static const step2 = {
    'school',
    'school_campus',
    'studied_from',
    'studied_until',
    'qualification_other',
    'results',
    'subjects',
  };

  /// Keys of step 3.
  static const step3 = {'statement'};

  /// The step a field key belongs to.
  static int stepOf(String key) => step3.contains(key)
      ? 3
      : step2.contains(key) ||
            key.startsWith('teacher.') ||
            key.startsWith('referee.')
      ? 2
      : 1;

  /// The lowest step among [errors], or `null` when empty.
  static int? firstStep(FormErrors errors) {
    if (errors.isEmpty) return null;
    return errors.keys.map(stepOf).reduce((a, b) => a < b ? a : b);
  }
}
