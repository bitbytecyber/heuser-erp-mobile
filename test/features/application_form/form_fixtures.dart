import 'package:heuser_erp_mobile/features/application_form/domain/form_draft.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_options.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_parts.dart';

/// A complete parent, as the web test's `parent`.
const parent = Guardian(
  relation: 'Father',
  firstName: 'Ali',
  lastName: 'Ahmed',
  cnic: '42101-1234567-1',
  mobile: '0300 1234567',
  email: 'ali.ahmed@example.com',
);

/// A draft that passes steps 1 and 2 (results added per test).
FormDraft completeDraft() => const FormDraft(
  firstName: 'Sara',
  lastName: 'Ahmed',
  dateOfBirth: '2010-03-15',
  gender: 'female',
  cnic: '42101-1111111-1',
  mobile: '0300 1112233',
  address: 'House 1',
  cityOther: 'Karachi',
  guardians: [parent, Guardian()],
  schoolId: 1,
  schoolText: 'Beaconhouse',
  schoolCampus: 'Gulshan',
  studiedFrom: 2020,
  studiedUntil: 2026,
  subjects: [
    SubjectPick(course: 1, teacher: 1),
    SubjectPick(course: 2, teacher: 2),
    SubjectPick(course: 3, teacher: 3),
  ],
);

/// A result that is out.
ResultRow out(String subject, String grade) => ResultRow(
  subject: subject,
  sittingMonth: 6,
  sittingYear: 2026,
  resultOut: true,
  grade: grade,
);

/// A result still awaited (optionally with a predicted grade).
ResultRow awaited(String subject, [String grade = '']) => ResultRow(
  subject: subject,
  sittingMonth: 11,
  sittingYear: 2026,
  grade: grade,
);

/// Options with three subjects (one with two teachers) and a sport.
const options = FormOptions(
  subjects: [
    SubjectOption(
      course: 1,
      name: 'Physics',
      teachers: [TeacherOption(id: 1, name: 'A')],
    ),
    SubjectOption(
      course: 2,
      name: 'Chemistry',
      teachers: [
        TeacherOption(id: 2, name: 'B'),
        TeacherOption(id: 5, name: 'C'),
      ],
    ),
    SubjectOption(
      course: 3,
      name: 'Maths',
      teachers: [TeacherOption(id: 3, name: 'D')],
    ),
  ],
  sports: [SportOption(id: 7, name: 'Cricket', hasTrial: true)],
);

/// A fresh draft application as the backend returns it after `POST`.
Application freshApplication({
  int id = 42,
  String updatedAt = '2026-10-01T10:00:00Z',
}) => Application(id: id, cycle: '2026', updatedAt: updatedAt);

/// A saved application echoing the given results.
Application savedApplication(
  Application base, {
  List<ResultRow>? results,
  int formStep = 2,
}) => base.copyWith(
  formStep: formStep,
  updatedAt: '2026-10-01T10:05:00Z',
  results: results ?? base.results,
);
