import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/failure_messages.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/presentation/cubit/application_load_cubit.dart';

/// Loads one application and shows the form (draft) or the tracker.
/// The route provides the [ApplicationLoadCubit].
class ApplicationPage extends StatelessWidget {
  /// Creates the page.
  const ApplicationPage({
    required this.formBuilder,
    required this.trackerBuilder,
    super.key,
  });

  /// Builds the form for a draft.
  final Widget Function(BuildContext context, Application application)
  formBuilder;

  /// Builds the tracker for a sent application.
  final Widget Function(BuildContext context, Application application)
  trackerBuilder;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return BlocBuilder<ApplicationLoadCubit, ApplicationLoadState>(
      builder: (context, state) => switch (state) {
        ApplicationLoading() => HScaffold(
          appBar: HAppBar(backLabel: t.common.back),
          body: const Center(child: HSpinner(size: 28)),
        ),
        ApplicationLoadFailed(:final failure) => HScaffold(
          appBar: HAppBar(backLabel: t.common.back),
          body: Center(
            child: HEmptyState(
              icon: HIcons.warning,
              tone: HTone.warning,
              title: t.errors.notFound,
              message: failureMessage(failure, t),
              actionLabel: t.common.retry,
              onAction: context.read<ApplicationLoadCubit>().load,
            ),
          ),
        ),
        ApplicationLoaded(:final application) =>
          application.isDraft
              ? formBuilder(context, application)
              : trackerBuilder(context, application),
      },
    );
  }
}
