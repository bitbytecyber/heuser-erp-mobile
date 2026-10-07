/// Input masks shared with the web form (`components/apply/fields.tsx`).
///
/// Both return the *displayed* text; the API receives the same masked
/// strings, as the web does.
abstract final class Masks {
  /// Pakistani CNIC / B-Form: 13 digits as `#####-#######-#`. Partial input
  /// is masked progressively so typing never jumps.
  static String cnic(String v) {
    final d = _digits(v, 13);
    if (d.length <= 5) return d;
    if (d.length <= 12) return '${d.substring(0, 5)}-${d.substring(5)}';
    return '${d.substring(0, 5)}-${d.substring(5, 12)}-${d.substring(12)}';
  }

  /// Mobile numbers: local `0300 1234567`, or international `+92 300 1234567`
  /// when the text starts with `+` or with the country code 92.
  static String phone(String v) {
    final raw = v.trim();
    final intl = raw.startsWith('+') || _digits(raw, 99).startsWith('92');
    if (intl) {
      final d = _digits(raw, 12);
      if (d.length <= 2) return d.isEmpty ? '+' : '+$d';
      final r = d.substring(2);
      final tail = r.length > 3 ? ' ${r.substring(3)}' : '';
      return '+${d.substring(0, 2)} ${r.substring(0, r.length > 3 ? 3 : r.length)}$tail';
    }
    final d = _digits(raw, 11);
    return d.length > 4 ? '${d.substring(0, 4)} ${d.substring(4)}' : d;
  }

  /// Only the digits of [v].
  static String digits(String v) => _digits(v, 99);

  static String _digits(String v, int max) {
    final d = v.replaceAll(RegExp('[^0-9]'), '');
    return d.length > max ? d.substring(0, max) : d;
  }
}
