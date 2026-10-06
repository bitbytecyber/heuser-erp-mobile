# heuser-erp-mobile

Heuser College's mobile app (Flutter 3.47): the applicant portal — sign up,
apply for admission in three steps, upload documents, book the interview and
sports trials, accept the offer and send payment proofs — plus notifications
and profile. It talks to `heuser-erp-backend` and mirrors the web portal's
`/apply` area.

## Quick start

```sh
make setup                    # git hooks + pub get (app, packages/heuser_ds, apps/widgetbook)
make gen                      # codegen (slang, freezed, json, injectable, go_router, widgetbook)
make run FLAVOR=dev           # local Django at http://10.0.2.2:8090 (Android emulator)
make check                    # the full local gate; what CI runs
make widgetbook               # browse every design-system component
```

Flavors: `dev` (local backend), `staging`, `prod` — `env/<flavor>.json` holds
the public defines, `main_<flavor>.dart` the entry point, Android product
flavors / iOS xcconfigs the native side.

## Where to read next

- [ARCHITECTURE.md](ARCHITECTURE.md) — layers, bootstrap, auth state machine, autosave, tracker.
- [DESIGN.md](DESIGN.md) — tokens, presets, components, motion, remote theme schema.
- [RELEASE.md](RELEASE.md) — versioning, Codemagic, Shorebird, Firebase and signing setup.
- [CLAUDE.md](CLAUDE.md) and `.claude/rules/` — the rules every contributor (human or agent) follows.

## Repo layout

```
lib/                 app (app/, core/, features/)
packages/heuser_ds/  design system (tokens, presets, H* components, goldens)
apps/widgetbook/     component catalogue
env/                 per-flavor compile-time defines
scripts/             CI gates and the Shorebird patch helper
codemagic.yaml       pipelines (analyze-and-test, release, patch, nightly)
```
