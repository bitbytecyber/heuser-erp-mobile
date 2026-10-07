import 'package:flutter/foundation.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Device authentication (fingerprint, face, or the device PIN as a
/// fallback) for the optional app lock. Never throws.
class AppLockService {
  /// Creates the service. [auth] is injectable for tests.
  AppLockService(this._prefs, {LocalAuthentication? auth})
    : _auth = auth ?? LocalAuthentication();

  static const _key = 'security.app_lock.v1';

  final SharedPreferencesAsync _prefs;
  final LocalAuthentication _auth;

  /// The device can authenticate the user (biometrics or a screen lock).
  Future<bool> supported() async {
    try {
      return await _auth.isDeviceSupported();
    } on Object catch (e) {
      debugPrint('AppLockService: $e');
      return false;
    }
  }

  /// Asks the user to authenticate; `true` when they did.
  Future<bool> authenticate(String reason) async {
    try {
      return await _auth.authenticate(
        localizedReason: reason,
        persistAcrossBackgrounding: true,
      );
    } on Object catch (e) {
      debugPrint('AppLockService: $e');
      return false;
    }
  }

  /// The lock is turned on.
  Future<bool> enabled() async => await _prefs.getBool(_key) ?? false;

  /// Turns the lock on or off.
  Future<void> setEnabled({required bool value}) => _prefs.setBool(_key, value);
}
