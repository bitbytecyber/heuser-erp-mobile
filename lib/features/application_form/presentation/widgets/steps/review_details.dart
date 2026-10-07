import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/format/format_checks.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_constants.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_draft.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_options.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_parts.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';
import 'package:intl/intl.dart';

/// A section of the review.
class ReviewSection {
  /// Creates a section.
  const ReviewSection({required this.title, required this.items, this.step});

  /// Heading.
  final String title;

  /// Step the "Edit" link opens (null = none).
  final int? step;

  /// (label, value) pairs; an empty value shows "Not added".
  final List<(String, String)> items;
}

/// "Your details" (step 3, with Edit links) and the tracker's read-only
/// Application tab (`review.tsx`).
class ReviewDetails extends StatelessWidget {
  /// Creates the review.
  const ReviewDetails({
    required this.draft,
    required this.options,
    required this.countryName,
    required this.collegeName,
    this.onEdit,
    this.readOnly = false,
    super.key,
  });

  /// The draft to show.
  final FormDraft draft;

  /// Options (subject and teacher names).
  final FormOptions? options;

  /// ISO code → display name.
  final String Function(String code) countryName;

  /// College name for the copy.
  final String collegeName;

  /// "Edit" handler (step 1 or 2).
  final ValueChanged<int>? onEdit;

  /// Adds the statement and hides Edit links.
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final sections = buildReviewSections(
      draft,
      options,
      t,
      countryName: countryName,
      collegeName: collegeName,
      readOnly: readOnly,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final sec in sections) ...[
          HKeyValueGroup(
            title: sec.title,
            trailing: !readOnly && onEdit != null && sec.step != null
                ? HButton.ghost(
                    label: t.common.edit,
                    size: HButtonSize.sm,
                    onPressed: () => onEdit!(sec.step!),
                  )
                : null,
            children: [
              for (final (label, value) in sec.items)
                HKeyValue(
                  label: label,
                  value: value,
                  emptyPlaceholder: t.common.notAdded,
                ),
            ],
          ),
          HSpace.gap3,
        ],
      ],
    );
  }
}

String _date(String? iso) {
  if (iso == null || iso.isEmpty) return '';
  final d = DateTime.tryParse(iso);
  return d == null ? iso : DateFormat('d MMMM yyyy').format(d);
}

/// The sections, as pure data (tested).
List<ReviewSection> buildReviewSections(
  FormDraft s,
  FormOptions? options,
  Translations t, {
  required String Function(String code) countryName,
  required String collegeName,
  bool readOnly = false,
}) {
  final r = t.form.review;
  String work(Guardian g) => [
    switch (g.work) {
      'Self-employed' => r.ownBusiness,
      'Unemployed' => r.notWorking,
      _ => g.work,
    },
    g.organisation,
    g.designation,
  ].where((x) => x.isNotEmpty).join(' · ');
  List<(String, String)> person(Guardian g) => [
    (r.name, '${g.firstName} ${g.lastName}'.trim()),
    (r.relation, g.relation),
    (t.form.parents.cnic, g.cnic),
    (r.mobile, FormatChecks.showPhone(g.mobile)),
    (r.email, g.email),
    (r.maritalStatus, g.maritalStatus),
    (r.work, work(g)),
  ];
  String subjectLabel(SubjectPick p) {
    final o = options?.subject(p.course);
    if (o == null) return p.courseName ?? '';
    final te = o.teachers.where((x) => x.id == p.teacher).firstOrNull;
    return te == null ? o.name : r.kWith(subject: o.name, teacher: te.name);
  }

  final rel = s.guardians[0].relation.isEmpty
      ? t.form.emergency.sameAsFirst
      : r.sameAs(relation: s.guardians[0].relation.toLowerCase());
  final graded = s.results.where((x) => x.grade.isNotEmpty || !x.resultOut);
  final sibs = s.siblings.where((x) => x.name.trim().isNotEmpty).toList();
  final qual = switch (s.qualification) {
    Qualification.oLevel => t.form.school.oLevel,
    Qualification.igcse => t.form.school.igcse,
    Qualification.matric => t.form.school.matric,
    Qualification.akuEb => t.form.school.akuEb,
    Qualification.other =>
      s.qualificationOther.isEmpty ? t.form.school.other : s.qualificationOther,
  };
  return [
    ReviewSection(
      title: r.you,
      step: 1,
      items: [
        (
          r.applyingFor,
          s.level == Level.as_
              ? t.applications.levelAS
              : t.applications.levelA2,
        ),
        (r.name, '${s.firstName} ${s.lastName}'.trim()),
        (r.dob, _date(s.dateOfBirth)),
        (r.gender, s.gender.isEmpty ? '' : FormRules.capFirst(s.gender)),
        (r.cnic, s.cnic),
        (r.religion, s.religion),
        (r.mobile, FormatChecks.showPhone(s.mobile)),
        (r.email, s.email),
        (
          r.dual,
          s.dual
              ? (s.otherNationality.isEmpty
                    ? t.common.yes
                    : countryName(s.otherNationality))
              : t.common.no,
        ),
        (
          r.home,
          [
            s.address,
            s.cityText,
            if (s.country.isNotEmpty) countryName(s.country),
          ].where((x) => x.isNotEmpty).join(', '),
        ),
      ],
    ),
    ReviewSection(title: r.parent, step: 1, items: person(s.guardians[0])),
    if (s.parentB)
      ReviewSection(
        title: r.secondParent,
        step: 1,
        items: person(s.guardians[1]),
      ),
    ReviewSection(
      title: r.emergency,
      step: 1,
      items: s.emg.same
          ? [(r.contact, rel)]
          : [
              (r.name, '${s.emg.firstName} ${s.emg.lastName}'.trim()),
              (r.relation, s.emg.relation),
              (r.mobile, FormatChecks.showPhone(s.emg.mobile)),
              (r.cnic, s.emg.cnic),
              (r.email, s.emg.email),
            ],
    ),
    if (s.sib && sibs.isNotEmpty)
      ReviewSection(
        title: r.siblings(name: collegeName),
        step: 1,
        items: [
          (
            r.siblings(name: collegeName),
            sibs
                .map(
                  (x) => x.yearOrClass.isEmpty
                      ? x.name
                      : '${x.name} (${x.yearOrClass})',
                )
                .join(', '),
          ),
        ],
      ),
    ReviewSection(
      title: r.studies,
      step: 2,
      items: [
        (r.school, s.isPrivateCandidate ? r.privateCandidate : s.schoolText),
        (
          r.years,
          s.studiedFrom != null || s.studiedUntil != null
              ? '${s.studiedFrom ?? ''} – ${s.studiedUntil ?? ''}'
              : '',
        ),
        (r.qualification, qual),
        if (s.qualification == Qualification.matric &&
            s.matricPercentage.isNotEmpty)
          (r.percentage, '${s.matricPercentage}%'),
        (
          r.results,
          graded
              .map((x) {
                final ses = FormRules.sessionLabel(
                  x.sittingMonth,
                  x.sittingYear,
                );
                final what = x.resultOut
                    ? x.grade
                    : '${r.awaited}${x.grade.isNotEmpty ? ', ${r.expected(grade: x.grade)}' : ''}';
                return '${x.subject} $what${ses.isNotEmpty ? ' ($ses)' : ''}';
              })
              .join(' · '),
        ),
        (
          r.choices,
          s.subjects.map(subjectLabel).where((x) => x.isNotEmpty).join(', '),
        ),
        (r.future, s.futureStudy),
        (
          r.referee,
          [
            s.referee.name,
            s.referee.email,
          ].where((x) => x.isNotEmpty).join(' · '),
        ),
      ],
    ),
    ReviewSection(
      title: r.beyond,
      step: 2,
      items: [
        (
          r.sports,
          s.sports
              .map(
                (a) =>
                    '${a.name} (${a.level.isEmpty ? 'School' : a.level})'
                    '${a.details.isNotEmpty ? ': ${a.details}' : ''}',
              )
              .join(' · '),
        ),
        (
          r.activities,
          s.otherActivities
              .map(
                (a) =>
                    '${a.name}${a.details.isNotEmpty ? ': ${a.details}' : ''}',
              )
              .join(' · '),
        ),
        (r.trial, s.wantsSportsTrial ? r.trialYes : t.common.no),
        if (s.more) (r.anythingElse, s.anythingElse),
      ],
    ),
    if (readOnly)
      ReviewSection(title: r.statement, items: [(r.statement, s.statement)]),
  ];
}
