import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/files/file_pick_service.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/draft_store.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/bloc/application_form_bloc.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/cubit/countries_cubit.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/pages/form_page_feedback.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/pages/form_step_views.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart';
import 'package:heuser_erp_mobile/features/documents/presentation/cubit/documents_cubit.dart';

/// The three-step form: stepper, the step body (shared-axis transition),
/// save state in the app bar, Back / Continue / Send at the bottom.
class ApplicationFormPage extends StatelessWidget {
  /// Creates the page for [application].
  const ApplicationFormPage({
    required this.application,
    required this.repo,
    required this.drafts,
    required this.files,
    required this.online,
    required this.collegeName,
    required this.onLeave,
    required this.onSubmitted,
    this.userEmail,
    super.key,
  });

  /// The draft application.
  final Application application;

  /// Intake repository (blocs + pickers).
  final IntakeRepository repo;

  /// Draft cache for this user.
  final DraftStore drafts;

  /// File picking for uploads.
  final FilePickService files;

  /// `true` when the device is online.
  final Stream<bool> online;

  /// College name for the copy.
  final String collegeName;

  /// Signed-in email.
  final String? userEmail;

  /// Leave to the list (saved).
  final VoidCallback onLeave;

  /// The application was sent.
  final ValueChanged<Application> onSubmitted;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => ApplicationFormBloc(
          repo: repo,
          drafts: drafts,
          application: application,
          userEmail: userEmail,
          online: online,
        )..add(const ApplicationFormEvent.started()),
      ),
      BlocProvider(
        create: (_) => DocumentsCubit(
          repo: repo,
          files: files,
          applicationId: application.id,
        ),
      ),
      BlocProvider(create: (_) => CountriesCubit(repo)),
    ],
    child: _FormView(
      repo: repo,
      collegeName: collegeName,
      userEmail: userEmail,
      onLeave: onLeave,
      onSubmitted: onSubmitted,
    ),
  );
}

class _FormView extends StatelessWidget {
  const _FormView({
    required this.repo,
    required this.collegeName,
    required this.userEmail,
    required this.onLeave,
    required this.onSubmitted,
  });

  final IntakeRepository repo;
  final String collegeName;
  final String? userEmail;
  final VoidCallback onLeave;
  final ValueChanged<Application> onSubmitted;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<ApplicationFormBloc, ApplicationFormState>(
          listenWhen: (a, b) => a.noticeSeq != b.noticeSeq && b.notice != null,
          listener: (context, state) => FormFeedback.onNotice(
            context,
            state.notice!,
            t,
            onLeave: onLeave,
            onSubmitted: onSubmitted,
          ),
        ),
        BlocListener<ApplicationFormBloc, ApplicationFormState>(
          listenWhen: (a, b) => a.resumable == null && b.resumable != null,
          listener: (context, state) =>
              unawaited(FormFeedback.askResume(context, t)),
        ),
        BlocListener<DocumentsCubit, DocumentsState>(
          listenWhen: (a, b) => a.noticeSeq != b.noticeSeq && b.notice != null,
          listener: (context, state) =>
              FormFeedback.onDocs(context, state.notice!, t),
        ),
      ],
      child: BlocBuilder<ApplicationFormBloc, ApplicationFormState>(
        buildWhen: (a, b) =>
            a.step != b.step ||
            a.formStep != b.formStep ||
            a.save != b.save ||
            a.sending != b.sending ||
            a.declared != b.declared,
        builder: (context, state) {
          final bloc = context.read<ApplicationFormBloc>();
          final titles = [
            t.form.steps.family,
            t.form.steps.studies,
            t.form.steps.review,
          ];
          final metas = [
            t.form.meta.family,
            t.form.meta.studies,
            t.form.meta.review,
          ];
          final step = state.step;
          return HScaffold(
            appBar: HAppBar(
              title: titles[step - 1],
              backLabel: t.common.back,
              onBack: () => bloc.add(const ApplicationFormEvent.backPressed()),
              actions: [
                SavePill(status: state.save),
                HButton.ghost(
                  label: t.form.finishLater,
                  size: HButtonSize.sm,
                  onPressed: () =>
                      bloc.add(const ApplicationFormEvent.finishLaterPressed()),
                ),
              ],
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    HSpace.gutter,
                    HSpace.x2,
                    HSpace.gutter,
                    0,
                  ),
                  child: HStepper(
                    steps: titles,
                    current: step - 1,
                    completed: state.formStep - 1,
                    stepLabel: t.form.step,
                    ofLabel: t.form.of,
                    isReachable: (i) => state.isReachable(i + 1),
                    onStepTap: (i) =>
                        bloc.add(ApplicationFormEvent.stepRequested(i + 1)),
                  ),
                ),
                Expanded(
                  child: PageTransitionSwitcher(
                    duration: context.h.motion.of(context.h.motion.slow),
                    transitionBuilder: (child, primary, secondary) =>
                        HPageTransitions.sharedAxisX(
                          context,
                          primary,
                          secondary,
                          child,
                        ),
                    child: FormStepView(
                      key: ValueKey<int>(step),
                      step: step,
                      repo: repo,
                      collegeName: collegeName,
                      userEmail: userEmail,
                    ),
                  ),
                ),
              ],
            ),
            bottomBar: Padding(
              padding: const EdgeInsets.fromLTRB(
                HSpace.gutter,
                HSpace.x2,
                HSpace.gutter,
                HSpace.x2,
              ),
              child: Row(
                children: [
                  HButton.ghost(
                    label: t.common.back,
                    onPressed: () =>
                        bloc.add(const ApplicationFormEvent.backPressed()),
                  ),
                  Expanded(
                    child: HText(
                      metas[step - 1],
                      align: TextAlign.center,
                      style: HTextStyle.bodySm,
                      tone: HTextTone.tertiary,
                    ),
                  ),
                  if (step < 3)
                    HButton.filled(
                      label: t.common.kContinue,
                      expand: false,
                      trailingIcon: HIcons.chevronRight,
                      onPressed: () => bloc.add(
                        const ApplicationFormEvent.continuePressed(),
                      ),
                    )
                  else
                    HButton.filled(
                      label: state.sending
                          ? t.form.sending
                          : t.form.sendApplication,
                      expand: false,
                      icon: HIcons.send,
                      loading: state.sending,
                      onPressed: state.sending
                          ? null
                          : () => bloc.add(
                              const ApplicationFormEvent.submitPressed(),
                            ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
