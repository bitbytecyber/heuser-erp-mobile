import 'dart:convert';

import 'package:heuser_erp_mobile/features/auth/domain/auth_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// What the last successful session knew: the user and the abilities
/// payload. A **UI hint for offline cold starts, never authorization**: the
/// server re-checks every capability on every request.
class SessionSnapshot {
  /// Creates a snapshot.
  const SessionSnapshot({
    required this.user,
    required this.abilities,
    required this.savedAt,
  });

  /// The user.
  final AuthUser user;

  /// Raw `GET /me/abilities/` JSON.
  final Map<String, dynamic>? abilities;

  /// When it was written.
  final DateTime savedAt;
}

/// Persists [SessionSnapshot] in shared preferences.
class SessionSnapshotStore {
  /// Creates the store.
  SessionSnapshotStore(this._prefs);

  static const _key = 'session.snapshot.v1';
  final SharedPreferencesAsync _prefs;

  /// Reads the snapshot, or `null` when absent or unreadable.
  Future<SessionSnapshot?> read() async {
    final raw = await _prefs.getString(_key);
    if (raw == null) return null;
    try {
      final json = jsonDecode(raw);
      if (json is! Map) return null;
      final user = json['user'];
      final abilities = json['abilities'];
      return SessionSnapshot(
        user: AuthUser.fromJson(Map<String, dynamic>.from(user as Map)),
        abilities: abilities is Map
            ? Map<String, dynamic>.from(abilities)
            : null,
        savedAt:
            DateTime.tryParse(json['saved_at']?.toString() ?? '') ??
            DateTime.fromMillisecondsSinceEpoch(0),
      );
    } on Object catch (_) {
      return null;
    }
  }

  /// Writes the snapshot.
  Future<void> write({
    required AuthUser user,
    Map<String, dynamic>? abilities,
  }) => _prefs.setString(
    _key,
    jsonEncode({
      'user': user.toJson(),
      'abilities': abilities,
      'saved_at': DateTime.now().toIso8601String(),
    }),
  );

  /// Drops the snapshot.
  Future<void> clear() => _prefs.remove(_key);
}
