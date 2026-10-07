import 'package:heuser_erp_mobile/core/storage/json_file_cache.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/draft_store.dart';

/// [DraftStore] on a [JsonFileCache], one file per `<user>_<application>`.
/// The user id scopes the cache so a second account on the same phone
/// never sees another applicant's draft; `clearAll` runs on sign-out.
class FileDraftStore implements DraftStore {
  /// Creates the store for [userId].
  FileDraftStore(this._cache, {required this.userId});

  final JsonFileCache _cache;

  /// Account the drafts belong to.
  final int userId;

  String _key(int applicationId) => 'u${userId}_a$applicationId';

  @override
  Future<CachedDraft?> read(int applicationId) async {
    final json = await _cache.read(_key(applicationId));
    if (json == null) return null;
    try {
      return CachedDraft.fromJson(json);
    } on Object catch (_) {
      // A draft written by an older app version: not worth resuming.
      await _cache.remove(_key(applicationId));
      return null;
    }
  }

  @override
  Future<void> write(int applicationId, CachedDraft draft) =>
      _cache.write(_key(applicationId), draft.toJson());

  @override
  Future<void> clear(int applicationId) => _cache.remove(_key(applicationId));
}

/// Keeps drafts in memory (tests, and the widgetbook).
class InMemoryDraftStore implements DraftStore {
  final _items = <int, CachedDraft>{};

  @override
  Future<CachedDraft?> read(int applicationId) async => _items[applicationId];

  @override
  Future<void> write(int applicationId, CachedDraft draft) async =>
      _items[applicationId] = draft;

  @override
  Future<void> clear(int applicationId) async => _items.remove(applicationId);
}
