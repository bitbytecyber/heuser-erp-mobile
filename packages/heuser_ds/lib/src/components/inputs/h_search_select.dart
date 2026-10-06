import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/components/buttons/h_button.dart';
import 'package:heuser_ds/src/components/buttons/h_pressable.dart';
import 'package:heuser_ds/src/components/data/h_list_tile.dart';
import 'package:heuser_ds/src/components/feedback/h_empty_state.dart';
import 'package:heuser_ds/src/components/feedback/h_progress.dart';
import 'package:heuser_ds/src/components/feedback/h_status_pill.dart';
import 'package:heuser_ds/src/components/inputs/h_field_frame.dart';
import 'package:heuser_ds/src/components/inputs/h_text_field.dart';
import 'package:heuser_ds/src/components/surfaces/h_bottom_sheet.dart';
import 'package:heuser_ds/src/foundation/h_haptics.dart';
import 'package:heuser_ds/src/foundation/h_icon.dart';
import 'package:heuser_ds/src/foundation/h_icons.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/tokens/h_spacing.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

part 'h_search_select_internal.dart';

/// Labels for [HSearchSelect] (the app passes `t.*` strings).
class HSearchLabels {
  /// Creates labels.
  const HSearchLabels({
    this.searchHint = 'Search',
    this.noResults = 'No matches',
    this.notListed = 'Not listed? Enter it manually',
    this.error = 'Could not load. Try again.',
    this.retry = 'Try again',
  });

  /// Search box placeholder.
  final String searchHint;

  /// Empty result text.
  final String noResults;

  /// Free-text escape hatch.
  final String notListed;

  /// Load failure text.
  final String error;

  /// Retry label.
  final String retry;
}

/// Picker backed by a paged remote search (schools: 30 per page by offset).
/// Opens a sheet with a search box and an infinite list; optional "not
/// listed" escape hatch for free-text entry.
class HSearchSelect<T> extends StatelessWidget {
  /// Creates a search select.
  const HSearchSelect({
    required this.fetchPage,
    required this.labelOf,
    required this.value,
    required this.onChanged,
    this.subtitleOf,
    this.pageSize = 30,
    this.label,
    this.hint = 'Search…',
    this.helper,
    this.error,
    this.enabled = true,
    this.required = false,
    this.onOther,
    this.otherLabel,
    this.labels = const HSearchLabels(),
    this.leadingIcon = HIcons.search,
    super.key,
  });

  /// Loads one page: `fetchPage(query, offset)`; fewer than [pageSize] items ends paging.
  final Future<List<T>> Function(String query, int offset) fetchPage;

  /// Primary text of an item.
  final String Function(T item) labelOf;

  /// Secondary text of an item.
  final String Function(T item)? subtitleOf;

  /// Page size used to detect the last page.
  final int pageSize;

  /// Selected item.
  final T? value;

  /// Selection handler.
  final ValueChanged<T>? onChanged;

  /// Label.
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

  /// "Not listed" handler (free text); hidden when null.
  final VoidCallback? onOther;

  /// Text shown in the field when [onOther] was chosen (e.g. the typed name).
  final String? otherLabel;

  /// Labels.
  final HSearchLabels labels;

  /// Field glyph.
  final IconData leadingIcon;

  Future<void> _open(BuildContext context) async {
    final result = await HBottomSheet.show<_Pick<T>>(
      context,
      builder: (ctx) => _SearchSheet<T>(
        title: label,
        fetchPage: fetchPage,
        labelOf: labelOf,
        subtitleOf: subtitleOf,
        pageSize: pageSize,
        labels: labels,
        showOther: onOther != null,
      ),
    );
    if (result == null) return;
    unawaited(HHaptics.selection());
    if (result.other) {
      onOther?.call();
    } else {
      onChanged?.call(result.item as T);
    }
  }

  @override
  Widget build(BuildContext context) {
    final active = enabled && onChanged != null;
    final text = value != null ? labelOf(value as T) : (otherLabel ?? hint);
    final placeholder = value == null && otherLabel == null;
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
          leadingIcon,
          tone: state.focused ? HTextTone.brand : HTextTone.tertiary,
        ),
        trailing: const HIcon(HIcons.chevronDown, tone: HTextTone.tertiary),
        child: HText(
          text,
          style: HTextStyle.bodyLg,
          tone: placeholder || !active ? HTextTone.tertiary : HTextTone.primary,
          maxLines: 1,
        ),
      ),
    );
  }
}
