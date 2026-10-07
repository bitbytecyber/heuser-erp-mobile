import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/documents.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';
import 'package:heuser_erp_mobile/features/documents/domain/doc_rows_input.dart';

part 'doc_rows.freezed.dart';

/// The applicant-facing state of one document row.
enum DocState {
  /// Nothing sent.
  missing,

  /// Sent, application not yet submitted.
  ready,

  /// Deferred.
  later,

  /// Sent; the office is checking it.
  checking,

  /// Approved by the office.
  verified,

  /// Rejected: a clearer copy is needed.
  replace,
}

/// Which list a row belongs to, in display order.
enum DocGroup {
  /// Needed before your interview.
  beforeInterview,

  /// Add when you have them.
  later,

  /// Certificates.
  certificates,

  /// Needed at enrolment.
  enrolment,
}

/// A copy sent before the current one.
@freezed
abstract class EarlierCopy with _$EarlierCopy {
  /// Creates a copy.
  const factory EarlierCopy({
    required VersionState state,
    required String at,
    String? file,
  }) = _EarlierCopy;
}

/// One row of the documents list (`documents-list.tsx` `DocRow`): the attach
/// cards on steps 1–2, the list on step 3 and the tracker share it.
@freezed
abstract class DocRow with _$DocRow {
  /// Creates a row.
  const factory DocRow({
    required String key,
    required String code,
    required int docType,
    required String title,
    required String sub,
    required DocStage stage,
    required DocGroup group,
    required DocState state,
    int? docId,
    int? result,
    @Default('') String activity,
    @Default(false) bool early,
    @Default('') String reason,
    String? file,
    String? url,
    @Default(true) bool actionable,
    @Default(false) bool isResult,
    @Default(false) bool removable,
    @Default(<EarlierCopy>[]) List<EarlierCopy> earlier,
  }) = _DocRow;
  const DocRow._();

  /// The latest copy is an image (thumbnail).
  bool get isImage => url != null && _imageRe.hasMatch(url!);

  /// Sent in some form.
  bool get isDone => state == DocState.ready || state == DocState.verified;
}

final _imageRe = RegExp(
  r'\.(png|jpe?g|webp|gif|bmp|heic|heif)(\?|$)',
  caseSensitive: false,
);

DocState _stateOf(DocSlot? slot, bool sent) => switch (slot?.state) {
  DocSlotState.pending => sent ? DocState.checking : DocState.ready,
  DocSlotState.approved => DocState.verified,
  DocSlotState.rejected => DocState.replace,
  // "Later" (from before it was dropped) is just not sent yet.
  _ => DocState.missing,
};

String? _fileName(String? url) {
  if (url == null) return null;
  final last = url.split('?').first.split('/').last;
  try {
    final d = Uri.decodeComponent(last);
    return d.isEmpty ? null : d;
  } on Object catch (_) {
    return last.isEmpty ? null : last;
  }
}

/// Builds the rows, line for line with `documents-list.tsx` `buildDocRows`.
List<DocRow> buildDocRows(DocRowsInput input) {
  final bySlot = {
    for (final s in input.slots) '${s.docType}:${s.result ?? ''}': s,
  };
  final rows = <DocRow>[];

  void push(
    DocumentType dt,
    int? result,
    String title,
    String sub, {
    bool actionable = true,
    DocSlot? slotOverride,
  }) {
    final slot = slotOverride ?? bySlot['${dt.id}:${result ?? ''}'];
    final key = slotOverride != null
        ? 'slot:${slotOverride.id}'
        : '${dt.id}:${result ?? ''}';
    final state = _stateOf(slot, input.sent);
    // "Before interview" only when the office really needs it before booking;
    // otherwise it is asked for early but the interview can be booked without it.
    final early =
        dt.stage == DocStage.beforeInterview && dt.blocksInterview == false;
    final stage = early ? DocStage.optional : dt.stage;
    final url = slot?.versions.firstOrNull?.file;
    final file = _fileName(url);
    final group = dt.code == 'certificate'
        ? DocGroup.certificates
        : !early && stage == DocStage.beforeInterview
        ? DocGroup.beforeInterview
        : stage == DocStage.atEnrolment
        ? DocGroup.enrolment
        : DocGroup.later;
    final isImage = url != null && _imageRe.hasMatch(url);
    final shownSub = state == DocState.replace
        ? '${input.titles.replaceSub}${(slot?.reason.isNotEmpty ?? false) ? ' ${slot!.reason}' : ''}'
        : (state == DocState.ready ||
                  state == DocState.checking ||
                  state == DocState.verified) &&
              file != null
        ? (isImage ? sub : file)
        : sub;
    final versions = slot?.versions ?? const <DocVersion>[];
    rows.add(
      DocRow(
        key: key,
        code: dt.code,
        docType: dt.id,
        docId: slot?.id,
        result: result,
        activity: slot?.activity ?? '',
        title: title,
        sub: shownSub,
        stage: stage,
        early: early,
        group: group,
        state: state,
        reason: slot?.reason ?? '',
        file: file,
        url: url,
        actionable: actionable,
        isResult: dt.perSubject || dt.code == 'result_overall',
        // Only before the application is sent; after that the office has it.
        removable:
            !input.sent &&
            slot != null &&
            versions.isNotEmpty &&
            versions.every((v) => v.state == VersionState.pending),
        earlier: [
          for (final v in versions.skip(1))
            EarlierCopy(
              file: _fileName(v.file),
              state: v.state,
              at: v.uploadedAt,
            ),
        ],
      ),
    );
  }

  // A combined statement already sent covers every subject whose result is out.
  final combinedIn = input.slots.any(
    (s) => s.code == 'result_overall' && s.hasFile,
  );
  for (final dt in input.types) {
    final hasSlot = input.slots.any((s) => s.docType == dt.id);
    if (dt.code == 'ibcc' &&
        input.qualification != Qualification.matric &&
        !hasSlot) {
      continue;
    }
    if (dt.code == 'recommendation' &&
        input.refereeName.trim().isEmpty &&
        !hasSlot) {
      continue;
    }
    if (dt.code == 'certificate' && !input.hasActivities && !hasSlot) {
      continue;
    }
    // Only when the interviewer asked for one.
    if (dt.code == 'medical_certificate' && !hasSlot) {
      continue;
    }
    if (dt.perSubject) {
      bool sentOwn(int id) => bySlot['${dt.id}:$id']?.hasFile ?? false;
      // With a combined statement in, only subjects it can't cover yet (results
      // still awaited) are listed — plus any per-subject file sent anyway.
      final out = input.results.where((r) {
        final id = r.id;
        if (id == null) return false;
        return combinedIn
            ? sentOwn(id) || !r.resultOut
            : r.resultOut || bySlot.containsKey('${dt.id}:$id');
      });
      final title = input.titles.resultTitle(input.qualification);
      final sub = input.predicted
          ? input.titles.subPredicted
          : input.titles.subNow;
      if (out.isEmpty && !combinedIn) {
        push(dt, null, title, sub, actionable: false);
      }
      for (final r in out) {
        push(
          dt,
          r.id,
          '$title · ${r.subject}',
          combinedIn && !r.resultOut ? input.titles.subAwaiting : sub,
        );
      }
    } else if (dt.code == 'certificate') {
      // One row per certificate sent, each named after its sport / activity; a
      // plain placeholder only when none is in yet.
      final certs = input.slots.where(
        (sl) => sl.docType == dt.id && sl.hasFile,
      );
      if (certs.isNotEmpty) {
        for (final sl in certs) {
          push(dt, null, sl.name, dt.hint, slotOverride: sl);
        }
      } else {
        push(dt, null, dt.name, dt.hint);
      }
    } else if (dt.code == 'result_overall') {
      // A combined statement can be sent several times, each covering a
      // different sitting: one row per existing one, or a placeholder.
      final slots = input.slots.where(
        (sl) => sl.docType == dt.id && (!combinedIn || sl.hasFile),
      );
      if (slots.isNotEmpty) {
        for (final sl in slots) {
          push(dt, null, dt.name, dt.hint, slotOverride: sl);
        }
      } else {
        push(dt, null, dt.name, dt.hint);
      }
    } else {
      push(dt, null, dt.name, dt.hint);
    }
  }
  // Stable sort by group (List.sort is not stable; index tie-break keeps order).
  final indexed = rows.asMap().entries.toList()
    ..sort((a, b) {
      final g = a.value.group.index - b.value.group.index;
      return g != 0 ? g : a.key - b.key;
    });
  return [for (final e in indexed) e.value];
}
