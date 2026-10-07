// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inbox_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InboxItem _$InboxItemFromJson(Map<String, dynamic> json) => _InboxItem(
  id: (json['id'] as num).toInt(),
  categoryKey: json['category_key'] as String? ?? '',
  categoryLabel: json['category_label'] as String? ?? '',
  title: json['title'] as String? ?? '',
  body: json['body'] as String? ?? '',
  payload:
      json['payload'] as Map<String, dynamic>? ?? const <String, dynamic>{},
  priority: json['priority'] as String? ?? 'normal',
  isRead: json['is_read'] as bool? ?? false,
  isDismissed: json['is_dismissed'] as bool? ?? false,
  createdAt: json['created_at'] as String? ?? '',
);

Map<String, dynamic> _$InboxItemToJson(_InboxItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_key': instance.categoryKey,
      'category_label': instance.categoryLabel,
      'title': instance.title,
      'body': instance.body,
      'payload': instance.payload,
      'priority': instance.priority,
      'is_read': instance.isRead,
      'is_dismissed': instance.isDismissed,
      'created_at': instance.createdAt,
    };
