import 'package:heuser_erp_mobile/features/application_form/domain/form_draft.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_options.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_parts.dart';

/// The `PATCH step/{n}/` body for a step (`form-model.ts` `payload`).
Map<String, dynamic> stepPayload(int step, FormDraft s, FormOptions? options) {
  return switch (step) {
    1 => _step1(s),
    2 => _step2(s, options),
    _ => {'statement': s.statement},
  };
}

Map<String, dynamic> _step1(FormDraft s) {
  final gs = s.shownGuardians.where((g) => g.isFilled);
  return {
    'level': s.level.wire,
    'first_name': s.firstName.trim(),
    'last_name': s.lastName.trim(),
    'date_of_birth': (s.dateOfBirth?.isEmpty ?? true) ? null : s.dateOfBirth,
    'gender': s.gender,
    'cnic': s.cnic,
    'religion': s.religion,
    'mobile': s.mobile,
    'email': s.email.trim(),
    'other_nationality': s.dual ? s.otherNationality : '',
    'address': s.address,
    'country': s.country,
    'city_id': s.cityId,
    'city_other': s.cityId != null ? '' : s.cityOther,
    'emergency_contact': {
      'same_as_parent': s.emg.same ? 'yes' : 'no',
      'first_name': s.emg.firstName,
      'last_name': s.emg.lastName,
      'name': '${s.emg.firstName} ${s.emg.lastName}'.trim(),
      'relation': s.emg.relation,
      'mobile': s.emg.mobile,
      'cnic': s.emg.cnic,
      'email': s.emg.email,
    },
    'guardians': [for (final g in gs) _guardian(g)],
    'siblings': s.sib
        ? [
            for (final x in s.siblings)
              if (x.name.trim().isNotEmpty)
                {'name': x.name, 'year_or_class': x.yearOrClass},
          ]
        : <Map<String, dynamic>>[],
  };
}

Map<String, dynamic> _guardian(Guardian g) => {
  if (g.id != null) 'id': g.id,
  'relation': g.relation,
  'first_name': g.firstName,
  'last_name': g.lastName,
  'cnic': g.cnic,
  'mobile': g.mobile,
  'email': g.email,
  'marital_status': g.maritalStatus,
  'work': g.work,
  'organisation': g.isEmployed ? g.organisation : '',
  'designation': g.isEmployed ? g.designation : '',
};

Map<String, dynamic> _step2(FormDraft s, FormOptions? options) {
  final private = s.isPrivateCandidate;
  return {
    'is_private_candidate': private,
    'school_id': private ? null : s.schoolId,
    'school_other': private || s.schoolId != null ? '' : s.schoolOther,
    'school_campus': private ? '' : s.schoolCampus.trim(),
    'studied_from': s.studiedFrom,
    'studied_until': s.studiedUntil,
    'qualification': s.qualification.wire,
    'qualification_other': s.qualification.wire == 'other'
        ? s.qualificationOther.trim()
        : '',
    'matric_percentage':
        s.qualification.wire == 'matric' && s.matricPercentage.isNotEmpty
        ? s.matricPercentage
        : null,
    'future_study': s.futureStudy,
    'referee': s.hasReferee ? _referee(s.referee) : _referee(const Referee()),
    'wants_sports_trial': s.wantsSportsTrial,
    'anything_else': s.more ? s.anythingElse : '',
    'results': [
      for (final r in s.results)
        {
          if (r.id != null) 'id': r.id,
          'subject': r.subject,
          'sitting_month': r.sittingMonth,
          'sitting_year': r.sittingYear,
          'result_out': r.resultOut,
          'grade': r.grade,
        },
    ],
    'subjects': [
      for (final x in s.subjects)
        if (x.teacher != 0) {'course': x.course, 'teacher': x.teacher},
    ],
    'activities': [
      for (final a in s.activities)
        {
          'kind': a.kind,
          'sport_id': a.sportId,
          'name': a.name,
          'level': a.level,
          'details': a.details,
          'wants_trial':
              a.isSport &&
              s.wantsSportsTrial &&
              (options?.sportHasTrial(a.sportId) ?? false),
        },
    ],
  };
}

Map<String, dynamic> _referee(Referee r) => {
  'name': r.name,
  'email': r.email,
  'organisation': r.organisation,
  'designation': r.designation,
};
