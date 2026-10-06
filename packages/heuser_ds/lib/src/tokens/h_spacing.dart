import 'package:flutter/widgets.dart' show EdgeInsets, SizedBox;

/// 4-pt spacing scale. Use these instead of raw numbers in `EdgeInsets`,
/// `SizedBox` and gaps.
abstract final class HSpace {
  /// 4
  static const double x1 = 4;

  /// 8
  static const double x2 = 8;

  /// 12
  static const double x3 = 12;

  /// 16
  static const double x4 = 16;

  /// 20
  static const double x5 = 20;

  /// 24
  static const double x6 = 24;

  /// 28
  static const double x7 = 28;

  /// 32
  static const double x8 = 32;

  /// 40
  static const double x10 = 40;

  /// 48
  static const double x12 = 48;

  /// 64
  static const double x16 = 64;

  /// Horizontal page gutter (16).
  static const double gutter = x4;

  /// Vertical rhythm between sections (24).
  static const double section = x6;

  /// Page padding: gutter on the sides, section at the bottom.
  static const EdgeInsets page = EdgeInsets.fromLTRB(
    gutter,
    x4,
    gutter,
    section,
  );

  /// Card inner padding (16).
  static const EdgeInsets card = EdgeInsets.all(x4);

  /// Hero card inner padding (20).
  static const EdgeInsets hero = EdgeInsets.all(x5);

  /// Vertical gap helpers.
  static const SizedBox gap1 = SizedBox(height: x1);

  /// 8
  static const SizedBox gap2 = SizedBox(height: x2);

  /// 12
  static const SizedBox gap3 = SizedBox(height: x3);

  /// 16
  static const SizedBox gap4 = SizedBox(height: x4);

  /// 24
  static const SizedBox gap6 = SizedBox(height: x6);

  /// 32
  static const SizedBox gap8 = SizedBox(height: x8);

  /// Horizontal gap helpers.
  static const SizedBox hgap1 = SizedBox(width: x1);

  /// 8
  static const SizedBox hgap2 = SizedBox(width: x2);

  /// 12
  static const SizedBox hgap3 = SizedBox(width: x3);

  /// 16
  static const SizedBox hgap4 = SizedBox(width: x4);
}
