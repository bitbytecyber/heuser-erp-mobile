import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/components/feedback/h_status_pill.dart';
import 'package:heuser_ds/src/foundation/h_icons.dart';

/// Formats the time left until [deadline] relative to [now].
/// Returns `null` when the deadline has passed.
String? formatTimeLeft(DateTime deadline, DateTime now) {
  final d = deadline.difference(now);
  if (d.isNegative) return null;
  if (d.inDays >= 1) {
    final hours = d.inHours - d.inDays * 24;
    return hours > 0 ? '${d.inDays}d ${hours}h' : '${d.inDays}d';
  }
  if (d.inHours >= 1) {
    final mins = d.inMinutes - d.inHours * 60;
    return '${d.inHours}h ${mins}m';
  }
  return '${d.inMinutes}m';
}

/// Live countdown pill for offer deadlines. Re-renders every minute; tone
/// escalates to warning under 24 h and danger under 2 h / after expiry.
class HCountdown extends StatefulWidget {
  /// Creates a countdown.
  const HCountdown({
    required this.deadline,
    this.prefix = '',
    this.expiredLabel = 'Expired',
    this.now,
    super.key,
  });

  /// Deadline (local time).
  final DateTime deadline;

  /// Text before the duration, e.g. "Respond in ".
  final String prefix;

  /// Shown after the deadline.
  final String expiredLabel;

  /// Fixed "now" for tests and goldens; `null` uses the clock.
  final DateTime? now;

  @override
  State<HCountdown> createState() => _HCountdownState();
}

class _HCountdownState extends State<HCountdown> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (widget.now == null) {
      _timer = Timer.periodic(const Duration(minutes: 1), (_) {
        if (mounted) setState(() {});
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final now = widget.now ?? DateTime.now();
    final left = formatTimeLeft(widget.deadline, now);
    final remaining = widget.deadline.difference(now);
    final tone = left == null || remaining.inHours < 2
        ? HTone.danger
        : remaining.inHours < 24
        ? HTone.warning
        : HTone.brand;
    return HStatusPill(
      left == null ? widget.expiredLabel : '${widget.prefix}$left',
      tone: tone,
      icon: left == null ? HIcons.error : HIcons.clock,
    );
  }
}
