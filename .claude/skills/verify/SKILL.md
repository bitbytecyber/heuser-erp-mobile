---
name: verify
description: Verification gate for Dart/Flutter changes in this repo — format, analyze (fatal infos/warnings), tests, codegen freshness, import rule, goldens and coverage. Use before reporting any change as done, and whenever asked to check, lint, analyze or test.
---

# Verify

Run from the repo root (Git Bash / sh):

```sh
dart format lib test packages/heuser_ds/lib packages/heuser_ds/test apps/widgetbook/lib
flutter analyze --fatal-infos --fatal-warnings
(cd packages/heuser_ds && flutter analyze --fatal-infos --fatal-warnings)
(cd apps/widgetbook && flutter analyze --fatal-infos --fatal-warnings)
flutter test --coverage
(cd packages/heuser_ds && flutter test)
sh scripts/check-codegen.sh
sh scripts/check-imports.sh
sh scripts/check-ds-goldens.sh
sh scripts/coverage-gate.sh
```

or simply `make check`. Interpret:

- **analyze** output lists `info` lines too and they are fatal in CI: fix them,
  do not downgrade the rule. A `// ignore:` needs a reason in the same line.
- **check-codegen** failing means run `make gen` and commit the generated files.
- **check-imports** failing means a Material/Cupertino import outside the DS:
  replace with `heuser_ds` components / `context.h` tokens.
- **check-ds-goldens** failing means a component has no golden: use the
  `ds-component` skill.
- **coverage-gate** reports the gated percentage; add unit tests to `core/`
  or `domain/` code rather than excluding files.
- A golden mismatch after an intentional visual change: `make update-goldens`,
  look at the PNG diff, include it in the PR.

Report the actual output. If a step fails and you cannot fix it, say so with
the error; never report "done" with a red step.
