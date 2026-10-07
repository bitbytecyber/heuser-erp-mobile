import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application_summary.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';

/// One application in the list: name, level, status pill, mini stage bar.
class ApplicationCard extends StatelessWidget {
  /// Creates the card.
  const ApplicationCard({
    required this.item,
    required this.onTap,
    this.onMore,
    super.key,
  });

  /// The summary.
  final AppSummary item;

  /// Opens the form or tracker.
  final VoidCallback onTap;

  /// Opens the actions sheet (delete / withdraw).
  final VoidCallback? onMore;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final a = item;
    final name = a.fullName.trim().isEmpty ? t.applications.draft : a.fullName;
    final (label, tone) = _pill(a, t);
    return HCard(
      onTap: onTap,
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
                    HText(name, style: HTextStyle.titleLg, maxLines: 1),
                    HSpace.gap1,
                    HText(
                      [
                        if (a.level == Level.as_)
                          t.applications.levelAS
                        else
                          t.applications.levelA2,
                        ?a.reference,
                      ].join(' · '),
                      style: HTextStyle.bodySm,
                      tone: HTextTone.secondary,
                    ),
                  ],
                ),
              ),
              HSpace.hgap2,
              HStatusPill(label, tone: tone),
              if (onMore != null)
                HIconButton(
                  icon: HIcons.more,
                  size: 36,
                  semanticsLabel: t.common.more,
                  onPressed: onMore,
                ),
            ],
          ),
          HSpace.gap3,
          if (a.status.isDraft)
            HProgressBar(value: (a.formStep.clamp(1, 3) - 1) / 3 + 0.12)
          else
            HProgressBar(value: a.tracker.progress),
          HSpace.gap2,
          Row(
            children: [
              Expanded(
                child: HText(
                  a.status.isDraft
                      ? t.applications.stepOf(step: a.formStep.clamp(1, 3))
                      : (a.tracker.ended ?? _currentStageLabel(a)),
                  style: HTextStyle.bodySm,
                  tone: HTextTone.secondary,
                ),
              ),
              HText(
                t.applications.updated(when: relativeTime(a.updatedAtTime, t)),
                style: HTextStyle.bodySm,
                tone: HTextTone.tertiary,
              ),
            ],
          ),
        ],
      ),
    );
  }

  static String _currentStageLabel(AppSummary a) =>
      a.tracker.stages
          .where((s) => s.key == a.tracker.current)
          .firstOrNull
          ?.label ??
      a.statusLabel;

  static (String, HTone) _pill(AppSummary a, Translations t) {
    final label = a.status.isDraft ? t.applications.draft : a.statusLabel;
    final tone = switch (a.status) {
      AppStatus.draft => HTone.neutral,
      AppStatus.offered ||
      AppStatus.readyToEnroll ||
      AppStatus.enrolled => HTone.success,
      AppStatus.notOffered ||
      AppStatus.closed ||
      AppStatus.withdrawn => HTone.danger,
      AppStatus.financialVerification => HTone.warning,
      _ => HTone.brand,
    };
    return (label, tone);
  }
}

/// "just now", "5 min ago", "3 h ago", "2 d ago".
String relativeTime(DateTime? at, Translations t) {
  if (at == null) return t.applications.justNow;
  final diff = DateTime.now().difference(at.toLocal());
  if (diff.inMinutes < 1) return t.applications.justNow;
  if (diff.inHours < 1) return t.applications.minutesAgo(n: diff.inMinutes);
  if (diff.inDays < 1) return t.applications.hoursAgo(n: diff.inHours);
  return t.applications.daysAgo(n: diff.inDays);
}
