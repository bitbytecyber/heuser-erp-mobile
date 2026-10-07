import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/tracker/domain/tracker_rules.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/widgets/tracker_format.dart';

/// The one status card under the stage bar.
class StatusCardView extends StatelessWidget {
  /// Creates the card.
  const StatusCardView({
    required this.card,
    required this.collegeName,
    super.key,
  });

  /// What applies.
  final StatusCard card;

  /// College name for the copy.
  final String collegeName;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context).tracker.status;
    final at = card.at;
    final (icon, title, body) = switch (card.kind) {
      StatusKind.withdrawn => (
        HIcons.close,
        t.withdrawnTitle,
        t.withdrawnBody(
          date: at == null ? t.anEarlierDate : TrackerFormat.dateLong(at),
        ),
      ),
      StatusKind.notOffered => (
        HIcons.close,
        t.notOfferedTitle,
        t.notOfferedBody,
      ),
      StatusKind.closed => (HIcons.close, t.closedTitle, t.closedBody),
      StatusKind.enrolled => (
        HIcons.school,
        t.enrolledTitle(name: collegeName),
        t.enrolledBody,
      ),
      StatusKind.readyToEnroll => (
        HIcons.checkCircle,
        t.readyTitle,
        t.readyBody,
      ),
      StatusKind.paymentChecking => (
        HIcons.payment,
        t.checkingTitle,
        t.checkingBody,
      ),
      StatusKind.paymentRejected => (
        HIcons.payment,
        t.payTitle,
        t.payRejectedBody,
      ),
      StatusKind.payVoucher => (HIcons.payment, t.payTitle, t.payBody),
      StatusKind.offerExpired => (
        HIcons.offer,
        t.offerExpiredTitle,
        t.offerExpiredBody,
      ),
      StatusKind.offerDeclined => (
        HIcons.offer,
        t.offerDeclinedTitle,
        t.offerDeclinedBody,
      ),
      StatusKind.offered => (HIcons.offer, t.offeredTitle, t.offeredBody),
      StatusKind.sportsTrial => (HIcons.sports, t.trialTitle, t.trialBody),
      StatusKind.interviewDone => (
        HIcons.clock,
        t.interviewDoneTitle,
        t.interviewDoneBody,
      ),
      StatusKind.interviewBooked => (
        HIcons.calendar,
        t.bookedTitle,
        t.bookedBody(when: TrackerFormat.slot(at)),
      ),
      StatusKind.bookInterview => (HIcons.calendar, t.bookTitle, t.bookBody),
      StatusKind.reviewing => (
        HIcons.clock,
        t.reviewingTitle,
        card.missing.isEmpty
            ? t.reviewingBody
            : t.reviewingMissing(
                docs: card.missing.map((m) => m.toLowerCase()).join(t.and),
              ),
      ),
    };
    final c = context.h.colors;
    final bg = card.kind.positive
        ? c.successSoft
        : card.kind.negative
        ? c.surfaceAlt
        : c.brandSoft;
    final tone = card.kind.positive
        ? HTextTone.success
        : card.kind.negative
        ? HTextTone.secondary
        : HTextTone.brand;
    return HCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: HSpace.x12,
            height: HSpace.x12,
            decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
            child: Center(child: HIcon(icon, tone: tone)),
          ),
          HSpace.hgap3,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HText(title, style: HTextStyle.titleLg),
                HSpace.gap1,
                HText(body, tone: HTextTone.secondary),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
