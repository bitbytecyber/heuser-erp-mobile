import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/failure_messages.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/cubit/auth_action_cubit.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/widgets/auth_scaffold.dart';

/// Email verification by code (6 uppercase letters/digits from allauth).
class VerifyEmailPage extends StatelessWidget {
  /// Creates the page.
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final email = context.select<AuthBloc, String>(
      (b) => switch (b.state) {
        AuthPending(:final email) => email,
        _ => '',
      },
    );
    return _CodePage(
      icon: HIcons.mail,
      title: t.auth.verifyTitle,
      body: t.auth.verifyBody(email: email),
      length: 6,
      alphanumeric: true,
      onCode: (c, code) => c.verifyEmail(code),
      invalidMessage: t.auth.verifyCodeInvalid,
      secondary: _Resend(),
      showBack: false,
    );
  }
}

/// Second factor (TOTP, or a recovery code).
class MfaPage extends StatefulWidget {
  /// Creates the page.
  const MfaPage({super.key});

  @override
  State<MfaPage> createState() => _MfaPageState();
}

class _MfaPageState extends State<MfaPage> {
  bool _recovery = false;
  final _recoveryCode = TextEditingController();

  @override
  void dispose() {
    _recoveryCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    if (_recovery) {
      final state = context.watch<AuthActionCubit>().state;
      return AuthScaffold(
        icon: HIcons.shield,
        title: t.auth.mfaTitle,
        body: t.auth.mfaRecovery,
        showBack: false,
        fields: [
          HTextField(
            controller: _recoveryCode,
            label: t.auth.mfaRecoveryHint,
            autocorrect: false,
            enableSuggestions: false,
            error: fieldError(state.failureOrNull, 'code'),
          ),
          HSpace.gap3,
          HButton.ghost(
            label: t.auth.mfaBody,
            onPressed: () => setState(() => _recovery = false),
          ),
        ],
        bottom: HButton.filled(
          label: t.common.kContinue,
          loading: state.isBusy,
          size: HButtonSize.lg,
          onPressed: () =>
              context.read<AuthActionCubit>().mfa(_recoveryCode.text.trim()),
        ),
      );
    }
    return _CodePage(
      icon: HIcons.shield,
      title: t.auth.mfaTitle,
      body: t.auth.mfaBody,
      length: 6,
      alphanumeric: false,
      onCode: (c, code) => c.mfa(code),
      invalidMessage: t.auth.verifyCodeInvalid,
      secondary: HButton.ghost(
        label: t.auth.mfaRecovery,
        onPressed: () => setState(() => _recovery = true),
        expand: true,
      ),
      showBack: false,
    );
  }
}

/// Confirm an emailed login code.
class LoginCodeConfirmPage extends StatelessWidget {
  /// Creates the page.
  const LoginCodeConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final email = context.select<AuthBloc, String>(
      (b) => switch (b.state) {
        AuthPending(:final email) => email,
        _ => '',
      },
    );
    return _CodePage(
      icon: HIcons.mail,
      title: t.auth.loginCodeConfirmTitle,
      body: t.auth.loginCodeConfirmBody(email: email),
      length: 6,
      alphanumeric: true,
      onCode: (c, code) => c.confirmLoginCode(code),
      invalidMessage: t.auth.verifyCodeInvalid,
      secondary: null,
      showBack: false,
    );
  }
}

class _Resend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return BlocListener<AuthActionCubit, AuthActionState>(
      listenWhen: (_, s) => s is AuthActionDone && s.outcome == null,
      listener: (context, _) => HToast.success(context, t.auth.codeSent),
      child: HButton.ghost(
        label: t.auth.resendCode,
        icon: HIcons.refresh,
        expand: true,
        onPressed: () => context.read<AuthActionCubit>().resendVerification(),
      ),
    );
  }
}

class _CodePage extends StatefulWidget {
  const _CodePage({
    required this.icon,
    required this.title,
    required this.body,
    required this.length,
    required this.alphanumeric,
    required this.onCode,
    required this.invalidMessage,
    required this.secondary,
    required this.showBack,
  });
  final IconData icon;
  final String title;
  final String body;
  final int length;
  final bool alphanumeric;
  final void Function(AuthActionCubit cubit, String code) onCode;
  final String invalidMessage;
  final Widget? secondary;
  final bool showBack;

  @override
  State<_CodePage> createState() => _CodePageState();
}

class _CodePageState extends State<_CodePage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final state = context.watch<AuthActionCubit>().state;
    final failure = state.failureOrNull;
    final error = failure is Validation
        ? (fieldError(failure, 'code') ??
              fieldError(failure, 'key') ??
              widget.invalidMessage)
        : null;
    return AuthScaffold(
      icon: widget.icon,
      title: widget.title,
      body: widget.body,
      showBack: widget.showBack,
      onFailure: (f) {
        if (f is Validation) {
          _controller.clear();
          return;
        }
        HToast.error(context, failureMessage(f, t));
      },
      fields: [
        HOtpField(
          controller: _controller,
          length: widget.length,
          alphanumeric: widget.alphanumeric,
          enabled: !state.isBusy,
          error: error,
          onChanged: (_) {
            if (failure != null) context.read<AuthActionCubit>().reset();
          },
          onCompleted: (code) =>
              widget.onCode(context.read<AuthActionCubit>(), code),
        ),
        if (state.isBusy) ...[HSpace.gap4, const Center(child: HSpinner())],
        if (widget.secondary != null) ...[HSpace.gap6, widget.secondary!],
        HSpace.gap4,
        HButton.ghost(
          label: t.auth.backToSignIn,
          expand: true,
          onPressed: () =>
              context.read<AuthBloc>().add(const AuthEvent.signOutRequested()),
        ),
      ],
    );
  }
}
