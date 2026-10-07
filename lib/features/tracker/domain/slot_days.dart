/// One bookable time (interview time or trial session).
class SlotItem {
  /// Creates the item.
  const SlotItem({
    required this.key,
    required this.at,
    this.left = 1,
    this.booked,
    this.total,
    this.mine = false,
  });

  /// What is sent when booked (interview: the ISO start; trial: session id).
  final String key;

  /// Local start time.
  final DateTime at;

  /// Places still free.
  final int left;

  /// Interview only: places taken at this time.
  final int? booked;

  /// Interview only: all places at this time.
  final int? total;

  /// The family's current booking ("Last selected").
  final bool mine;
}

/// Times of one day.
class SlotDay {
  /// Creates the day.
  const SlotDay(this.date, this.items);

  /// Midnight of the day (local).
  final DateTime date;

  /// Times in order.
  final List<SlotItem> items;

  /// Places free that day.
  int get free => items.fold(0, (n, t) => n + t.left);
}

/// Groups times by local day, sorted (`Slots` in `tracker.tsx`).
List<SlotDay> groupSlotsByDay(Iterable<SlotItem> items) {
  final sorted = [...items]..sort((a, b) => a.at.compareTo(b.at));
  final days = <SlotDay>[];
  for (final t in sorted) {
    final d = DateTime(t.at.year, t.at.month, t.at.day);
    if (days.isNotEmpty && days.last.date == d) {
      days.last.items.add(t);
    } else {
      days.add(SlotDay(d, [t]));
    }
  }
  return days;
}

/// Days open at first: the first day and the day of the family's booking.
Set<DateTime> initiallyOpenDays(List<SlotDay> days) => {
  if (days.isNotEmpty) days.first.date,
  for (final d in days)
    if (d.items.any((t) => t.mine)) d.date,
};
