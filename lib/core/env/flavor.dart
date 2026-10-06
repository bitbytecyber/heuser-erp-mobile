/// Build flavor. Chosen at compile time by
/// `--dart-define-from-file=env/<flavor>.json` and by the `main_<flavor>.dart`
/// entry point; the two must agree (see `AppEnv.fromDefines`).
enum Flavor {
  dev,
  staging,
  prod;

  /// Parses the `FLAVOR` define; unknown values are a build error, never a
  /// silent fallback.
  static Flavor parse(String raw) => Flavor.values.firstWhere(
    (f) => f.name == raw,
    orElse: () =>
        throw StateError('Unknown FLAVOR "$raw" (expected dev|staging|prod)'),
  );

  bool get isProd => this == Flavor.prod;
}
