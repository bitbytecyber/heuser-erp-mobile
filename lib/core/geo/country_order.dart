/// The order countries are offered in, everywhere there is a country field
/// (`lib/geo/country-order.ts` on the web): Pakistan first, then the US, UK
/// and Canada, then the Gulf, then every other country A–Z.
abstract final class CountryOrder {
  /// Popular ISO codes, in order.
  static const popular = [
    'PK',
    'US',
    'GB',
    'CA',
    'AE',
    'SA',
    'QA',
    'KW',
    'BH',
    'OM',
  ];

  /// Default country of an address.
  static const defaultCountry = 'PK';

  /// Default city of an address.
  static const defaultCity = 'Karachi';

  /// Popular countries in their order, then the rest by name.
  static List<T> sort<T>(
    List<T> list,
    String Function(T) code,
    String Function(T) name,
  ) {
    int rank(String c) {
      final i = popular.indexOf(c.toUpperCase());
      return i == -1 ? popular.length : i;
    }

    final copy = [...list]
      ..sort((a, b) {
        final r = rank(code(a)) - rank(code(b));
        return r != 0
            ? r
            : name(a).toLowerCase().compareTo(name(b).toLowerCase());
      });
    return copy;
  }
}
