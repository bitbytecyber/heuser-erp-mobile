# env/

One JSON file per flavor, passed with `--dart-define-from-file=env/<flavor>.json`
to `flutter run`, `shorebird release` and `shorebird patch` alike (see
`Makefile`, `codemagic.yaml`, `scripts/shorebird-patch.sh`). Keeping a single
source stops a patch from being built with different defines than its release.

Only **public** client-side values belong here (OAuth *client* IDs, hosts).
Secrets never do; they live in Codemagic groups / your keychain.

| Key | Meaning |
|---|---|
| `FLAVOR` | `dev` \| `staging` \| `prod`; selects `AppEnv` at startup |
| `APP_NAME` | launcher label |
| `API_BASE_URL` | Django origin, no trailing slash (`/api/v1/` and `/_allauth/app/v1/` are appended) |
| `WS_BASE_URL` | Channels origin for `ws/notifications/` (dev runs daphne on a separate port) |
| `GOOGLE_WEB_CLIENT_ID` | the **web** OAuth client id, passed as `serverClientId` so Google returns an `id_token` the backend accepts |
| `APPLE_CLIENT_ID` | the iOS bundle id (must be listed in backend `APPLE_OAUTH_CLIENT_ID`) |
| `APP_STORE_ID` | numeric App Store id for the update prompt |
