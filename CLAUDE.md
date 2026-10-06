# heuser-erp-mobile

Flutter app for Heuser College: the **applicant portal** (sign-up, 3-step
admission form, documents, interview, trials, offer, payments), notifications
and profile. Backend is `../heuser-erp-backend` (Django + django-allauth
headless); the web portal it mirrors is `../heuser-erp-frontend/app/apply`.

Read before changing anything: `ARCHITECTURE.md` (layers, bootstrap, auth,
autosave), `DESIGN.md` (tokens, presets, components), `RELEASE.md` (flavors,
Codemagic, Shorebird). The rules in `.claude/rules/*.md` are mandatory and
checked by CI scripts; the skills in `.claude/skills/` are the way to add a
component, feature or endpoint.

## Commands

```sh
make setup                # once per clone: git hooks + pub get everywhere
make run FLAVOR=dev       # flutter run --flavor dev -t lib/main_dev.dart --dart-define-from-file=env/dev.json
make gen                  # slang + build_runner (freezed, json, injectable, go_router) + widgetbook
make check                # format + analyze (fatal infos/warnings) + tests + codegen/imports/goldens/coverage gates
make goldens              # DS goldens; make update-goldens after an intentional visual change
make widgetbook           # component catalogue in Chrome
```

Flutter is pinned to `.fvmrc` (3.47.1) in `pubspec.yaml`, `codemagic.yaml` and every
`shorebird --flutter-version`. Bump all of them in one commit.

## Layout

```
lib/app/        root widget, bootstrap sequence, router + shells, theme cubit, DI modules
lib/core/       env, network (dio + interceptors + Failure/Result), auth token store, storage,
                connectivity, observability, push, realtime, updater, i18n, format, utils
lib/features/<feature>/{data,domain,presentation}
packages/heuser_ds/   the design system (tokens, presets, H* components) — the ONLY place that
                      imports Material/Cupertino (as an invisible engine, see theme-rules)
apps/widgetbook/      catalogue of every DS component × preset × brightness
env/<flavor>.json     compile-time defines (public values only)
```

## Non-negotiables (details in `.claude/rules/`)

- **Theme:** no hard-coded `Color`, `TextStyle`, `EdgeInsets`, `BorderRadius`, `Duration` in
  app code. Everything comes from `context.h` tokens and `H*` components. Material imports
  only inside `packages/heuser_ds` (bridge/components/foundation) and `lib/app/app.dart`.
- **Layers:** widget → bloc → repository (abstract, domain) → api (Dio). Only `*_api.dart`
  touches Dio. Every call returns `Result<T>` (`Either<Failure, T>`); never throw across layers.
- **Blocs** are created per route in a `BlocProvider`, never registered in GetIt. Events and
  states are freezed sealed classes. Navigation happens in `BlocListener`, never in `build`.
- **Networking:** Dio keeps its default `validateStatus` (4xx throws) and every call goes
  through `safeCall`. Paths are constants in the feature's `*_api.dart` with Django's trailing
  slash. Never retry after a 401/403. Interceptor order in `network_module.dart` is load-bearing.
- **Files stay under 300 lines** (pre-commit enforces). Split by responsibility, not by line count.
- **Generated code is committed** (`*.g.dart`, `*.freezed.dart`, `*.config.dart`,
  `strings.g.dart`); CI fails if it is stale. Never hand-edit it.
- **Strings** live in `lib/i18n/en.i18n.json` and are used as `t.feature.key`; no literals in UI.
- **Every DS component** ships with a Widgetbook use-case and a golden test, and a row in DESIGN.md.

## Backend contract cheat-sheet

- Auth: `/_allauth/app/v1/*` with `X-Session-Token` (no JWT). Login 401 may carry a pending
  flow (`verify_email`, `mfa_authenticate`, `login_by_code`). Token rotates in `meta.session_token`.
- Social: `POST /api/v1/auth/social/precheck/` → `known:false` → choice page →
  `POST /api/v1/auth/social/applicant/` → `POST /_allauth/app/v1/auth/provider/token`.
- Admissions: `/api/v1/intake/me/applications/…` (capability `adm_apply.use`); errors
  `400 {code, detail, details}`, `503 {code: "module_disabled"}`.
- Branding + theme policy: public `GET /api/v1/site-branding/` (`mobile_theme` block).

## Agent workflow

Use the skills: `ds-component`, `feature-scaffold`, `api-endpoint`, `verify`. Run `verify`
(or `make check`) before reporting any change as done. Ask the `heuser-flutter-reviewer`
agent to review a diff before merge.
