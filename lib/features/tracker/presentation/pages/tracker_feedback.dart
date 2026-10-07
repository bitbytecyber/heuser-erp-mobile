import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/failure_messages.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/documents/presentation/cubit/documents_cubit.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/bloc/tracker_bloc.dart';

/// Toasts and hand-offs for the tracker: bloc notices become toasts, and a
/// document change feeds the fresh application back into the bloc.
class TrackerFeedback extends StatelessWidget {
  /// Creates the listener.
  const TrackerFeedback({required this.child, this.onChanged, super.key});

  /// The page.
  final Widget child;

  /// Called with every fresh copy.
  final ValueChanged<Application>? onChanged;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<TrackerBloc, TrackerState>(
          listenWhen: (a, b) => a.noticeSeq != b.noticeSeq && b.notice != null,
          listener: (context, s) {
            final msg = switch (s.notice!) {
              TrackerNoticeKind.interviewBooked =>
                t.tracker.interview.bookedToast,
              TrackerNoticeKind.interviewMoved =>
                t.tracker.interview.movedToast,
              TrackerNoticeKind.trialBooked => t.tracker.trials.bookedToast,
              TrackerNoticeKind.resultSaved => t.tracker.results.savedToast,
              TrackerNoticeKind.failed => '',
            };
            if (s.notice == TrackerNoticeKind.failed) {
              final f = s.failure;
              if (f != null && f is! Cancelled) {
                HToast.error(context, failureMessage(f, t));
              }
            } else {
              unawaited(HHaptics.success());
              HToast.success(context, msg);
            }
          },
        ),
        BlocListener<TrackerBloc, TrackerState>(
          listenWhen: (a, b) => a.application != b.application,
          listener: (context, s) => onChanged?.call(s.application),
        ),
        BlocListener<DocumentsCubit, DocumentsState>(
          listenWhen: (a, b) => a.noticeSeq != b.noticeSeq && b.notice != null,
          listener: (context, s) {
            final bloc = context.read<TrackerBloc>();
            switch (s.notice!) {
              case DocsUploaded(
                :final application,
                :final title,
                :final withFile,
              ):
                bloc.add(TrackerEvent.applicationUpdated(application));
                if (withFile) {
                  HToast.success(context, t.documents.added(name: title));
                }
              case DocsRemoved(:final application, :final title):
                bloc.add(TrackerEvent.applicationUpdated(application));
                HToast.show(context, t.documents.removed(name: title));
              case DocsUploadFailed(:final failure):
                HToast.error(
                  context,
                  _msg(failure, t.documents.uploadFailed, t),
                );
              case DocsRemoveFailed(:final failure):
                HToast.error(
                  context,
                  _msg(failure, t.documents.removeFailed, t),
                );
            }
          },
        ),
      ],
      child: child,
    );
  }

  static String _msg(Failure f, String fallback, Translations t) {
    final m = failureMessage(f, t);
    return f is Validation && m.isNotEmpty ? m : fallback;
  }
}
