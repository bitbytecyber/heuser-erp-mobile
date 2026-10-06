import 'dart:async';

import 'package:flutter/services.dart' show TextInputAction, TextInputType;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/app/router/auth_redirect.dart';
import 'package:heuser_erp_mobile/core/i18n/failure_messages.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/cubit/auth_action_cubit.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/widgets/auth_scaffold.dart';

/// Request a sign-in code by email (then the root bloc routes to confirm).
class LoginCodeRequestPage extends StatefulWidget {
  /// Creates the page.
  const LoginCodeRequestPage({super.key});

  @override
  State<LoginCodeRequestPage> createState() => _LoginCodeRequestPageState();
}

class _LoginCodeRequestPageState extends State<LoginCodeRequestPage> {
  final _email = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final state = context.watch<AuthActionCubit>().state;
    return AuthScaffold(
      icon: HIcons.mail,
      title: t.auth.loginCodeTitle,
      body: t.auth.loginCodeBody,
      fields: [
        HTextField(
          controller: _email,
          label: t.auth.email,
          hint: t.auth.emailHint,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          autofillHints: const [AutofillHints.email],
          leadingIcon: HIcons.mail,
          autocorrect: false,
          error:
              fieldError(state.failureOrNull, 'email') ??
              (state.failureOrNull == null
                  ? null
                  : failureMessage(state.failureOrNull!, t)),
          onSubmitted: (_) =>
              context.read<AuthActionCubit>().requestLoginCode(_email.text),
        ),
      ],
      bottom: HButton.filled(
        label: t.auth.loginCodeSend,
        loading: state.isBusy,
        size: HButtonSize.lg,
        onPressed: () =>
            context.read<AuthActionCubit>().requestLoginCode(_email.text),
      ),
    );
  }
}

/// Forgot password: emails a reset link.
class ForgotPasswordPage extends StatefulWidget {
  /// Creates the page.
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _email = TextEditingController();
  bool _sent = false;

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final state = context.watch<AuthActionCubit>().state;
    if (_sent) {
      return AuthScaffold(
        icon: HIcons.checkCircle,
        title: t.auth.forgotSentTitle,
        body: t.auth.forgotSentBody(email: _email.text.trim()),
        fields: const [],
        bottom: HButton.filled(
          label: t.auth.backToSignIn,
          size: HButtonSize.lg,
          onPressed: () => context.go(RoutePaths.login),
        ),
      );
    }
    return BlocListener<AuthActionCubit, AuthActionState>(
      listenWhen: (_, s) => s is AuthActionDone,
      listener: (_, _) => setState(() => _sent = true),
      child: AuthScaffold(
        icon: HIcons.lock,
        title: t.auth.forgotTitle,
        body: t.auth.forgotBody,
        fields: [
          HTextField(
            controller: _email,
            label: t.auth.email,
            hint: t.auth.emailHint,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            autofillHints: const [AutofillHints.email],
            leadingIcon: HIcons.mail,
            autocorrect: false,
            error: fieldError(state.failureOrNull, 'email'),
            onSubmitted: (_) => context
                .read<AuthActionCubit>()
                .requestPasswordReset(_email.text),
          ),
        ],
        bottom: HButton.filled(
          label: t.auth.forgotSend,
          loading: state.isBusy,
          size: HButtonSize.lg,
          onPressed: () =>
              context.read<AuthActionCubit>().requestPasswordReset(_email.text),
        ),
      ),
    );
  }
}

/// Set a new password from an emailed key (App Link `/reset-password/<key>`).
class ResetPasswordPage extends StatefulWidget {
  /// Creates the page.
  const ResetPasswordPage({required this.resetKey, super.key});

  /// The key from the link.
  final String resetKey;

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _password = TextEditingController();
  final _confirm = TextEditingController();
  String? _localError;
  bool _done = false;

  @override
  void dispose() {
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  void _submit() {
    final t = Translations.of(context).auth;
    setState(() {
      _localError = _password.text.length < 8
          ? t.passwordTooShort
          : _password.text != _confirm.text
          ? t.passwordsDiffer
          : null;
    });
    if (_localError != null) return;
    unawaited(
      context.read<AuthActionCubit>().resetPassword(
        key: widget.resetKey,
        password: _password.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final state = context.watch<AuthActionCubit>().state;
    if (_done) {
      return AuthScaffold(
        icon: HIcons.checkCircle,
        title: t.auth.resetDoneTitle,
        body: t.auth.resetDoneBody,
        showBack: false,
        fields: const [],
        bottom: HButton.filled(
          label: t.auth.signIn,
          size: HButtonSize.lg,
          onPressed: () => context.go(RoutePaths.login),
        ),
      );
    }
    final failure = state.failureOrNull;
    return BlocListener<AuthActionCubit, AuthActionState>(
      listenWhen: (_, s) => s is AuthActionDone,
      listener: (_, _) => setState(() => _done = true),
      child: AuthScaffold(
        icon: HIcons.lock,
        title: t.auth.resetTitle,
        body: t.auth.resetBody,
        fields: [
          HTextField(
            controller: _password,
            label: t.auth.password,
            hint: t.auth.passwordHint,
            obscureText: true,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.newPassword],
            leadingIcon: HIcons.lock,
            error:
                _localError ??
                fieldError(failure, 'password') ??
                (fieldError(failure, 'key') == null
                    ? null
                    : t.auth.resetInvalidKey),
          ),
          HSpace.gap3,
          HTextField(
            controller: _confirm,
            label: t.auth.confirmPassword,
            obscureText: true,
            textInputAction: TextInputAction.done,
            leadingIcon: HIcons.lock,
            onSubmitted: (_) => _submit(),
          ),
        ],
        bottom: HButton.filled(
          label: t.auth.resetSubmit,
          loading: state.isBusy,
          size: HButtonSize.lg,
          onPressed: _submit,
        ),
      ),
    );
  }
}
