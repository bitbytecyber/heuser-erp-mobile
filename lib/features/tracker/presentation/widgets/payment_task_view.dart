import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/files/file_pick_service.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/applications/data/datasources/offer_api.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/offer.dart';
import 'package:heuser_erp_mobile/features/documents/presentation/widgets/file_source_sheet.dart';
import 'package:heuser_erp_mobile/features/tracker/domain/offer_rules.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/cubit/downloads_cubit.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/widgets/task_tile.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/widgets/tracker_format.dart';

/// Fee payment: one voucher per instalment, with proof of payment upload.
class PaymentTaskView extends StatelessWidget {
  /// Creates the task.
  const PaymentTaskView({
    required this.application,
    required this.files,
    super.key,
  });

  /// The application.
  final Application application;

  /// File picking for proofs.
  final FilePickService files;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context).tracker.payment;
    final offer = application.offer;
    if (offer == null || offer.state != 'accepted') {
      return TaskTile(
        state: TaskState.locked,
        icon: HIcons.payment,
        title: t.title,
        sub: t.locked,
      );
    }
    final paid = OfferRules.allPaid(offer);
    return TaskTile(
      state: paid ? TaskState.done : TaskState.todo,
      icon: HIcons.payment,
      title: t.title,
      sub: paid ? t.paid : t.due,
      children: [
        for (final i in offer.instalments) ...[
          _InstalmentCard(
            application: application,
            offer: offer,
            instalment: i,
            files: files,
          ),
          HSpace.gap3,
        ],
      ],
    );
  }
}

class _InstalmentCard extends StatefulWidget {
  const _InstalmentCard({
    required this.application,
    required this.offer,
    required this.instalment,
    required this.files,
  });

  final Application application;
  final Offer offer;
  final Instalment instalment;
  final FilePickService files;

  @override
  State<_InstalmentCard> createState() => _InstalmentCardState();
}

class _InstalmentCardState extends State<_InstalmentCard> {
  String _method = 'online';

  Future<void> _upload() async {
    final bloc = context.read<TrackerBloc>();
    final source = await FileSourceSheet.show(context);
    if (source == null) return;
    final f = await widget.files.pick(source);
    if (f == null) return;
    bloc.add(
      TrackerEvent.evidenceSubmitted(
        instalment: widget.instalment.id,
        method: _method,
        filePath: f.path,
        fileName: f.name,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context).tracker.payment;
    final i = widget.instalment;
    final offer = widget.offer;
    final kind = OfferRules.instalment(i);
    final latest = OfferRules.latestEvidence(i);
    final payBy = OfferRules.payBy(i, offer);
    final title = i.kind == 'tuition'
        ? (offer.tuitionPeriod?.isNotEmpty ?? false)
              ? t.tuitionPeriod(period: offer.tuitionPeriod!)
              : t.tuition
        : OfferRules.numberInstalments(offer)
        ? t.instalment(n: i.sequence)
        : t.admission;
    final busy = context.select<TrackerBloc, bool>((b) => b.state.busy);
    final downloading = context.select<DownloadsCubit, bool>(
      (c) =>
          c.state.busy.contains(DownloadsCubit.keyOf(OfferPdf.challan, i.id)),
    );
    return HCard(
      elevation: HCardElevation.flat,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HText(title, style: HTextStyle.labelMd, tone: HTextTone.secondary),
          HSpace.gap2,
          HKeyValue(
            label: t.amount,
            value: OfferRules.money(i.amount),
            inline: true,
          ),
          HKeyValue(
            label: t.payBy,
            value: payBy == null ? '' : TrackerFormat.dateLong(payBy),
            inline: true,
          ),
          if (OfferRules.partlyPaid(i)) ...[
            HSpace.gap2,
            HText(
              t.partly(
                paid: OfferRules.money(i.paidAmount),
                left: OfferRules.money(i.remaining),
              ),
              style: HTextStyle.bodySm,
              tone: HTextTone.warning,
            ),
          ],
          if (kind == InstalmentKind.rejected) ...[
            HSpace.gap2,
            HText(
              [
                if (latest?.reason.trim().isNotEmpty ?? false)
                  latest!.reason.trim(),
                t.uploadAgain,
              ].join(' '),
              style: HTextStyle.bodySm,
              tone: HTextTone.danger,
            ),
          ],
          HSpace.gap3,
          if (kind == InstalmentKind.paid)
            HStatusPill(
              t.paidPill,
              tone: HTone.success,
              icon: HIcons.checkCircle,
            )
          else if (kind == InstalmentKind.checking)
            HStatusPill(
              t.checkingPill,
              tone: HTone.warning,
              icon: HIcons.hourglass,
            )
          else ...[
            if (kind == InstalmentKind.replaceable) ...[
              HStatusPill(t.checkingPill, tone: HTone.warning),
              HSpace.gap2,
            ],
            HButton.tonal(
              label: OfferRules.partlyPaid(i) ? t.balanceVoucher : t.voucher,
              icon: HIcons.download,
              size: HButtonSize.sm,
              loading: downloading,
              onPressed: () => unawaited(
                context.read<DownloadsCubit>().open(
                  offer.id,
                  OfferPdf.challan,
                  instalment: i.id,
                  sequence: i.sequence,
                ),
              ),
            ),
            HSpace.gap3,
            HSegmented<String>(
              segments: [
                HSegment(value: 'online', label: t.online),
                HSegment(value: 'bank', label: t.bank),
              ],
              value: _method,
              onChanged: (v) => setState(() => _method = v),
            ),
            HSpace.gap3,
            HButton.filled(
              label: kind == InstalmentKind.rejected
                  ? t.again
                  : kind == InstalmentKind.replaceable
                  ? t.another
                  : t.upload,
              icon: HIcons.upload,
              loading: busy,
              onPressed: busy ? null : () => unawaited(_upload()),
            ),
          ],
        ],
      ),
    );
  }
}
