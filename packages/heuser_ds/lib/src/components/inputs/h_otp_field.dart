import 'package:flutter/material.dart'
    show InputBorder, InputDecoration, TextField;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/foundation/h_animate.dart';
import 'package:heuser_ds/src/foundation/h_haptics.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/tokens/h_motion.dart';
import 'package:heuser_ds/src/tokens/h_radius.dart';
import 'package:heuser_ds/src/tokens/h_spacing.dart';

/// Code entry as individual cells: 6 digits for TOTP, 8 alphanumerics
/// (`XXXX-XXXX`, with a dash between groups) for allauth email codes.
/// One hidden text field receives input and paste; cells only render.
class HOtpField extends StatefulWidget {
  /// Creates a code field.
  const HOtpField({
    required this.length,
    required this.onCompleted,
    this.onChanged,
    this.groupSize,
    this.alphanumeric = false,
    this.autofocus = true,
    this.error,
    this.enabled = true,
    this.controller,
    this.semanticsLabel = 'Verification code',
    super.key,
  });

  /// Number of characters.
  final int length;

  /// Fires once all cells are filled (uppercased when [alphanumeric]).
  final ValueChanged<String> onCompleted;

  /// Fires on every change.
  final ValueChanged<String>? onChanged;

  /// Draws a dash after every [groupSize] cells (e.g. 4 for `XXXX-XXXX`).
  final int? groupSize;

  /// Accept letters and digits (else digits only).
  final bool alphanumeric;

  /// Autofocus.
  final bool autofocus;

  /// Error text (danger cells + shake).
  final String? error;

  /// Enabled.
  final bool enabled;

  /// Optional controller (to clear from outside).
  final TextEditingController? controller;

  /// What screen readers call the field. The cells are drawn for sighted
  /// users only; assistive tech sees one labelled text field.
  final String semanticsLabel;

  @override
  State<HOtpField> createState() => _HOtpFieldState();
}

class _HOtpFieldState extends State<HOtpField> {
  /// The controller this state created (and must dispose), if any.
  TextEditingController? _owned;
  late TextEditingController _c;
  final FocusNode _focus = FocusNode();
  String _last = '';

  @override
  void initState() {
    super.initState();
    _c = widget.controller ?? (_owned = TextEditingController());
    _last = _sanitize(_c.text);
    _c.addListener(_onText);
    _focus.addListener(_onFocus);
  }

  @override
  void didUpdateWidget(HOtpField old) {
    super.didUpdateWidget(old);
    if (widget.controller == old.controller) return;
    _c.removeListener(_onText);
    final previous = _c.value;
    _owned?.dispose();
    _owned = null;
    _c =
        widget.controller ??
        (_owned = TextEditingController.fromValue(previous));
    _last = _sanitize(_c.text);
    _c.addListener(_onText);
  }

  @override
  void dispose() {
    _c.removeListener(_onText);
    _owned?.dispose();
    _focus.dispose();
    super.dispose();
  }

  void _onFocus() {
    if (mounted) setState(() {});
  }

  String _sanitize(String raw) => _OtpFormatter.clean(
    raw,
    length: widget.length,
    alphanumeric: widget.alphanumeric,
  );

  // Controllers set from outside bypass input formatters, so text is
  // normalised here too.
  void _onText() {
    final v = _sanitize(_c.text);
    if (v != _c.text) {
      _c.value = TextEditingValue(
        text: v,
        selection: TextSelection.collapsed(offset: v.length),
      );
      return;
    }
    if (v == _last) return;
    _last = v;
    setState(() {});
    widget.onChanged?.call(v);
    if (v.length == widget.length) {
      HHaptics.success().ignore();
      widget.onCompleted(v);
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final c = h.colors;
    final text = _c.text;
    final hasError = widget.error != null && widget.error!.isNotEmpty;
    final cells = <Widget>[];
    for (var i = 0; i < widget.length; i++) {
      final filled = i < text.length;
      final isActive =
          _focus.hasFocus &&
          (i == text.length ||
              (i == widget.length - 1 && text.length == widget.length));
      if (widget.groupSize != null && i > 0 && i % widget.groupSize! == 0) {
        cells.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: HSpace.x1),
            child: Container(width: 10, height: 2, color: c.outline),
          ),
        );
      }
      cells.add(
        Expanded(
          child: AnimatedContainer(
            duration: h.motion.of(h.motion.fast),
            curve: HMotion.easeOut,
            height: 56,
            margin: const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              color: widget.enabled
                  ? c.surfaceAlt
                  : c.surfaceAlt.withValues(alpha: 0.6),
              borderRadius: HRadius.smAll,
              border: Border.all(
                color: hasError
                    ? c.danger
                    : (isActive
                          ? c.brand
                          : (filled ? c.outline : c.outlineSoft)),
                width: isActive || hasError ? 1.8 : 1,
              ),
              boxShadow: isActive
                  ? [BoxShadow(color: c.focusRing, spreadRadius: 2)]
                  : const [],
            ),
            alignment: Alignment.center,
            child: HText(
              filled ? text[i] : '',
              style: HTextStyle.headlineSm,
              tone: hasError ? HTextTone.danger : HTextTone.primary,
            ),
          ),
        ),
      );
    }
    final row = Row(children: cells);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            // The real input: transparent, full-size, so taps and paste land
            // on it. It stays in the semantics tree as the one text field
            // screen readers interact with; the cells are excluded.
            Positioned.fill(
              child: Semantics(
                label: widget.semanticsLabel,
                child: Opacity(
                  opacity: 0,
                  alwaysIncludeSemantics: true,
                  child: TextField(
                    controller: _c,
                    focusNode: _focus,
                    enabled: widget.enabled,
                    autofocus: widget.autofocus,
                    keyboardType: widget.alphanumeric
                        ? TextInputType.text
                        : TextInputType.number,
                    textCapitalization: widget.alphanumeric
                        ? TextCapitalization.characters
                        : TextCapitalization.none,
                    autofillHints: const [AutofillHints.oneTimeCode],
                    enableSuggestions: false,
                    autocorrect: false,
                    showCursor: false,
                    // Strip separators *before* truncating, so a pasted
                    // `ABCD-EFGH` or `123 456` fills every cell.
                    inputFormatters: [
                      _OtpFormatter(
                        length: widget.length,
                        alphanumeric: widget.alphanumeric,
                      ),
                    ],
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: '',
                    ),
                  ),
                ),
              ),
            ),
            ExcludeSemantics(
              child: IgnorePointer(child: hasError ? row.hShake(context) : row),
            ),
          ],
        ),
        if (hasError) ...[
          HSpace.gap2,
          HText(
            widget.error!,
            style: HTextStyle.bodySm,
            tone: HTextTone.danger,
            align: TextAlign.center,
          ),
        ],
      ],
    );
  }
}

/// Keeps only code characters (uppercased when alphanumeric), then
/// truncates to the code length.
class _OtpFormatter extends TextInputFormatter {
  _OtpFormatter({required this.length, required this.alphanumeric});

  final int length;
  final bool alphanumeric;

  static String clean(
    String raw, {
    required int length,
    required bool alphanumeric,
  }) {
    var v = raw.replaceAll(
      RegExp(alphanumeric ? '[^A-Za-z0-9]' : '[^0-9]'),
      '',
    );
    if (alphanumeric) v = v.toUpperCase();
    return v.length > length ? v.substring(0, length) : v;
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final v = clean(newValue.text, length: length, alphanumeric: alphanumeric);
    if (v == newValue.text) return newValue;
    return TextEditingValue(
      text: v,
      selection: TextSelection.collapsed(offset: v.length),
    );
  }
}
