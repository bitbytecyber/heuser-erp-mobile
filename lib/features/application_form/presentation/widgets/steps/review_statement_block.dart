import 'package:flutter/services.dart' show TextCapitalization;
import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_constants.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_draft.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/draft_fields.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/form_block.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/form_scope.dart';

/// Step 3 · "Your statement": three prompts and the 80–300 word text.
class ReviewStatementBlock extends StatelessWidget {
  /// Creates the block.
  const ReviewStatementBlock({
    required this.draft,
    required this.collegeName,
    super.key,
  });

  /// Current draft.
  final FormDraft draft;

  /// College name for the copy.
  final String collegeName;

  void _insert(BuildContext context, String prompt) {
    final add = prompt.replaceAll('…', ' ');
    context.patchField('statement', (d) {
      final cur = d.statement.replaceAll(RegExp(r'\s+$'), '');
      return d.copyWith(statement: cur.isEmpty ? add : '$cur\n\n$add');
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final s = t.form.statement;
    final words = draft.statementWords;
    final tone = words > FormRules.maxWords
        ? HTone.danger
        : words >= FormRules.minWords
        ? HTone.success
        : HTone.neutral;
    return FormBlock(
      title: s.title,
      required: true,
      note: s.note(name: collegeName),
      trailing: HStatusPill(
        words == 1 ? s.word : s.words(n: words),
        tone: tone,
      ),
      children: [
        Wrap(
          spacing: HSpace.x2,
          runSpacing: HSpace.x2,
          children: [
            for (final p in [
              s.prompt1(name: collegeName),
              s.prompt2,
              s.prompt3,
            ])
              HChip(p, icon: HIcons.add, onTap: () => _insert(context, p)),
          ],
        ),
        HSpace.gap3,
        DraftTextField(
          value: draft.statement,
          error: context.fieldError('statement'),
          maxLines: 12,
          minLines: 7,
          textCapitalization: TextCapitalization.sentences,
          onChanged: (v) =>
              context.patchField('statement', (d) => d.copyWith(statement: v)),
        ),
      ],
    );
  }
}

/// Step 3 · the declaration checkbox.
class ReviewDeclaration extends StatelessWidget {
  /// Creates the declaration.
  const ReviewDeclaration({
    required this.declared,
    required this.missing,
    required this.collegeName,
    required this.onChanged,
    super.key,
  });

  /// Ticked.
  final bool declared;

  /// "Please confirm before sending" is shown.
  final bool missing;

  /// College name for the copy.
  final String collegeName;

  /// Toggle handler.
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return HCard(
      child: HCheckbox(
        label: t.form.declaration.text(name: collegeName),
        value: declared,
        error: missing ? t.form.declaration.missing : null,
        onChanged: onChanged,
      ),
    );
  }
}
