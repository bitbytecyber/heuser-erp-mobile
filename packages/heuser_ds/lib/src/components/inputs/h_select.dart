import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/components/buttons/h_pressable.dart';
import 'package:heuser_ds/src/components/inputs/h_field_frame.dart';
import 'package:heuser_ds/src/components/inputs/h_text_field.dart';
import 'package:heuser_ds/src/components/surfaces/h_bottom_sheet.dart';
import 'package:heuser_ds/src/foundation/h_haptics.dart';
import 'package:heuser_ds/src/foundation/h_icon.dart';
import 'package:heuser_ds/src/foundation/h_icons.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/tokens/h_radius.dart';
import 'package:heuser_ds/src/tokens/h_spacing.dart';

/// One option of an [HSelect].
class HSelectOption<T> {
  /// Creates an option.
  const HSelectOption({
    required this.value,
    required this.label,
    this.subtitle,
    this.icon,
  });

  /// Value.
  final T value;

  /// Label.
  final String label;

  /// Secondary line.
  final String? subtitle;

  /// Leading glyph.
  final IconData? icon;
}

/// Picker field for a fixed list of options. Opens an [HBottomSheet] with
/// the options (and a filter box when there are more than eight).
class HSelect<T> extends StatelessWidget {
  /// Creates a select.
  const HSelect({
    required this.options,
    required this.value,
    required this.onChanged,
    this.label,
    this.hint = 'Choose…',
    this.helper,
    this.error,
    this.enabled = true,
    this.required = false,
    this.sheetTitle,
    this.searchHint = 'Search',
    this.leadingIcon,
    super.key,
  });

  /// Options.
  final List<HSelectOption<T>> options;

  /// Selected value.
  final T? value;

  /// Change handler.
  final ValueChanged<T>? onChanged;

  /// Label above.
  final String? label;

  /// Placeholder.
  final String hint;

  /// Helper.
  final String? helper;

  /// Error.
  final String? error;

  /// Enabled.
  final bool enabled;

  /// Required marker.
  final bool required;

  /// Title of the sheet (defaults to [label]).
  final String? sheetTitle;

  /// Placeholder of the filter box.
  final String searchHint;

  /// Leading glyph in the field.
  final IconData? leadingIcon;

  HSelectOption<T>? get _selected {
    for (final o in options) {
      if (o.value == value) return o;
    }
    return null;
  }

  Future<void> _open(BuildContext context) async {
    final picked = await HBottomSheet.show<T>(
      context,
      builder: (ctx) => _OptionsSheet<T>(
        title: sheetTitle ?? label,
        options: options,
        selected: value,
        searchHint: searchHint,
      ),
    );
    if (picked != null) {
      unawaited(HHaptics.selection());
      onChanged?.call(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final active = enabled && onChanged != null;
    final selected = _selected;
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
        leading: leadingIcon == null
            ? null
            : HIcon(leadingIcon!, tone: HTextTone.tertiary),
        trailing: const HIcon(HIcons.chevronDown, tone: HTextTone.tertiary),
        child: HText(
          selected?.label ?? hint,
          style: HTextStyle.bodyLg,
          tone: selected == null || !active
              ? HTextTone.tertiary
              : HTextTone.primary,
          maxLines: 1,
        ),
      ),
    );
  }
}

class _OptionsSheet<T> extends StatefulWidget {
  const _OptionsSheet({
    required this.title,
    required this.options,
    required this.selected,
    required this.searchHint,
  });
  final String? title;
  final List<HSelectOption<T>> options;
  final T? selected;
  final String searchHint;

  @override
  State<_OptionsSheet<T>> createState() => _OptionsSheetState<T>();
}

class _OptionsSheetState<T> extends State<_OptionsSheet<T>> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final c = context.h.colors;
    final searchable = widget.options.length > 8;
    final q = _query.trim().toLowerCase();
    final shown = q.isEmpty
        ? widget.options
        : widget.options
              .where(
                (o) =>
                    o.label.toLowerCase().contains(q) ||
                    (o.subtitle?.toLowerCase().contains(q) ?? false),
              )
              .toList();
    return HBottomSheet(
      title: widget.title,
      padding: const EdgeInsets.fromLTRB(HSpace.x2, 0, HSpace.x2, HSpace.x4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (searchable)
            Padding(
              padding: const EdgeInsets.fromLTRB(
                HSpace.x2,
                0,
                HSpace.x2,
                HSpace.x2,
              ),
              child: HTextField(
                hint: widget.searchHint,
                leadingIcon: HIcons.search,
                onChanged: (v) => setState(() => _query = v),
              ),
            ),
          for (final o in shown)
            HPressable(
              onPressed: () => Navigator.of(context).pop(o.value),
              pressedScale: 1,
              haptic: false,
              semanticsLabel: o.label,
              builder: (context, state) {
                final isSel = o.value == widget.selected;
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: HSpace.x3,
                    vertical: HSpace.x3,
                  ),
                  decoration: BoxDecoration(
                    color: isSel
                        ? c.brandSoft
                        : (state.pressed || state.hovered
                              ? c.surfaceAlt
                              : const Color(0x00000000)),
                    borderRadius: HRadius.smAll,
                  ),
                  child: Row(
                    children: [
                      if (o.icon != null) ...[
                        HIcon(
                          o.icon!,
                          tone: isSel
                              ? HTextTone.brandStrong
                              : HTextTone.secondary,
                        ),
                        HSpace.hgap3,
                      ],
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HText(
                              o.label,
                              style: HTextStyle.bodyLg,
                              tone: isSel
                                  ? HTextTone.brandStrong
                                  : HTextTone.primary,
                            ),
                            if (o.subtitle != null)
                              HText(
                                o.subtitle!,
                                style: HTextStyle.bodySm,
                                tone: HTextTone.secondary,
                              ),
                          ],
                        ),
                      ),
                      if (isSel)
                        const HIcon(HIcons.check, tone: HTextTone.brandStrong),
                    ],
                  ),
                );
              },
            ),
          if (shown.isEmpty)
            const Padding(
              padding: EdgeInsets.all(HSpace.x4),
              child: HText(
                'No matches',
                tone: HTextTone.tertiary,
                align: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}
