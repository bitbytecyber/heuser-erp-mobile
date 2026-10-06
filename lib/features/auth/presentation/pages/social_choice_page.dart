import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/auth/domain/social_precheck.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/cubit/auth_action_cubit.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:heuser_erp_mobile/features/branding/data/branding_repository.dart';

/// "We don't have an account for you yet": apply for admission, or back out.
/// Nothing has been created on the server at this point.
class SocialChoicePage extends StatelessWidget {
  /// Creates the page.
  const SocialChoicePage({
    required this.precheck,
    required this.branding,
    super.key,
  });

  /// The unknown identity.
  final SocialPrecheck precheck;

  /// College name.
  final BrandingRepository branding;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final state = context.watch<AuthActionCubit>().state;
    return AuthScaffold(
      icon: HIcons.sparkle,
      title: t.auth.choiceTitle(name: precheck.greetingName),
      body: t.auth.choiceBody(
        email: precheck.email,
        college: branding.current.name,
      ),
      fields: [
        HHeroCard(
          child: Row(
            children: [
              HAvatar(
                name:
                    '${precheck.firstName} ${precheck.lastName}'.trim().isEmpty
                    ? precheck.email
                    : '${precheck.firstName} ${precheck.lastName}',
                size: HAvatarSize.lg,
              ),
              HSpace.hgap3,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HText(
                      '${precheck.firstName} ${precheck.lastName}'.trim(),
                      style: HTextStyle.titleLg,
                    ),
                    HText(precheck.email, tone: HTextTone.secondary),
                    HSpace.gap2,
                    HStatusPill(
                      precheck.provider.name,
                      tone: HTone.brand,
                      icon: HIcons.shield,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
      bottom: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HButton.filled(
            label: t.auth.choiceApply,
            icon: HIcons.school,
            loading: state.isBusy,
            size: HButtonSize.lg,
            onPressed: () => context.read<AuthActionCubit>().applyWithSocial(
              precheck.pendingToken,
            ),
          ),
          HSpace.gap2,
          HButton.ghost(
            label: t.auth.choiceNotMe,
            expand: true,
            onPressed: () => context.pop(),
          ),
        ],
      ),
    );
  }
}

/// Signed in, but the account has no mobile portal.
class NoPortalPage extends StatelessWidget {
  /// Creates the page.
  const NoPortalPage({required this.onSignOut, super.key});

  /// Sign-out handler.
  final VoidCallback onSignOut;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return HScaffold(
      body: Center(
        child: HEmptyState(
          icon: HIcons.lock,
          tone: HTone.neutral,
          title: t.auth.noPortalTitle,
          message: t.auth.noPortalBody,
          actionLabel: t.common.signOut,
          onAction: onSignOut,
        ),
      ),
    );
  }
}

/// Blank navy frame shown while the stored session is checked (the native
/// splash is still covering it).
class SplashPage extends StatelessWidget {
  /// Creates the page.
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) => ColoredBox(
    color: context.h.colors.surface,
    child: const SizedBox.expand(),
  );
}
