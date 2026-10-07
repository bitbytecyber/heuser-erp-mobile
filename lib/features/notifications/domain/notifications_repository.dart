import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/notifications/data/models/inbox_item.dart';

/// The inbox and the unread badge.
abstract interface class NotificationsRepository {
  /// One page, newest first (1-based).
  Future<Result<InboxPage>> page(int page);

  /// Unread notifications.
  Future<Result<int>> unreadCount();

  /// Marks one as read.
  Future<Result<void>> markRead(int id);

  /// Marks every one as read.
  Future<Result<void>> markAllRead();

  /// Hides one.
  Future<Result<void>> dismiss(int id);

  /// Records an open.
  Future<Result<void>> click(int id);
}
