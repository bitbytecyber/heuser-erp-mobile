# Theme rules

The look of this app is a bespoke design system (`packages/heuser_ds`), not
Material. These rules keep it that way; `scripts/check-imports.sh`,
`scripts/check-ds-goldens.sh` and the goldens enforce most of them in CI.

## 1. Tokens only

- Never write a literal `Color(0x…)`, `Colors.*`, `TextStyle(...)`,
  `EdgeInsets.all(12)`, `BorderRadius.circular(8)` or `Duration(milliseconds: …)`
  in `lib/` or `apps/`. Read them from the theme:
  `final h = context.h;` then `h.colors.brand`, `h.type.titleMd`,
  `HSpace.x4`, `HRadius.md`, `h.motion.standard`.
- Spacing is a 4-pt grid (`HSpace.x1 … x10`, `gutter`, `section`). Radii are
  `sm 12 / md 16 / lg 20 / xl 28 / pill`. If a design needs a value that is not
  a token, add the token to the DS (with a golden) rather than inlining it.
- Colour roles are semantic (`brand`, `brandSoft`, `surfaceRaised`,
  `textSecondary`, `dangerSoft`…). Never pick a role because it "looks right";
  pick the one that means what the element is.

## 2. Material is an engine, not a style

- `package:flutter/material.dart` (and `cupertino.dart`, `material_ui`) may be
  imported only in `packages/heuser_ds/lib/src/theme/bridge/**`,
  `packages/heuser_ds/lib/src/components/**`,
  `packages/heuser_ds/lib/src/foundation/**` and `lib/app/app.dart`.
  Everywhere else import `package:flutter/widgets.dart` and `package:heuser_ds/heuser_ds.dart`.
- Inside a DS component, Material widgets are allowed when they save real work
  (text editing, scrolling physics, focus, Navigator/overlays), but every
  visible property must be driven by H tokens: no ripples (`NoSplash`), no
  default elevation overlays, no M3 shapes, no default `ColorScheme` colours.
- The Material bridge (`material_bridge.dart`) exists so engine widgets we
  cannot restyle (text selection handles, scrollbars, date picker internals)
  still match. It is derived from `HThemeData`; never the other way round.

## 3. Pastel derivation and contrast

- Tints are brand colour mixed with 75–80 % white (`brandSoft`, `accentSoft`,
  `successSoft`…). Navy (`#000F1D`) is never tinted (it goes grey): navy
  surfaces use the brand's own `#DCDDE8` / `#F5F5F7`.
- Text roles must reach 4.5:1 against the surface they are documented for;
  `onBrand`/`onAccent` against their fill likewise. The preset test asserts this.
- Danger stays the M3 red family (`#B3261E`), distinct from the brand red, so
  an error never reads as branding.

## 4. Presets and remote themes

- A preset is `HPreset{id, label, light, dark, fonts?}` in
  `packages/heuser_ds/lib/src/theme/presets/`. Adding one: new file →
  register in `preset_registry.dart` → add the id to the backend
  `BUILTIN_MOBILE_PRESETS` → `make update-goldens` → row in DESIGN.md.
- The admin's `mobile_theme` (from `GET /api/v1/site-branding/`) is decoded
  leniently (`mobile_theme_codec.dart`): a missing role falls back to the
  built-in preset with the same id, else to Heuser Classic; an invalid hex is
  dropped. The app must never crash or go blank because of a theme payload.
- Resolution order is in `app/theme/theme_resolver.dart` and must stay pure:
  remote policy → user preference (only if `allow_user_override`) → system
  brightness.

## 5. Every component is catalogued and golden-tested

- A new `h_<name>.dart` under `packages/heuser_ds/lib/src/components/` needs
  `apps/widgetbook/lib/use_cases/<name>_use_case.dart` and
  `packages/heuser_ds/test/goldens/h_<name>_golden_test.dart` rendering it in
  every preset × light/dark (use `goldenPresetMatrix`). Inputs and buttons
  also render at text scale 1.3 and 2.0.
- Goldens are generated on the pinned Flutter in CI (`mac_mini_m2`). Locally on
  Windows run `make goldens`; platform goldens are disabled so fonts render
  identically.

## 6. Motion

- Durations/curves come from `h.motion` (`fast 120`, `standard 220`,
  `slow 360`, `emphasized 480`). Respect `MediaQuery.disableAnimations`.
- Page/step/tab transitions use `HPageTransitions` (SharedAxis / FadeThrough);
  micro-interactions use the `HAnimate` presets built on flutter_animate.
  Never hand-roll an `AnimationController` for something those cover.
- Haptics through `HHaptics` only (`selection`, `success`, `error`).
