// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CachedDraft _$CachedDraftFromJson(Map<String, dynamic> json) => _CachedDraft(
  draft: FormDraft.fromJson(json['draft'] as Map<String, dynamic>),
  baseUpdatedAt: json['baseUpdatedAt'] as String,
  savedAt: json['savedAt'] as String,
  dirtySteps:
      (json['dirtySteps'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const <int>[],
);

Map<String, dynamic> _$CachedDraftToJson(_CachedDraft instance) =>
    <String, dynamic>{
      'draft': instance.draft.toJson(),
      'baseUpdatedAt': instance.baseUpdatedAt,
      'savedAt': instance.savedAt,
      'dirtySteps': instance.dirtySteps,
    };
