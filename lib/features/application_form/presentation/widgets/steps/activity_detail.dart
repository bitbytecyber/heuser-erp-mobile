import 'package:flutter/services.dart' show TextCapitalization;
import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_constants.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/draft_fields.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_parts.dart';
import 'package:heuser_erp_mobile/features/documents/presentation/widgets/attach_card.dart';

/// One chosen sport / activity: level (sports), a line of detail and the
/// certificate button.
class ActivityDetail extends StatelessWidget {
  /// Creates the row.
  const ActivityDetail({
    required this.row,
    required this.hint,
    required this.certType,
    required this.certCount,
    required this.onChanged,
    this.levelLabel,
    super.key,
  });

  /// The activity.
  final ActivityRow row;

  /// Placeholder of the detail line.
  final String hint;

  /// Label of the level select (sports only).
  final String? levelLabel;

  /// Certificate document type id.
  final int? certType;

  /// Certificates already sent.
  final int certCount;

  /// Change handler.
  final ValueChanged<ActivityRow> onChanged;

  @override
  Widget build(BuildContext context) => HCard(
    elevation: HCardElevation.flat,
    padding: const EdgeInsets.all(HSpace.x3),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HText(row.name, style: HTextStyle.titleSm),
        HSpace.gap2,
        if (levelLabel != null) ...[
          HSelect<String>(
            label: levelLabel,
            value: row.level.isEmpty ? 'School' : row.level,
            options: [
              for (final l in FormRules.sportLevels)
                HSelectOption(value: l, label: l),
            ],
            onChanged: (v) => onChanged(row.copyWith(level: v)),
          ),
          HSpace.gap2,
        ],
        DraftTextField(
          hint: hint,
          value: row.details,
          textCapitalization: TextCapitalization.sentences,
          onChanged: (v) => onChanged(row.copyWith(details: v)),
        ),
        HSpace.gap2,
        CertificateButton(
          docType: certType,
          activityKey: row.activityKey,
          activityName: row.name,
          count: certCount,
        ),
      ],
    ),
  );
}
