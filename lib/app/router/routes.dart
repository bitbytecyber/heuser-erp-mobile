import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/app/di/injection.dart';
import 'package:heuser_erp_mobile/app/router/auth_redirect.dart';
import 'package:heuser_erp_mobile/app/router/shells/applicant_shell.dart';
import 'package:heuser_erp_mobile/core/connectivity/connectivity_service.dart';
import 'package:heuser_erp_mobile/core/files/document_opener.dart';
import 'package:heuser_erp_mobile/core/files/file_pick_service.dart';
import 'package:heuser_erp_mobile/core/realtime/notifications_socket.dart';
import 'package:heuser_erp_mobile/core/storage/json_file_cache.dart';
import 'package:heuser_erp_mobile/features/application_form/data/file_draft_store.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/pages/application_form_page.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart';
import 'package:heuser_erp_mobile/features/applications/presentation/bloc/applications_bloc.dart';
import 'package:heuser_erp_mobile/features/applications/presentation/cubit/application_load_cubit.dart';
import 'package:heuser_erp_mobile/features/applications/presentation/pages/application_page.dart';
import 'package:heuser_erp_mobile/features/applications/presentation/pages/applications_page.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_repository.dart';
import 'package:heuser_erp_mobile/features/auth/domain/social_precheck.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/cubit/auth_action_cubit.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/pages/code_pages.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/pages/login_page.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/pages/password_pages.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/pages/signup_page.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/pages/social_choice_page.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/pages/welcome_page.dart';
import 'package:heuser_erp_mobile/features/branding/data/branding_repository.dart';
import 'package:heuser_erp_mobile/features/me/presentation/pages/appearance_page.dart';
import 'package:heuser_erp_mobile/features/me/presentation/pages/change_password_page.dart';
import 'package:heuser_erp_mobile/features/me/presentation/pages/profile_page.dart';
import 'package:heuser_erp_mobile/features/notifications/domain/notification_link.dart';
import 'package:heuser_erp_mobile/features/notifications/domain/notifications_repository.dart';
import 'package:heuser_erp_mobile/features/notifications/presentation/bloc/notifications_bloc.dart';
import 'package:heuser_erp_mobile/features/notifications/presentation/cubit/unread_cubit.dart';
import 'package:heuser_erp_mobile/features/notifications/presentation/pages/notifications_page.dart';
import 'package:heuser_erp_mobile/features/student/presentation/pages/student_home_page.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/pages/tracker_page.dart';

part 'routes.g.dart';
part 'routes_applicant.dart';

// Transitions: shared-axis X for pushes, fade-through for root swaps.
// The duration mirrors HMotion.slow; route builders have no theme context.
const _transition = Duration(milliseconds: 360);

CustomTransitionPage<void> _slide(GoRouterState state, Widget child) =>
    CustomTransitionPage(
      key: state.pageKey,
      transitionDuration: _transition,
      reverseTransitionDuration: _transition,
      transitionsBuilder: HPageTransitions.sharedAxisX,
      child: child,
    );

CustomTransitionPage<void> _fade(GoRouterState state, Widget child) =>
    CustomTransitionPage(
      key: state.pageKey,
      transitionDuration: _transition,
      transitionsBuilder: HPageTransitions.fadeThrough,
      child: child,
    );

/// Each auth page gets its own action cubit; successful sign-ins reach the
/// root bloc through the repository's event stream.
Widget _withAction(Widget page) => BlocProvider(
  create: (_) => AuthActionCubit(getIt<AuthRepository>()),
  child: page,
);

// --- public ------------------------------------------------------------------

/// Blank frame while the session is checked.
@TypedGoRoute<SplashRoute>(path: '/')
class SplashRoute extends GoRouteData with $SplashRoute {
  /// Const.
  const SplashRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      _fade(state, const SplashPage());
}

/// Welcome.
@TypedGoRoute<WelcomeRoute>(path: '/welcome')
class WelcomeRoute extends GoRouteData with $WelcomeRoute {
  /// Const.
  const WelcomeRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => _fade(
    state,
    _withAction(WelcomePage(branding: getIt<BrandingRepository>())),
  );
}

/// Login.
@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData with $LoginRoute {
  /// Const.
  const LoginRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      _slide(state, _withAction(const LoginPage()));
}

/// Signup.
@TypedGoRoute<SignupRoute>(path: '/signup')
class SignupRoute extends GoRouteData with $SignupRoute {
  /// Const.
  const SignupRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      _slide(state, _withAction(const SignupPage()));
}

/// Verify email code.
@TypedGoRoute<VerifyEmailRoute>(path: '/verify-email')
class VerifyEmailRoute extends GoRouteData with $VerifyEmailRoute {
  /// Const.
  const VerifyEmailRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      _fade(state, _withAction(const VerifyEmailPage()));
}

/// Second factor.
@TypedGoRoute<MfaRoute>(path: '/mfa')
class MfaRoute extends GoRouteData with $MfaRoute {
  /// Const.
  const MfaRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      _fade(state, _withAction(const MfaPage()));
}

/// Login by code: request, then confirm.
@TypedGoRoute<LoginCodeRoute>(
  path: '/login-code',
  routes: [TypedGoRoute<LoginCodeConfirmRoute>(path: 'confirm')],
)
class LoginCodeRoute extends GoRouteData with $LoginCodeRoute {
  /// Const.
  const LoginCodeRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      _slide(state, _withAction(const LoginCodeRequestPage()));
}

/// Confirm the emailed code.
class LoginCodeConfirmRoute extends GoRouteData with $LoginCodeConfirmRoute {
  /// Const.
  const LoginCodeConfirmRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      _fade(state, _withAction(const LoginCodeConfirmPage()));
}

/// Forgot password.
@TypedGoRoute<ForgotPasswordRoute>(path: '/forgot-password')
class ForgotPasswordRoute extends GoRouteData with $ForgotPasswordRoute {
  /// Const.
  const ForgotPasswordRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      _slide(state, _withAction(const ForgotPasswordPage()));
}

/// Reset password from an emailed key (`/reset-password?key=…`).
@TypedGoRoute<ResetPasswordRoute>(path: '/reset-password')
class ResetPasswordRoute extends GoRouteData with $ResetPasswordRoute {
  /// Creates the route.
  const ResetPasswordRoute({this.key = ''});

  /// The reset key.
  final String key;
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      _slide(state, _withAction(ResetPasswordPage(resetKey: key)));
}

/// Unknown social identity: apply or back out.
@TypedGoRoute<SocialChoiceRoute>(path: '/social-choice')
class SocialChoiceRoute extends GoRouteData with $SocialChoiceRoute {
  /// Creates the route with the precheck as extra.
  const SocialChoiceRoute({required this.$extra});

  /// The precheck result.
  final SocialPrecheck $extra;
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => _slide(
    state,
    _withAction(
      SocialChoicePage(precheck: $extra, branding: getIt<BrandingRepository>()),
    ),
  );
}

/// Signed in without a mobile portal.
@TypedGoRoute<NoPortalRoute>(path: '/no-portal')
class NoPortalRoute extends GoRouteData with $NoPortalRoute {
  /// Const.
  const NoPortalRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => _fade(
    state,
    NoPortalPage(
      onSignOut: () =>
          context.read<AuthBloc>().add(const AuthEvent.signOutRequested()),
    ),
  );
}

/// Phase-2 placeholder for the enrolled-student portal.
@TypedGoRoute<StudentRoute>(path: '/student')
class StudentRoute extends GoRouteData with $StudentRoute {
  /// Const.
  const StudentRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => _fade(
    state,
    StudentHomePage(
      name: context.read<AuthBloc>().state.userOrNull?.greetingName ?? '',
      onSignOut: () =>
          context.read<AuthBloc>().add(const AuthEvent.signOutRequested()),
    ),
  );
}
