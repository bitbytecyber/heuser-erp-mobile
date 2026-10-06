import 'package:flutter/material.dart'
    show InputBorder, InputDecoration, TextField;
import 'package:flutter/services.dart'
    show TextCapitalization, TextInputAction, TextInputFormatter, TextInputType;
import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/components/buttons/h_icon_button.dart';
import 'package:heuser_ds/src/components/inputs/h_field_frame.dart';
import 'package:heuser_ds/src/foundation/h_icon.dart';
import 'package:heuser_ds/src/foundation/h_icons.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';

/// Single- or multi-line text input in the shared [HFieldFrame].
///
/// Material's [TextField] is the editing engine (selection, IME, autofill);
/// its decoration is removed and the frame draws everything visible.
class HTextField extends StatefulWidget {
  /// Creates a text field.
  const HTextField({
    this.controller,
    this.initialValue,
    this.label,
    this.hint,
    this.helper,
    this.error,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.required = false,
    this.autofocus = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.leadingIcon,
    this.trailing,
    this.focusNode,
    this.autofillHints,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.showObscureToggle = true,
    super.key,
  }) : assert(
         controller == null || initialValue == null,
         'Pass controller or initialValue, not both',
       );

  /// Controller.
  final TextEditingController? controller;

  /// Initial text when no [controller] is passed.
  final String? initialValue;

  /// Label above.
  final String? label;

  /// Placeholder.
  final String? hint;

  /// Helper text.
  final String? helper;

  /// Error text (danger state when non-empty).
  final String? error;

  /// Change callback.
  final ValueChanged<String>? onChanged;

  /// Submit callback.
  final ValueChanged<String>? onSubmitted;

  /// Tap callback (use with [readOnly] for pickers).
  final VoidCallback? onTap;

  /// Keyboard.
  final TextInputType? keyboardType;

  /// Action key.
  final TextInputAction? textInputAction;

  /// Capitalisation.
  final TextCapitalization textCapitalization;

  /// Formatters (see `HMasks`).
  final List<TextInputFormatter>? inputFormatters;

  /// Password mode.
  final bool obscureText;

  /// Enabled.
  final bool enabled;

  /// Read only.
  final bool readOnly;

  /// Shows the required asterisk.
  final bool required;

  /// Autofocus.
  final bool autofocus;

  /// Max lines (null = unlimited).
  final int? maxLines;

  /// Min lines.
  final int? minLines;

  /// Max length (shows a counter in the helper slot).
  final int? maxLength;

  /// Leading glyph.
  final IconData? leadingIcon;

  /// Trailing widget.
  final Widget? trailing;

  /// Focus node.
  final FocusNode? focusNode;

  /// Autofill hints.
  final Iterable<String>? autofillHints;

  /// IME suggestions.
  final bool enableSuggestions;

  /// Autocorrect.
  final bool autocorrect;

  /// Shows an eye toggle when [obscureText].
  final bool showObscureToggle;

  @override
  State<HTextField> createState() => _HTextFieldState();
}

class _HTextFieldState extends State<HTextField> {
  late final FocusNode _focus = widget.focusNode ?? FocusNode();
  late final TextEditingController _controller =
      widget.controller ?? TextEditingController(text: widget.initialValue);
  bool _focused = false;
  bool _obscured = true;

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocus);
  }

  void _onFocus() {
    if (mounted) setState(() => _focused = _focus.hasFocus);
  }

  @override
  void dispose() {
    _focus.removeListener(_onFocus);
    if (widget.focusNode == null) _focus.dispose();
    if (widget.controller == null) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final c = h.colors;
    final multiline = (widget.maxLines ?? 2) != 1;
    final counter = widget.maxLength == null
        ? null
        : ValueListenableBuilder<TextEditingValue>(
            valueListenable: _controller,
            builder: (_, v, _) => HText(
              '${v.text.length}/${widget.maxLength}',
              style: HTextStyle.bodySm,
              tone: HTextTone.tertiary,
            ),
          );
    final trailing =
        widget.trailing ??
        (widget.obscureText && widget.showObscureToggle
            ? HIconButton(
                icon: _obscured ? HIcons.eye : HIcons.eyeOff,
                semanticsLabel: _obscured ? 'Show' : 'Hide',
                size: 36,
                onPressed: () => setState(() => _obscured = !_obscured),
              )
            : null);

    return HFieldFrame(
      label: widget.label,
      helper: widget.helper,
      error: widget.error,
      focused: _focused,
      enabled: widget.enabled,
      required: widget.required,
      minHeight: multiline ? 96 : 52,
      padding: EdgeInsets.fromLTRB(
        16,
        multiline ? 12 : 0,
        trailing == null ? 16 : 8,
        multiline ? 12 : 0,
      ),
      leading: widget.leadingIcon == null
          ? null
          : HIcon(
              widget.leadingIcon!,
              tone: _focused ? HTextTone.brand : HTextTone.tertiary,
            ),
      trailing: trailing == null && counter == null
          ? null
          : Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [?trailing, ?counter],
            ),
      child: TextField(
        controller: _controller,
        focusNode: _focus,
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        autofocus: widget.autofocus,
        onTap: widget.onTap,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        keyboardType:
            widget.keyboardType ?? (multiline ? TextInputType.multiline : null),
        textInputAction: widget.textInputAction,
        textCapitalization: widget.textCapitalization,
        inputFormatters: widget.inputFormatters,
        obscureText: widget.obscureText && _obscured,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        maxLength: widget.maxLength,
        autofillHints: widget.autofillHints,
        enableSuggestions: widget.enableSuggestions,
        autocorrect: widget.autocorrect,
        cursorColor: c.brand,
        cursorRadius: const Radius.circular(2),
        style: h.type.bodyLg.copyWith(
          color: widget.enabled ? c.textPrimary : c.textTertiary,
        ),
        textAlignVertical: multiline
            ? TextAlignVertical.top
            : TextAlignVertical.center,
        decoration: InputDecoration(
          isCollapsed: true,
          isDense: true,
          border: InputBorder.none,
          counterText: '',
          hintText: widget.hint,
          hintStyle: h.type.bodyLg.copyWith(color: c.textTertiary),
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
