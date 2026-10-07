import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_erp_mobile/core/format/format_checks.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_draft.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_errors.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/bloc/application_form_bloc.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/widgets/form_messages.dart';

/// What every block widget needs from the form bloc, as short calls.
extension FormScope on BuildContext {
  /// Applies [update] to the draft (autosave follows).
  void patch(FormDraft Function(FormDraft d) update) =>
      read<ApplicationFormBloc>().add(
        ApplicationFormEvent.draftChanged(update),
      );

  /// Applies [update] and clears the error on [key].
  void patchField(String key, FormDraft Function(FormDraft d) update) {
    final bloc = read<ApplicationFormBloc>()
      ..add(ApplicationFormEvent.draftChanged(update));
    if (bloc.state.errors.containsKey(key)) {
      bloc.add(ApplicationFormEvent.errorCleared(key));
    }
  }

  /// Clears the error on [key].
  void clearError(String key) =>
      read<ApplicationFormBloc>().add(ApplicationFormEvent.errorCleared(key));

  /// Sets a format error on [key] (blur check of a text field).
  void formatError(String key, FieldFormat format) =>
      read<ApplicationFormBloc>().add(
        ApplicationFormEvent.errorSet(key, FormError.format(format)),
      );

  /// The localised error for [key], rebuilding only when it changes.
  String? fieldError(String key) {
    final e = select<ApplicationFormBloc, FormError?>(
      (b) => b.state.errors[key],
    );
    return e == null ? null : formErrorText(e, Translations.of(this));
  }
}
