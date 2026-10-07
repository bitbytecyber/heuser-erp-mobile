import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/app/security/app_lock_cubit.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_user.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Profile tab: identity card, account rows, appearance, about, sign out.
class ProfilePage extends StatelessWidget {
  /// Creates the page.
  const ProfilePage({
    required this.onAppearance,
    required this.onPassword,
    super.key,
  });

  /// Opens the appearance page.
  final VoidCallback onAppearance;

  /// Opens change / set password.
  final VoidCallback onPassword;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final user = context.select<AuthBloc, AuthUser?>((b) => b.state.userOrNull);
    return HScaffold(
      appBar: HAppBar(title: t.profile.title, showBack: false),
      body: ListView(
        padding: HSpace.page,
        children: [
          if (user != null)
            HCard(
              child: Row(
                children: [
                  HAvatar(name: user.displayName, size: HAvatarSize.lg),
                  HSpace.hgap3,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HText(user.displayName, style: HTextStyle.titleLg),
                        HText(
                          user.email,
                          tone: HTextTone.secondary,
                          maxLines: 1,
                        ),
                        if (!user.isEmailVerified) ...[
                          HSpace.gap2,
                          HStatusPill(
                            t.auth.verifyTitle,
                            tone: HTone.warning,
                            icon: HIcons.warning,
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          HSpace.gap4,
          HText(
            t.profile.account,
            style: HTextStyle.labelMd,
            tone: HTextTone.secondary,
          ),
          HSpace.gap2,
          HCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                HListTile(
                  icon: HIcons.palette,
                  title: t.profile.appearance,
                  onTap: onAppearance,
                ),
                const HDivider(indent: HSpace.x4),
                HListTile(
                  icon: HIcons.lock,
                  tone: HTone.neutral,
                  title: (user?.hasUsablePassword ?? true)
                      ? t.profile.changePassword
                      : t.profile.setPassword,
                  onTap: onPassword,
                ),
              ],
            ),
          ),
          const _AppLockSection(),
          HSpace.gap4,
          HText(
            t.profile.about,
            style: HTextStyle.labelMd,
            tone: HTextTone.secondary,
          ),
          HSpace.gap2,
          HCard(
            padding: EdgeInsets.zero,
            child: FutureBuilder<PackageInfo>(
              future: PackageInfo.fromPlatform(),
              builder: (context, snap) => HListTile(
                icon: HIcons.info,
                tone: HTone.info,
                title: t.app.name,
                subtitle: snap.hasData
                    ? t.profile.version(
                        version:
                            '${snap.data!.version} (${snap.data!.buildNumber})',
                      )
                    : null,
                showChevron: false,
              ),
            ),
          ),
          HSpace.gap6,
          HButton.outline(
            label: t.common.signOut,
            icon: HIcons.logout,
            onPressed: () async {
              final yes = await HDialog.confirm(
                context,
                title: t.profile.signOutConfirmTitle,
                message: t.profile.signOutConfirmBody,
                confirmLabel: t.common.signOut,
                cancelLabel: t.common.cancel,
                icon: HIcons.logout,
              );
              if (yes && context.mounted) {
                context.read<AuthBloc>().add(
                  const AuthEvent.signOutRequested(),
                );
              }
            },
          ),
        ].hStaggered(context),
      ),
    );
  }
}

/// "App lock" switch, only on devices that can authenticate.
class _AppLockSection extends StatelessWidget {
  const _AppLockSection();

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final s = context.watch<AppLockCubit>().state;
    if (!s.supported) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HSpace.gap4,
        HText(
          t.profile.security,
          style: HTextStyle.labelMd,
          tone: HTextTone.secondary,
        ),
        HSpace.gap2,
        HCard(
          child: HSwitch(
            label: t.profile.appLock,
            description: t.profile.appLockSub,
            value: s.enabled,
            enabled: !s.busy,
            onChanged: (v) => context.read<AppLockCubit>().setEnabled(
              value: v,
              reason: t.lock.enableReason,
            ),
          ),
        ),
      ],
    );
  }
}
