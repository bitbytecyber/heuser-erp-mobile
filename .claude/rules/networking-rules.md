# Networking rules

Ported from the proven core of `sms-flutter` and then corrected; the pitfalls
below cost that app real outages. Do not re-learn them.

## Dio

- Dio keeps its **default `validateStatus`**: 4xx and 5xx throw
  `DioException`. Every call is wrapped in `safeCall(() => dio.get(...))`,
  which maps the exception to a `Failure` via `FailureMapper` and returns
  `Left(failure)`. Reading `response.statusCode` by hand is a smell.
- The one exception is the allauth datasource: it passes a per-request
  `Options(validateStatus: (s) => s != null && s < 500)` so 401-with-flows,
  409 and 410 bodies are read as data (`AllauthResponse`).
- `BackgroundTransformer` is on: JSON decodes off the UI isolate.
- Interceptor order in `app/di/modules/network_module.dart` is load-bearing:
  `SessionTokenInterceptor → TruncatingLogInterceptor (debug) →
  TransientRetryInterceptor → NetworkErrorInterceptor`. Do not reorder.

## Session token

- Header `X-Session-Token`; stored in `SessionTokenStore` (secure storage +
  in-memory cache). The interceptor harvests a rotated token from **any**
  response's `meta.session_token`.
- A 401 (non-allauth), or a 403 whose body says `UNAUTHENTICATED`, counts as
  a dead session **only if the token the request carried equals the token
  held now**. A stale rejection from a previous session is inert.
- 403 with any other body is a capability denial on a live session: show it,
  never sign out.
- Requests to `/_allauth/*` are skipped by the rejection logic (a failed login
  is a 401 too).
- **Never retry or fall back after a 401/403.** A second unauthenticated hit
  can clear the server session.

## Retries

`TransientRetryInterceptor` retries **GET only**, on transport failures only
(timeouts, connection errors), with 1 s then 2 s backoff, and not while the
device is known to be offline. Writes are never auto-retried; the form bloc's
autosave queue re-sends on reconnect because it owns the semantics.

## Paths and payloads

- Paths are `static const` on the feature's `*_api.dart`, relative to
  `AppEnv.apiV1` or `AppEnv.allauthApp`, and end with `/` (Django redirects
  drop the method otherwise).
- Multipart uploads use the helpers in `core/network/multipart.dart`;
  `sendTimeout` is 60 s. Photos are compressed before upload.
- Admissions errors are `400 {code, detail, details}` → `Failure.validation`;
  `503 {code: "module_disabled"}` → `Failure.moduleDisabled`.
- The user-facing message for a `Failure` comes from `failureMessage(f)` in
  `core/i18n/failure_messages.dart` (slang keys), never from the server body
  except for `Failure.validation.message`.

## WebSocket

`core/realtime/notifications_socket.dart` connects to
`AppEnv.notificationsSocket` with an explicit `Origin: <API origin>` header
(Channels rejects a missing Origin) and the subprotocol
`x-session-token, <token>`. Exponential backoff with jitter, closes on
sign-out, never reconnects after a 4401.
