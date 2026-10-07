# Architecture

How the app is put together, in the order things happen. The rules behind the
choices are in `.claude/rules/*.md`; this document explains the moving parts.

## 1. Layers

```
presentation   pages, widgets, blocs/cubits          (lib/features/*/presentation, lib/app)
domain         entities, abstract repositories, pure rules   (lib/features/*/domain)
data           Dio apis, DTOs, repository impls, caches      (lib/features/*/data)
core           env, network, auth token, connectivity, storage, format, i18n (lib/core)
heuser_ds      tokens, presets, H* components (packages/heuser_ds)
```

Dependencies point downwards only. A widget talks to a bloc; a bloc talks to
an abstract repository; a repository talks to an api; only an api touches
`Dio`. Every async boundary returns `Result<T>` (`Either<Failure, T>`).

The intake payloads are the contract shared with the web portal, so their
freezed DTOs (`features/applications/data/models`) are used directly by blocs
and widgets. App-side domain types exist only where the app adds logic:
`FormDraft`, `FormError`, `DocRow`, `CachedDraft`, `Failure`, `PendingFlow`.

## 2. Bootstrap

`lib/main_<flavor>.dart` → `bootstrap(flavor)`:

1. `WidgetsFlutterBinding` + `FlutterNativeSplash.preserve()`.
2. `AppEnv.fromDefines()` reads `--dart-define-from-file=env/<flavor>.json`.
3. `configureDependencies(env)` registers `AppEnv` by hand, then injectable
   builds the graph from `app/di/modules/core_module.dart` (Dio with its
   interceptors, token store, connectivity, apis, repositories, caches).
4. `ConnectivityService.initialize()`, user agent, `runApp(HeuserApp)`.

`HeuserApp` (`app/app.dart`) owns the root blocs: `ThemeCubit` (branding
cache → remote `mobile_theme` → user preference) and `AuthBloc` (`started`
restores the session with a 6 s budget). The native splash is removed on the
first non-`unknown` auth state; `GoRouter.redirect` is the pure
`authRedirect(state, location)` so every route change re-checks the session.

## 3. Networking

One `Dio` from `DioFactory`. Interceptor order is load-bearing:

```
SessionTokenInterceptor → TruncatingLogInterceptor (debug) →
TransientRetryInterceptor (GET + transport errors only) → NetworkErrorInterceptor
```

Dio keeps the default `validateStatus`; `safeCall()` turns any
`DioException` into a `Failure` via `FailureMapper` (admissions
`{code, detail, details}` → `Failure.validation` with `missing`; `503
module_disabled` → `Failure.moduleDisabled`). The allauth datasource is the
only caller reading 401/409/410 bodies as data.

A `/api/v1` 401, or a 403 whose body says `UNAUTHENTICATED`, is a dead
session only when the token the request carried equals the current token
(`AuthSignals.onSessionRejected`). Nothing is retried after a 401/403.

## 4. Auth state machine

`AuthRepositoryImpl` is split into parts: `_AuthTransitions` (a lock and the
credential-swap window so a rotated token never races a request),
`_SocialFlows` (Google / Apple → precheck → applicant signup → provider
token) and `_AccountFlows` (login, signup, codes, passwords). It emits
`SessionEvent`s; `AuthBloc` folds them into

```
unknown → unauthenticated(reason) | pending(flow, email) | authenticated(user, abilities, portal, fromSnapshot)
```

`Abilities.portal` (`adm_apply.use` → applicant, `dashboard.view_student` →
student) picks the shell. A session snapshot (`SessionSnapshotStore`) lets a
cold start work offline; abilities refresh on resume after 10 minutes.

Per-page auth actions run in an `AuthActionCubit` (idle / busy / failed /
needsChoice / done) created by the route.

## 5. Routing and shells

`app/router/routes.dart` (+ `routes_applicant.dart`, both parts of one
library) declares typed go_router routes. The applicant portal is a
`StatefulShellRoute` with three branches (Applications, Notifications,
Profile); `ApplicantShellRoute.builder` provides the shell-scoped
`ApplicationsBloc` so the list and the nested `/apply/:id` page share it.
Blocs are created in route builders, never registered in GetIt.

## 6. The application form (autosave)

`ApplicationFormBloc` (`features/application_form/presentation/bloc`) mirrors
`components/apply/application-form.tsx`:

- `draftChanged(update)` applies a pure `FormDraft → FormDraft` update, marks
  the current step dirty, mirrors the draft to the per-user `DraftStore`
  (JSON file) and restarts a 900 ms debounce.
- `_SaveQueue` serialises every `PATCH step/{n}/` through one promise chain,
  in ascending dirty-step order, whichever handler asks (debounce, step
  change, Continue, Finish later, Send). The payload is built when the
  request runs, so it always carries the latest draft. New result rows get
  their server ids back (`_reconcileResults`) so later saves update in place.
- A connectivity failure keeps the step dirty and shows `SaveStatus.offline`;
  `connectivityChanged(online: true)` flushes. Other failures surface as a
  `FormNotice.saveFailed` for the page to toast.
- `continuePressed` runs `validateStep` (pure, `domain/form_validation.dart`)
  and only then saves; the server's `missing` list becomes field errors via
  `serverMissing`. `submitPressed` checks 80–300 words and the declaration,
  saves step 3, then `POST submit/`; a `missing_fields` error jumps to the
  first offending step (`FormFieldKeys.firstStep`).
- On open, a cached draft whose `baseUpdatedAt` equals the server
  `updated_at` and has dirty steps is offered as "Resume unsaved changes?";
  an older cache is dropped.

Pages never hold form logic: each block widget takes the draft and calls
`context.patch` / `context.patchField` (`widgets/form_scope.dart`). Error
copy is resolved in `formErrorText` from slang keys.

Documents (`features/documents`) share one `DocumentsCubit` per
application: uploads, "later" and removals return the fresh `Application`,
which the page feeds back into the form bloc. `buildDocRows` is a line-for-
line port of the web's `documents-list.tsx`.

## 7. Theme

`packages/heuser_ds` is the only place that imports Material. `HThemeData`
(tokens + colour scheme) is resolved by `theme_resolver.dart`:
remote policy (`mobile_theme`) → user preference (only if
`allow_user_override`) → system brightness. Presets are registered in
`preset_registry.dart`; the backend's `BUILTIN_MOBILE_PRESETS` must list the
same ids.

## 8. Testing

`test/` mirrors `lib/`. Pure rules (validation, payloads, doc rows, masks)
are unit-tested against the web test cases; blocs with `bloc_test` +
mocktail fakes of the abstract repositories, and `fakeAsync` for the
debounce; DS components with alchemist goldens across presets × brightness.
`make check` runs what CI runs.
