import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/components/buttons/h_button.dart';
import 'package:heuser_ds/src/components/feedback/h_progress.dart';
import 'package:heuser_ds/src/components/feedback/h_status_pill.dart';
import 'package:heuser_ds/src/components/surfaces/h_card.dart';
import 'package:heuser_ds/src/foundation/h_icon.dart';
import 'package:heuser_ds/src/foundation/h_icons.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/tokens/h_spacing.dart';

/// State of a document slot, mirroring the backend's slot states.
enum HFileState {
  /// Nothing uploaded yet.
  missing,

  /// Applicant chose "later".
  later,

  /// Upload in progress.
  uploading,

  /// Uploaded, awaiting the office.
  pending,

  /// Accepted.
  approved,

  /// Rejected with a reason.
  rejected,
}

/// Localised labels for [HFileState] pills (the app passes `t.*` strings).
class HFileLabels {
  /// Creates labels.
  const HFileLabels({
    this.missing = 'Needed',
    this.later = 'Later',
    this.uploading = 'Uploading…',
    this.pending = 'Being checked',
    this.approved = 'Approved',
    this.rejected = 'Rejected',
    this.upload = 'Upload',
    this.replace = 'Replace',
    this.laterAction = 'Later',
    this.remove = 'Remove',
    this.open = 'View',
  });

  /// Pill label.
  final String missing;

  /// Pill label.
  final String later;

  /// Pill label.
  final String uploading;

  /// Pill label.
  final String pending;

  /// Pill label.
  final String approved;

  /// Pill label.
  final String rejected;

  /// Action label.
  final String upload;

  /// Action label.
  final String replace;

  /// Action label.
  final String laterAction;

  /// Action label.
  final String remove;

  /// Action label.
  final String open;

  /// Label for a state.
  String of(HFileState s) => switch (s) {
    HFileState.missing => missing,
    HFileState.later => later,
    HFileState.uploading => uploading,
    HFileState.pending => pending,
    HFileState.approved => approved,
    HFileState.rejected => rejected,
  };
}

/// Document slot: title, hint, status pill, file name, progress, rejection
/// reason and the actions valid for the state.
class HFilePickerTile extends StatelessWidget {
  /// Creates a tile.
  const HFilePickerTile({
    required this.title,
    required this.state,
    this.hint,
    this.fileName,
    this.progress,
    this.rejectReason,
    this.onPick,
    this.onLater,
    this.onRemove,
    this.onOpen,
    this.labels = const HFileLabels(),
    super.key,
  });

  /// Document name (e.g. "Passport-style photo").
  final String title;

  /// Current state.
  final HFileState state;

  /// Helper text (what is accepted, why it is needed).
  final String? hint;

  /// Uploaded file name.
  final String? fileName;

  /// Upload progress 0..1 while [HFileState.uploading].
  final double? progress;

  /// Office's reason when [HFileState.rejected].
  final String? rejectReason;

  /// Upload / replace handler.
  final VoidCallback? onPick;

  /// "Later" handler (only offered while missing).
  final VoidCallback? onLater;

  /// Remove handler (only while pending and allowed).
  final VoidCallback? onRemove;

  /// Open the uploaded file.
  final VoidCallback? onOpen;

  /// Labels.
  final HFileLabels labels;

  @override
  Widget build(BuildContext context) {
    final (tone, icon) = switch (state) {
      HFileState.missing => (HTone.warning, HIcons.upload),
      HFileState.later => (HTone.neutral, HIcons.clock),
      HFileState.uploading => (HTone.info, HIcons.upload),
      HFileState.pending => (HTone.info, HIcons.hourglass),
      HFileState.approved => (HTone.success, HIcons.checkCircle),
      HFileState.rejected => (HTone.danger, HIcons.error),
    };
    final hasFile = fileName != null && fileName!.isNotEmpty;
    return HCard(
      elevation: HCardElevation.flat,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HText(title, style: HTextStyle.titleMd),
                    if (hint != null) ...[
                      const SizedBox(height: 2),
                      HText(
                        hint!,
                        style: HTextStyle.bodySm,
                        tone: HTextTone.secondary,
                      ),
                    ],
                  ],
                ),
              ),
              HSpace.hgap2,
              HStatusPill(labels.of(state), tone: tone, icon: icon),
            ],
          ),
          if (hasFile) ...[
            HSpace.gap3,
            Row(
              children: [
                const HIcon(
                  HIcons.file,
                  size: HIconSize.sm,
                  tone: HTextTone.tertiary,
                ),
                HSpace.hgap1,
                Expanded(
                  child: HText(
                    fileName!,
                    style: HTextStyle.bodySm,
                    tone: HTextTone.secondary,
                    maxLines: 1,
                  ),
                ),
                if (onOpen != null)
                  HButton.ghost(
                    label: labels.open,
                    onPressed: onOpen,
                    size: HButtonSize.sm,
                  ),
              ],
            ),
          ],
          if (state == HFileState.uploading) ...[
            HSpace.gap2,
            HProgressBar(value: progress ?? 0),
          ],
          if (state == HFileState.rejected && rejectReason != null) ...[
            HSpace.gap2,
            HText(
              rejectReason!,
              style: HTextStyle.bodySm,
              tone: HTextTone.danger,
            ),
          ],
          if (state != HFileState.uploading &&
              state != HFileState.approved) ...[
            HSpace.gap3,
            Row(
              children: [
                if (onPick != null)
                  Expanded(
                    child: HButton.tonal(
                      label: hasFile || state == HFileState.rejected
                          ? labels.replace
                          : labels.upload,
                      onPressed: onPick,
                      size: HButtonSize.sm,
                      icon: HIcons.upload,
                    ),
                  ),
                if (onLater != null && state == HFileState.missing) ...[
                  HSpace.hgap2,
                  HButton.outline(
                    label: labels.laterAction,
                    onPressed: onLater,
                    size: HButtonSize.sm,
                    expand: false,
                  ),
                ],
                if (onRemove != null && state == HFileState.pending) ...[
                  HSpace.hgap2,
                  HButton.ghost(
                    label: labels.remove,
                    onPressed: onRemove,
                    size: HButtonSize.sm,
                  ),
                ],
              ],
            ),
          ],
        ],
      ),
    );
  }
}
