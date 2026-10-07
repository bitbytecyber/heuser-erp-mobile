import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/failure_messages.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart';
import 'package:heuser_erp_mobile/features/tracker/domain/slot_days.dart';
import 'package:heuser_erp_mobile/features/tracker/domain/slot_mapping.dart';
import 'package:heuser_erp_mobile/features/tracker/domain/tracker_rules.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/cubit/slot_list_cubit.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/widgets/slot_picker.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/widgets/task_tile.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/widgets/tracker_format.dart';

/// The Interview task: locked, booked (with one move), or a time picker.
class InterviewTaskView extends StatefulWidget {
  /// Creates the task.
  const InterviewTaskView({
    required this.application,
    required this.repo,
    super.key,
  });

  /// The application.
  final Application application;

  /// For the times list.
  final IntakeRepository repo;

  @override
  State<InterviewTaskView> createState() => _InterviewTaskViewState();
}

class _InterviewTaskViewState extends State<InterviewTaskView> {
  bool _changing = false;

  @override
  void didUpdateWidget(InterviewTaskView old) {
    super.didUpdateWidget(old);
    // A new booking closes the picker.
    if (old.application.interview?.startsAt !=
        widget.application.interview?.startsAt) {
      _changing = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context).tracker.interview;
    final a = widget.application;
    final task = TrackerRules.interviewTask(a);
    final when = TrackerFormat.slot(task.at);
    final live =
        task.kind == InterviewKind.bookedCanMove ||
        task.kind == InterviewKind.bookedFinal;
    final sub = switch (task.kind) {
      InterviewKind.inProgress => t.inProgress(when: when),
      InterviewKind.done => t.done(when: when),
      InterviewKind.missed => t.missed,
      InterviewKind.waitingForTimes => t.waitingTimes,
      InterviewKind.waitingForDocuments => t.waitingDocs,
      InterviewKind.bookedCanMove ||
      InterviewKind.bookedFinal => t.booked(when: when),
      InterviewKind.book => t.choose,
    };
    // Times can only be picked while the office has them released (as on
    // the web); otherwise neither the picker nor "Change it" is offered.
    final canBook = TrackerRules.canBookInterview(a);
    final canMove = canBook && task.kind == InterviewKind.bookedCanMove;
    final showPicker =
        canBook && (task.kind == InterviewKind.book || (canMove && _changing));
    return TaskTile(
      state: task.kind.locked
          ? TaskState.locked
          : task.kind.isDone
          ? TaskState.done
          : TaskState.todo,
      icon: HIcons.calendar,
      title: t.title,
      sub: sub,
      children: [
        if (task.kind == InterviewKind.bookedFinal)
          HText(
            t.movedOnce,
            style: HTextStyle.bodySm,
            tone: HTextTone.secondary,
          ),
        if (canMove && !_changing)
          Row(
            children: [
              Expanded(
                child: HText(
                  t.notHappy,
                  style: HTextStyle.bodySm,
                  tone: HTextTone.secondary,
                ),
              ),
              HButton.ghost(
                label: t.changeIt,
                size: HButtonSize.sm,
                onPressed: () => setState(() => _changing = true),
              ),
            ],
          ),
        if (canMove && _changing && task.at != null) ...[
          Row(
            children: [
              Expanded(
                child: HText(
                  t.pickNew,
                  style: HTextStyle.bodySm,
                  tone: HTextTone.secondary,
                ),
              ),
              HButton.ghost(
                label: t.keep(time: TrackerFormat.time(task.at!)),
                size: HButtonSize.sm,
                onPressed: () => setState(() => _changing = false),
              ),
            ],
          ),
          HSpace.gap2,
        ],
        if (showPicker)
          BlocProvider(
            create: (_) => SlotListCubit(
              () async =>
                  (await widget.repo.interviewTimes(a.id))
                      .mapOk((times) => interviewSlots(times, a.interview)),
            ),
            child: _Times(live: live, current: task.at),
          ),
      ],
    );
  }
}

class _Times extends StatelessWidget {
  const _Times({required this.live, required this.current});

  final bool live;
  final DateTime? current;

  Future<void> _confirm(BuildContext context, SlotItem s) async {
    final t = Translations.of(context).tracker.interview;
    final bloc = context.read<TrackerBloc>();
    final when = TrackerFormat.slot(s.at);
    final yes = await HDialog.confirm(
      context,
      title: live ? t.confirmMoveTitle : t.confirmBookTitle,
      message: live && current != null
          ? t.confirmMoveBody(when: when, old: TrackerFormat.slot(current))
          : t.confirmBookBody(when: when),
      confirmLabel: live ? t.confirmMove : t.confirmBook,
      cancelLabel: Translations.of(context).common.cancel,
      icon: HIcons.calendar,
    );
    if (yes) {
      bloc.add(TrackerEvent.interviewBooked(s.key, reschedule: live));
    }
  }

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context);
    final busy = context.select<TrackerBloc, bool>((b) => b.state.busy);
    return BlocBuilder<SlotListCubit, SlotListState>(
      builder: (context, state) => switch (state) {
        SlotListLoading() => const Center(child: HSpinner()),
        SlotListFailed(:final failure) => HEmptyState(
          compact: true,
          icon: HIcons.warning,
          tone: HTone.warning,
          title: failureMessage(failure, tr),
          actionLabel: tr.common.retry,
          onAction: () => unawaited(context.read<SlotListCubit>().load()),
        ),
        SlotListLoaded(:final items) when items.isEmpty => HText(
          tr.tracker.interview.noTimes,
          style: HTextStyle.bodySm,
          tone: HTextTone.secondary,
        ),
        SlotListLoaded(:final items) => SlotPicker(
          items: items,
          enabled: !busy,
          onPick: (s) => unawaited(_confirm(context, s)),
        ),
      },
    );
  }
}
