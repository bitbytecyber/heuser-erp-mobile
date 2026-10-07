import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';
import 'package:heuser_erp_mobile/features/documents/domain/doc_rows.dart';
import 'package:heuser_erp_mobile/features/documents/domain/doc_rows_input.dart';

/// Localised labels and tones for document rows (`PILL` / `statusPill` on
/// the web).
abstract final class DocLabels {
  /// The "when is it needed" pill for a row (by stage).
  static (String, HTone) stagePill(DocRow? row, Translations t) {
    final p = t.documents.pills;
    if (row == null) return (p.optional, HTone.neutral);
    if (row.early) return (p.early, HTone.warning);
    return switch (row.stage) {
      DocStage.beforeInterview => (p.beforeInterview, HTone.brand),
      DocStage.afterResults => (p.afterResults, HTone.warning),
      DocStage.atEnrolment => (p.atEnrolment, HTone.warning),
      _ => (p.optional, HTone.neutral),
    };
  }

  /// The status pill for a row (state first, then stage).
  static (String, HTone) statusPill(DocRow row, Translations t) {
    final p = t.documents.pills;
    return switch (row.state) {
      DocState.ready => (p.added, HTone.success),
      DocState.checking => (p.checking, HTone.warning),
      // The applicant only needs to know it arrived; the review is the office's.
      DocState.verified => (p.received, HTone.success),
      DocState.replace => (p.replace, HTone.danger),
      DocState.later => (p.later, HTone.neutral),
      DocState.missing => stagePill(row, t),
    };
  }

  /// Group heading.
  static String group(DocGroup g, Translations t) => switch (g) {
    DocGroup.beforeInterview => t.documents.groups.beforeInterview,
    DocGroup.later => t.documents.groups.later,
    DocGroup.certificates => t.documents.groups.certificates,
    DocGroup.enrolment => t.documents.groups.enrolment,
  };

  /// Titles handed to `buildDocRows`.
  static DocTitles titles(Translations t) => DocTitles(
    resultMatric: t.documents.resultTitle.matric,
    resultIgcse: t.documents.resultTitle.igcse,
    resultAkuEb: t.documents.resultTitle.akuEb,
    resultCaie: t.documents.resultTitle.caie,
    subPredicted: t.documents.resultSubPredicted,
    subNow: t.documents.resultSubNow,
    subAwaiting: t.documents.resultAwaiting,
    replaceSub: t.documents.replaceSub,
  );

  /// The `HFileState` matching a row.
  static HFileState fileState(DocRow row, {required bool busy}) {
    if (busy) return HFileState.uploading;
    return switch (row.state) {
      DocState.missing => HFileState.missing,
      DocState.later => HFileState.later,
      DocState.ready => HFileState.pending,
      DocState.checking => HFileState.pending,
      DocState.verified => HFileState.approved,
      DocState.replace => HFileState.rejected,
    };
  }

  /// Labels for `HFilePickerTile`.
  static HFileLabels fileLabels(DocRow? row, Translations t) {
    final d = t.documents;
    final (stage, _) = stagePill(row, t);
    return HFileLabels(
      missing: stage,
      later: d.pills.later,
      uploading: d.uploading,
      pending: row?.state == DocState.checking
          ? d.pills.checking
          : d.pills.added,
      approved: d.pills.received,
      rejected: d.pills.replace,
      upload: d.upload,
      replace: d.replace,
      laterAction: d.later,
      remove: d.remove,
      open: d.open,
    );
  }
}
