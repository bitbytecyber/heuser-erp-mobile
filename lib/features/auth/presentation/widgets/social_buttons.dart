import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/auth/data/datasources/apple_auth_service.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/cubit/auth_action_cubit.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/widgets/auth_scaffold.dart';

/// Google and (on iOS) Apple buttons with an "or" divider.
class SocialButtons extends StatelessWidget {
  /// Creates the buttons.
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context).auth;
    final busy = context.select<AuthActionCubit, bool>((c) => c.state.isBusy);
    final cubit = context.read<AuthActionCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HButton.outline(
          label: t.continueWithGoogle,
          icon: HIcons.sparkle,
          onPressed: busy ? null : cubit.google,
        ),
        if (AppleAuthService.isSupportedPlatform) ...[
          HSpace.gap2,
          HButton.outline(
            label: t.continueWithApple,
            icon: HIcons.shield,
            onPressed: busy ? null : cubit.apple,
          ),
        ],
        HSpace.gap4,
        Row(
          children: [
            const Expanded(child: HDivider()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: HSpace.x3),
              child: HText(
                t.or,
                style: HTextStyle.labelMd,
                tone: HTextTone.tertiary,
              ),
            ),
            const Expanded(child: HDivider()),
          ],
        ),
        HSpace.gap4,
      ],
    );
  }
}
