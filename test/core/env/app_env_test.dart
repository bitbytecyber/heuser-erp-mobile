import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_erp_mobile/core/env/app_env.dart';
import 'package:heuser_erp_mobile/core/env/flavor.dart';

void main() {
  group('AppEnv', () {
    test('normalises origins and derives API roots', () {
      final env = AppEnv.custom(
        flavor: Flavor.staging,
        appName: 'Heuser Staging',
        apiBaseUrl: 'https://devsis.example.com/',
        wsBaseUrl: 'wss://devsis.example.com',
        googleWebClientId: '',
        appleClientId: '',
        appStoreId: '',
      );
      expect(env.apiBaseUrl, 'https://devsis.example.com');
      expect(env.apiV1.toString(), 'https://devsis.example.com/api/v1/');
      expect(
        env.allauthApp.toString(),
        'https://devsis.example.com/_allauth/app/v1/',
      );
      expect(
        env.notificationsSocket.toString(),
        'wss://devsis.example.com/ws/notifications/',
      );
    });

    test('rejects a path in the origin', () {
      expect(
        () => AppEnv.custom(
          flavor: Flavor.dev,
          appName: 'x',
          apiBaseUrl: 'http://10.0.2.2:8090/api/v1',
          wsBaseUrl: 'ws://10.0.2.2:8091',
          googleWebClientId: '',
          appleClientId: '',
          appStoreId: '',
        ),
        throwsStateError,
      );
    });

    test('rejects plain http in prod', () {
      expect(
        () => AppEnv.custom(
          flavor: Flavor.prod,
          appName: 'x',
          apiBaseUrl: 'http://sis.example.com',
          wsBaseUrl: 'wss://sis.example.com',
          googleWebClientId: '',
          appleClientId: '',
          appStoreId: '',
        ),
        throwsStateError,
      );
    });

    test('Flavor.parse rejects unknown values', () {
      expect(() => Flavor.parse('qa'), throwsStateError);
      expect(Flavor.parse('prod'), Flavor.prod);
    });
  });
}
