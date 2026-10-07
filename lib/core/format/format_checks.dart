import 'package:heuser_erp_mobile/core/format/masks.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

/// The three formats the admission form checks (`fields.tsx` `Fmt`).
enum FieldFormat {
  /// A mobile number (landlines fail: codes go by SMS).
  phone,

  /// An email address.
  email,

  /// A 13-digit CNIC / B-Form number.
  cnic,
}

/// Default country for bare local numbers, as on the web.
const IsoCode defaultPhoneCountry = IsoCode.PK;

/// Format checks shared with the web form. An empty value always passes:
/// "required" is a separate rule.
abstract final class FormatChecks {
  static final _email = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]{2,}$');

  /// Whether [v] is acceptable for [format].
  static bool ok(FieldFormat format, String v) {
    final s = v.trim();
    if (s.isEmpty) return true;
    return switch (format) {
      FieldFormat.email => _email.hasMatch(s),
      FieldFormat.cnic => Masks.digits(s).length == 13,
      FieldFormat.phone => isMobile(s),
    };
  }

  /// Any country by its own numbering rules; bare local numbers are read as
  /// Pakistani. Only *mobile* numbers pass.
  static bool isMobile(String s) {
    try {
      final p = PhoneNumber.parse(s, callerCountry: defaultPhoneCountry);
      return p.isValid(type: PhoneNumberType.mobile);
    } on Object catch (_) {
      return false;
    }
  }

  /// Pakistani numbers the local way (`0300 1234567`), others international
  /// (`+44 7700 900123`). Unparseable input is returned as typed.
  static String showPhone(String? v) {
    if (v == null || v.trim().isEmpty) return v ?? '';
    try {
      final p = PhoneNumber.parse(v, callerCountry: defaultPhoneCountry);
      if (p.isoCode == defaultPhoneCountry) {
        return p.formatNsn().isEmpty ? v : '0${p.formatNsn()}';
      }
      return p.international;
    } on Object catch (_) {
      return v;
    }
  }
}
