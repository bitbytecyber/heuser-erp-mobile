import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/failure_messages.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/applications/presentation/widgets/application_card.dart';
import 'package:heuser_erp_mobile/features/notifications/data/models/inbox_item.dart';
import 'package:heuser_erp_mobile/features/notifications/domain/notification_link.dart';
import 'package:heuser_erp_mobile/features/notifications/presentation/bloc/notifications_bloc.dart';
import 'package:heuser_erp_mobile/features/notifications/presentation/cubit/unread_cubit.dart';

/// Notifications tab: the inbox, newest first. Reads [NotificationsBloc]
/// from the route and the shell's [UnreadCubit].
class NotificationsPage extends StatelessWidget {
  /// Creates the page.
  const NotificationsPage({required this.onOpenLink, super.key});

  /// Opens a notification's in-app destination.
  final ValueChanged<AppLink> onOpenLink;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return BlocListener<UnreadCubit, UnreadState>(
      // A live push: show it at the top of the list.
      listenWhen: (a, b) => a.pushSeq != b.pushSeq,
      listener: (context, _) => context.read<NotificationsBloc>().add(
        const NotificationsEvent.refreshed(),
      ),
      child: BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (context, state) {
          final bloc = context.read<NotificationsBloc>();
          return HScaffold(
            appBar: HAppBar(
              title: t.notifications.title,
              showBack: false,
              actions: [
                if (state.anyUnread)
                  HButton.ghost(
                    label: t.notifications.markAllRead,
                    size: HButtonSize.sm,
                    onPressed: () {
                      bloc.add(const NotificationsEvent.allRead());
                      context.read<UnreadCubit>().set(0);
                    },
                  ),
              ],
            ),
            body: _body(context, state, t),
          );
        },
      ),
    );
  }

  Widget _body(BuildContext context, NotificationsState state, Translations t) {
    final bloc = context.read<NotificationsBloc>();
    if (state.loading) {
      return const Center(child: HSpinner(size: 28));
    }
    final f = state.failure;
    if (f != null && state.items.isEmpty) {
      return Center(
        child: HEmptyState(
          icon: HIcons.warning,
          tone: HTone.warning,
          title: t.notifications.loadFailed,
          message: failureMessage(f, t),
          actionLabel: t.common.retry,
          onAction: () => bloc.add(const NotificationsEvent.refreshed()),
        ),
      );
    }
    if (state.items.isEmpty) {
      return Center(
        child: HEmptyState(
          icon: HIcons.bell,
          tone: HTone.neutral,
          title: t.notifications.emptyTitle,
          message: t.notifications.emptyBody,
        ),
      );
    }
    return NotificationListener<ScrollNotification>(
      onNotification: (n) {
        if (n.metrics.extentAfter < 400) {
          bloc.add(const NotificationsEvent.moreRequested());
        }
        return false;
      },
      child: HRefreshable(
        semanticsLabel: t.common.loading,
        onRefresh: () async {
          bloc.add(const NotificationsEvent.refreshed());
          unawaited(context.read<UnreadCubit>().refresh());
          await bloc.stream
              .firstWhere((s) => !s.loading)
              .timeout(
                const Duration(seconds: 15),
                onTimeout: () => bloc.state,
              );
        },
        child: ListView.separated(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: HSpace.page,
          itemCount: state.items.length + (state.loadingMore ? 1 : 0),
          separatorBuilder: (_, _) => HSpace.gap2,
          itemBuilder: (context, i) {
            if (i >= state.items.length) {
              return const Center(child: HSpinner());
            }
            final item = state.items[i];
            return Dismissible(
              key: ValueKey(item.id),
              direction: DismissDirection.endToStart,
              onDismissed: (_) =>
                  bloc.add(NotificationsEvent.dismissed(item.id)),
              child: _ItemCard(item: item, onTap: () => _open(context, item)),
            );
          },
        ),
      ),
    );
  }

  void _open(BuildContext context, InboxItem item) {
    context.read<NotificationsBloc>().add(NotificationsEvent.opened(item));
    unawaited(context.read<UnreadCubit>().refresh());
    final link = AppLink.parse(item.link);
    if (link != null) onOpenLink(link);
  }
}

class _ItemCard extends StatelessWidget {
  const _ItemCard({required this.item, required this.onTap});

  final InboxItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final c = context.h.colors;
    return HCard(
      onTap: onTap,
      color: item.isRead ? null : c.brandSoft.withValues(alpha: 0.35),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: HSpace.x1),
            child: HBadge(count: item.isRead ? 0 : null, tone: HTone.brand),
          ),
          HSpace.hgap3,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HText(
                  item.title,
                  style: HTextStyle.titleSm,
                  weight: item.isRead ? null : FontWeight.w700,
                ),
                if (item.body.isNotEmpty) ...[
                  HSpace.gap1,
                  HText(
                    item.body,
                    style: HTextStyle.bodySm,
                    tone: HTextTone.secondary,
                    maxLines: 3,
                  ),
                ],
                HSpace.gap1,
                HText(
                  [
                    if (item.categoryLabel.isNotEmpty) item.categoryLabel,
                    relativeTime(item.createdAtTime, t),
                  ].join(' · '),
                  style: HTextStyle.bodySm,
                  tone: HTextTone.tertiary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
