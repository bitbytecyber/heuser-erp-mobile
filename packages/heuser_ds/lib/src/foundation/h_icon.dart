import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';

/// Icon sizes.
enum HIconSize {
  /// 16
  sm(16),

  /// 20
  md(20),

  /// 24
  lg(24),

  /// 32
  xl(32);

  HIconSize(this.px);

  /// Logical pixels.
  final double px;
}

/// Themed icon: a glyph from `HIcons` with a semantic tone.
class HIcon extends StatelessWidget {
  /// Creates an icon.
  const HIcon(
    this.icon, {
    this.size = HIconSize.md,
    this.tone = HTextTone.primary,
    this.color,
    this.semanticsLabel,
    super.key,
  });

  /// The glyph.
  final IconData icon;

  /// Size.
  final HIconSize size;

  /// Semantic colour; ignored when [color] is given.
  final HTextTone tone;

  /// Explicit colour.
  final Color? color;

  /// Semantics label (icons without one are decorative).
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    return Icon(
      icon,
      size: size.px,
      color: color ?? tone.resolve(h),
      semanticLabel: semanticsLabel,
    );
  }
}
