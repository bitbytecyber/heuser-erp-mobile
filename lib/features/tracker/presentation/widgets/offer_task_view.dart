import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/applications/data/datasources/offer_api.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/offer.dart';
import 'package:heuser_erp_mobile/features/tracker/domain/offer_rules.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/cubit/downloads_cubit.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/widgets/task_tile.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/widgets/tracker_format.dart';

/// The offer: summary, deadline countdown, fee table, accept, PDFs.
class OfferTaskView extends StatefulWidget {
  /// Creates the task.
  const OfferTaskView({required this.application, super.key});

  /// The application.
  final Application application;

  @override
  State<OfferTaskView> createState() => _OfferTaskViewState();
}

class _OfferTaskViewState extends State<OfferTaskView> {
  /// Fires when the deadline passes while the screen is open, so Accept
  /// gives way to "deadline passed" without a refresh.
  Timer? _deadline;

  @override
  void initState() {
    super.initState();
    _schedule();
  }

  @override
  void didUpdateWidget(OfferTaskView old) {
    super.didUpdateWidget(old);
    if (old.application.offer != widget.application.offer) _schedule();
  }

  @override
  void dispose() {
    _deadline?.cancel();
    super.dispose();
  }

  void _schedule() {
    _deadline?.cancel();
    _deadline = null;
    final offer = widget.application.offer;
    final now = DateTime.now();
    if (OfferRules.offerTask(offer, now) != OfferTaskKind.open) return;
    final end = OfferRules.deadlineEnd(offer!);
    if (end == null) return;
    // At the end of that day `offerTask` flips; if the timer fires a hair
    // early, [_schedule] arms it again for the remainder.
    _deadline = Timer(end.difference(now), () {
      if (!mounted) return;
      setState(_schedule);
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context).tracker.offer;
    final a = widget.application;
    final offer = a.offer;
    final kind = OfferRules.offerTask(offer, DateTime.now());
    if (offer == null || kind == OfferTaskKind.waiting) {
      return TaskTile(
        state: TaskState.locked,
        icon: HIcons.offer,
        title: t.waitingTitle,
        sub: t.waitingSub,
      );
    }
    final level = a.level == Level.as_ ? t.levelAS : t.levelA2;
    var summary = t.summary(level: level, cycle: a.cycle);
    final sch = OfferRules.scholarshipSummary(offer);
    if (sch.isNotEmpty) {
      summary = t.withScholarships(summary: summary, list: sch);
    }
    if (offer.isConditional) summary = t.conditional(summary: summary);
    final sub = switch (kind) {
      OfferTaskKind.accepted => t.accepted,
      OfferTaskKind.declined => t.declined,
      OfferTaskKind.expired => t.expired,
      _ => summary,
    };
    final calc = offer.calculation;
    final deadline = OfferRules.deadlineEnd(offer);
    return TaskTile(
      state: switch (kind) {
        OfferTaskKind.open || OfferTaskKind.deadlinePassed => TaskState.todo,
        OfferTaskKind.declined || OfferTaskKind.expired => TaskState.locked,
        _ => TaskState.done,
      },
      icon: HIcons.offer,
      title: t.title,
      sub: sub,
      children: [
        if (offer.state == 'sent' && deadline != null) ...[
          Wrap(
            spacing: HSpace.x2,
            runSpacing: HSpace.x2,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              HText(
                t.respondBy(date: TrackerFormat.dateLong(deadline)),
                style: HTextStyle.bodySm,
                tone: HTextTone.secondary,
              ),
              HCountdown(deadline: deadline, expiredLabel: t.deadlinePassed),
            ],
          ),
          HSpace.gap3,
        ],
        if (offer.isConditional && offer.conditions.isNotEmpty) ...[
          HText(
            offer.conditions,
            style: HTextStyle.bodySm,
            tone: HTextTone.secondary,
          ),
          HSpace.gap2,
        ],
        if (offer.subjects.isNotEmpty) ...[
          HText(
            offer.subjects
                .map(
                  (s) => t.kWith(course: s.courseName, teacher: s.teacherName),
                )
                .join(' · '),
            style: HTextStyle.bodySm,
            tone: HTextTone.secondary,
          ),
          HSpace.gap3,
        ],
        HFeeTable(
          rows: [
            for (final l in calc.lines)
              HFeeRow(
                label: l.recurrence == 'monthly'
                    ? t.monthly(label: l.label)
                    : l.label,
                amount: OfferRules.money(l.amount),
              ),
            for (final l in OfferRules.savings(offer))
              HFeeRow(
                label: t.scholarshipOn(label: l.label.toLowerCase()),
                amount: '− ${OfferRules.money(l.saving)}',
                tone: HTextTone.success,
              ),
            if ((num.tryParse(calc.monthly) ?? 0) > 0)
              HFeeRow(
                label: t.monthlyTotal,
                amount: OfferRules.money(calc.monthly),
                emphasis: true,
              ),
          ],
          total: OfferRules.money(calc.dueNow),
          totalLabel: t.dueNow,
        ),
        HSpace.gap3,
        if (kind == OfferTaskKind.open) ...[
          _AcceptButton(amount: OfferRules.money(calc.dueNow)),
          HSpace.gap2,
        ],
        _PdfButtons(offer: offer),
      ],
    );
  }
}

class _AcceptButton extends StatelessWidget {
  const _AcceptButton({required this.amount});

  final String amount;

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context);
    final t = tr.tracker.offer;
    final busy = context.select<TrackerBloc, bool>((b) => b.state.busy);
    return HButton.filled(
      label: t.accept,
      icon: HIcons.checkCircle,
      loading: busy,
      onPressed: busy
          ? null
          : () => unawaited(() async {
              final bloc = context.read<TrackerBloc>();
              final yes = await HDialog.confirm(
                context,
                title: t.acceptTitle,
                message: t.acceptBody(amount: amount),
                confirmLabel: t.accept,
                cancelLabel: t.notYet,
                icon: HIcons.offer,
              );
              if (yes) bloc.add(const TrackerEvent.offerAccepted());
            }()),
    );
  }
}

class _PdfButtons extends StatelessWidget {
  const _PdfButtons({required this.offer});

  final Offer offer;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context).tracker.offer;
    final busy = context.select<DownloadsCubit, Set<String>>(
      (c) => c.state.busy,
    );
    final cubit = context.read<DownloadsCubit>();
    Widget button(String label, OfferPdf kind) => HButton.outline(
      label: label,
      icon: HIcons.download,
      size: HButtonSize.sm,
      expand: false,
      loading: busy.contains(DownloadsCubit.keyOf(kind, null)),
      onPressed: () => unawaited(cubit.open(offer.id, kind)),
    );
    return Wrap(
      spacing: HSpace.x2,
      runSpacing: HSpace.x2,
      children: [
        button(t.letter, OfferPdf.letter),
        button(t.details, OfferPdf.details),
        if (offer.hasTerms) button(t.terms, OfferPdf.terms),
      ],
    );
  }
}
