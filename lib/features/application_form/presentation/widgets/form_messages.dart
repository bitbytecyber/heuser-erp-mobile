import 'package:heuser_erp_mobile/core/format/format_checks.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_errors.dart';

/// The one place a [FormError] becomes words.
String formErrorText(FormError e, Translations t) => switch (e) {
  FormRequired(:final field) => _required(field, t),
  FormFormat(:final format) => switch (format) {
    FieldFormat.phone => t.form.errors.format.phone,
    FieldFormat.email => t.form.errors.format.email,
    FieldFormat.cnic => t.form.errors.format.cnic,
  },
  FormTeacher(:final subject) =>
    subject.isEmpty
        ? t.form.errors.teacherGeneric
        : t.form.errors.teacher(subject: subject),
  FormStatementShort() => t.form.errors.statementShort,
  FormStatementLong() => t.form.errors.statementLong,
  FormServer(:final message) => message,
};

String _required(String field, Translations t) {
  final r = t.form.errors.req;
  return switch (field) {
    'first_name' => r.first_name,
    'last_name' => r.last_name,
    'date_of_birth' => r.date_of_birth,
    'gender' => r.gender,
    'cnic' => r.cnic,
    'mobile' => r.mobile,
    'other_nationality' => r.other_nationality,
    'address' => r.address,
    'city' => r.city,
    'country' => r.country,
    'guardians' => r.guardians,
    'emg.first_name' => r.emg_first_name,
    'emg.last_name' => r.emg_last_name,
    'emg.relation' => r.emg_relation,
    'emg.mobile' => r.emg_mobile,
    'school' => r.school,
    'school_campus' => r.school_campus,
    'qualification_other' => r.qualification_other,
    'studied_from' => r.studied_from,
    'studied_until' => r.studied_until,
    'results' => r.results,
    'subjects' => r.subjects,
    'parent.relation' => r.parent_relation,
    'parent.first_name' => r.parent_first_name,
    'parent.last_name' => r.parent_last_name,
    'parent.cnic' => r.parent_cnic,
    'parent.mobile' => r.parent_mobile,
    'parent.email' => r.parent_email,
    _ => r.other,
  };
}
