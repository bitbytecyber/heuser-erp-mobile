# Architecture rules

## Layers (one direction only)

```
presentation (pages, widgets, blocs)
    ↓ depends on
domain (entities, abstract repositories, pure rules)
    ↑ implemented by
data (api clients, DTOs, repository impls, caches)
```

- A **page/widget** reads state from a bloc and dispatches events. It never
  calls a repository or api directly and never holds business rules.
- A **bloc** depends on an *abstract* repository from `domain/`. It never
  imports Dio, DTO parsing, or another feature's data layer.
- A **repository impl** (`data/repositories/`) orchestrates one or more
  `*_api.dart` classes, maps DTOs, owns caching and in-flight deduplication,
  and returns `Result<T>`.
- An **api** (`data/datasources/*_api.dart`) is the only thing that touches
  `Dio`. Paths are `static const` on the class, with Django's trailing slash.

## Feature-first

`lib/features/<feature>/{data,domain,presentation}`. Shared, feature-agnostic
code goes to `lib/core/`; app wiring (router, DI, theme bootstrap) to
`lib/app/`. A feature may depend on `core/` and on another feature's
`domain/` only.

## DTO vs entity

The intake API payloads **are** the contract shared with the web portal, so
their freezed DTOs in `data/models/` are used directly by blocs and widgets.
Separate domain types exist only where the app adds logic: `FormDraft`,
`DocRow`, `TodoTask`, `Failure`, `PendingFlow`. Do not add a mapping layer
"for purity".

## Result everywhere

Every async boundary returns `Future<Result<T>>` (`Either<Failure, T>` from
fpdart). Throwing across a layer is a bug. `Failure` is the sealed class in
`core/network/failure.dart`; user-facing copy for a failure lives in slang
keys, not on the failure itself.

## Dependency injection

- `get_it` + `injectable`; `configureDependencies()` in `app/di/injection.dart`.
- Register repositories, apis, stores, services. **Never register a bloc**:
  blocs are created in the route (`BlocProvider(create: …)`) so their lifetime
  equals the screen's.
- Widgets never call `getIt<…>()`. They read blocs via `context.read` and the
  route obtains dependencies through injectable factories.

## Files

- Under 300 lines, enforced by the pre-commit hook. A form step page is a
  composition of block widgets, each in its own file taking
  `(draft, errors, onPatch)`.
- Generated files are committed and never edited by hand.
- One public type per file unless they are trivially coupled (event + state
  live in `part` files of the bloc).

## Portals

`PortalShellSpec` makes a portal a data object (branches + routes). The
applicant shell is the first; the enrolled-student shell (phase 2) must be
added by writing a spec, not by special-casing the router.
