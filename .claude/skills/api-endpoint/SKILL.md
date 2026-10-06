---
name: api-endpoint
description: Wire a backend endpoint through the layers — DTO, api method with safeCall, repository mapping to Result, bloc usage, and tests. Use when adding or changing an API call, parsing a response, or debugging a 401/403/400 from the Django backend.
---

# Adding an endpoint

1. **Find the contract** in `../heuser-erp-backend` (view/serializer) or
   `../heuser-erp-frontend/lib/api/endpoints/*.ts`. Capture a real response as
   `test/fixtures/<feature>/<name>.json`.
2. **DTO**: `data/models/<name>_dto.dart` with `@freezed` + `@JsonSerializable(fieldRename: FieldRename.snake)`;
   nullable where the backend may omit; no defaults that hide server changes.
3. **Api method** in `data/datasources/<feature>_api.dart`:
   ```dart
   static const _apps = 'intake/me/applications/';
   Future<Result<Application>> fetch(int id) => safeCall(() async {
     final r = await _dio.get<Map<String, dynamic>>('$_apps$id/');
     return ApplicationDto.fromJson(r.data!);
   });
   ```
   Paths end with `/`. Multipart via `core/network/multipart.dart`.
   Allauth endpoints use `_allauthDio` with the per-request `validateStatus < 500`.
4. **Repository**: expose the method on the abstract repo; the impl adds caching
   or dedupe only if the call is read-heavy.
5. **Failures**: `400 {code, detail, details}` arrives as `Failure.validation`;
   map `details`/`missing` to field keys in the domain, not in the widget.
6. **Tests**: api test asserting method + path + body against a mock adapter and
   parsing the fixture; repository test for cache behaviour; bloc test for the
   success and each failure branch.
7. `make gen && make check`.

Traps: never check `statusCode` by hand (4xx throws into `safeCall`); never
retry after 401/403; a 403 with a non-UNAUTHENTICATED body is a capability
denial, show it.
