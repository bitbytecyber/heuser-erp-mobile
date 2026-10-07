import 'package:intl/intl.dart';

/// Date and time wording of the tracker (`tracker.tsx` helpers).
abstract final class TrackerFormat {
  /// `Tue 29 Sep`
  static String day(DateTime d) => DateFormat('EEE d MMM').format(d);

  /// `10:30 AM`
  static String time(DateTime d) => DateFormat('h:mm a').format(d);

  /// `Tue 29 Sep at 10:30 AM`
  static String slot(DateTime? d) => d == null ? '' : '${day(d)} at ${time(d)}';

  /// `29 Sep 2026`
  static String dateLong(DateTime d) => DateFormat('d MMM yyyy').format(d);

  /// `Tuesday 29 September`
  static String dayLong(DateTime d) => DateFormat('EEEE d MMMM').format(d);

  /// `29 Sep, 10:30 AM`
  static String history(String iso) {
    final d = DateTime.tryParse(iso)?.toLocal();
    if (d == null) return iso;
    return '${DateFormat('dd MMM').format(d)}, ${time(d)}';
  }

  /// `interview_booked` → `Interview booked`
  static String humanize(String action) {
    final t = action.replaceAll('_', ' ');
    return t.isEmpty ? t : '${t[0].toUpperCase()}${t.substring(1)}';
  }

  /// Up to three names, then "and N more".
  static String names(
    List<String> list,
    String Function(String names, int n) andMore,
  ) {
    final head = list.take(3).join(', ');
    return list.length > 3 ? andMore(head, list.length - 3) : head;
  }
}
