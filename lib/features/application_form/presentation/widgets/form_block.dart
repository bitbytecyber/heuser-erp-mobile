import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

/// A titled section of a form step (`.block` + `BlockHead` on the web): a
/// card with a title row (required asterisk, optional tag, trailing widget),
/// an optional note, and the fields.
class FormBlock extends StatelessWidget {
  /// Creates a block.
  const FormBlock({
    required this.title,
    required this.children,
    this.note,
    this.required = false,
    this.optional = false,
    this.optionalLabel,
    this.trailing,
    super.key,
  });

  /// Block title.
  final String title;

  /// Supporting note under the title.
  final String? note;

  /// Shows the brand asterisk.
  final bool required;

  /// Shows the "optional" tag.
  final bool optional;

  /// Text of the optional tag (localised by the page).
  final String? optionalLabel;

  /// Widget at the end of the title row (counter).
  final Widget? trailing;

  /// Fields.
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final c = context.h.colors;
    return HCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: title),
                      if (required)
                        TextSpan(
                          text: ' *',
                          style: context.h.type.titleMd.copyWith(
                            color: c.brand,
                          ),
                        ),
                      if (optional && optionalLabel != null)
                        TextSpan(
                          text: '  ${optionalLabel!}',
                          style: context.h.type.labelMd.copyWith(
                            color: c.textTertiary,
                          ),
                        ),
                    ],
                  ),
                  style: context.h.type.titleMd.copyWith(color: c.textPrimary),
                ),
              ),
              if (trailing != null) ...[HSpace.hgap2, trailing!],
            ],
          ),
          if (note != null) ...[
            HSpace.gap1,
            HText(note!, style: HTextStyle.bodySm, tone: HTextTone.secondary),
          ],
          HSpace.gap4,
          ...children,
        ],
      ),
    );
  }
}

/// A sub-heading inside a block (`.sub-title`).
class FormSubTitle extends StatelessWidget {
  /// Creates the sub-title.
  const FormSubTitle(this.text, {this.note, super.key});

  /// Text.
  final String text;

  /// Supporting note.
  final String? note;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      HText(text, style: HTextStyle.titleSm),
      if (note != null) ...[
        HSpace.gap1,
        HText(note!, style: HTextStyle.bodySm, tone: HTextTone.secondary),
      ],
      HSpace.gap2,
    ],
  );
}

/// Inline error line under a group control (chips, result lists).
class FormErrorLine extends StatelessWidget {
  /// Creates the line.
  const FormErrorLine(this.message, {super.key});

  /// Text, or `null` to render nothing.
  final String? message;

  @override
  Widget build(BuildContext context) {
    if (message == null || message!.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: HSpace.x2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HIcon(HIcons.error, size: HIconSize.sm, tone: HTextTone.danger),
          HSpace.hgap1,
          Expanded(
            child: HText(
              message!,
              style: HTextStyle.bodySm,
              tone: HTextTone.danger,
            ),
          ),
        ],
      ),
    ).hShake(context);
  }
}

/// A label above a control that has no frame of its own (segmented, chips).
class FormGroupLabel extends StatelessWidget {
  /// Creates the label.
  const FormGroupLabel(
    this.text, {
    this.required = false,
    this.optionalLabel,
    super.key,
  });

  /// Text.
  final String text;

  /// Brand asterisk.
  final bool required;

  /// "optional" tag.
  final String? optionalLabel;

  @override
  Widget build(BuildContext context) {
    final c = context.h.colors;
    return Padding(
      padding: const EdgeInsets.only(bottom: HSpace.x2),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: text),
            if (required)
              TextSpan(
                text: ' *',
                style: context.h.type.labelMd.copyWith(color: c.brand),
              ),
            if (optionalLabel != null)
              TextSpan(
                text: '  $optionalLabel',
                style: context.h.type.labelMd.copyWith(color: c.textTertiary),
              ),
          ],
        ),
        style: context.h.type.labelMd.copyWith(color: c.textSecondary),
      ),
    );
  }
}
