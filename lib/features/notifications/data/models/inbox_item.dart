import 'package:freezed_annotation/freezed_annotation.dart';

part 'inbox_item.freezed.dart';
part 'inbox_item.g.dart';

/// One notification in the inbox (`NotificationInboxSerializer`).
@freezed
abstract class InboxItem with _$InboxItem {
  /// Creates an item.
  const factory InboxItem({
    required int id,
    @JsonKey(name: 'category_key') @Default('') String categoryKey,
    @JsonKey(name: 'category_label') @Default('') String categoryLabel,
    @Default('') String title,
    @Default('') String body,
    @Default(<String, dynamic>{}) Map<String, dynamic> payload,
    @Default('normal') String priority,
    @JsonKey(name: 'is_read') @Default(false) bool isRead,
    @JsonKey(name: 'is_dismissed') @Default(false) bool isDismissed,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
  }) = _InboxItem;
  const InboxItem._();

  /// From JSON.
  factory InboxItem.fromJson(Map<String, dynamic> json) =>
      _$InboxItemFromJson(json);

  /// The deep link the notification carries (`payload.link`), or `''`.
  String get link => (payload['link'] ?? '').toString();

  /// Parsed `created_at`.
  DateTime? get createdAtTime => DateTime.tryParse(createdAt)?.toLocal();
}

/// One page of the inbox.
class InboxPage {
  /// Creates a page.
  const InboxPage({
    required this.items,
    required this.hasMore,
    required this.total,
  });

  /// Items on the page.
  final List<InboxItem> items;

  /// A next page exists.
  final bool hasMore;

  /// All items.
  final int total;
}
