// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_precheck.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SocialPrecheck _$SocialPrecheckFromJson(Map<String, dynamic> json) =>
    _SocialPrecheck(
      known: json['known'] as bool,
      pendingToken: json['pending_token'] as String? ?? '',
      expiresIn: (json['expires_in'] as num?)?.toInt() ?? 0,
      email: json['email'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      cardSignupEnabled: json['card_signup_enabled'] as bool? ?? false,
    );

Map<String, dynamic> _$SocialPrecheckToJson(_SocialPrecheck instance) =>
    <String, dynamic>{
      'known': instance.known,
      'pending_token': instance.pendingToken,
      'expires_in': instance.expiresIn,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'card_signup_enabled': instance.cardSignupEnabled,
    };
