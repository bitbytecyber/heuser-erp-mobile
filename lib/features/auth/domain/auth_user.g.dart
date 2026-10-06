// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthUser _$AuthUserFromJson(Map<String, dynamic> json) => _AuthUser(
  id: (json['id'] as num).toInt(),
  email: json['email'] as String,
  firstName: json['first_name'] as String? ?? '',
  lastName: json['last_name'] as String? ?? '',
  fullname: json['fullname'] as String? ?? '',
  username: json['username'] as String? ?? '',
  isSuperuser: json['is_superuser'] as bool? ?? false,
  hasUsablePassword: json['has_usable_password'] as bool? ?? true,
  isEmailVerified: json['is_email_verified'] as bool? ?? false,
  avatar: json['avatar'] as String?,
  phone: json['phone'] as String?,
);

Map<String, dynamic> _$AuthUserToJson(_AuthUser instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'fullname': instance.fullname,
  'username': instance.username,
  'is_superuser': instance.isSuperuser,
  'has_usable_password': instance.hasUsablePassword,
  'is_email_verified': instance.isEmailVerified,
  'avatar': instance.avatar,
  'phone': instance.phone,
};
