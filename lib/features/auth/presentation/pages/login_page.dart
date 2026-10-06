import 'dart:async';

import 'package:flutter/services.dart' show TextInputAction, TextInputType;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/app/router/auth_redirect.dart';
import 'package:heuser_erp_mobile/core/i18n/failure_messages.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/cubit/auth_action_cubit.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/widgets/social_buttons.dart';

/// Email + password sign-in.
class LoginPage extends StatefulWidget {
  /// Creates the page.
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  String? _emailError;
  String? _passwordError;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _submit() {
    final t = Translations.of(context).auth;
    final email = _email.text.trim();
    setState(() {
      _emailError = _isEmail(email) ? null : t.invalidEmail;
      _passwordError = _password.text.isEmpty ? t.passwordTooShort : null;
    });
    if (_emailError != null || _passwordError != null) return;
    unawaited(context.read<AuthActionCubit>().login(email, _password.text));
  }

  static bool _isEmail(String v) =>
      RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(v);

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final state = context.watch<AuthActionCubit>().state;
    final failure = state.failureOrNull;
    final invalidCreds = failure is Validation && failure.fieldErrors.isEmpty
        ? failureMessage(failure, t)
        : null;
    return BlocListener<AuthActionCubit, AuthActionState>(
      listenWhen: (_, s) => s is AuthActionNeedsChoice,
      listener: (context, state) => context.push(
        RoutePaths.socialChoice,
        extra: (state as AuthActionNeedsChoice).precheck,
      ),
      child: AuthScaffold(
        title: t.auth.signIn,
        onFailure: (f) {
          if (f is Validation) return; // shown inline below
          HToast.error(context, failureMessage(f, t));
        },
        fields: [
          const SocialButtons(),
          HTextField(
            controller: _email,
            label: t.auth.email,
            hint: t.auth.emailHint,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.email],
            leadingIcon: HIcons.mail,
            error: _emailError ?? fieldError(failure, 'email'),
            autocorrect: false,
            enableSuggestions: false,
          ),
          HSpace.gap3,
          HTextField(
            controller: _password,
            label: t.auth.password,
            obscureText: true,
            textInputAction: TextInputAction.done,
            autofillHints: const [AutofillHints.password],
            leadingIcon: HIcons.lock,
            error:
                _passwordError ??
                fieldError(failure, 'password') ??
                invalidCreds,
            onSubmitted: (_) => _submit(),
          ),
          HSpace.gap2,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HButton.ghost(
                label: t.auth.forgotPassword,
                onPressed: () => context.push(RoutePaths.forgotPassword),
                size: HButtonSize.sm,
              ),
              HButton.ghost(
                label: t.auth.signInWithCode,
                onPressed: () => context.push(RoutePaths.loginCode),
                size: HButtonSize.sm,
              ),
            ],
          ),
        ],
        bottom: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HButton.filled(
              label: t.auth.signIn,
              onPressed: _submit,
              loading: state.isBusy,
              size: HButtonSize.lg,
            ),
            HSpace.gap2,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HText(
                  t.auth.noAccount(name: t.app.name),
                  tone: HTextTone.secondary,
                ),
                HButton.ghost(
                  label: t.auth.createAccount,
                  onPressed: () => context.pushReplacement(RoutePaths.signup),
                  size: HButtonSize.sm,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
