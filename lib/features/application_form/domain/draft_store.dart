import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_draft.dart';

part 'draft_store.freezed.dart';
part 'draft_store.g.dart';

/// A draft kept on the device because it has not reached the server yet
/// (offline, app killed mid-edit). [baseUpdatedAt] is the server
/// `updated_at` the edits were made on top of: a newer copy on the server
/// means the office or another device changed it, and the cache is dropped.
@freezed
abstract class CachedDraft with _$CachedDraft {
  /// Creates a cached draft.
  const factory CachedDraft({
    required FormDraft draft,
    required String baseUpdatedAt,
    required String savedAt,
    @Default(<int>[]) List<int> dirtySteps,
  }) = _CachedDraft;

  /// From JSON.
  factory CachedDraft.fromJson(Map<String, dynamic> json) =>
      _$CachedDraftFromJson(json);
}

/// Per-application draft cache. Keys are the application id; the store is
/// scoped to the signed-in account by its implementation.
abstract interface class DraftStore {
  /// The cached draft for [applicationId], if any.
  Future<CachedDraft?> read(int applicationId);

  /// Saves [draft] for [applicationId].
  Future<void> write(int applicationId, CachedDraft draft);

  /// Removes the cached draft for [applicationId].
  Future<void> clear(int applicationId);
}
