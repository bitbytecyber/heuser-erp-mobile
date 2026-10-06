import 'dart:convert';

import 'package:heuser_erp_mobile/app/theme/theme_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Local persistence for the user's preference and the last remote policy
/// (so the first frame after a cold start already has the admin's theme).
abstract class ThemePreferenceStore {
  /// Reads the user's preference.
  Future<ThemePreference> readPreference();

  /// Writes the user's preference.
  Future<void> writePreference(ThemePreference pref);

  /// Reads the cached `mobile_theme` JSON, if any.
  Future<Object?> readCachedRemote();

  /// Caches the `mobile_theme` JSON.
  Future<void> writeCachedRemote(Object? json);
}

/// shared_preferences-backed store.
class SharedPrefsThemeStore implements ThemePreferenceStore {
  /// Creates a store over `prefs`.
  SharedPrefsThemeStore(this._prefs);

  static const _prefKey = 'theme.preference.v1';
  static const _remoteKey = 'theme.remote.v1';

  final SharedPreferencesAsync _prefs;

  @override
  Future<ThemePreference> readPreference() async {
    final raw = await _prefs.getString(_prefKey);
    if (raw == null) return ThemePreference.none;
    try {
      return ThemePreference.fromJson(jsonDecode(raw));
    } on FormatException {
      return ThemePreference.none;
    }
  }

  @override
  Future<void> writePreference(ThemePreference pref) =>
      _prefs.setString(_prefKey, jsonEncode(pref.toJson()));

  @override
  Future<Object?> readCachedRemote() async {
    final raw = await _prefs.getString(_remoteKey);
    if (raw == null) return null;
    try {
      return jsonDecode(raw);
    } on FormatException {
      return null;
    }
  }

  @override
  Future<void> writeCachedRemote(Object? json) => json == null
      ? _prefs.remove(_remoteKey)
      : _prefs.setString(_remoteKey, jsonEncode(json));
}

/// In-memory store for tests and the widgetbook.
class InMemoryThemeStore implements ThemePreferenceStore {
  /// Creates a store with optional seed values.
  InMemoryThemeStore({this.pref = ThemePreference.none, this.remote});

  /// Current preference.
  ThemePreference pref;

  /// Current cached policy.
  Object? remote;

  @override
  Future<ThemePreference> readPreference() async => pref;

  @override
  Future<void> writePreference(ThemePreference pref) async => this.pref = pref;

  @override
  Future<Object?> readCachedRemote() async => remote;

  @override
  Future<void> writeCachedRemote(Object? json) async => remote = json;
}
