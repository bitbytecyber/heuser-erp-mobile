import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_options.dart';
import 'package:heuser_erp_mobile/features/tracker/domain/slot_days.dart';

/// Interview times → slot items. The family's current booking is marked
/// and, when it is no longer offered (fully booked), added back so it stays
/// visible (`InterviewTask` in `tracker.tsx`).
List<SlotItem> interviewSlots(List<TimeOption> times, Interview? current) {
  final mineIso = current?.startsAt;
  final mine = mineIso == null ? null : DateTime.tryParse(mineIso);
  final items = <SlotItem>[
    for (final t in times)
      if (DateTime.tryParse(t.startsAt) case final at?)
        SlotItem(
          key: t.startsAt,
          at: at.toLocal(),
          left: t.places,
          booked: t.booked,
          total: t.total,
          mine: mine != null && at.isAtSameMomentAs(mine),
        ),
  ];
  final live =
      current != null &&
      (current.state == 'upcoming' || current.state == 'delayed');
  if (live && mine != null && !items.any((s) => s.mine)) {
    items.add(SlotItem(key: '', at: mine.toLocal(), left: 0, mine: true));
  }
  return items;
}

/// Trial sessions → slot items (the key is the session id).
List<SlotItem> trialSlots(List<TrialOption> sessions) => [
  for (final s in sessions)
    if (DateTime.tryParse(s.startsAt) case final at?)
      SlotItem(key: '${s.id}', at: at.toLocal(), left: s.placesLeft),
];
