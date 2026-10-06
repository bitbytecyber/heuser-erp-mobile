import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/app/router/auth_redirect.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_outcome.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/cubit/auth_action_cubit.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/widgets/social_buttons.dart';
import 'package:heuser_erp_mobile/features/branding/data/branding_repository.dart';

/// First screen: logo, tagline, sign in / create account, social buttons.
class WelcomePage extends StatelessWidget {
  /// Creates the page.
  const WelcomePage({required this.branding, super.key});

  /// For the college name and logo.
  final BrandingRepository branding;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final name = branding.current.name;
    final reason = context.select<AuthBloc, SignOutReason>(
      (b) => switch (b.state) {
        AuthUnauthenticated(:final reason) => reason,
        _ => SignOutReason.none,
      },
    );
    return BlocListener<AuthActionCubit, AuthActionState>(
      listenWhen: (_, s) => s is AuthActionNeedsChoice,
      listener: (context, state) => context.push(
        RoutePaths.socialChoice,
        extra: (state as AuthActionNeedsChoice).precheck,
      ),
      child: AuthScaffold(
        showBack: false,
        title: t.auth.welcomeTitle,
        body: t.auth.welcomeBody(name: name),
        fields: [
          if (reason == SignOutReason.serverRejected ||
              reason == SignOutReason.expired)
            Padding(
              padding: const EdgeInsets.only(bottom: HSpace.x4),
              child: HCard(
                elevation: HCardElevation.flat,
                child: Row(
                  children: [
                    const HIcon(HIcons.info, tone: HTextTone.info),
                    HSpace.hgap3,
                    Expanded(
                      child: HText(
                        t.auth.signedOutServer,
                        tone: HTextTone.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          const SocialButtons(),
          HButton.filled(
            label: t.auth.signIn,
            onPressed: () => context.push(RoutePaths.login),
            size: HButtonSize.lg,
          ),
          HSpace.gap2,
          HButton.tonal(
            label: t.auth.createAccount,
            onPressed: () => context.push(RoutePaths.signup),
            size: HButtonSize.lg,
          ),
          HSpace.gap6,
          HText(
            t.auth.termsNote(name: name),
            style: HTextStyle.bodySm,
            tone: HTextTone.tertiary,
            align: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
