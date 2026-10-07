part of 'routes.dart';

// --- applicant shell ----------------------------------------------------------

/// The applicant portal: three stateful branches under one nav bar.
@TypedStatefulShellRoute<ApplicantShellRoute>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<ApplicationsBranch>(
      routes: [
        TypedGoRoute<ApplicationsRoute>(
          path: '/apply',
          routes: [TypedGoRoute<ApplicationRoute>(path: 'application/:id')],
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
          routes: [
            TypedGoRoute<AppearanceRoute>(path: 'appearance'),
            TypedGoRoute<ChangePasswordRoute>(path: 'password'),
          ],
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
  ) => MultiBlocProvider(
    providers: [
      // Shell-scoped: the list and the nested application pages share it.
      BlocProvider(
        create: (_) =>
            ApplicationsBloc(getIt<IntakeRepository>())
              ..add(const ApplicationsEvent.started()),
      ),
      // The badge and the live socket live as long as the signed-in shell.
      BlocProvider(
        create: (_) => UnreadCubit(
          getIt<NotificationsRepository>(),
          getIt<NotificationsSocket>(),
        ),
      ),
    ],
    child: ApplicantShell(
      navigationShell: navigationShell,
      onOpenLink: (link) => switch (link) {
        ApplicationLink(:final id) => ApplicationRoute(id: id).go(context),
        ApplicationsLink() => const ApplicationsRoute().go(context),
      },
      // Nested pages (the form, the tracker) take the whole height.
      showNav: RoutePaths.applicantTabs.contains(state.uri.path),
    ),
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
    collegeName: getIt<BrandingRepository>().current.displayName,
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
    final branding = getIt<BrandingRepository>().current.displayName;
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
              key: ValueKey('tracker-${application.id}'),
              application: application,
              repo: repo,
              files: getIt<FilePickService>(),
              opener: getIt<DocumentOpener>(),
              collegeName: branding,
              onChanged: (_) => context.read<ApplicationsBloc>().add(
                const ApplicationsEvent.refreshed(force: true),
              ),
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
  Widget build(BuildContext context, GoRouterState state) => BlocProvider(
    create: (_) =>
        NotificationsBloc(getIt<NotificationsRepository>())
          ..add(const NotificationsEvent.started()),
    child: NotificationsPage(
      onOpenLink: (link) => switch (link) {
        ApplicationLink(:final id) => ApplicationRoute(id: id).go(context),
        ApplicationsLink() => const ApplicationsRoute().go(context),
      },
    ),
  );
}

/// Profile tab.
class ProfileRoute extends GoRouteData with $ProfileRoute {
  /// Const.
  const ProfileRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => ProfilePage(
    onAppearance: () => const AppearanceRoute().go(context),
    onPassword: () => const ChangePasswordRoute().go(context),
  );
}

/// Appearance (preset + mode).
class AppearanceRoute extends GoRouteData with $AppearanceRoute {
  /// Const.
  const AppearanceRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      _slide(state, const AppearancePage());
}

/// Change (or set a first) password.
class ChangePasswordRoute extends GoRouteData with $ChangePasswordRoute {
  /// Const.
  const ChangePasswordRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    final user = context.read<AuthBloc>().state.userOrNull;
    return _slide(
      state,
      _withAction(
        ChangePasswordPage(hasPassword: user?.hasUsablePassword ?? true),
      ),
    );
  }
}
