import 'package:flutter/services.dart' show HapticFeedback;

/// The only haptics entry point. Keeps feedback consistent: light for
/// selection, medium for primary actions, heavy for errors.
abstract final class HHaptics {
  /// Tab change, chip toggle, picker scroll.
  static Future<void> selection() => HapticFeedback.selectionClick();

  /// Primary button press, step advance.
  static Future<void> tap() => HapticFeedback.lightImpact();

  /// Submitted, saved, booked.
  static Future<void> success() => HapticFeedback.mediumImpact();

  /// Validation error, failed action.
  static Future<void> error() => HapticFeedback.heavyImpact();
}
