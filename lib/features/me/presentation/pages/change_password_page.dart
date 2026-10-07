import 'dart:async';

import 'package:flutter/services.dart' show TextInputAction;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/failure_messages.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/cubit/auth_action_cubit.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/widgets/auth_scaffold.dart';

/// Change the password, or set a first one for an account made with
/// Google / Apple ([hasPassword] false: no current password is asked).
class ChangePasswordPage extends StatefulWidget {
  /// Creates the page.
  const ChangePasswordPage({required this.hasPassword, super.key});

  /// The account already has a usable password.
  final bool hasPassword;

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _current = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();
  String? _currentError;
  String? _localError;

  @override
  void dispose() {
    _current.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  void _submit() {
    final t = Translations.of(context);
    setState(() {
      _currentError = widget.hasPassword && _current.text.isEmpty
          ? t.profile.currentPasswordNeeded
          : null;
      _localError = _password.text.length < 8
          ? t.auth.passwordTooShort
          : _password.text != _confirm.text
          ? t.auth.passwordsDiffer
          : null;
    });
    if (_currentError != null || _localError != null) return;
    unawaited(
      context.read<AuthActionCubit>().changePassword(
        newPassword: _password.text,
        currentPassword: widget.hasPassword ? _current.text : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final state = context.watch<AuthActionCubit>().state;
    final failure = state.failureOrNull;
    return BlocListener<AuthActionCubit, AuthActionState>(
      listenWhen: (_, s) => s is AuthActionDone,
      listener: (context, _) {
        unawaited(HHaptics.success());
        HToast.success(context, t.profile.passwordChanged);
        context.pop();
      },
      child: AuthScaffold(
        icon: HIcons.lock,
        title: widget.hasPassword
            ? t.profile.changePassword
            : t.profile.setPassword,
        body: widget.hasPassword
            ? t.profile.changePasswordBody
            : t.profile.setPasswordBody,
        onFailure: (f) {
          if (fieldError(f, 'current_password') != null ||
              fieldError(f, 'new_password') != null) {
            return; // shown under the fields
          }
          final msg = failureMessage(f, t);
          if (msg.isNotEmpty) HToast.error(context, msg);
        },
        fields: [
          if (widget.hasPassword) ...[
            HTextField(
              controller: _current,
              label: t.profile.currentPassword,
              obscureText: true,
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.password],
              leadingIcon: HIcons.lock,
              error: _currentError ?? fieldError(failure, 'current_password'),
            ),
            HSpace.gap3,
          ],
          HTextField(
            controller: _password,
            label: t.profile.newPassword,
            hint: t.auth.passwordHint,
            obscureText: true,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.newPassword],
            leadingIcon: HIcons.lock,
            error: _localError ?? fieldError(failure, 'new_password'),
          ),
          HSpace.gap3,
          HTextField(
            controller: _confirm,
            label: t.auth.confirmPassword,
            obscureText: true,
            textInputAction: TextInputAction.done,
            autofillHints: const [AutofillHints.newPassword],
            leadingIcon: HIcons.lock,
            onSubmitted: (_) => _submit(),
          ),
        ],
        bottom: HButton.filled(
          label: t.common.save,
          size: HButtonSize.lg,
          loading: state.isBusy,
          onPressed: _submit,
        ),
      ),
    );
  }
}
