import 'package:flutter/services.dart' show TextInputFormatter;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

/// Input masks shared with the web form (`fields.tsx`).
abstract final class HMasks {
  /// Pakistani CNIC / B-Form: `#####-#######-#` (13 digits).
  static TextInputFormatter cnic() => MaskTextInputFormatter(
    mask: '#####-#######-#',
    filter: {'#': RegExp('[0-9]')},
  );

  /// Local mobile: `#### #######` (11 digits starting with 0).
  static TextInputFormatter pkMobile() => MaskTextInputFormatter(
    mask: '#### #######',
    filter: {'#': RegExp('[0-9]')},
  );

  /// Email verification code from allauth: `XXXX-XXXX` (8 characters).
  static TextInputFormatter verificationCode() => MaskTextInputFormatter(
    mask: 'AAAA-AAAA',
    filter: {'A': RegExp('[A-Za-z0-9]')},
  );

  /// Strips a CNIC mask to its 13 digits.
  static String unmaskDigits(String masked) =>
      masked.replaceAll(RegExp('[^0-9]'), '');

  /// Formats 13 digits as `#####-#######-#`; returns the input unchanged if
  /// it is not 13 digits.
  static String formatCnic(String digits) {
    final d = unmaskDigits(digits);
    if (d.length != 13) return digits;
    return '${d.substring(0, 5)}-${d.substring(5, 12)}-${d.substring(12)}';
  }
}
