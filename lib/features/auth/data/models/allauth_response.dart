import 'package:heuser_erp_mobile/features/auth/domain/auth_user.dart';
import 'package:heuser_erp_mobile/features/auth/domain/pending_flow.dart';

/// A parsed django-allauth headless envelope: `{status, data, meta, errors}`.
///
/// The datasource reads every `< 500` status as data (allauth answers 401 for
/// pending flows, 409 for "already logged in", 410 for "session gone"), so
/// this type is where those meanings live.
class AllauthResponse {
  /// Parses [json] with the HTTP [statusCode].
  AllauthResponse(this.statusCode, Map<String, dynamic>? json)
    : _json = json ?? const {};

  /// HTTP status.
  final int statusCode;
  final Map<String, dynamic> _json;

  Map<String, dynamic>? get _data => _json['data'] is Map
      ? Map<String, dynamic>.from(_json['data'] as Map)
      : null;
  Map<String, dynamic>? get _meta => _json['meta'] is Map
      ? Map<String, dynamic>.from(_json['meta'] as Map)
      : null;
  List<dynamic> get _errors =>
      _json['errors'] is List ? _json['errors'] as List : const [];

  /// `meta.is_authenticated`.
  bool get isAuthenticated => _meta?['is_authenticated'] == true;

  /// `meta.session_token`, when carried.
  String? get sessionToken {
    final t = _meta?['session_token'];
    if (t is! String || t.trim().isEmpty) return null;
    return t.trim();
  }

  /// `data.user`, when carried.
  AuthUser? get user {
    final u = _data?['user'];
    if (u is! Map) return null;
    try {
      return AuthUser.fromJson(Map<String, dynamic>.from(u));
    } on Object catch (_) {
      return null;
    }
  }

  /// `data.flows`.
  List<Map<String, dynamic>> get flows {
    final raw = _data?['flows'];
    if (raw is! List) return const [];
    return raw
        .whereType<Map<dynamic, dynamic>>()
        .map(Map<String, dynamic>.from)
        .toList();
  }

  /// The pending flow, if any.
  PendingFlow? get pendingFlow {
    for (final f in flows) {
      if (f['is_pending'] == true) {
        final types = f['types'];
        return PendingFlow.fromId(
          f['id']?.toString() ?? '',
          types: types is List
              ? types.map((t) => t.toString()).toList()
              : const [],
        );
      }
    }
    return null;
  }

  /// A step is pending.
  bool get hasPendingFlow => pendingFlow != null;

  /// 2xx.
  bool get isOk => statusCode >= 200 && statusCode < 300;

  /// 401 without `is_authenticated`: not signed in.
  bool get isUnauthenticated => statusCode == 401 && !isAuthenticated;

  /// 401 **with** `is_authenticated`: alive session, action needs re-auth.
  bool get requiresReauthentication => statusCode == 401 && isAuthenticated;

  /// 409: already logged in (we still sent a live token).
  bool get isConflict => statusCode == 409;

  /// 410: session gone, drop the token.
  bool get sessionGone => statusCode == 410;

  /// 429.
  bool get isRateLimited => statusCode == 429;

  /// First error message.
  String? get errorMessage {
    if (_errors.isEmpty) return null;
    final first = _errors.first;
    if (first is Map && first['message'] != null) {
      return first['message'].toString();
    }
    return first.toString();
  }

  /// First error code.
  String? get errorCode {
    if (_errors.isEmpty) return null;
    final first = _errors.first;
    return first is Map ? first['code']?.toString() : null;
  }

  /// Per-field messages keyed by `param`.
  Map<String, String> get fieldErrors {
    final out = <String, String>{};
    for (final e in _errors) {
      if (e is! Map) continue;
      final param = e['param']?.toString();
      final message = e['message']?.toString();
      if (param == null || param.isEmpty || message == null) continue;
      out.putIfAbsent(param, () => message);
    }
    return out;
  }
}
