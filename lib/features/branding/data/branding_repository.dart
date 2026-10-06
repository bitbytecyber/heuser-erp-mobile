import 'dart:async';
import 'dart:convert';

import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/branding/data/site_branding_api.dart';
import 'package:heuser_erp_mobile/features/branding/domain/site_branding.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Site branding with a disk cache, so the first frame already carries the
/// college's name and theme policy. [refresh] is called at start (with a
/// short budget), on resume and after sign-in; listeners (the theme cubit)
/// react to [stream].
class BrandingRepository {
  /// Creates the repository.
  BrandingRepository(this._api, this._prefs);

  static const _key = 'branding.site.v1';
  static const _ttl = Duration(minutes: 10);

  final SiteBrandingApi _api;
  final SharedPreferencesAsync _prefs;
  final _controller = StreamController<SiteBranding>.broadcast();
  SiteBranding _current = SiteBranding.fallback;
  DateTime? _fetchedAt;
  Future<void>? _inFlight;

  /// The branding in effect.
  SiteBranding get current => _current;

  /// Emits whenever [current] changes.
  Stream<SiteBranding> get stream => _controller.stream;

  /// Loads the cached branding (no network).
  Future<SiteBranding> loadCached() async {
    final raw = await _prefs.getString(_key);
    if (raw != null) {
      try {
        final json = jsonDecode(raw);
        if (json is Map) {
          _set(SiteBranding.fromJson(Map<String, dynamic>.from(json)));
        }
      } on Object catch (_) {
        // Corrupt cache: keep the fallback.
      }
    }
    return _current;
  }

  /// Fetches from the backend unless fetched less than `_ttl` ago (or [force]).
  /// De-duplicates concurrent calls. Never throws.
  Future<Result<SiteBranding>> refresh({
    Duration? budget,
    bool force = false,
  }) async {
    if (!force &&
        _fetchedAt != null &&
        DateTime.now().difference(_fetchedAt!) < _ttl) {
      return ok(_current);
    }
    if (_inFlight != null) {
      await _inFlight;
      return ok(_current);
    }
    final completer = Completer<void>();
    _inFlight = completer.future;
    try {
      final result = await _api.fetch(timeout: budget);
      result.fold((_) {}, (b) {
        _fetchedAt = DateTime.now();
        _set(b);
        unawaited(_prefs.setString(_key, jsonEncode(b.toJson())));
      });
      return result;
    } finally {
      completer.complete();
      _inFlight = null;
    }
  }

  void _set(SiteBranding b) {
    _current = b;
    if (!_controller.isClosed) _controller.add(b);
  }

  /// Releases the stream.
  Future<void> dispose() => _controller.close();
}
