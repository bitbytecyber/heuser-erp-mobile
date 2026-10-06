import 'package:heuser_erp_mobile/core/env/flavor.dart';

/// Compile-time environment, read once from `--dart-define-from-file`.
///
/// Every value is a `String.fromEnvironment` constant so nothing is decided at
/// runtime and a Shorebird patch cannot drift from its release (both are built
/// from the same `env/<flavor>.json`). Validation is eager: a malformed URL
/// fails on the first frame rather than on the first request.
class AppEnv {
  const AppEnv._({
    required this.flavor,
    required this.appName,
    required this.apiBaseUrl,
    required this.wsBaseUrl,
    required this.googleWebClientId,
    required this.appleClientId,
    required this.appStoreId,
  });

  /// Builds the environment from the defines, asserting that the entry point
  /// ([expected], from `main_<flavor>.dart`) matches `FLAVOR`. A mismatch
  /// means someone ran `main_prod.dart` with `env/dev.json` or vice versa.
  factory AppEnv.fromDefines({required Flavor expected}) {
    final flavor = Flavor.parse(_flavor);
    if (flavor != expected) {
      throw StateError(
        'Entry point is main_${expected.name}.dart but FLAVOR=${flavor.name}. '
        'Pass --dart-define-from-file=env/${expected.name}.json.',
      );
    }
    return AppEnv.custom(
      flavor: flavor,
      appName: _appName,
      apiBaseUrl: _apiBaseUrl,
      wsBaseUrl: _wsBaseUrl,
      googleWebClientId: _googleWebClientId,
      appleClientId: _appleClientId,
      appStoreId: _appStoreId,
    );
  }

  /// Validating constructor used by [AppEnv.fromDefines] and by tests.
  factory AppEnv.custom({
    required Flavor flavor,
    required String appName,
    required String apiBaseUrl,
    required String wsBaseUrl,
    required String googleWebClientId,
    required String appleClientId,
    required String appStoreId,
  }) {
    final api = _validatedOrigin(apiBaseUrl, 'API_BASE_URL', const {
      'http',
      'https',
    });
    final ws = _validatedOrigin(wsBaseUrl, 'WS_BASE_URL', const {'ws', 'wss'});
    if (flavor.isProd && api.scheme != 'https') {
      throw StateError('API_BASE_URL must be https in prod (got $apiBaseUrl).');
    }
    return AppEnv._(
      flavor: flavor,
      appName: appName,
      apiBaseUrl: api.toString(),
      wsBaseUrl: ws.toString(),
      googleWebClientId: googleWebClientId,
      appleClientId: appleClientId,
      appStoreId: appStoreId,
    );
  }

  static const _flavor = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
  static const _appName = String.fromEnvironment(
    'APP_NAME',
    defaultValue: 'Heuser Dev',
  );
  static const _apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://10.0.2.2:8090',
  );
  static const _wsBaseUrl = String.fromEnvironment(
    'WS_BASE_URL',
    defaultValue: 'ws://10.0.2.2:8091',
  );
  static const _googleWebClientId = String.fromEnvironment(
    'GOOGLE_WEB_CLIENT_ID',
  );
  static const _appleClientId = String.fromEnvironment('APPLE_CLIENT_ID');
  static const _appStoreId = String.fromEnvironment('APP_STORE_ID');

  final Flavor flavor;
  final String appName;

  /// Backend origin without a trailing slash, e.g. `https://sis.example.com`.
  final String apiBaseUrl;

  /// Channels origin for `ws/notifications/`.
  final String wsBaseUrl;

  /// The **web** OAuth client id (Google returns an `id_token` for it).
  final String googleWebClientId;

  /// The iOS bundle id; must be listed in the backend `APPLE_OAUTH_CLIENT_ID`.
  final String appleClientId;

  /// Numeric App Store id, used by the update prompt.
  final String appStoreId;

  /// `…/api/v1/` — DRF endpoints. The trailing slash is required by Django.
  Uri get apiV1 => Uri.parse('$apiBaseUrl/api/v1/');

  /// `…/_allauth/app/v1/` — django-allauth headless **app** client.
  Uri get allauthApp => Uri.parse('$apiBaseUrl/_allauth/app/v1/');

  /// `…/ws/notifications/` — Channels consumer.
  Uri get notificationsSocket => Uri.parse('$wsBaseUrl/ws/notifications/');

  static Uri _validatedOrigin(String raw, String name, Set<String> schemes) {
    final uri = Uri.tryParse(raw);
    if (uri == null || !schemes.contains(uri.scheme) || uri.host.isEmpty) {
      throw StateError(
        '$name must be an absolute ${schemes.join('/')} origin (got "$raw").',
      );
    }
    if (uri.path.isNotEmpty && uri.path != '/') {
      throw StateError('$name must be an origin without a path (got "$raw").');
    }
    return uri.replace(path: '');
  }
}
