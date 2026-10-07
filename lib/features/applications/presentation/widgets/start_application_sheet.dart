import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application_summary.dart';

/// The user's choice in [StartApplicationSheet].
class StartChoice {
  /// Creates the choice.
  const StartChoice({this.copyFrom});

  /// Application to copy the family block from, or `null` to start fresh.
  final int? copyFrom;
}

/// "Copy family details?" when earlier applications exist.
abstract final class StartApplicationSheet {
  /// Shows the sheet; `null` when dismissed.
  static Future<StartChoice?> show(
    BuildContext context,
    List<AppSummary> from,
  ) {
    final t = Translations.of(context).applications;
    return HBottomSheet.show<StartChoice>(
      context,
      builder: (ctx) => HBottomSheet(
        title: t.copyFamilyTitle,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            HText(t.copyFamilyBody, tone: HTextTone.secondary),
            HSpace.gap4,
            for (final a in from) ...[
              HButton.tonal(
                label: t.copyFamilyFrom(name: a.fullName),
                icon: HIcons.family,
                onPressed: () =>
                    Navigator.of(ctx).pop(StartChoice(copyFrom: a.id)),
              ),
              HSpace.gap2,
            ],
            HButton.outline(
              label: t.copyFamilyNone,
              onPressed: () => Navigator.of(ctx).pop(const StartChoice()),
            ),
          ],
        ),
      ),
    );
  }
}
