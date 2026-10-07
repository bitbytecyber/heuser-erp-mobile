import 'package:flutter/services.dart'
    show TextCapitalization, TextInputAction, TextInputType;
import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/format/format_checks.dart';
import 'package:heuser_erp_mobile/core/format/masks.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/form_block.dart';

/// A text field bound to a draft value. Owns its controller so typing never
/// fights the bloc; an external change (mask, resume, server reconcile) is
/// pushed into the controller only when it differs from what is typed.
/// Masks and format checks mirror `fields.tsx` `TextInput`.
class DraftTextField extends StatefulWidget {
  /// Creates the field.
  const DraftTextField({
    required this.value,
    required this.onChanged,
    this.label,
    this.hint,
    this.helper,
    this.error,
    this.format,
    this.required = false,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.words,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.autofillHints,
    this.leadingIcon,
    this.onFormatError,
    this.enabled = true,
    super.key,
  });

  /// Current draft value.
  final String value;

  /// Called with the (masked) text on every change.
  final ValueChanged<String> onChanged;

  /// Field label.
  final String? label;

  /// Placeholder.
  final String? hint;

  /// Helper text.
  final String? helper;

  /// Error text from the form errors.
  final String? error;

  /// Mask + blur check.
  final FieldFormat? format;

  /// Required marker.
  final bool required;

  /// Keyboard.
  final TextInputType? keyboardType;

  /// Action key.
  final TextInputAction textInputAction;

  /// Capitalisation (names default to words).
  final TextCapitalization textCapitalization;

  /// Lines.
  final int? maxLines;

  /// Min lines (multiline).
  final int? minLines;

  /// Max length.
  final int? maxLength;

  /// Autofill.
  final Iterable<String>? autofillHints;

  /// Leading glyph.
  final IconData? leadingIcon;

  /// Called on blur with the malformed value's format, so the page can set
  /// a format error (the bloc owns errors).
  final ValueChanged<FieldFormat>? onFormatError;

  /// Enabled.
  final bool enabled;

  @override
  State<DraftTextField> createState() => _DraftTextFieldState();
}

class _DraftTextFieldState extends State<DraftTextField> {
  late final _controller = TextEditingController(text: widget.value);
  final _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocus);
  }

  @override
  void didUpdateWidget(DraftTextField old) {
    super.didUpdateWidget(old);
    if (widget.value != _controller.text) {
      _controller.value = TextEditingValue(
        text: widget.value,
        selection: TextSelection.collapsed(offset: widget.value.length),
      );
    }
  }

  void _onFocus() {
    if (_focus.hasFocus) return;
    final f = widget.format;
    final v = _controller.text;
    if (f != null && v.isNotEmpty && !FormatChecks.ok(f, v)) {
      widget.onFormatError?.call(f);
    }
  }

  @override
  void dispose() {
    _focus
      ..removeListener(_onFocus)
      ..dispose();
    _controller.dispose();
    super.dispose();
  }

  String _mask(String v) => switch (widget.format) {
    FieldFormat.cnic => Masks.cnic(v),
    FieldFormat.phone => Masks.phone(v),
    _ => v,
  };

  @override
  Widget build(BuildContext context) {
    final f = widget.format;
    return HTextField(
      controller: _controller,
      focusNode: _focus,
      label: widget.label,
      hint: widget.hint,
      helper: widget.helper,
      error: widget.error,
      required: widget.required,
      enabled: widget.enabled,
      keyboardType:
          widget.keyboardType ??
          switch (f) {
            FieldFormat.cnic => TextInputType.number,
            FieldFormat.phone => TextInputType.phone,
            FieldFormat.email => TextInputType.emailAddress,
            null =>
              widget.maxLines == 1
                  ? TextInputType.text
                  : TextInputType.multiline,
          },
      textInputAction: widget.textInputAction,
      textCapitalization: f == null
          ? widget.textCapitalization
          : TextCapitalization.none,
      autocorrect: f == null,
      enableSuggestions: f == null,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength ?? (f == FieldFormat.phone ? 16 : null),
      autofillHints: widget.autofillHints,
      leadingIcon: widget.leadingIcon,
      onChanged: (v) {
        final masked = _mask(v);
        if (masked != v) {
          _controller.value = TextEditingValue(
            text: masked,
            selection: TextSelection.collapsed(offset: masked.length),
          );
        }
        widget.onChanged(masked);
      },
    );
  }
}

/// A labelled segmented control with an error line (`Seg` on the web).
class DraftSegmented<T> extends StatelessWidget {
  /// Creates the control.
  const DraftSegmented({
    required this.label,
    required this.segments,
    required this.value,
    required this.onChanged,
    this.error,
    this.required = false,
    this.optionalLabel,
    super.key,
  });

  /// Label above.
  final String label;

  /// Options.
  final List<HSegment<T>> segments;

  /// Selected value (`null` = none).
  final T? value;

  /// Selection handler.
  final ValueChanged<T> onChanged;

  /// Error text.
  final String? error;

  /// Asterisk.
  final bool required;

  /// "optional" tag.
  final String? optionalLabel;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      FormGroupLabel(label, required: required, optionalLabel: optionalLabel),
      HSegmented<T>(segments: segments, value: value, onChanged: onChanged),
      FormErrorLine(error),
    ],
  );
}

/// A labelled group of selectable chips with an error line, for choices
/// with more than three options (work, qualification).
class DraftChipGroup<T> extends StatelessWidget {
  /// Creates the group.
  const DraftChipGroup({
    required this.label,
    required this.options,
    required this.value,
    required this.onChanged,
    this.error,
    this.required = false,
    this.optionalLabel,
    super.key,
  });

  /// Label above.
  final String label;

  /// Options.
  final List<HSegment<T>> options;

  /// Selected value (`null` = none).
  final T? value;

  /// Selection handler.
  final ValueChanged<T> onChanged;

  /// Error text.
  final String? error;

  /// Asterisk.
  final bool required;

  /// "optional" tag.
  final String? optionalLabel;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      FormGroupLabel(label, required: required, optionalLabel: optionalLabel),
      Wrap(
        spacing: HSpace.x2,
        runSpacing: HSpace.x2,
        children: [
          for (final o in options)
            HChip(
              o.label,
              icon: o.icon,
              selected: o.value == value,
              onTap: () => onChanged(o.value),
            ),
        ],
      ),
      FormErrorLine(error),
    ],
  );
}
