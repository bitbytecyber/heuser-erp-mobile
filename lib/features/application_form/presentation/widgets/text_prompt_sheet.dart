import 'package:flutter/services.dart' show TextInputAction;
import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

/// A bottom sheet asking for one line of text (a school or city not in the
/// list, a custom subject). Resolves with the trimmed text, or `null`.
abstract final class TextPromptSheet {
  /// Shows the prompt.
  static Future<String?> show(
    BuildContext context, {
    required String title,
    required String hint,
    required String confirmLabel,
    required String cancelLabel,
    String initial = '',
    int maxLength = 80,
    String? Function(String value)? validate,
  }) => HBottomSheet.show<String>(
    context,
    builder: (ctx) => _Prompt(
      title: title,
      hint: hint,
      confirmLabel: confirmLabel,
      cancelLabel: cancelLabel,
      initial: initial,
      maxLength: maxLength,
      validate: validate,
    ),
  );
}

class _Prompt extends StatefulWidget {
  const _Prompt({
    required this.title,
    required this.hint,
    required this.confirmLabel,
    required this.cancelLabel,
    required this.initial,
    required this.maxLength,
    this.validate,
  });

  final String title;
  final String hint;
  final String confirmLabel;
  final String cancelLabel;
  final String initial;
  final int maxLength;
  final String? Function(String value)? validate;

  @override
  State<_Prompt> createState() => _PromptState();
}

class _PromptState extends State<_Prompt> {
  late final _controller = TextEditingController(text: widget.initial);
  String? _error;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final v = _controller.text.trim();
    final err = widget.validate?.call(v);
    if (err != null) {
      setState(() => _error = err);
      return;
    }
    Navigator.of(context).pop(v);
  }

  @override
  Widget build(BuildContext context) => HBottomSheet(
    title: widget.title,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        HTextField(
          controller: _controller,
          hint: widget.hint,
          autofocus: true,
          maxLength: widget.maxLength,
          error: _error,
          textInputAction: TextInputAction.done,
          onChanged: (_) {
            if (_error != null) setState(() => _error = null);
          },
          onSubmitted: (_) => _submit(),
        ),
        HSpace.gap4,
        HButton.filled(label: widget.confirmLabel, onPressed: _submit),
        HSpace.gap2,
        HButton.ghost(
          label: widget.cancelLabel,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}
