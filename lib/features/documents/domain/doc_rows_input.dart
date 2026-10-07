import 'package:heuser_erp_mobile/features/applications/data/models/documents.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_parts.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';

/// Inputs of `buildDocRows`.
class DocRowsInput {
  /// Creates the input.
  const DocRowsInput({
    required this.types,
    required this.slots,
    required this.results,
    required this.qualification,
    required this.predicted,
    required this.refereeName,
    required this.hasActivities,
    required this.sent,
    this.titles = const DocTitles(),
  });

  /// Document types of the cycle.
  final List<DocumentType> types;

  /// Slots on the application.
  final List<DocSlot> slots;

  /// Result rows (per-subject result files).
  final List<ResultRow> results;

  /// Current qualification (names the result document).
  final Qualification qualification;

  /// Every result still awaited.
  final bool predicted;

  /// Referee name (shows the recommendation row).
  final String refereeName;

  /// Any sport/activity (shows the certificate row).
  final bool hasActivities;

  /// The application has been submitted.
  final bool sent;

  /// Localised titles.
  final DocTitles titles;
}

/// Localised bits the builder needs (the app passes `t.*`).
class DocTitles {
  /// Creates the titles.
  const DocTitles({
    this.resultMatric = 'Matric result card',
    this.resultIgcse = 'IGCSE result',
    this.resultAkuEb = 'AKU-EB result',
    this.resultCaie = 'CAIE result',
    this.subPredicted = 'Upload it when results are announced.',
    this.subNow = 'You can add it now or later.',
    this.subAwaiting = "Awaiting result. Add it when it's announced, or send another combined statement.",
    this.replaceSub =
        'The office asked for a clearer copy. Please upload it again.',
  });

  /// Matric result card title.
  final String resultMatric;

  /// IGCSE result title.
  final String resultIgcse;

  /// AKU-EB result title.
  final String resultAkuEb;

  /// CAIE result title.
  final String resultCaie;

  /// Sub-line while every result is awaited.
  final String subPredicted;

  /// Sub-line otherwise.
  final String subNow;

  /// Sub-line for a subject a combined statement cannot cover yet.
  final String subAwaiting;

  /// Rejected copy sub-line.
  final String replaceSub;

  /// The result document's title for [q].
  String resultTitle(Qualification q) => switch (q) {
    Qualification.matric => resultMatric,
    Qualification.igcse => resultIgcse,
    Qualification.akuEb => resultAkuEb,
    _ => resultCaie,
  };
}
