import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/failure_messages.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/bloc/application_form_bloc.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/documents/presentation/cubit/documents_cubit.dart';

/// The page-side reactions to bloc notices (toasts, dialogs, navigation).
abstract final class FormFeedback {
  /// Toasts / navigation for a form notice.
  static void onNotice(
    BuildContext context,
    FormNotice n,
    Translations t, {
    required VoidCallback onLeave,
    required ValueChanged<Application> onSubmitted,
  }) {
    switch (n) {
      case FormNoticeSaveFailed(:final failure):
        HToast.error(context, failureMessage(failure, t));
      case FormNoticeFixMarked():
        HToast.show(
          context,
          t.form.fixMarked,
          tone: HTone.warning,
          icon: HIcons.warning,
        );
      case FormNoticeSubmitFailed(:final failure):
        HToast.error(context, failureMessage(failure, t));
      case FormNoticeLeave():
        HToast.success(context, t.form.leftToast);
        onLeave();
      case FormNoticeSubmitted(:final application):
        unawaited(HHaptics.success());
        onSubmitted(application);
    }
  }

  /// Hands a documents outcome to the form bloc and toasts it.
  static void onDocs(BuildContext context, DocsNotice n, Translations t) {
    final form = context.read<ApplicationFormBloc>();
    switch (n) {
      case DocsUploaded(:final application, :final title, :final withFile):
        form.add(ApplicationFormEvent.applicationUpdated(application));
        if (withFile) HToast.success(context, t.documents.added(name: title));
      case DocsRemoved(:final application, :final title):
        form.add(ApplicationFormEvent.applicationUpdated(application));
        HToast.show(context, t.documents.removed(name: title));
      case DocsUploadFailed(:final failure):
        HToast.error(
          context,
          _docFailure(failure, t.documents.uploadFailed, t),
        );
      case DocsRemoveFailed(:final failure):
        HToast.error(
          context,
          _docFailure(failure, t.documents.removeFailed, t),
        );
    }
  }

  static String _docFailure(Failure f, String fallback, Translations t) {
    final m = failureMessage(f, t);
    return f is Validation && m.isNotEmpty ? m : fallback;
  }

  /// "Resume unsaved changes?" dialog.
  static Future<void> askResume(BuildContext context, Translations t) async {
    final bloc = context.read<ApplicationFormBloc>();
    final yes = await HDialog.confirm(
      context,
      title: t.form.resumeTitle,
      message: t.form.resumeBody,
      confirmLabel: t.form.resumeYes,
      cancelLabel: t.form.resumeNo,
      icon: HIcons.edit,
    );
    bloc.add(ApplicationFormEvent.resumeDecided(resume: yes));
  }
}

/// The autosave indicator in the app bar.
class SavePill extends StatelessWidget {
  /// Creates the pill.
  const SavePill({required this.status, super.key});

  /// Current save status.
  final SaveStatus status;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context).form;
    return switch (status) {
      SaveStatus.saved => HStatusPill(
        t.saved,
        tone: HTone.success,
        icon: HIcons.check,
      ),
      SaveStatus.saving => HStatusPill(t.saving, icon: HIcons.hourglass),
      SaveStatus.error => HStatusPill(
        t.notSaved,
        tone: HTone.danger,
        icon: HIcons.error,
      ),
      SaveStatus.offline => HStatusPill(
        t.offlineSaved,
        tone: HTone.warning,
        icon: HIcons.offline,
      ),
    };
  }
}
