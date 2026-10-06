import 'package:flutter/material.dart' show showDatePicker;
import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/components/buttons/h_pressable.dart';
import 'package:heuser_ds/src/components/inputs/h_field_frame.dart';
import 'package:heuser_ds/src/foundation/h_haptics.dart';
import 'package:heuser_ds/src/foundation/h_icon.dart';
import 'package:heuser_ds/src/foundation/h_icons.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:intl/intl.dart';

/// Date field. Opens the platform date picker (Material engine, themed by
/// the bridge) and shows the value as `14 Mar 2010`.
class HDatePicker extends StatelessWidget {
  /// Creates a date field.
  const HDatePicker({
    required this.value,
    required this.onChanged,
    this.label,
    this.hint = 'Select a date',
    this.helper,
    this.error,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.enabled = true,
    this.required = false,
    this.format = 'd MMM yyyy',
    super.key,
  });

  /// Selected date.
  final DateTime? value;

  /// Change handler.
  final ValueChanged<DateTime>? onChanged;

  /// Label.
  final String? label;

  /// Placeholder.
  final String hint;

  /// Helper.
  final String? helper;

  /// Error.
  final String? error;

  /// Earliest selectable (default 1900).
  final DateTime? firstDate;

  /// Latest selectable (default today + 10 years).
  final DateTime? lastDate;

  /// Initial date when nothing is selected (default: [lastDate] or today).
  final DateTime? initialDate;

  /// Enabled.
  final bool enabled;

  /// Required marker.
  final bool required;

  /// intl pattern.
  final String format;

  Future<void> _open(BuildContext context) async {
    final now = DateTime.now();
    final first = firstDate ?? DateTime(1900);
    final last = lastDate ?? DateTime(now.year + 10, 12, 31);
    var initial = value ?? initialDate ?? now;
    if (initial.isAfter(last)) initial = last;
    if (initial.isBefore(first)) initial = first;
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: first,
      lastDate: last,
    );
    if (picked != null) {
      HHaptics.selection().ignore();
      onChanged?.call(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final active = enabled && onChanged != null;
    final text = value == null ? hint : DateFormat(format).format(value!);
    return HPressable(
      onPressed: active ? () => _open(context) : null,
      haptic: false,
      pressedScale: 1,
      isButton: false,
      semanticsLabel: label,
      builder: (context, state) => HFieldFrame(
        label: label,
        helper: helper,
        error: error,
        focused: state.focused,
        enabled: active,
        required: required,
        leading: HIcon(
          HIcons.calendar,
          tone: state.focused ? HTextTone.brand : HTextTone.tertiary,
        ),
        child: HText(
          text,
          style: HTextStyle.bodyLg,
          tone: value == null || !active
              ? HTextTone.tertiary
              : HTextTone.primary,
          maxLines: 1,
        ),
      ),
    );
  }
}
