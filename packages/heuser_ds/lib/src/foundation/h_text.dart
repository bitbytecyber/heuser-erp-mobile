import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/theme/h_theme_data.dart';

/// Which step of the type scale to use.
enum HTextStyle {
  /// 44 condensed.
  displayLg,

  /// 36 condensed.
  displayMd,

  /// 30 condensed.
  displaySm,

  /// 26 bold.
  headlineLg,

  /// 22 bold.
  headlineMd,

  /// 19 bold.
  headlineSm,

  /// 17 semibold.
  titleLg,

  /// 15 semibold.
  titleMd,

  /// 13 semibold.
  titleSm,

  /// 16 regular.
  bodyLg,

  /// 14 regular (default).
  bodyMd,

  /// 12 regular.
  bodySm,

  /// 14 semibold.
  labelLg,

  /// 12 semibold.
  labelMd,

  /// 11 semibold.
  labelSm,

  /// 13 tabular.
  mono;

  /// Resolves against a theme.
  TextStyle resolve(HThemeData h) => switch (this) {
    HTextStyle.displayLg => h.type.displayLg,
    HTextStyle.displayMd => h.type.displayMd,
    HTextStyle.displaySm => h.type.displaySm,
    HTextStyle.headlineLg => h.type.headlineLg,
    HTextStyle.headlineMd => h.type.headlineMd,
    HTextStyle.headlineSm => h.type.headlineSm,
    HTextStyle.titleLg => h.type.titleLg,
    HTextStyle.titleMd => h.type.titleMd,
    HTextStyle.titleSm => h.type.titleSm,
    HTextStyle.bodyLg => h.type.bodyLg,
    HTextStyle.bodyMd => h.type.bodyMd,
    HTextStyle.bodySm => h.type.bodySm,
    HTextStyle.labelLg => h.type.labelLg,
    HTextStyle.labelMd => h.type.labelMd,
    HTextStyle.labelSm => h.type.labelSm,
    HTextStyle.mono => h.type.mono,
  };
}

/// Semantic text colour.
enum HTextTone {
  /// `textPrimary`.
  primary,

  /// `textSecondary`.
  secondary,

  /// `textTertiary`.
  tertiary,

  /// `textInverse` (on inverse surfaces).
  inverse,

  /// `brand`.
  brand,

  /// `brandStrong` (on brandSoft).
  brandStrong,

  /// `onBrand` (on brand fills).
  onBrand,

  /// `danger`.
  danger,

  /// `success`.
  success,

  /// `warning`.
  warning,

  /// `info`.
  info;

  /// Resolves against a theme.
  Color resolve(HThemeData h) => switch (this) {
    HTextTone.primary => h.colors.textPrimary,
    HTextTone.secondary => h.colors.textSecondary,
    HTextTone.tertiary => h.colors.textTertiary,
    HTextTone.inverse => h.colors.textInverse,
    HTextTone.brand => h.colors.brand,
    HTextTone.brandStrong => h.colors.brandStrong,
    HTextTone.onBrand => h.colors.onBrand,
    HTextTone.danger => h.colors.danger,
    HTextTone.success => h.colors.success,
    HTextTone.warning => h.colors.warning,
    HTextTone.info => h.colors.info,
  };
}

/// Themed text. The only way to put text on screen in this app: it picks the
/// scale step and the semantic tone, so screens never build a [TextStyle].
class HText extends StatelessWidget {
  /// Creates themed text.
  const HText(
    this.data, {
    this.style = HTextStyle.bodyMd,
    this.tone = HTextTone.primary,
    this.color,
    this.align,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.weight,
    this.semanticsLabel,
    super.key,
  });

  /// The string.
  final String data;

  /// Scale step.
  final HTextStyle style;

  /// Semantic colour; ignored when [color] is given.
  final HTextTone tone;

  /// Explicit colour (for text on a custom fill, e.g. `onSuccess`).
  final Color? color;

  /// Alignment.
  final TextAlign? align;

  /// Max lines.
  final int? maxLines;

  /// Overflow; defaults to ellipsis when [maxLines] is set.
  final TextOverflow? overflow;

  /// Soft wrap.
  final bool? softWrap;

  /// Weight override (e.g. `FontWeight.w700` for an emphasised body).
  final FontWeight? weight;

  /// Semantics label.
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    var textStyle = style.resolve(h).copyWith(color: color ?? tone.resolve(h));
    if (weight != null) textStyle = textStyle.copyWith(fontWeight: weight);
    return Text(
      data,
      style: textStyle,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow ?? (maxLines != null ? TextOverflow.ellipsis : null),
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
    );
  }
}
