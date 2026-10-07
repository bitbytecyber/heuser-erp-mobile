part of 'routes.dart';

// --- applicant shell ----------------------------------------------------------

/// The applicant portal: three stateful branches under one nav bar.
@TypedStatefulShellRoute<ApplicantShellRoute>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<ApplicationsBranch>(
      routes: [
        TypedGoRoute<ApplicationsRoute>(
          path: '/apply',
          routes: [TypedGoRoute<ApplicationRoute>(path: ':id')],
        ),
      ],
    ),
    TypedStatefulShellBranch<NotificationsBranch>(
      routes: [TypedGoRoute<NotificationsRoute>(path: '/apply/notifications')],
    ),
    TypedStatefulShellBranch<ProfileBranch>(
      routes: [
        TypedGoRoute<ProfileRoute>(
          path: '/apply/profile',
          routes: [TypedGoRoute<AppearanceRoute>(path: 'appearance')],
        ),
      ],
    ),
  ],
)
class ApplicantShellRoute extends StatefulShellRouteData {
  /// Const.
  const ApplicantShellRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) => BlocProvider(
    // Shell-scoped: the list and the nested application pages share it.
    create: (_) =>
        ApplicationsBloc(getIt<IntakeRepository>())
          ..add(const ApplicationsEvent.started()),
    child: ApplicantShell(navigationShell: navigationShell),
  );
}

/// Applications branch.
class ApplicationsBranch extends StatefulShellBranchData {
  /// Const.
  const ApplicationsBranch();
}

/// Notifications branch.
class NotificationsBranch extends StatefulShellBranchData {
  /// Const.
  const NotificationsBranch();
}

/// Profile branch.
class ProfileBranch extends StatefulShellBranchData {
  /// Const.
  const ProfileBranch();
}

/// Applications tab.
class ApplicationsRoute extends GoRouteData with $ApplicationsRoute {
  /// Const.
  const ApplicationsRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => ApplicationsPage(
    collegeName: getIt<BrandingRepository>().current.name,
    onOpen: (id, {initial}) =>
        ApplicationRoute(id: id, $extra: initial).push<void>(context),
  );
}

/// One application: the form while a draft, the tracker once sent.
class ApplicationRoute extends GoRouteData with $ApplicationRoute {
  /// Creates the route. [$extra] skips the fetch when the caller has the
  /// application already (just created).
  const ApplicationRoute({required this.id, this.$extra});

  /// Application id.
  final int id;

  /// Preloaded application.
  final Application? $extra;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    final repo = getIt<IntakeRepository>();
    final branding = getIt<BrandingRepository>().current.name;
    final user = context.read<AuthBloc>().state.userOrNull;
    void leave() {
      context.read<ApplicationsBloc>().add(
        const ApplicationsEvent.refreshed(force: true),
      );
      if (context.canPop()) context.pop();
    }

    return _slide(
      state,
      BlocProvider(
        create: (_) => ApplicationLoadCubit(repo, id, initial: $extra),
        child: Builder(
          builder: (context) => ApplicationPage(
            formBuilder: (context, application) => ApplicationFormPage(
              key: ValueKey('form-${application.id}'),
              application: application,
              repo: repo,
              drafts: FileDraftStore(
                getIt<JsonFileCache>(instanceName: 'drafts'),
                userId: user?.id ?? 0,
              ),
              files: getIt<FilePickService>(),
              online: getIt<ConnectivityService>().statusStream.map(
                (s) => s == NetworkStatus.online,
              ),
              collegeName: branding,
              userEmail: user?.email,
              onLeave: leave,
              onSubmitted: (sent) {
                context.read<ApplicationLoadCubit>().replace(sent);
                context.read<ApplicationsBloc>().add(
                  const ApplicationsEvent.refreshed(force: true),
                );
              },
            ),
            trackerBuilder: (context, application) => TrackerPage(
              application: application,
              repo: repo,
              collegeName: branding,
            ),
          ),
        ),
      ),
    );
  }
}

/// Notifications tab.
class NotificationsRoute extends GoRouteData with $NotificationsRoute {
  /// Const.
  const NotificationsRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const NotificationsPage();
}

/// Profile tab.
class ProfileRoute extends GoRouteData with $ProfileRoute {
  /// Const.
  const ProfileRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ProfilePage(onAppearance: () => const AppearanceRoute().go(context));
}

/// Appearance (preset + mode).
class AppearanceRoute extends GoRouteData with $AppearanceRoute {
  /// Const.
  const AppearanceRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      _slide(state, const AppearancePage());
}
