import 'dart:async';

import 'package:flutter/services.dart'
    show TextCapitalization, TextInputAction, TextInputType;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/app/router/auth_redirect.dart';
import 'package:heuser_erp_mobile/core/i18n/failure_messages.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/cubit/auth_action_cubit.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/widgets/social_buttons.dart';

/// Open self-signup: email + password (names, CNIC and phone optional, as on
/// the web). allauth replies with a pending `verify_email`, which the root
/// bloc turns into the verify page.
class SignupPage extends StatefulWidget {
  /// Creates the page.
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _first = TextEditingController();
  final _last = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();
  final _cnic = TextEditingController();
  final _phone = TextEditingController();
  final _errors = <String, String?>{};

  @override
  void dispose() {
    for (final c in [
      _first,
      _last,
      _email,
      _password,
      _confirm,
      _cnic,
      _phone,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  void _submit() {
    final t = Translations.of(context).auth;
    final email = _email.text.trim();
    setState(() {
      _errors['email'] = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)
          ? null
          : t.invalidEmail;
      _errors['password'] = _password.text.length < 8
          ? t.passwordTooShort
          : null;
      _errors['confirm'] = _confirm.text != _password.text
          ? t.passwordsDiffer
          : null;
    });
    if (_errors.values.any((e) => e != null)) return;
    unawaited(
      context.read<AuthActionCubit>().signup(
        email: email,
        password: _password.text,
        firstName: _first.text,
        lastName: _last.text,
        cnic: HMasks.unmaskDigits(_cnic.text),
        phone: _phone.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final state = context.watch<AuthActionCubit>().state;
    final failure = state.failureOrNull;
    return BlocListener<AuthActionCubit, AuthActionState>(
      listenWhen: (_, s) => s is AuthActionNeedsChoice,
      listener: (context, state) => context.push(
        RoutePaths.socialChoice,
        extra: (state as AuthActionNeedsChoice).precheck,
      ),
      child: AuthScaffold(
        title: t.auth.createAccount,
        fields: [
          const SocialButtons(),
          Row(
            children: [
              Expanded(
                child: HTextField(
                  controller: _first,
                  label: t.auth.firstName,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.givenName],
                ),
              ),
              HSpace.hgap3,
              Expanded(
                child: HTextField(
                  controller: _last,
                  label: t.auth.lastName,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.familyName],
                ),
              ),
            ],
          ),
          HSpace.gap3,
          HTextField(
            controller: _email,
            label: t.auth.email,
            hint: t.auth.emailHint,
            required: true,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.email],
            leadingIcon: HIcons.mail,
            autocorrect: false,
            enableSuggestions: false,
            error: _errors['email'] ?? fieldError(failure, 'email'),
          ),
          HSpace.gap3,
          HTextField(
            controller: _password,
            label: t.auth.password,
            hint: t.auth.passwordHint,
            required: true,
            obscureText: true,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.newPassword],
            leadingIcon: HIcons.lock,
            error: _errors['password'] ?? fieldError(failure, 'password'),
          ),
          HSpace.gap3,
          HTextField(
            controller: _confirm,
            label: t.auth.confirmPassword,
            required: true,
            obscureText: true,
            textInputAction: TextInputAction.next,
            leadingIcon: HIcons.lock,
            error: _errors['confirm'],
          ),
          HSpace.gap3,
          HTextField(
            controller: _cnic,
            label: t.auth.cnic,
            helper: t.auth.cnicHelper,
            keyboardType: TextInputType.number,
            inputFormatters: [HMasks.cnic()],
            textInputAction: TextInputAction.next,
            error: fieldError(failure, 'cnic'),
          ),
          HSpace.gap3,
          HTextField(
            controller: _phone,
            label: t.auth.phone,
            keyboardType: TextInputType.phone,
            inputFormatters: [HMasks.pkMobile()],
            textInputAction: TextInputAction.done,
            autofillHints: const [AutofillHints.telephoneNumber],
            leadingIcon: HIcons.phone,
            error: fieldError(failure, 'phone'),
            onSubmitted: (_) => _submit(),
          ),
        ],
        bottom: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HButton.filled(
              label: t.auth.createAccount,
              onPressed: _submit,
              loading: state.isBusy,
              size: HButtonSize.lg,
            ),
            HSpace.gap2,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HText(t.auth.haveAccount, tone: HTextTone.secondary),
                HButton.ghost(
                  label: t.auth.signIn,
                  onPressed: () => context.pushReplacement(RoutePaths.login),
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
