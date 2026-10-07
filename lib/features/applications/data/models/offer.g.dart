// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OfferLine _$OfferLineFromJson(Map<String, dynamic> json) => _OfferLine(
  component: json['component'] as String? ?? '',
  label: json['label'] as String? ?? '',
  amount: json['amount'] as String? ?? '0',
  recurrence: json['recurrence'] as String? ?? 'one_time',
  normalPercent: json['normal_percent'] as String? ?? '0',
  afterNormal: json['after_normal'] as String? ?? '0',
  specialPercent: json['special_percent'] as String? ?? '0',
  net: json['net'] as String? ?? '0',
  saving: json['saving'] as String? ?? '0',
);

Map<String, dynamic> _$OfferLineToJson(_OfferLine instance) =>
    <String, dynamic>{
      'component': instance.component,
      'label': instance.label,
      'amount': instance.amount,
      'recurrence': instance.recurrence,
      'normal_percent': instance.normalPercent,
      'after_normal': instance.afterNormal,
      'special_percent': instance.specialPercent,
      'net': instance.net,
      'saving': instance.saving,
    };

_OfferCalculation _$OfferCalculationFromJson(Map<String, dynamic> json) =>
    _OfferCalculation(
      lines:
          (json['lines'] as List<dynamic>?)
              ?.map((e) => OfferLine.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <OfferLine>[],
      dueNow: json['due_now'] as String? ?? '0',
      monthly: json['monthly'] as String? ?? '0',
      tuitionMonths: (json['tuition_months'] as num?)?.toInt(),
      tuitionDue: json['tuition_due'] as String?,
      tuitionPeriod: json['tuition_period'] as String?,
    );

Map<String, dynamic> _$OfferCalculationToJson(_OfferCalculation instance) =>
    <String, dynamic>{
      'lines': instance.lines.map((e) => e.toJson()).toList(),
      'due_now': instance.dueNow,
      'monthly': instance.monthly,
      'tuition_months': instance.tuitionMonths,
      'tuition_due': instance.tuitionDue,
      'tuition_period': instance.tuitionPeriod,
    };

_OfferSubject _$OfferSubjectFromJson(Map<String, dynamic> json) =>
    _OfferSubject(
      course: (json['course'] as num).toInt(),
      courseName: json['course_name'] as String? ?? '',
      teacher: (json['teacher'] as num?)?.toInt() ?? 0,
      teacherName: json['teacher_name'] as String? ?? '',
    );

Map<String, dynamic> _$OfferSubjectToJson(_OfferSubject instance) =>
    <String, dynamic>{
      'course': instance.course,
      'course_name': instance.courseName,
      'teacher': instance.teacher,
      'teacher_name': instance.teacherName,
    };

_OfferScholarship _$OfferScholarshipFromJson(Map<String, dynamic> json) =>
    _OfferScholarship(
      type: (json['type'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      percent: json['percent'] as String? ?? '0',
      reason: json['reason'] as String? ?? '',
      appliedOnRemainder: json['applied_on_remainder'] as bool? ?? false,
    );

Map<String, dynamic> _$OfferScholarshipToJson(_OfferScholarship instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'percent': instance.percent,
      'reason': instance.reason,
      'applied_on_remainder': instance.appliedOnRemainder,
    };

_PaymentEvidence _$PaymentEvidenceFromJson(Map<String, dynamic> json) =>
    _PaymentEvidence(
      id: (json['id'] as num).toInt(),
      state: json['state'] as String? ?? 'pending',
      reason: json['reason'] as String? ?? '',
      method: json['method'] as String? ?? '',
      submittedAt: json['submitted_at'] as String? ?? '',
      amount: json['amount'] as String?,
      familyTold: json['family_told'] as bool?,
      replaceable: json['replaceable'] as bool?,
    );

Map<String, dynamic> _$PaymentEvidenceToJson(_PaymentEvidence instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state': instance.state,
      'reason': instance.reason,
      'method': instance.method,
      'submitted_at': instance.submittedAt,
      'amount': instance.amount,
      'family_told': instance.familyTold,
      'replaceable': instance.replaceable,
    };

_Instalment _$InstalmentFromJson(Map<String, dynamic> json) => _Instalment(
  id: (json['id'] as num).toInt(),
  sequence: (json['sequence'] as num?)?.toInt() ?? 0,
  kind: json['kind'] as String? ?? 'admission',
  amount: json['amount'] as String? ?? '0',
  dueDate: json['due_date'] as String?,
  unlocksEnrollment: json['unlocks_enrollment'] as bool? ?? false,
  paid: json['paid'] as bool? ?? false,
  paidAmount: json['paid_amount'] as String? ?? '0',
  remaining: json['remaining'] as String? ?? '0',
  shortAccepted: json['short_accepted'] as bool? ?? false,
  evidence:
      (json['evidence'] as List<dynamic>?)
          ?.map((e) => PaymentEvidence.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <PaymentEvidence>[],
);

Map<String, dynamic> _$InstalmentToJson(_Instalment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sequence': instance.sequence,
      'kind': instance.kind,
      'amount': instance.amount,
      'due_date': instance.dueDate,
      'unlocks_enrollment': instance.unlocksEnrollment,
      'paid': instance.paid,
      'paid_amount': instance.paidAmount,
      'remaining': instance.remaining,
      'short_accepted': instance.shortAccepted,
      'evidence': instance.evidence.map((e) => e.toJson()).toList(),
    };

_Offer _$OfferFromJson(Map<String, dynamic> json) => _Offer(
  id: (json['id'] as num).toInt(),
  version: (json['version'] as num?)?.toInt() ?? 1,
  state: json['state'] as String? ?? '',
  stateLabel: json['state_label'] as String? ?? '',
  isConditional: json['is_conditional'] as bool? ?? false,
  conditions: json['conditions'] as String? ?? '',
  subjects:
      (json['subjects'] as List<dynamic>?)
          ?.map((e) => OfferSubject.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <OfferSubject>[],
  calculation: json['calculation'] == null
      ? const OfferCalculation()
      : OfferCalculation.fromJson(json['calculation'] as Map<String, dynamic>),
  tuitionMonths: (json['tuition_months'] as num?)?.toInt(),
  tuitionAmount: json['tuition_amount'] as String?,
  tuitionFrom: json['tuition_from'] as String?,
  tuitionPeriod: json['tuition_period'] as String?,
  scholarships:
      (json['scholarships'] as List<dynamic>?)
          ?.map((e) => OfferScholarship.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <OfferScholarship>[],
  deadline: json['deadline'] as String?,
  extendedOnce: json['extended_once'] as bool? ?? false,
  sentAt: json['sent_at'] as String?,
  hasTerms: json['has_terms'] as bool? ?? false,
  instalments:
      (json['instalments'] as List<dynamic>?)
          ?.map((e) => Instalment.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Instalment>[],
);

Map<String, dynamic> _$OfferToJson(_Offer instance) => <String, dynamic>{
  'id': instance.id,
  'version': instance.version,
  'state': instance.state,
  'state_label': instance.stateLabel,
  'is_conditional': instance.isConditional,
  'conditions': instance.conditions,
  'subjects': instance.subjects.map((e) => e.toJson()).toList(),
  'calculation': instance.calculation.toJson(),
  'tuition_months': instance.tuitionMonths,
  'tuition_amount': instance.tuitionAmount,
  'tuition_from': instance.tuitionFrom,
  'tuition_period': instance.tuitionPeriod,
  'scholarships': instance.scholarships.map((e) => e.toJson()).toList(),
  'deadline': instance.deadline,
  'extended_once': instance.extendedOnce,
  'sent_at': instance.sentAt,
  'has_terms': instance.hasTerms,
  'instalments': instance.instalments.map((e) => e.toJson()).toList(),
};
