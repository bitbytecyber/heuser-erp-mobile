---
name: feature-scaffold
description: Scaffold or extend a feature in lib/features end to end — domain repository, data impl + api, freezed bloc, typed go_router route, DI registration, tests. Use when adding a new screen, tab, flow or feature module.
---

# Scaffolding a feature

```
lib/features/<feature>/
  domain/      <entity>.dart (freezed) · <feature>_repository.dart (abstract, returns Result<T>) · pure rules
  data/        datasources/<feature>_api.dart (Dio, @lazySingleton) · models/*_dto.dart (freezed+json)
               repositories/<feature>_repository_impl.dart (@LazySingleton(as: <Feature>Repository))
  presentation/ bloc/<feature>_bloc.dart (+ _event.dart/_state.dart parts, freezed sealed)
               pages/<feature>_page.dart · widgets/*
```

Steps:
1. Domain first: entity + abstract repository method signatures. Write the pure
   rules as functions with unit tests against fixtures.
2. Data: api class with `static const` paths (trailing slash), every call via
   `safeCall`; DTOs with `@freezed` + `@JsonSerializable`; repository impl with
   caching/in-flight dedupe where lists are involved.
3. Bloc: `@freezed sealed class <Feature>Event/State`; constructor takes the
   abstract repo; choose `bloc_concurrency` transformers deliberately; cancel
   subscriptions in `close()`.
4. Route: add a typed route in `lib/app/router/routes.dart`
   (`@TypedGoRoute<…>`), with `BlocProvider(create: (_) => <Feature>Bloc(getIt())..add(const Started()))`
   wrapping the page. Shell branches live in `lib/app/router/shells/`.
5. Page: `HScaffold`/`HAppBar`, `BlocBuilder` for content, `BlocListener` for
   navigation/toasts, `HSkeleton` while loading, `FailureView` with retry on error.
6. Strings in `lib/i18n/en.i18n.json` under `<feature>.*`; run `dart run slang`.
7. `make gen`, then tests: `bloc_test` for every handler, widget test for the page.
8. `make check`.
