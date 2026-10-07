// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:heuser_erp_mobile/app/di/modules/core_module.dart' as _i708;
import 'package:heuser_erp_mobile/app/theme/theme_preference_store.dart'
    as _i850;
import 'package:heuser_erp_mobile/core/auth/auth_signals.dart' as _i608;
import 'package:heuser_erp_mobile/core/auth/session_token_store.dart' as _i725;
import 'package:heuser_erp_mobile/core/connectivity/connectivity_service.dart'
    as _i800;
import 'package:heuser_erp_mobile/core/env/app_env.dart' as _i1035;
import 'package:heuser_erp_mobile/core/files/document_opener.dart' as _i851;
import 'package:heuser_erp_mobile/core/files/file_pick_service.dart' as _i685;
import 'package:heuser_erp_mobile/core/realtime/notifications_socket.dart'
    as _i722;
import 'package:heuser_erp_mobile/core/storage/json_file_cache.dart' as _i675;
import 'package:heuser_erp_mobile/features/applications/data/datasources/booking_api.dart'
    as _i328;
import 'package:heuser_erp_mobile/features/applications/data/datasources/intake_api.dart'
    as _i269;
import 'package:heuser_erp_mobile/features/applications/data/datasources/offer_api.dart'
    as _i210;
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart'
    as _i927;
import 'package:heuser_erp_mobile/features/auth/data/datasources/allauth_api.dart'
    as _i55;
import 'package:heuser_erp_mobile/features/auth/data/datasources/apple_auth_service.dart'
    as _i142;
import 'package:heuser_erp_mobile/features/auth/data/datasources/google_auth_service.dart'
    as _i811;
import 'package:heuser_erp_mobile/features/auth/data/datasources/social_auth_api.dart'
    as _i360;
import 'package:heuser_erp_mobile/features/auth/data/repositories/session_snapshot_store.dart'
    as _i256;
import 'package:heuser_erp_mobile/features/auth/domain/auth_repository.dart'
    as _i6;
import 'package:heuser_erp_mobile/features/branding/data/branding_repository.dart'
    as _i1064;
import 'package:heuser_erp_mobile/features/branding/data/site_branding_api.dart'
    as _i712;
import 'package:heuser_erp_mobile/features/me/data/me_api.dart' as _i994;
import 'package:heuser_erp_mobile/features/notifications/data/datasources/notifications_api.dart'
    as _i547;
import 'package:heuser_erp_mobile/features/notifications/domain/notifications_repository.dart'
    as _i17;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final coreModule = _$CoreModule();
    gh.lazySingleton<_i460.SharedPreferencesAsync>(() => coreModule.prefs());
    gh.lazySingleton<_i725.SessionTokenStore>(() => coreModule.tokenStore());
    gh.lazySingleton<_i608.AuthSignals>(() => coreModule.authSignals());
    gh.lazySingleton<_i800.ConnectivityService>(
      () => coreModule.connectivity(),
    );
    gh.lazySingleton<_i142.AppleAuthService>(() => coreModule.apple());
    gh.lazySingleton<_i851.DocumentOpener>(() => coreModule.documentOpener());
    gh.lazySingleton<_i685.FilePickService>(() => coreModule.filePickService());
    gh.lazySingleton<_i811.GoogleAuthService>(
      () => coreModule.google(gh<_i1035.AppEnv>()),
    );
    gh.lazySingleton<_i675.JsonFileCache>(
      () => coreModule.draftCache(),
      instanceName: 'drafts',
    );
    gh.lazySingleton<_i256.SessionSnapshotStore>(
      () => coreModule.snapshotStore(gh<_i460.SharedPreferencesAsync>()),
    );
    gh.lazySingleton<_i850.ThemePreferenceStore>(
      () => coreModule.themeStore(gh<_i460.SharedPreferencesAsync>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => coreModule.dio(
        gh<_i1035.AppEnv>(),
        gh<_i725.SessionTokenStore>(),
        gh<_i800.ConnectivityService>(),
        gh<_i608.AuthSignals>(),
      ),
    );
    gh.lazySingleton<_i722.NotificationsSocket>(
      () => coreModule.notificationsSocket(
        gh<_i1035.AppEnv>(),
        gh<_i725.SessionTokenStore>(),
      ),
    );
    gh.lazySingleton<_i55.AllauthApi>(
      () => coreModule.allauthApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i360.SocialAuthApi>(
      () => coreModule.socialAuthApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i994.MeApi>(() => coreModule.meApi(gh<_i361.Dio>()));
    gh.lazySingleton<_i712.SiteBrandingApi>(
      () => coreModule.siteBrandingApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i269.IntakeApi>(
      () => coreModule.intakeApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i210.OfferApi>(
      () => coreModule.offerApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i328.BookingApi>(
      () => coreModule.bookingApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i547.NotificationsApi>(
      () => coreModule.notificationsApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i6.AuthRepository>(
      () => coreModule.authRepository(
        gh<_i55.AllauthApi>(),
        gh<_i360.SocialAuthApi>(),
        gh<_i994.MeApi>(),
        gh<_i725.SessionTokenStore>(),
        gh<_i256.SessionSnapshotStore>(),
        gh<_i608.AuthSignals>(),
        gh<_i1035.AppEnv>(),
        gh<_i811.GoogleAuthService>(),
        gh<_i142.AppleAuthService>(),
      ),
    );
    gh.lazySingleton<_i927.IntakeRepository>(
      () => coreModule.intakeRepository(
        gh<_i269.IntakeApi>(),
        gh<_i328.BookingApi>(),
        gh<_i210.OfferApi>(),
      ),
    );
    gh.lazySingleton<_i1064.BrandingRepository>(
      () => coreModule.brandingRepository(
        gh<_i712.SiteBrandingApi>(),
        gh<_i460.SharedPreferencesAsync>(),
      ),
    );
    gh.lazySingleton<_i17.NotificationsRepository>(
      () => coreModule.notificationsRepository(gh<_i547.NotificationsApi>()),
    );
    return this;
  }
}

class _$CoreModule extends _i708.CoreModule {}
