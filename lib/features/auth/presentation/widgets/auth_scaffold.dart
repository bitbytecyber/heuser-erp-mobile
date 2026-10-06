import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/failure_messages.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/cubit/auth_action_cubit.dart';

/// Shared frame for the auth pages: back button, display title, body copy,
/// staggered content, a pinned primary action, and the failure toast wiring
/// for `AuthActionCubit` (validation messages are shown inline by the page;
/// everything else toasts).
class AuthScaffold extends StatelessWidget {
  /// Creates the frame.
  const AuthScaffold({
    required this.title,
    required this.fields,
    this.body,
    this.bottom,
    this.showBack = true,
    this.icon,
    this.onFailure,
    super.key,
  });

  /// Display title.
  final String title;

  /// Supporting copy under the title.
  final String? body;

  /// Form content.
  final List<Widget> fields;

  /// Pinned bottom action(s).
  final Widget? bottom;

  /// Show the back button.
  final bool showBack;

  /// Optional glyph above the title.
  final IconData? icon;

  /// Called for failures that are not plain validation (page decides).
  final void Function(Failure failure)? onFailure;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return BlocListener<AuthActionCubit, AuthActionState>(
      listenWhen: (_, s) => s is AuthActionFailed,
      listener: (context, state) {
        final f = (state as AuthActionFailed).failure;
        if (onFailure != null) {
          onFailure!(f);
          return;
        }
        if (f is Validation && f.fieldErrors.isNotEmpty) return;
        final msg = failureMessage(f, t);
        if (msg.isNotEmpty) HToast.error(context, msg);
      },
      child: HScaffold(
        appBar: HAppBar(showBack: showBack, backLabel: t.common.back),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(
            HSpace.gutter,
            HSpace.x2,
            HSpace.gutter,
            HSpace.x6,
          ),
          children: [
            if (icon != null) ...[
              Builder(
                builder: (context) => Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: context.h.colors.brandSoft,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: HIcon(
                      icon!,
                      size: HIconSize.xl,
                      tone: HTextTone.brandStrong,
                    ),
                  ),
                ),
              ),
              HSpace.gap4,
            ],
            HText(title, style: HTextStyle.displaySm),
            if (body != null) ...[
              HSpace.gap2,
              HText(body!, style: HTextStyle.bodyLg, tone: HTextTone.secondary),
            ],
            HSpace.gap6,
            ...fields,
          ].hStaggered(context),
        ),
        bottomBar: bottom == null
            ? null
            : Padding(
                padding: const EdgeInsets.fromLTRB(
                  HSpace.gutter,
                  HSpace.x2,
                  HSpace.gutter,
                  HSpace.x3,
                ),
                child: bottom,
              ),
      ),
    );
  }
}

/// Whether the cubit is busy (for button loading states).
extension AuthActionX on AuthActionState {
  /// Busy.
  bool get isBusy => this is AuthActionBusy;

  /// The failure, if any.
  Failure? get failureOrNull =>
      this is AuthActionFailed ? (this as AuthActionFailed).failure : null;
}
