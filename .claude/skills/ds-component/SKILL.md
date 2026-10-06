---
name: ds-component
description: Add or change a design-system component in packages/heuser_ds — file, tokens, Widgetbook use-case, golden test and DESIGN.md row. Use when asked to build, restyle or extend any H* widget (button, field, sheet, card, stepper, tile…).
---

# Adding a `heuser_ds` component

1. **Place it**: `packages/heuser_ds/lib/src/components/<group>/h_<name>.dart`
   (`buttons | inputs | surfaces | feedback | navigation | data`). Export it from
   `lib/heuser_ds.dart`. Keep the file under 300 lines; split variants/styles into
   `h_<name>_style.dart` if needed.
2. **Style from tokens only**: read `final h = HTheme.of(context);` and use
   `h.colors.*`, `h.type.*`, `HSpace`, `HRadius`, `h.elevation.*`, `h.motion.*`.
   Material widgets are allowed inside as an engine (`NoSplash`, no default
   shapes/elevation). Public API: named constructors per variant, `enabled`,
   `onPressed`, `semanticsLabel`; sizes from an enum, never raw numbers.
3. **Motion**: pressed/hover/focus states animate with `h.motion.fast`; entrance
   via `HAnimate.*` presets. Respect `MediaQuery.disableAnimationsOf`.
4. **Widgetbook**: `apps/widgetbook/lib/use_cases/<name>_use_case.dart` with one
   `@UseCase` per variant and knobs for the interesting props. Run
   `cd apps/widgetbook && dart run build_runner build --delete-conflicting-outputs`.
5. **Golden**: `packages/heuser_ds/test/goldens/h_<name>_golden_test.dart` using
   `goldenPresetMatrix('h_<name>', (ctx) => …)` from `test/helpers/golden.dart`;
   inputs/buttons also at text scale 1.3 and 2.0. Generate with
   `make update-goldens`, then `make goldens` must pass twice.
6. **Document**: add the component to the inventory table in `DESIGN.md`.
7. **Verify**: `cd packages/heuser_ds && flutter analyze --fatal-infos --fatal-warnings && flutter test`,
   then `sh scripts/check-ds-goldens.sh && sh scripts/check-imports.sh`.
