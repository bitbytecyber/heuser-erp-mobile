import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/connectivity/connectivity_banner.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:heuser_erp_mobile/features/notifications/domain/notification_link.dart';
import 'package:heuser_erp_mobile/features/notifications/presentation/cubit/unread_cubit.dart';
import 'package:heuser_erp_mobile/features/notifications/presentation/widgets/live_notifications.dart';

/// The applicant portal's frame: bottom navigation over the three branches
/// (Applications, Notifications, Profile) plus the offline banner and the
/// "showing cached details" strip when the session came from the snapshot.
class ApplicantShell extends StatelessWidget {
  /// Creates the shell.
  const ApplicantShell({
    required this.navigationShell,
    required this.onOpenLink,
    this.showNav = true,
    super.key,
  });

  /// go_router's branch navigator.
  final StatefulNavigationShell navigationShell;

  /// Opens a live push's destination.
  final ValueChanged<AppLink> onOpenLink;

  /// Whether the tab bar is shown (hidden on nested pages).
  final bool showNav;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final unreadCount = context.select<UnreadCubit, int>((c) => c.state.count);
    final fromSnapshot = context.select<AuthBloc, bool>(
      (b) => switch (b.state) {
        AuthAuthenticated(:final fromSnapshot) => fromSnapshot,
        _ => false,
      },
    );
    return LiveNotifications(
      onOpenLink: onOpenLink,
      openLabel: t.notifications.open,
      child: HScaffold(
        safeAreaBody: false,
        body: Column(
          children: [
            const ConnectivityBanner(),
            if (fromSnapshot)
              Builder(
                builder: (context) => ColoredBox(
                  color: context.h.colors.infoSoft,
                  child: SafeArea(
                    bottom: false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: HSpace.x4,
                        vertical: HSpace.x2,
                      ),
                      child: Row(
                        children: [
                          const HIcon(
                            HIcons.info,
                            size: HIconSize.sm,
                            tone: HTextTone.info,
                          ),
                          HSpace.hgap2,
                          Expanded(
                            child: HText(
                              t.profile.offlineSnapshot,
                              style: HTextStyle.bodySm,
                              tone: HTextTone.info,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            Expanded(child: navigationShell),
          ],
        ),
        bottomNav: !showNav
            ? null
            : HNavBar(
                items: [
                  HNavItem(icon: HIcons.home, label: t.shell.applications),
                  HNavItem(
                    icon: HIcons.bell,
                    label: t.shell.notifications,
                    badgeCount: unreadCount,
                  ),
                  HNavItem(icon: HIcons.person, label: t.shell.profile),
                ],
                index: navigationShell.currentIndex,
                onChanged: (i) => navigationShell.goBranch(
                  i,
                  initialLocation: i == navigationShell.currentIndex,
                ),
              ),
      ),
    );
  }
}
