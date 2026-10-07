import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heuser_erp_mobile/core/format/masks.dart';
import 'package:heuser_erp_mobile/core/geo/country_order.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_parts.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';

part 'form_draft.freezed.dart';
part 'form_draft.g.dart';

/// The emergency contact block of step 1.
@freezed
abstract class Emergency with _$Emergency {
  /// Creates the block.
  const factory Emergency({
    @Default(true) bool same,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String relation,
    @Default('') String mobile,
    @Default('') String cnic,
    @Default('') String email,
  }) = _Emergency;

  /// From JSON (draft cache).
  factory Emergency.fromJson(Map<String, dynamic> json) =>
      _$EmergencyFromJson(json);
}

/// The draft as the three steps edit it (`form-model.ts` `FormState`),
/// mapped to and from the intake API by [FormDraft.fromApplication] and
/// `stepPayload`. Countries are ISO codes; cities and schools are a
/// catalogue id or free text (`…Other`).
@freezed
abstract class FormDraft with _$FormDraft {
  /// Creates a draft.
  const factory FormDraft({
    @Default(Level.as_) Level level,
    @Default('') String firstName,
    @Default('') String lastName,
    String? dateOfBirth,
    @Default('') String gender,
    @Default('') String cnic,
    @Default('') String religion,
    @Default('') String mobile,
    @Default('') String email,
    @Default(false) bool dual,
    @Default('') String otherNationality,
    @Default('') String address,
    @Default(CountryOrder.defaultCountry) String country,
    int? cityId,
    @Default('') String cityOther,
    @Default('') String cityText,
    @Default(<Guardian>[Guardian(), Guardian()]) List<Guardian> guardians,
    @Default(false) bool parentB,
    @Default(Emergency()) Emergency emg,
    @Default(false) bool sib,
    @Default(<Sibling>[Sibling()]) List<Sibling> siblings,
    // step 2
    @Default(false) bool isPrivateCandidate,
    int? schoolId,
    @Default('') String schoolOther,
    @Default('') String schoolText,
    @Default('') String schoolCampus,
    int? studiedFrom,
    int? studiedUntil,
    @Default(Qualification.oLevel) Qualification qualification,
    @Default('') String qualificationOther,
    @Default('') String matricPercentage,
    @Default(<ResultRow>[]) List<ResultRow> results,
    @Default(<SubjectPick>[]) List<SubjectPick> subjects,
    @Default('') String futureStudy,
    @Default(false) bool hasReferee,
    @Default(Referee()) Referee referee,
    @Default(<ActivityRow>[]) List<ActivityRow> activities,
    @Default(false) bool wantsSportsTrial,
    @Default(false) bool more,
    @Default('') String anythingElse,
    // step 3
    @Default('') String statement,
  }) = _FormDraft;
  const FormDraft._();

  /// From JSON (draft cache).
  factory FormDraft.fromJson(Map<String, dynamic> json) =>
      _$FormDraftFromJson(json);

  /// Builds the draft from an application. [userEmail] fills an empty email
  /// from the signed-in account, as the web form does.
  factory FormDraft.fromApplication(Application a, {String? userEmail}) {
    final p = a.profile;
    final ec = p.emergencyContact;
    final ecName = (ec['name'] ?? '').toString().split(' ');
    final g = [
      for (final x in a.guardians)
        x.copyWith(cnic: Masks.cnic(x.cnic), mobile: Masks.phone(x.mobile)),
    ];
    final country = p.country.isNotEmpty
        ? p.country
        : CountryOrder.defaultCountry;
    // A new Pakistan address starts in Karachi, but only when no city is
    // chosen yet (country is pre-set to PK, so keying off `!country` skipped it).
    final freshAddress =
        country == CountryOrder.defaultCountry &&
        p.cityId == null &&
        p.cityOther.isEmpty &&
        a.cityName.isEmpty;
    final email = p.email.isNotEmpty ? p.email : (userEmail ?? '');
    return FormDraft(
      level: a.level,
      firstName: p.firstName,
      lastName: p.lastName,
      dateOfBirth: p.dateOfBirth,
      gender: p.gender,
      cnic: Masks.cnic(p.cnic),
      religion: p.religion,
      mobile: Masks.phone(p.mobile),
      email: email,
      dual: p.otherNationality.isNotEmpty,
      otherNationality: p.otherNationality,
      address: p.address,
      country: country,
      cityId: p.cityId,
      cityOther: freshAddress ? CountryOrder.defaultCity : p.cityOther,
      cityText: freshAddress ? CountryOrder.defaultCity : a.cityName,
      guardians: [
        if (g.isNotEmpty) g[0] else const Guardian(),
        if (g.length > 1) g[1] else const Guardian(),
      ],
      parentB: g.length > 1,
      emg: Emergency(
        same: ec['same_as_parent'] != 'no',
        firstName: _s(ec['first_name']) ?? ecName.first,
        lastName: _s(ec['last_name']) ?? ecName.skip(1).join(' '),
        relation: _s(ec['relation']) ?? '',
        mobile: Masks.phone(_s(ec['mobile']) ?? ''),
        cnic: Masks.cnic(_s(ec['cnic']) ?? ''),
        email: _s(ec['email']) ?? '',
      ),
      sib: a.siblings.isNotEmpty,
      siblings: a.siblings.isNotEmpty ? a.siblings : const [Sibling()],
      isPrivateCandidate: p.isPrivateCandidate,
      schoolId: p.schoolId,
      schoolOther: p.schoolOther,
      schoolText: p.isPrivateCandidate ? '' : a.schoolName,
      schoolCampus: p.schoolCampus,
      studiedFrom: p.studiedFrom,
      studiedUntil: p.studiedUntil,
      qualification: p.qualification,
      qualificationOther: p.qualificationOther,
      matricPercentage: p.matricPercentage ?? '',
      results: a.results,
      subjects: [
        for (final s in a.subjects)
          SubjectPick(course: s.course, teacher: s.teacher),
      ],
      futureStudy: p.futureStudy,
      hasReferee: p.referee.isFilled,
      referee: p.referee,
      activities: a.activities,
      wantsSportsTrial: p.wantsSportsTrial,
      more: p.anythingElse.isNotEmpty,
      anythingElse: p.anythingElse,
      statement: p.statement,
    );
  }

  static String? _s(Object? v) => v is String ? v : null;

  /// Guardians that count: the first, plus the second when it is shown.
  List<Guardian> get shownGuardians => parentB ? guardians : [guardians.first];

  /// Every result is still awaited (chooses wording on the results block).
  bool get predicted =>
      results.isNotEmpty && results.every((r) => !r.resultOut);

  /// Sports among the activities.
  List<ActivityRow> get sports => activities.where((a) => a.isSport).toList();

  /// Non-sport activities.
  List<ActivityRow> get otherActivities =>
      activities.where((a) => !a.isSport).toList();

  /// Statement word count.
  int get statementWords => RegExp(r'\S+').allMatches(statement).length;
}
