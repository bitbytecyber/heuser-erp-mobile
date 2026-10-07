import 'package:heuser_erp_mobile/core/format/format_checks.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_constants.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_draft.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_errors.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_options.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';

/// Client-side check of step 1 or 2 (`form-model.ts` `validate`, spec §3.3).
/// Returns field key → error; empty when the step is complete.
FormErrors validateStep(int step, FormDraft s, FormOptions? options) {
  final e = <String, FormError>{};
  void need(String key, Object? v, [String? messageKey]) {
    if (v == null || (v is String && v.trim().isEmpty)) {
      e[key] = FormError.required(messageKey ?? key);
    }
  }

  void fmt(String key, String v, FieldFormat f) {
    if (!e.containsKey(key) && v.isNotEmpty && !FormatChecks.ok(f, v)) {
      e[key] = FormError.format(f);
    }
  }

  if (step == 1) {
    need('first_name', s.firstName);
    need('last_name', s.lastName);
    need('date_of_birth', s.dateOfBirth);
    need('gender', s.gender);
    need('cnic', s.cnic);
    fmt('cnic', s.cnic, FieldFormat.cnic);
    need('mobile', s.mobile);
    fmt('mobile', s.mobile, FieldFormat.phone);
    fmt('email', s.email, FieldFormat.email);
    if (s.dual) need('other_nationality', s.otherNationality);
    need('address', s.address);
    need('city', s.cityId != null ? 'x' : s.cityOther);
    need('country', s.country);
    final prefixes = s.parentB ? const ['pA', 'pB'] : const ['pA'];
    for (var i = 0; i < prefixes.length; i++) {
      final p = prefixes[i];
      final g = s.guardians[i];
      need('$p.relation', g.relation, 'parent.relation');
      need('$p.first_name', g.firstName, 'parent.first_name');
      need('$p.last_name', g.lastName, 'parent.last_name');
      need('$p.cnic', g.cnic, 'parent.cnic');
      need('$p.mobile', g.mobile, 'parent.mobile');
      need('$p.email', g.email, 'parent.email');
      fmt('$p.cnic', g.cnic, FieldFormat.cnic);
      fmt('$p.mobile', g.mobile, FieldFormat.phone);
      fmt('$p.email', g.email, FieldFormat.email);
    }
    if (!s.emg.same) {
      need('emg.first_name', s.emg.firstName);
      need('emg.last_name', s.emg.lastName);
      need('emg.relation', s.emg.relation);
      need('emg.mobile', s.emg.mobile);
      fmt('emg.mobile', s.emg.mobile, FieldFormat.phone);
      fmt('emg.cnic', s.emg.cnic, FieldFormat.cnic);
      fmt('emg.email', s.emg.email, FieldFormat.email);
    }
    return e;
  }
  if (step == 2) {
    if (!s.isPrivateCandidate) {
      need('school', s.schoolId != null ? 'x' : s.schoolOther);
      need('school_campus', s.schoolCampus);
      need('studied_from', s.studiedFrom);
      need('studied_until', s.studiedUntil);
    }
    if (s.qualification == Qualification.other) {
      need('qualification_other', s.qualificationOther);
    }
    // Mix freely: results that are out need a grade; awaited ones only the sitting.
    final counted = s.results.where(
      (r) => r.resultOut ? r.grade.isNotEmpty : r.sittingYear != null,
    );
    if (counted.length < FormRules.minResults ||
        s.results.any((r) => r.resultOut && r.grade.isEmpty)) {
      e['results'] = const FormError.required('results');
    }
    if (s.subjects.length < FormRules.minSubjects) {
      e['subjects'] = const FormError.required('subjects');
    }
    for (final pick in s.subjects) {
      if (pick.teacher == 0) {
        final o = options?.subject(pick.course);
        e['teacher.${pick.course}'] = FormError.teacher(o?.name ?? '');
      }
    }
    if (s.hasReferee) fmt('referee.email', s.referee.email, FieldFormat.email);
    return e;
  }
  // Step 3: the statement length.
  final words = s.statementWords;
  if (words < FormRules.minWords) {
    e['statement'] = const FormError.statementShort();
  } else if (words > FormRules.maxWords) {
    e['statement'] = const FormError.statementLong();
  }
  return e;
}

/// Server `missing` keys (intake `save_step`) → field errors
/// (`form-model.ts` `serverMissing`).
FormErrors serverMissing(List<String> missing) => {
  for (final m in missing)
    if (m == 'guardians')
      'pA.first_name': const FormError.required('guardians')
    else if (m == 'statement')
      'statement': const FormError.statementShort()
    else
      m: FormError.required(_parentKey(m)),
};

/// `pA.cnic` → `parent.cnic`, so both parents share one message.
String _parentKey(String key) => key.startsWith('pA.') || key.startsWith('pB.')
    ? 'parent.${key.substring(3)}'
    : key;
