import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/files/file_pick_service.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/documents/domain/doc_rows.dart';
import 'package:heuser_erp_mobile/features/documents/presentation/cubit/documents_cubit.dart';
import 'package:heuser_erp_mobile/features/documents/presentation/widgets/doc_labels.dart';
import 'package:heuser_erp_mobile/features/documents/presentation/widgets/file_source_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

/// An attach card on steps 1–2 (`AttachCard` on the web): a file tile for
/// one document row, driven by the [DocumentsCubit] in scope. Renders
/// nothing when the cycle has no such document type ([row] is `null`).
class AttachCard extends StatelessWidget {
  /// Creates the card.
  const AttachCard({
    required this.row,
    required this.title,
    this.hint,
    this.canLater = false,
    this.canRemove = true,
    super.key,
  });

  /// The row, or `null` when the type is not in this cycle.
  final DocRow? row;

  /// Title shown (the step's wording, not the type name).
  final String title;

  /// Hint line.
  final String? hint;

  /// Offer "Later".
  final bool canLater;

  /// Offer "Remove" for unchecked uploads.
  final bool canRemove;

  @override
  Widget build(BuildContext context) {
    final r = row;
    if (r == null) return const SizedBox.shrink();
    final t = Translations.of(context);
    final pending = context.select<DocumentsCubit, String?>(
      (c) => c.state.pending,
    );
    final busy = pending == r.key;
    final anyBusy = pending != null;
    final cubit = context.read<DocumentsCubit>();
    return HFilePickerTile(
      title: title,
      hint: r.state == DocState.replace ? r.sub : hint,
      state: DocLabels.fileState(r, busy: busy),
      fileName: r.isImage ? null : r.file,
      rejectReason: r.state == DocState.replace ? r.reason : null,
      labels: DocLabels.fileLabels(r, t),
      onPick: anyBusy || !r.actionable
          ? null
          : () => unawaited(_pick(context, (s) => cubit.upload(r, s))),
      onLater: canLater && !anyBusy && r.state == DocState.missing && !r.early
          ? () => unawaited(cubit.later(r))
          : null,
      onRemove: canRemove && r.removable && !anyBusy
          ? () => unawaited(cubit.remove(r))
          : null,
      onOpen: r.url == null ? null : () => unawaited(openDocument(r.url!)),
    );
  }
}

/// Shows the source sheet and runs [action] with the choice.
Future<void> _pick(
  BuildContext context,
  Future<void> Function(FileSource source) action,
) async {
  final source = await FileSourceSheet.show(context);
  if (source == null) return;
  await action(source);
}

/// Opens an uploaded file in the system viewer / browser.
Future<void> openDocument(String url) async {
  final uri = Uri.tryParse(url);
  if (uri == null) return;
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}

/// A small "Certificate (optional) / Add more" button for one activity.
class CertificateButton extends StatelessWidget {
  /// Creates the button.
  const CertificateButton({
    required this.docType,
    required this.activityKey,
    required this.activityName,
    required this.count,
    super.key,
  });

  /// The certificate document type id, or `null` when the cycle has none.
  final int? docType;

  /// The backend activity key (`sport:3`, `activity:debating`).
  final String activityKey;

  /// Display name for the slot.
  final String activityName;

  /// Certificates already sent for this activity.
  final int count;

  @override
  Widget build(BuildContext context) {
    final dt = docType;
    if (dt == null) return const SizedBox.shrink();
    final t = Translations.of(context);
    final pending = context.select<DocumentsCubit, String?>(
      (c) => c.state.pending,
    );
    final cubit = context.read<DocumentsCubit>();
    final busy = pending == 'cert:$activityKey';
    return HButton.outline(
      size: HButtonSize.sm,
      expand: false,
      icon: HIcons.attach,
      loading: busy,
      label: count > 0 ? t.form.beyond.addMore : t.form.beyond.certificate,
      onPressed: pending != null
          ? null
          : () => unawaited(
              _pick(
                context,
                (s) => cubit.uploadCertificate(
                  dt,
                  s,
                  activity: activityKey,
                  activityName: activityName,
                  title: t.documents.certificateFor(name: activityName),
                ),
              ),
            ),
    );
  }
}
