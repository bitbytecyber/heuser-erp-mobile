import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:heuser_erp_mobile/app/router/auth_redirect.dart';
import 'package:heuser_erp_mobile/app/router/go_router_refresh_stream.dart';
import 'package:heuser_erp_mobile/app/router/routes.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/bloc/auth_bloc.dart';

/// Builds the router. The redirect is the pure [authRedirect]; the auth
/// bloc's stream re-runs it on every session change.
GoRouter buildAppRouter(AuthBloc auth) {
  final refresh = GoRouterRefreshStream(auth.stream);
  return GoRouter(
    initialLocation: RoutePaths.splash,
    routes: $appRoutes,
    refreshListenable: refresh,
    redirect: (context, state) =>
        authRedirect(state: auth.state, location: state.uri.toString()),
    debugLogDiagnostics: kDebugMode,
  );
}
