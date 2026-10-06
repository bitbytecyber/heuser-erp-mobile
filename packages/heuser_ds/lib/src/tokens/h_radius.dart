import 'package:flutter/painting.dart' show BorderRadius, Radius;

/// Corner radii. "Soft premium" means generous corners: small controls 12,
/// cards 16–20, sheets and hero cards 28, pills fully round.
abstract final class HRadius {
  /// 12 — chips, small buttons, inputs.
  static const double sm = 12;

  /// 16 — buttons, cards, list groups.
  static const double md = 16;

  /// 20 — large cards, dialogs.
  static const double lg = 20;

  /// 28 — bottom sheets, hero cards.
  static const double xl = 28;

  /// 999 — pills and avatars.
  static const double pill = 999;

  /// [sm] as a [BorderRadius].
  static const BorderRadius smAll = BorderRadius.all(Radius.circular(sm));

  /// [md] as a [BorderRadius].
  static const BorderRadius mdAll = BorderRadius.all(Radius.circular(md));

  /// [lg] as a [BorderRadius].
  static const BorderRadius lgAll = BorderRadius.all(Radius.circular(lg));

  /// [xl] as a [BorderRadius].
  static const BorderRadius xlAll = BorderRadius.all(Radius.circular(xl));

  /// [pill] as a [BorderRadius].
  static const BorderRadius pillAll = BorderRadius.all(Radius.circular(pill));

  /// Bottom sheet: rounded on top only.
  static const BorderRadius sheet = BorderRadius.vertical(
    top: Radius.circular(xl),
  );
}
