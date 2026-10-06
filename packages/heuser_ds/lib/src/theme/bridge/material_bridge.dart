import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:heuser_ds/src/theme/bridge/h_tokens_extension.dart';
import 'package:heuser_ds/src/theme/h_theme_data.dart';
import 'package:heuser_ds/src/tokens/h_radius.dart';
import 'package:heuser_ds/src/tokens/h_typography.dart';

/// Derives a Material [ThemeData] from [HThemeData].
///
/// This is the only place the design system meets Material's theming. It
/// exists so the engine widgets we cannot restyle ourselves (text selection
/// handles, scrollbars, date picker internals, `Navigator` barriers) still
/// match the H tokens. Nothing here is a visual decision: every value is
/// copied from the H theme. Material's own styling (ripples, tonal overlays,
/// M3 shapes) is switched off.
ThemeData materialThemeFrom(HThemeData h) {
  final c = h.colors;
  final brightness = c.brightness;
  final scheme = ColorScheme(
    brightness: brightness,
    primary: c.brand,
    onPrimary: c.onBrand,
    primaryContainer: c.brandSoft,
    onPrimaryContainer: c.brandStrong,
    secondary: c.accent,
    onSecondary: c.onAccent,
    secondaryContainer: c.accentSoft,
    onSecondaryContainer: c.textPrimary,
    tertiary: c.info,
    onTertiary: c.onInfo,
    tertiaryContainer: c.infoSoft,
    onTertiaryContainer: c.textPrimary,
    error: c.danger,
    onError: c.onDanger,
    errorContainer: c.dangerSoft,
    onErrorContainer: c.danger,
    surface: c.surface,
    onSurface: c.textPrimary,
    surfaceContainerLowest: c.surfaceRaised,
    surfaceContainerLow: c.surfaceAlt,
    surfaceContainer: c.surfaceAlt,
    surfaceContainerHigh: c.surfaceRaised,
    surfaceContainerHighest: c.surfaceRaised,
    onSurfaceVariant: c.textSecondary,
    outline: c.outline,
    outlineVariant: c.outlineSoft,
    inverseSurface: c.surfaceInverse,
    onInverseSurface: c.textInverse,
    inversePrimary: c.brandSoft,
    shadow: c.textPrimary,
    scrim: c.overlay,
    surfaceTint: Colors.transparent,
  );

  final t = h.type;
  final textTheme = TextTheme(
    displayLarge: t.displayLg,
    displayMedium: t.displayMd,
    displaySmall: t.displaySm,
    headlineLarge: t.headlineLg,
    headlineMedium: t.headlineMd,
    headlineSmall: t.headlineSm,
    titleLarge: t.titleLg,
    titleMedium: t.titleMd,
    titleSmall: t.titleSm,
    bodyLarge: t.bodyLg,
    bodyMedium: t.bodyMd,
    bodySmall: t.bodySm,
    labelLarge: t.labelLg,
    labelMedium: t.labelMd,
    labelSmall: t.labelSm,
  ).apply(bodyColor: c.textPrimary, displayColor: c.textPrimary);

  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    colorScheme: scheme,
    fontFamily: 'packages/${HFonts.package}/${h.fonts.ui}',
    textTheme: textTheme,
    scaffoldBackgroundColor: c.surface,
    canvasColor: c.surface,
    dividerColor: c.divider,
    splashFactory: NoSplash.splashFactory,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    focusColor: Colors.transparent,
    visualDensity: VisualDensity.standard,
    materialTapTargetSize: MaterialTapTargetSize.padded,
    iconTheme: IconThemeData(color: c.textPrimary, size: 22),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        for (final platform in TargetPlatform.values)
          platform: SharedAxisPageTransitionsBuilder(
            transitionType: SharedAxisTransitionType.horizontal,
            fillColor: c.surface,
          ),
      },
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: c.brand,
      selectionColor: c.brandSoft,
      selectionHandleColor: c.brand,
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStatePropertyAll(c.outline),
      radius: const Radius.circular(HRadius.pill),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: c.surface,
      foregroundColor: c.textPrimary,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      showDragHandle: false,
    ),
    dialogTheme: const DialogThemeData(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: c.surfaceRaised,
      surfaceTintColor: Colors.transparent,
      headerBackgroundColor: c.brandSoft,
      headerForegroundColor: c.brandStrong,
      shape: const RoundedRectangleBorder(borderRadius: HRadius.lgAll),
      dayShape: const WidgetStatePropertyAll(CircleBorder()),
      todayBorder: BorderSide(color: c.brand),
      todayForegroundColor: WidgetStatePropertyAll(c.brand),
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: c.surfaceRaised,
      shape: const RoundedRectangleBorder(borderRadius: HRadius.lgAll),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: c.surfaceInverse,
      contentTextStyle: t.bodyMd.copyWith(color: c.textInverse),
      behavior: SnackBarBehavior.floating,
      shape: const RoundedRectangleBorder(borderRadius: HRadius.mdAll),
    ),
    extensions: [HTokens(h)],
  );
}
