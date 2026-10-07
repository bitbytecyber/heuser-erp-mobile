import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// The django-allauth **app client** session token.
///
/// Login returns it as `meta.session_token`; every later request carries it
/// in `X-Session-Token`. It is the credential, so it lives in secure storage.
/// Reads are served from memory after the first hit so the interceptor never
/// waits on disk in the request path.
class SessionTokenStore {
  /// Creates a store; [storage] is injectable for tests.
  SessionTokenStore({FlutterSecureStorage? storage})
    : _storage = storage ?? const FlutterSecureStorage();

  static const String _key = 'allauth_session_token';

  final FlutterSecureStorage _storage;
  String? _cached;
  bool _loaded = false;

  /// The token if already in memory, without touching disk. `null` means
  /// "not loaded yet" as well as "no token"; call [read] when it matters.
  String? get cachedToken => _cached;

  /// Reads (and caches) the token.
  Future<String?> read() async {
    if (_loaded) return _cached;
    String? stored;
    try {
      stored = await _storage.read(key: _key);
    } on Object catch (_) {
      // Keystore unavailable (rare: a device in a broken lock state).
    }
    // A write or clear that landed while the disk read was in flight is
    // newer than what the disk returned: keep it.
    if (!_loaded) {
      _cached = stored;
      _loaded = true;
    }
    return _cached;
  }

  /// Stores a new token. The in-memory copy updates synchronously so the next
  /// request already carries it.
  Future<void> write(String token) async {
    final trimmed = token.trim();
    if (trimmed.isEmpty || trimmed == _cached) return;
    _cached = trimmed;
    _loaded = true;
    try {
      await _storage.write(key: _key, value: trimmed);
    } on Object catch (_) {
      // Keystore unavailable: the session still works for this process.
    }
  }

  /// Drops the token.
  Future<void> clear() async {
    _cached = null;
    _loaded = true;
    try {
      await _storage.delete(key: _key);
    } on Object catch (_) {
      // The in-memory copy is already gone.
    }
  }
}
