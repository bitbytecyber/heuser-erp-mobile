import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/offer.dart';

/// How the offer task reads.
enum OfferTaskKind {
  /// No offer yet (or still with the office).
  waiting,

  /// Sent; can be accepted.
  open,

  /// Sent but the deadline has passed.
  deadlinePassed,

  /// Accepted.
  accepted,

  /// Declined.
  declined,

  /// Expired.
  expired,
}

/// The state of one instalment for the family.
enum InstalmentKind {
  /// Paid and verified.
  paid,

  /// Proof sent; Finance is checking it.
  checking,

  /// Proof turned down but not told yet: still reads "being checked", and
  /// another copy can be sent.
  replaceable,

  /// Proof rejected: upload again.
  rejected,

  /// Nothing sent yet.
  due,
}

/// Offer and payment rules (`OfferTask` / `PaymentTask` in `tracker.tsx`).
abstract final class OfferRules {
  /// The offer task's state at [now].
  static OfferTaskKind offerTask(Offer? offer, DateTime now) {
    if (offer == null) return OfferTaskKind.waiting;
    return switch (offer.state) {
      'accepted' => OfferTaskKind.accepted,
      'declined' => OfferTaskKind.declined,
      'expired' => OfferTaskKind.expired,
      'sent' =>
        deadlineEnd(offer) != null && !deadlineEnd(offer)!.isAfter(now)
            ? OfferTaskKind.deadlinePassed
            : OfferTaskKind.open,
      _ => OfferTaskKind.waiting,
    };
  }

  /// The deadline as the end of that day, local time (`T23:59:59`).
  static DateTime? deadlineEnd(Offer offer) {
    final d = DateTime.tryParse(offer.deadline ?? '');
    if (d == null) return null;
    return DateTime(d.year, d.month, d.day, 23, 59, 59);
  }

  /// Fee lines with a scholarship saving.
  static List<OfferLine> savings(Offer offer) => offer.calculation.lines
      .where((l) => (num.tryParse(l.saving) ?? 0) > 0)
      .toList();

  /// `Merit 25%, Sports 10%`
  static String scholarshipSummary(Offer offer) => offer.scholarships
      .map((s) => '${s.name} ${_trim(s.percent)}%')
      .join(', ');

  /// Every instalment is paid.
  static bool allPaid(Offer offer) =>
      offer.instalments.isNotEmpty && offer.instalments.every((i) => i.paid);

  /// The newest proof sent for [i].
  static PaymentEvidence? latestEvidence(Instalment i) {
    final all = [...i.evidence]
      ..sort((a, b) => b.submittedAt.compareTo(a.submittedAt));
    return all.firstOrNull;
  }

  /// What the family sees for one instalment.
  static InstalmentKind instalment(Instalment i) {
    if (i.paid) return InstalmentKind.paid;
    final latest = latestEvidence(i);
    if (latest == null) return InstalmentKind.due;
    if (latest.replaceable ?? false) return InstalmentKind.replaceable;
    return switch (latest.state) {
      'pending' => InstalmentKind.checking,
      'rejected' => InstalmentKind.rejected,
      _ => InstalmentKind.due,
    };
  }

  /// Part of it received, the rest still due.
  static bool partlyPaid(Instalment i) =>
      !i.paid && (num.tryParse(i.paidAmount) ?? 0) > 0;

  /// Several non-tuition instalments: number them.
  static bool numberInstalments(Offer offer) =>
      offer.instalments.where((x) => x.kind != 'tuition').length > 1;

  /// The pay-by date: the instalment's own, else the offer deadline.
  static DateTime? payBy(Instalment i, Offer offer) =>
      DateTime.tryParse(i.dueDate ?? offer.deadline ?? '');

  /// `PKR 125,000`
  static String money(String v) {
    final n = num.tryParse(v) ?? 0;
    final s = n.round().abs().toString();
    final b = StringBuffer();
    for (var k = 0; k < s.length; k++) {
      if (k > 0 && (s.length - k) % 3 == 0) b.write(',');
      b.write(s[k]);
    }
    return 'PKR ${n < 0 ? '-' : ''}$b';
  }

  /// The application has a live offer worth listing (sent or after).
  static bool shown(Application a) =>
      offerTask(a.offer, DateTime.now()) != OfferTaskKind.waiting;

  static String _trim(String percent) {
    final n = num.tryParse(percent);
    if (n == null) return percent;
    return n == n.roundToDouble() ? '${n.toInt()}' : '$n';
  }
}
