import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/notifications/data/datasources/notifications_api.dart';
import 'package:heuser_erp_mobile/features/notifications/data/models/inbox_item.dart';
import 'package:heuser_erp_mobile/features/notifications/domain/notifications_repository.dart';

/// [NotificationsRepository] over [NotificationsApi].
class NotificationsRepositoryImpl implements NotificationsRepository {
  /// Creates the repository.
  NotificationsRepositoryImpl(this._api);

  final NotificationsApi _api;

  @override
  Future<Result<InboxPage>> page(int page) => _api.page(page);

  @override
  Future<Result<int>> unreadCount() => _api.fetchUnreadCount();

  @override
  Future<Result<void>> markRead(int id) => _api.markRead(id);

  @override
  Future<Result<void>> markAllRead() => _api.readAll();

  @override
  Future<Result<void>> dismiss(int id) => _api.dismiss(id);

  @override
  Future<Result<void>> click(int id) => _api.click(id);
}
