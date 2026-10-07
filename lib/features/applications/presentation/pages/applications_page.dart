import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/failure_messages.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application_summary.dart';
import 'package:heuser_erp_mobile/features/applications/presentation/bloc/applications_bloc.dart';
import 'package:heuser_erp_mobile/features/applications/presentation/widgets/application_card.dart';
import 'package:heuser_erp_mobile/features/applications/presentation/widgets/start_application_sheet.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_user.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/bloc/auth_bloc.dart';

/// Applications tab: greeting hero, the list (or empty / closed state) and
/// the "start" flow. Reads [ApplicationsBloc] from the route.
class ApplicationsPage extends StatelessWidget {
  /// Creates the page.
  const ApplicationsPage({
    required this.collegeName,
    required this.onOpen,
    super.key,
  });

  /// College name for the header.
  final String collegeName;

  /// Opens an application (form or tracker) by id.
  final void Function(int id, {Application? initial}) onOpen;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final user = context.select<AuthBloc, AuthUser?>((b) => b.state.userOrNull);
    return BlocListener<ApplicationsBloc, ApplicationsState>(
      listenWhen: (a, b) => a.noticeSeq != b.noticeSeq && b.notice != null,
      listener: (context, state) {
        switch (state.notice!) {
          case ApplicationsNoticeStarted(:final application):
            onOpen(application.id, initial: application);
          case ApplicationsNoticeWithdrawn(:final wasDraft):
            HToast.success(
              context,
              wasDraft ? t.applications.deleted : t.applications.withdrawn,
            );
          case ApplicationsNoticeFailed(:final failure):
            HToast.error(context, failureMessage(failure, t));
        }
        context.read<ApplicationsBloc>().add(
          const ApplicationsEvent.noticeConsumed(),
        );
      },
      child: HScaffold(
        appBar: HAppBar(
          title: t.applications.title,
          subtitle: collegeName,
          showBack: false,
        ),
        body: BlocBuilder<ApplicationsBloc, ApplicationsState>(
          builder: (context, state) => HRefreshable(
            semanticsLabel: t.common.loading,
            onRefresh: () async {
              final bloc = context.read<ApplicationsBloc>()
                ..add(const ApplicationsEvent.refreshed(force: true));
              await bloc.stream
                  .firstWhere((s) => !s.loading)
                  .timeout(
                    const Duration(seconds: 15),
                    onTimeout: () => bloc.state,
                  );
            },
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: HSpace.page,
              children: [
                HHeroCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HText(
                        '${_greeting()}, ${user?.greetingName ?? ''}'.trim(),
                        style: HTextStyle.headlineMd,
                      ),
                      HSpace.gap1,
                      HText(t.app.tagline, tone: HTextTone.secondary),
                    ],
                  ),
                ),
                HSpace.gap4,
                ..._body(context, state, t),
              ].hStaggered(context),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _body(
    BuildContext context,
    ApplicationsState state,
    Translations t,
  ) {
    if (state.loading && !state.hasData) {
      return [
        for (var i = 0; i < 2; i++) ...[
          HSkeleton(
            enabled: true,
            child: ApplicationCard(
              item: const AppSummary(id: 0, fullName: 'Loading name'),
              onTap: () {},
            ),
          ),
          HSpace.gap3,
        ],
      ];
    }
    if (state.closed) {
      return [
        HCard(
          child: HEmptyState(
            compact: true,
            icon: HIcons.lock,
            tone: HTone.neutral,
            title: t.applications.closedTitle,
            message: t.applications.closedBody,
          ),
        ),
      ];
    }
    final f = state.failure;
    if (f != null && !state.hasData) {
      return [
        HCard(
          child: HEmptyState(
            compact: true,
            icon: HIcons.warning,
            tone: HTone.warning,
            title: t.applications.loadFailedTitle,
            message: failureMessage(f, t),
            actionLabel: t.common.retry,
            onAction: () => context.read<ApplicationsBloc>().add(
              const ApplicationsEvent.refreshed(force: true),
            ),
          ),
        ),
      ];
    }
    if (state.items.isEmpty) {
      return [
        HCard(
          child: HEmptyState(
            compact: true,
            icon: HIcons.school,
            title: t.applications.emptyTitle,
            message: t.applications.emptyBody,
            actionLabel: t.applications.start,
            onAction: state.busy
                ? null
                : () => unawaited(_start(context, state.items)),
          ),
        ),
      ];
    }
    return [
      for (final a in state.items) ...[
        ApplicationCard(
          item: a,
          onTap: () => onOpen(a.id),
          onMore: a.status.canWithdraw
              ? () => unawaited(_more(context, a))
              : null,
        ),
        HSpace.gap3,
      ],
      HSpace.gap2,
      HButton.tonal(
        label: t.applications.startAnother,
        icon: HIcons.add,
        loading: state.busy,
        onPressed: state.busy
            ? null
            : () => unawaited(_start(context, state.items)),
      ),
    ];
  }

  Future<void> _start(BuildContext context, List<AppSummary> existing) async {
    final bloc = context.read<ApplicationsBloc>();
    final named = existing.where((a) => a.fullName.trim().isNotEmpty).toList();
    if (named.isEmpty) {
      bloc.add(const ApplicationsEvent.startRequested());
      return;
    }
    final choice = await StartApplicationSheet.show(context, named);
    if (choice == null) return;
    bloc.add(ApplicationsEvent.startRequested(copyFamilyFrom: choice.copyFrom));
  }

  Future<void> _more(BuildContext context, AppSummary a) async {
    final t = Translations.of(context);
    final bloc = context.read<ApplicationsBloc>();
    final draft = a.status.isDraft;
    final yes = await HDialog.confirm(
      context,
      title: draft
          ? t.applications.deleteDraftTitle
          : t.applications.withdrawTitle,
      message: draft
          ? t.applications.deleteDraftBody
          : t.applications.withdrawBody,
      confirmLabel: draft
          ? t.applications.deleteDraft
          : t.applications.withdraw,
      cancelLabel: t.common.cancel,
      destructive: true,
      icon: HIcons.delete,
    );
    if (yes) bloc.add(ApplicationsEvent.withdrawRequested(a.id));
  }

  static String _greeting() {
    final h = DateTime.now().hour;
    if (h < 12) return 'Good morning';
    if (h < 17) return 'Good afternoon';
    return 'Good evening';
  }
}
