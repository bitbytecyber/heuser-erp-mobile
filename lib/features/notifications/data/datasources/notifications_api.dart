import 'package:dio/dio.dart';
import 'package:heuser_erp_mobile/core/network/envelope.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/core/network/safe_call.dart';
import 'package:heuser_erp_mobile/features/notifications/data/models/inbox_item.dart';

/// `/api/v1/notifications/…`: the inbox, unread count and push devices.
/// Responses come in the `{ok, data}` envelope.
class NotificationsApi {
  /// Creates the api.
  NotificationsApi(this._dio);

  final Dio _dio;

  /// `notifications/`
  static const inbox = 'api/v1/notifications/';

  /// `notifications/unread-count/`
  static const unreadCount = '${inbox}unread-count/';

  /// `notifications/mark-all-read/`
  static const markAllRead = '${inbox}mark-all-read/';

  /// `notifications/{id}/{action}/`
  static String action(int id, String action) => '$inbox$id/$action/';

  /// `notifications/devices/{gcm|apns}/{register|unregister}/`
  static String device(String platform, String op) =>
      '${inbox}devices/$platform/$op/';

  /// One page of the inbox (20 per page, newest first).
  Future<Result<InboxPage>> page(int page) => safeCall(() async {
    final r = await _dio.get<Map<String, dynamic>>(
      inbox,
      queryParameters: {'page': page},
    );
    final data = unwrapEnvelope(r.data);
    final results = data['results'];
    return InboxPage(
      items: [
        if (results is List)
          for (final e in results)
            if (e is Map) InboxItem.fromJson(Map<String, dynamic>.from(e)),
      ],
      hasMore: data['next'] != null,
      total: (data['count'] as num?)?.toInt() ?? 0,
    );
  });

  /// Unread notifications.
  Future<Result<int>> fetchUnreadCount() => safeCall(() async {
    final r = await _dio.get<Map<String, dynamic>>(unreadCount);
    return (unwrapEnvelope(r.data)['unread_count'] as num?)?.toInt() ?? 0;
  });

  /// Marks one as read.
  Future<Result<void>> markRead(int id) =>
      safeCall(() => _dio.post<dynamic>(action(id, 'mark-read')));

  /// Marks every one as read.
  Future<Result<void>> readAll() =>
      safeCall(() => _dio.post<dynamic>(markAllRead));

  /// Hides one from the inbox.
  Future<Result<void>> dismiss(int id) =>
      safeCall(() => _dio.post<dynamic>(action(id, 'dismiss')));

  /// Records that the family opened it.
  Future<Result<void>> click(int id) =>
      safeCall(() => _dio.post<dynamic>(action(id, 'click')));

  /// Registers this phone for push ([platform] `gcm` or `apns`).
  Future<Result<void>> registerDevice(
    String platform,
    String token, {
    String? deviceId,
  }) => safeCall(
    () => _dio.post<dynamic>(
      device(platform, 'register'),
      data: {'registration_id': token, 'device_id': ?deviceId},
    ),
  );

  /// Stops push to this phone.
  Future<Result<void>> unregisterDevice(String platform, String token) =>
      safeCall(
        () => _dio.post<dynamic>(
          device(platform, 'unregister'),
          data: {'registration_id': token},
        ),
      );
}
