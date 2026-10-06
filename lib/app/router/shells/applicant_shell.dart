import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/connectivity/connectivity_banner.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/bloc/auth_bloc.dart';

/// The applicant portal's frame: bottom navigation over the three branches
/// (Applications, Notifications, Profile) plus the offline banner and the
/// "showing cached details" strip when the session came from the snapshot.
class ApplicantShell extends StatelessWidget {
  /// Creates the shell.
  const ApplicantShell({
    required this.navigationShell,
    this.unreadCount = 0,
    super.key,
  });

  /// go_router's branch navigator.
  final StatefulNavigationShell navigationShell;

  /// Unread notifications for the badge (wired in M6).
  final int unreadCount;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final fromSnapshot = context.select<AuthBloc, bool>(
      (b) => switch (b.state) {
        AuthAuthenticated(:final fromSnapshot) => fromSnapshot,
        _ => false,
      },
    );
    return HScaffold(
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
      bottomNav: HNavBar(
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
    );
  }
}
