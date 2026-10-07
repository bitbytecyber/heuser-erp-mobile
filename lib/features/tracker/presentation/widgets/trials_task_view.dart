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

/// The Sports trial task: one row per sport, each with its own calendar.
class TrialsTaskView extends StatelessWidget {
  /// Creates the task.
  const TrialsTaskView({
    required this.application,
    required this.repo,
    super.key,
  });

  /// The application.
  final Application application;

  /// For the sessions list.
  final IntakeRepository repo;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context).tracker.trials;
    final trials = application.trials;
    final open = trials.any(TrackerRules.trialOpen);
    final allSkipped = trials.every((x) => x.state == 'skipped');
    final booked = trials.where(
      (x) =>
          x.startsAt != null &&
          !TrackerRules.trialOpen(x) &&
          x.state != 'skipped',
    );
    final sub = open
        ? t.forScholarship
        : allSkipped
        ? t.skipped
        : t.booked(
            list: booked
                .map(
                  (x) =>
                      '${x.sportName}, ${TrackerFormat.slot(DateTime.tryParse(x.startsAt!)?.toLocal())}',
                )
                .join(' · '),
          );
    return TaskTile(
      state: open ? TaskState.todo : TaskState.done,
      icon: HIcons.sports,
      title: t.title,
      sub: sub,
      children: [
        for (final trial in trials) ...[
          _TrialRow(application: application, trial: trial, repo: repo),
          HSpace.gap3,
        ],
        if (!allSkipped)
          HText(
            open ? t.calendar : t.kit,
            style: HTextStyle.bodySm,
            tone: HTextTone.secondary,
          ),
      ],
    );
  }
}

class _TrialRow extends StatelessWidget {
  const _TrialRow({
    required this.application,
    required this.trial,
    required this.repo,
  });

  final Application application;
  final Trial trial;
  final IntakeRepository repo;

  Future<void> _confirm(BuildContext context, SlotItem s) async {
    final t = Translations.of(context).tracker.trials;
    final bloc = context.read<TrackerBloc>();
    final yes = await HDialog.confirm(
      context,
      title: t.confirmTitle(sport: trial.sportName),
      message: t.confirmBody(when: TrackerFormat.slot(s.at)),
      confirmLabel: Translations.of(context).tracker.interview.confirmBook,
      cancelLabel: Translations.of(context).common.cancel,
      icon: HIcons.sports,
    );
    if (yes) {
      bloc.add(
        TrackerEvent.trialBooked(booking: trial.id, session: int.parse(s.key)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context).tracker.trials;
    final open = TrackerRules.trialOpen(trial);
    final busy = context.select<TrackerBloc, bool>((b) => b.state.busy);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(child: HText(trial.sportName, style: HTextStyle.titleSm)),
            if (!open)
              HStatusPill(
                trial.state == 'done'
                    ? t.done
                    : trial.state == 'skipped'
                    ? t.skippedPill
                    : TrackerFormat.slot(
                        DateTime.tryParse(trial.startsAt ?? '')?.toLocal(),
                      ),
                tone: trial.state == 'done' ? HTone.success : HTone.info,
              ),
          ],
        ),
        HSpace.gap2,
        if (open && !application.trialReleased)
          HText(
            t.notReleased,
            style: HTextStyle.bodySm,
            tone: HTextTone.secondary,
          )
        else if (open)
          BlocProvider(
            create: (_) => SlotListCubit(
              () async => (await repo.trialSessions(
                application.id,
                trial.id,
              )).mapOk(trialSlots),
            ),
            child: BlocBuilder<SlotListCubit, SlotListState>(
              builder: (context, state) => switch (state) {
                SlotListLoading() => const Center(child: HSpinner()),
                SlotListFailed(:final failure) => HEmptyState(
                  compact: true,
                  icon: HIcons.warning,
                  tone: HTone.warning,
                  title: failureMessage(failure, Translations.of(context)),
                  actionLabel: Translations.of(context).common.retry,
                  onAction: () =>
                      unawaited(context.read<SlotListCubit>().load()),
                ),
                SlotListLoaded(items: []) => HText(
                  t.noTimes,
                  style: HTextStyle.bodySm,
                  tone: HTextTone.secondary,
                ),
                SlotListLoaded(:final items) => SlotPicker(
                  items: items,
                  enabled: !busy,
                  onPick: (s) => unawaited(_confirm(context, s)),
                ),
              },
            ),
          ),
      ],
    );
  }
}
