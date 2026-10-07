import 'package:dio/dio.dart';
import 'package:heuser_erp_mobile/app/theme/theme_preference_store.dart';
import 'package:heuser_erp_mobile/core/auth/auth_signals.dart';
import 'package:heuser_erp_mobile/core/auth/session_token_store.dart';
import 'package:heuser_erp_mobile/core/connectivity/connectivity_service.dart';
import 'package:heuser_erp_mobile/core/env/app_env.dart';
import 'package:heuser_erp_mobile/core/files/file_pick_service.dart';
import 'package:heuser_erp_mobile/core/network/dio_factory.dart';
import 'package:heuser_erp_mobile/core/storage/json_file_cache.dart';
import 'package:heuser_erp_mobile/features/applications/data/datasources/booking_api.dart';
import 'package:heuser_erp_mobile/features/applications/data/datasources/intake_api.dart';
import 'package:heuser_erp_mobile/features/applications/data/repositories/intake_repository_impl.dart';
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart';
import 'package:heuser_erp_mobile/features/auth/data/datasources/allauth_api.dart';
import 'package:heuser_erp_mobile/features/auth/data/datasources/apple_auth_service.dart';
import 'package:heuser_erp_mobile/features/auth/data/datasources/google_auth_service.dart';
import 'package:heuser_erp_mobile/features/auth/data/datasources/social_auth_api.dart';
import 'package:heuser_erp_mobile/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:heuser_erp_mobile/features/auth/data/repositories/session_snapshot_store.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_repository.dart';
import 'package:heuser_erp_mobile/features/branding/data/branding_repository.dart';
import 'package:heuser_erp_mobile/features/branding/data/site_branding_api.dart';
import 'package:heuser_erp_mobile/features/me/data/me_api.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Third-party and core singletons. `AppEnv` is registered by hand before
/// `getIt.init()` (see `injection.dart`). Blocs are never registered here.
@module
abstract class CoreModule {
  /// Async-first shared preferences.
  @lazySingleton
  SharedPreferencesAsync prefs() => SharedPreferencesAsync();

  /// Session token (secure storage).
  @lazySingleton
  SessionTokenStore tokenStore() => SessionTokenStore();

  /// Dio ↔ auth repository hub.
  @lazySingleton
  AuthSignals authSignals() => AuthSignals();

  /// Connectivity (initialised in bootstrap).
  @lazySingleton
  ConnectivityService connectivity() => ConnectivityService();

  /// The one Dio. Interceptor order lives in [DioFactory].
  @lazySingleton
  Dio dio(
    AppEnv env,
    SessionTokenStore tokens,
    ConnectivityService connectivity,
    AuthSignals signals,
  ) => DioFactory.create(
    env: env,
    tokenStore: tokens,
    connectivity: connectivity,
    onSessionRejected: (uri, code) =>
        signals.onSessionRejected?.call(uri, code),
    credentialSwap: () => signals.credentialSwap,
  );

  /// Google provider.
  @lazySingleton
  GoogleAuthService google(AppEnv env) =>
      GoogleAuthService(serverClientId: env.googleWebClientId);

  /// Apple provider.
  @lazySingleton
  AppleAuthService apple() => const AppleAuthService();

  /// Theme persistence.
  @LazySingleton(as: ThemePreferenceStore)
  SharedPrefsThemeStore themeStore(SharedPreferencesAsync prefs) =>
      SharedPrefsThemeStore(prefs);

  /// allauth app client.
  @lazySingleton
  AllauthApi allauthApi(Dio dio) => AllauthApi(dio);

  /// Backend social endpoints.
  @lazySingleton
  SocialAuthApi socialAuthApi(Dio dio) => SocialAuthApi(dio);

  /// `/me/*`.
  @lazySingleton
  MeApi meApi(Dio dio) => MeApi(dio);

  /// Public branding.
  @lazySingleton
  SiteBrandingApi siteBrandingApi(Dio dio) => SiteBrandingApi(dio);

  /// Session snapshot.
  @lazySingleton
  SessionSnapshotStore snapshotStore(SharedPreferencesAsync prefs) =>
      SessionSnapshotStore(prefs);

  /// Branding with cache.
  @lazySingleton
  BrandingRepository brandingRepository(
    SiteBrandingApi api,
    SharedPreferencesAsync prefs,
  ) => BrandingRepository(api, prefs);

  /// The auth repository.
  @LazySingleton(as: AuthRepository)
  AuthRepositoryImpl authRepository(
    AllauthApi allauth,
    SocialAuthApi social,
    MeApi me,
    SessionTokenStore tokens,
    SessionSnapshotStore snapshots,
    AuthSignals signals,
    AppEnv env,
    GoogleAuthService google,
    AppleAuthService apple,
  ) => AuthRepositoryImpl(
    allauth: allauth,
    social: social,
    me: me,
    tokens: tokens,
    snapshots: snapshots,
    signals: signals,
    env: env,
    google: google,
    apple: apple,
  );

  /// Applicant intake endpoints.
  @lazySingleton
  IntakeApi intakeApi(Dio dio) => IntakeApi(dio);

  /// Intake with option / country caches.
  @LazySingleton(as: IntakeRepository)
  IntakeRepositoryImpl intakeRepository(IntakeApi api, BookingApi booking) =>
      IntakeRepositoryImpl(api, booking);

  /// Interview / trial booking endpoints.
  @lazySingleton
  BookingApi bookingApi(Dio dio) => BookingApi(dio);

  /// Unsaved form drafts, one JSON file per application.
  @Named('drafts')
  @lazySingleton
  JsonFileCache draftCache() => JsonFileCache('drafts');

  /// Camera / gallery / document picking with compression.
  @lazySingleton
  FilePickService filePickService() => FilePickService();
}
