# DESIGN.md — the Heuser design system

Package: `packages/heuser_ds`. Style: **soft premium** — pastel surfaces with
tiered depth, generous radii, friendly type, motion on every touch. Derived
from heusercollege.com (navy `#000F1D`, maroon `#881A21`, red `#DA2A35`,
apricot `#FFBC7D`). Rules for using it are in `.claude/rules/theme-rules.md`;
how to add a component is `.claude/skills/ds-component`.

## 1. Tokens

| Token | Values |
|---|---|
| `HSpace` | 4-pt grid: x1 4 · x2 8 · x3 12 · x4 16 · x5 20 · x6 24 · x8 32 · x10 40 · x12 48 · x16 64; `gutter` 16, `section` 24; `page`, `card`, `hero` insets; `gap*`/`hgap*` boxes |
| `HRadius` | sm 12 · md 16 · lg 20 · xl 28 · pill; `sheet` (top corners xl) |
| `HElevation` | flat (outline only) · raised · floating · overlay — navy-tinted layered shadows in light, black in dark |
| `HMotion` | fast 120 ms · standard 220 · slow 360 · emphasized 480; curves `easeOut`, `enter`, `exit`, `spring`; `enabled=false` under reduce-motion (every duration collapses to 0) |
| `HTypeScale` | display Lg/Md/Sm (Barlow Semi Condensed 44/36/30) · headline Lg/Md/Sm (Manrope 700, 26/22/19) · title Lg/Md/Sm (600, 17/15/13) · body Lg/Md/Sm (400, 16/14/12) · label Lg/Md/Sm (600, 14/12/11) · mono 13. Styles carry no colour; `HText` applies the tone. |
| `HFonts` | `ui` Manrope (variable), `display` BarlowSemiCondensed; both bundled in the package (OFL) |

### Colour roles (`HColorScheme`, snake_case = remote JSON keys)

brand · on_brand · brand_soft · brand_strong · accent · on_accent · accent_soft ·
surface · surface_alt · surface_raised · surface_inverse · outline · outline_soft ·
divider · text_primary · text_secondary · text_tertiary · text_inverse ·
success · on_success · success_soft · warning · on_warning · warning_soft ·
danger · on_danger · danger_soft · info · on_info · info_soft ·
hero_gradient_start · hero_gradient_end · overlay · shimmer_base · shimmer_highlight ·
nav_indicator · focus_ring

Rules: pastels (`*_soft`) are the colour at 75–80 % white; navy is never tinted
(navy surfaces use `#DCDDE8` / `#F5F5F7`); `danger` is the M3 red family, not
the brand red; text roles reach 4.5:1 on all three surfaces and `on_*` roles
4.5:1 on their fills (`test/unit/presets_contrast_test.dart` enforces).

## 2. Presets (`HPresets.builtIn`)

| id | Light | Dark |
|---|---|---|
| `heuser_classic` (default) | brand `#881A21`, soft `#F8D4D7`, accent `#A85A1E`, surface `#FBFBFC` / alt `#F5F5F7` / raised `#FFFFFF`, text `#000F1D` | brand `#F6AEB3`, soft `#4A1418`, accent `#FFBC7D`, surface `#000F1D` / alt `#0B1A2B` / raised `#16263A`, text `#ECEEF4` |
| `navy_night` | brand `#00172E` on `#F5F5F7`, periwinkle soft `#DCDDE8` | brand `#9FB3D9`, soft `#223246` |
| `apricot_dawn` | brand `#A8541A`, soft `#FFEBD8`, cream surfaces `#FFFBF7` | brand `#FFBC7D`, warm dark surfaces `#1A1410` |
| `mint_calm` | brand `#2E7D5B`, soft `#D7F0E4`, surfaces `#F7FBF9` | brand `#8FD6B4`, surfaces `#0B1A14` |

Full hex tables: `packages/heuser_ds/lib/src/theme/presets/*.dart`.

**Adding a preset:** new file under `presets/` → add to `HPresets.builtIn` →
add the id to the backend `BUILTIN_MOBILE_PRESETS` → `make update-goldens` →
add a row here.

## 3. Resolution (admin policy + user preference)

`GET /api/v1/site-branding/` returns a `mobile_theme` block:

```json
{
  "active_preset": "heuser_classic",
  "allow_user_override": true,
  "presets": [
    {"id": "school_blue", "label": "School Blue",
     "light": {"brand": "#2A5C9A", "brand_soft": "#DCE8F7"},
     "dark":  {"brand": "#9EC2F0"}}
  ]
}
```

`MobileThemeCodec.decode` is lenient: unknown keys ignored, bad hex dropped, a
missing side or role falls back to the built-in preset with the same id (else
Heuser Classic), presets with invalid ids dropped, unknown `active_preset`
→ `null`. `resolveTheme` (`lib/app/theme/theme_resolver.dart`) then picks:
user's preset **if** `allow_user_override` and it still exists → admin's
`active_preset` → Heuser Classic; brightness from the user's mode (system →
OS). `ThemeCubit` loads the cached policy before the first frame and refreshes
from the network afterwards, so the admin's theme shows on a cold start.

## 4. Components

| Group | Components |
|---|---|
| buttons | `HButton` (filled / tonal / outline / ghost / danger; sm md lg; loading; icons), `HIconButton` (ghost / tonal / filled / outline; badge dot), `HPressable` (press/hover/focus engine) |
| inputs | `HTextField` (+ `HMasks.cnic`, `pkMobile`, `verificationCode`), `HFieldFrame`, `HSelect`, `HSearchSelect` (paged), `HDatePicker`, `HOtpField` (6 digits / 8 alphanumeric with group dash), `HCheckbox`, `HSwitch`, `HRadio`, `HChip`, `HSegmented`, `HFilePickerTile` (missing / later / uploading / pending / approved / rejected) |
| surfaces | `HCard` (flat / raised / floating, tappable), `HHeroCard` (soft gradient, inverse), `HScaffold`, `HBottomSheet.show`, `HDialog.show` / `confirm` |
| feedback | `HStatusPill` + `HTone`, `HBadge`, `HToast` (one at a time, de-duplicated), `HSkeleton` / `HSkeletonBox`, `HEmptyState`, `HSpinner`, `HProgressBar`, `HCountdown`, `HRefreshable` (pull to refresh, brand arc, haptic), `HSplashReveal` (launch-navy mark matching the native splash, lifts and dissolves into the app; skipped on warm start and reduced motion) |
| navigation | `HAppBar`, `HNavBar` (animated pill), `HStepper`, `HTabs` |
| data | `HListTile` + `HDivider`, `HKeyValue` / `HKeyValueGroup`, `HTimeline`, `HStageBar` (done / now / next / ended), `HFeeTable`, `HAvatar` |
| foundation | `HText` (+ `HTextStyle`, `HTextTone`), `HIcon` + `HIcons` (curated rounded set), `HHaptics`, `HAnimate` (`hFadeInUp`, `hScaleIn`, `hPop`, `hShake`, `hStaggered`), `HPageTransitions` (sharedAxisX/Y, fadeThrough, fade), `HScrollBehavior` |

Every component has a Widgetbook use-case (`apps/widgetbook`) and a golden in
`packages/heuser_ds/test/goldens` rendered across 4 presets × light/dark
(`goldenPresetMatrix`); inputs and buttons also at 1.3× and 2× text.

## 5. Motion

- Press: scale 0.97 over `fast`; hover/pressed tint = 6–12 % of `text_primary`.
- Entrances: `hFadeInUp` (fade + 12 px rise, `standard`, `enter` curve);
  lists stagger 40 ms per item (max 8).
- Transitions: shared-axis X between steps and drill-downs, shared-axis Y for
  page-sheets, fade-through between tabs/portals.
- Feedback: `hPop` for success, `hShake` for validation errors, haptics via
  `HHaptics` (selection / tap / success / error).
- Reduce motion: `MediaQuery`/`accessibilityFeatures.disableAnimations` flips
  `HMotion.enabled`; presets and spinners render static.

## 5a. Accessibility

- Every control is announced **once**: a component that sets a semantics
  label hides the text that repeats it (`HPressable.excludeChildSemantics`,
  `Semantics(excludeSemantics: true)`), and labelled toggles merge their
  visible label and description into one node. `test/unit/semantics_test.dart`
  pins this for buttons, chips, switches, checkboxes and the stepper.
- Meaning carried by colour or an icon is also spoken: task state on tracker
  tiles, unread inbox items, the stage bar's "Stage n of m: …" summary.
- Layouts grow with the text scale (no fixed heights around text); inputs,
  buttons and the stage bar have 2.0× goldens, pages have 200 % widget tests.
- Icon-only buttons require `semanticsLabel`; decorative overlays (splash,
  lock screen backdrop) are excluded from semantics.

## 6. Material as an engine

`materialThemeFrom(HThemeData)` builds a `ThemeData` for the engine widgets
(text editing, scrollbars, date picker, barrier) with ripples and tonal
overlays disabled. Material imports are allowed only in the DS bridge,
components and foundation, and in `lib/app/app.dart`; `scripts/check-imports.sh`
enforces it.
