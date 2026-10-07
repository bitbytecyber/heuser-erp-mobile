import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/files/file_pick_service.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/documents/domain/doc_rows.dart';
import 'package:heuser_erp_mobile/features/documents/presentation/cubit/documents_cubit.dart';
import 'package:heuser_erp_mobile/features/documents/presentation/widgets/attach_card.dart';
import 'package:heuser_erp_mobile/features/documents/presentation/widgets/doc_labels.dart';
import 'package:heuser_erp_mobile/features/documents/presentation/widgets/file_source_sheet.dart';

/// The grouped documents list (`DocsList` on the web): step 3 of the form
/// and the tracker's Documents tab. Reads the [DocumentsCubit] in scope.
class DocsList extends StatelessWidget {
  /// Creates the list.
  const DocsList({
    required this.rows,
    this.canLater = false,
    this.canUpload = true,
    this.canResubmit = false,
    super.key,
  });

  /// Rows from `buildDocRows`.
  final List<DocRow> rows;

  /// Offer "Later" on rows not needed before the interview.
  final bool canLater;

  /// Allow uploads at all.
  final bool canUpload;

  /// Result documents can be sent again while checked (until an offer).
  final bool canResubmit;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final children = <Widget>[];
    for (var i = 0; i < rows.length; i++) {
      final r = rows[i];
      if (i == 0 || rows[i - 1].group != r.group) {
        children.add(
          Padding(
            padding: EdgeInsets.only(
              top: i == 0 ? 0 : HSpace.x4,
              bottom: HSpace.x2,
            ),
            child: HText(
              DocLabels.group(r.group, t),
              style: HTextStyle.labelMd,
              tone: HTextTone.secondary,
            ),
          ),
        );
      }
      children.add(
        _DocTile(
          row: r,
          canLater: canLater,
          canUpload: canUpload,
          canResubmit: canResubmit,
        ),
      );
      // After the last combined statement: a row to add another one.
      final last = i + 1 >= rows.length || rows[i + 1].code != 'result_overall';
      if (canUpload &&
          r.actionable &&
          r.code == 'result_overall' &&
          r.docId != null &&
          r.state != DocState.missing &&
          last) {
        children.add(_AnotherOverall(docType: r.docType));
      }
      children.add(HSpace.gap2);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }
}

class _DocTile extends StatelessWidget {
  const _DocTile({
    required this.row,
    required this.canLater,
    required this.canUpload,
    required this.canResubmit,
  });

  final DocRow row;
  final bool canLater;
  final bool canUpload;
  final bool canResubmit;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final r = row;
    final pending = context.select<DocumentsCubit, String?>(
      (c) => c.state.pending,
    );
    final busy = pending == r.key;
    final anyBusy = pending != null;
    final cubit = context.read<DocumentsCubit>();
    final uploadable =
        canUpload &&
        r.actionable &&
        (r.state == DocState.missing ||
            r.state == DocState.ready ||
            r.state == DocState.replace ||
            r.state == DocState.later ||
            (canResubmit && r.isResult));
    final tile = HFilePickerTile(
      title: r.title,
      hint: r.sub,
      state: DocLabels.fileState(r, busy: busy),
      fileName: r.isImage ? null : r.file,
      rejectReason: r.state == DocState.replace ? r.reason : null,
      labels: DocLabels.fileLabels(r, t),
      onPick: uploadable && !anyBusy
          ? () => unawaited(_pickThen(context, (s) => cubit.upload(r, s)))
          : null,
      onLater:
          canLater &&
              canUpload &&
              !anyBusy &&
              r.state == DocState.missing &&
              !r.early
          ? () => unawaited(cubit.later(r))
          : null,
      onRemove: canUpload && r.removable && !anyBusy
          ? () => unawaited(cubit.remove(r))
          : null,
      onOpen: r.url == null ? null : () => unawaited(openDocument(r.url!)),
    );
    if (r.earlier.isEmpty) return tile;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        tile,
        Padding(
          padding: const EdgeInsets.fromLTRB(
            HSpace.x4,
            HSpace.x1,
            HSpace.x4,
            0,
          ),
          child: HText(
            r.earlier.length == 1
                ? t.documents.earlierOne
                : t.documents.earlierMany(n: r.earlier.length),
            style: HTextStyle.bodySm,
            tone: HTextTone.tertiary,
          ),
        ),
      ],
    );
  }
}

class _AnotherOverall extends StatelessWidget {
  const _AnotherOverall({required this.docType});

  final int docType;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final pending = context.select<DocumentsCubit, String?>(
      (c) => c.state.pending,
    );
    final cubit = context.read<DocumentsCubit>();
    return Padding(
      padding: const EdgeInsets.only(top: HSpace.x2),
      child: HFilePickerTile(
        title: t.documents.anotherOverallTitle,
        hint: t.documents.anotherOverallSub,
        state: pending == 'new:$docType'
            ? HFileState.uploading
            : HFileState.missing,
        labels: DocLabels.fileLabels(
          null,
          t,
        ).copyWithUpload(t.documents.addAnother),
        onPick: pending != null
            ? null
            : () => unawaited(
                _pickThen(
                  context,
                  (s) => cubit.uploadNew(docType, s, title: t.documents.result),
                ),
              ),
      ),
    );
  }
}

Future<void> _pickThen(
  BuildContext context,
  Future<void> Function(FileSource source) action,
) async {
  final source = await FileSourceSheet.show(context);
  if (source == null) return;
  await action(source);
}

extension on HFileLabels {
  HFileLabels copyWithUpload(String upload) => HFileLabels(
    missing: missing,
    later: later,
    uploading: uploading,
    pending: pending,
    approved: approved,
    rejected: rejected,
    upload: upload,
    replace: replace,
    laterAction: laterAction,
    remove: remove,
    open: open,
  );
}
