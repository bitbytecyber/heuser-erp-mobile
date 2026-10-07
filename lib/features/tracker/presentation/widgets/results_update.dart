import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_constants.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_parts.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/bloc/tracker_bloc.dart';

/// Results that come out after sending (`ResultsUpdate` in `tracker.tsx`):
/// tap the grade, save, then upload the slip in the documents list below.
class ResultsUpdate extends StatelessWidget {
  /// Creates the block.
  const ResultsUpdate({required this.results, super.key});

  /// Result rows of the application.
  final List<ResultRow> results;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context).tracker.results;
    final rows = results.where((r) => r.id != null).toList();
    if (rows.isEmpty) return const SizedBox.shrink();
    final waiting = rows.any((r) => !r.resultOut || r.grade.isEmpty);
    return HCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HText(waiting ? t.waitingTitle : t.title, style: HTextStyle.titleMd),
          HSpace.gap1,
          HText(t.hint, style: HTextStyle.bodySm, tone: HTextTone.secondary),
          HSpace.gap3,
          for (final r in rows) ...[_ResultEdit(row: r), HSpace.gap3],
        ],
      ),
    );
  }
}

class _ResultEdit extends StatefulWidget {
  const _ResultEdit({required this.row});

  final ResultRow row;

  @override
  State<_ResultEdit> createState() => _ResultEditState();
}

class _ResultEditState extends State<_ResultEdit> {
  String _grade = '';
  bool _open = false;

  @override
  void didUpdateWidget(_ResultEdit old) {
    super.didUpdateWidget(old);
    if (old.row.grade != widget.row.grade ||
        old.row.resultOut != widget.row.resultOut) {
      _open = false;
      _grade = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context).tracker.results;
    final r = widget.row;
    final out = r.resultOut && r.grade.isNotEmpty;
    final editing = !out || _open;
    final busy = context.select<TrackerBloc, bool>((b) => b.state.busy);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(child: HText(r.subject, style: HTextStyle.titleSm)),
            if (out)
              HStatusPill(r.grade, tone: HTone.success)
            else if (r.grade.isNotEmpty)
              HStatusPill(t.expected(grade: r.grade), tone: HTone.info),
          ],
        ),
        HSpace.gap2,
        if (editing) ...[
          Wrap(
            spacing: HSpace.x2,
            runSpacing: HSpace.x2,
            children: [
              for (final g in FormRules.grades)
                HChip(
                  g,
                  selected: _grade == g,
                  onTap: () => setState(() => _grade = g),
                ),
            ],
          ),
          HSpace.gap2,
          HButton.filled(
            label: out ? t.saveGrade : t.isOut,
            size: HButtonSize.sm,
            expand: false,
            loading: busy,
            onPressed: _grade.isEmpty || (out && _grade == r.grade) || busy
                ? null
                : () => context.read<TrackerBloc>().add(
                    TrackerEvent.resultUpdated(resultId: r.id!, grade: _grade),
                  ),
          ),
        ] else
          Row(
            children: [
              Expanded(
                child: HText(
                  t.resultOut,
                  style: HTextStyle.bodySm,
                  tone: HTextTone.secondary,
                ),
              ),
              HButton.outline(
                label: t.changeGrade,
                size: HButtonSize.sm,
                expand: false,
                onPressed: () => setState(() => _open = true),
              ),
            ],
          ),
      ],
    );
  }
}
