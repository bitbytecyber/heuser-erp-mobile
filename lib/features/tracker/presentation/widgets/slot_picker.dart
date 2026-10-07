import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/tracker/domain/slot_days.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/widgets/tracker_format.dart';

/// Times grouped by day, each day folding open and shut (`Slots` in
/// `tracker.tsx`). The first day and the day of the family's booking start
/// open; tapping a time calls [onPick] (the page confirms before booking).
class SlotPicker extends StatefulWidget {
  /// Creates the picker.
  const SlotPicker({
    required this.items,
    required this.onPick,
    this.enabled = true,
    super.key,
  });

  /// Times.
  final List<SlotItem> items;

  /// A time was tapped.
  final ValueChanged<SlotItem> onPick;

  /// Disabled while a booking is in flight.
  final bool enabled;

  @override
  State<SlotPicker> createState() => _SlotPickerState();
}

class _SlotPickerState extends State<SlotPicker> {
  Set<DateTime>? _open;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context).tracker.slots;
    final days = groupSlotsByDay(widget.items);
    final open = _open ?? initiallyOpenDays(days);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final d in days) ...[
          HListTile(
            title: d.date == today
                ? t.today(date: TrackerFormat.dayLong(d.date))
                : d.date == today.add(const Duration(days: 1))
                ? t.tomorrow(date: TrackerFormat.dayLong(d.date))
                : TrackerFormat.dayLong(d.date),
            subtitle: d.free == 0
                ? t.full
                : d.free == 1
                ? t.availableOne
                : t.available(n: d.free),
            icon: HIcons.calendar,
            tone: d.free == 0 ? HTone.neutral : HTone.brand,
            showChevron: false,
            trailing: HIcon(
              open.contains(d.date) ? HIcons.chevronDown : HIcons.chevronRight,
              tone: HTextTone.tertiary,
            ),
            onTap: () => setState(() {
              final next = {...open};
              if (!next.remove(d.date)) next.add(d.date);
              _open = next;
            }),
          ),
          if (open.contains(d.date))
            Padding(
              padding: const EdgeInsets.fromLTRB(
                HSpace.x2,
                HSpace.x1,
                HSpace.x2,
                HSpace.x3,
              ),
              child: Wrap(
                spacing: HSpace.x2,
                runSpacing: HSpace.x2,
                children: [
                  for (final s in d.items)
                    HChip(
                      _label(s, Translations.of(context)),
                      selected: s.mine,
                      enabled: widget.enabled && s.key.isNotEmpty && !s.mine,
                      onTap: () => widget.onPick(s),
                    ),
                ],
              ),
            ).hFadeInUp(context),
        ],
      ],
    );
  }

  static String _label(SlotItem s, Translations tr) {
    final t = tr.tracker.slots;
    final time = TrackerFormat.time(s.at);
    if (s.mine) return '$time · ${t.lastSelected}';
    if (s.total != null) {
      return '$time · ${t.places(booked: s.booked ?? 0, total: s.total!, left: s.left)}';
    }
    return '$time · ${t.left(n: s.left)}';
  }
}
