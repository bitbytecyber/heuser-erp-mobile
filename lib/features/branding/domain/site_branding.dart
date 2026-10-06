import 'package:freezed_annotation/freezed_annotation.dart';

part 'site_branding.freezed.dart';
part 'site_branding.g.dart';

/// White-label identity served by the backend. Name, logo and theme are
/// never hard-coded in the app (PRODUCT.md): they come from here.
@freezed
abstract class SiteBranding with _$SiteBranding {
  /// Creates branding.
  const factory SiteBranding({
    @Default('Heuser College') String name,
    @JsonKey(name: 'short_name') @Default('Heuser') String shortName,
    @Default('') String tagline,
    String? logo,
    @JsonKey(name: 'logo_alt_text') @Default('') String logoAltText,
    @JsonKey(name: 'support_email') @Default('') String supportEmail,
    @JsonKey(name: 'support_phone') @Default('') String supportPhone,
    @Default('') String website,

    /// Raw `mobile_theme` block; decoded by the design system's codec.
    @JsonKey(name: 'mobile_theme') Map<String, dynamic>? mobileTheme,
  }) = _SiteBranding;
  const SiteBranding._();

  /// From JSON.
  factory SiteBranding.fromJson(Map<String, dynamic> json) =>
      _$SiteBrandingFromJson(json);

  /// Built-in fallback while nothing is cached.
  static const SiteBranding fallback = SiteBranding();
}
