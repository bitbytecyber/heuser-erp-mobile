// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_branding.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SiteBranding _$SiteBrandingFromJson(Map<String, dynamic> json) =>
    _SiteBranding(
      name: json['name'] as String? ?? 'Heuser College',
      shortName: json['short_name'] as String? ?? 'Heuser',
      tagline: json['tagline'] as String? ?? '',
      logo: json['logo'] as String?,
      logoAltText: json['logo_alt_text'] as String? ?? '',
      supportEmail: json['support_email'] as String? ?? '',
      supportPhone: json['support_phone'] as String? ?? '',
      website: json['website'] as String? ?? '',
      mobileTheme: json['mobile_theme'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$SiteBrandingToJson(_SiteBranding instance) =>
    <String, dynamic>{
      'name': instance.name,
      'short_name': instance.shortName,
      'tagline': instance.tagline,
      'logo': instance.logo,
      'logo_alt_text': instance.logoAltText,
      'support_email': instance.supportEmail,
      'support_phone': instance.supportPhone,
      'website': instance.website,
      'mobile_theme': instance.mobileTheme,
    };
