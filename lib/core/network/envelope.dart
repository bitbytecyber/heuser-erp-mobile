/// Unwraps the backend's `{ok, data, meta}` envelope. Endpoints that do not
/// use it are passed through unchanged.
Map<String, dynamic> unwrapEnvelope(Object? body) {
  if (body is! Map) return const {};
  final map = Map<String, dynamic>.from(body);
  final data = map['data'];
  if (map.containsKey('ok') && data is Map) {
    return Map<String, dynamic>.from(data);
  }
  return map;
}
