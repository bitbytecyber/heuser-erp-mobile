import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';
part 'auth_user.g.dart';

/// The signed-in account, as serialised by the backend's `UserSerializer`
/// (allauth session `data.user`, `/auth/session`, `/me/profile/`).
@freezed
abstract class AuthUser with _$AuthUser {
  /// Creates a user.
  const factory AuthUser({
    required int id,
    required String email,
    @JsonKey(name: 'first_name') @Default('') String firstName,
    @JsonKey(name: 'last_name') @Default('') String lastName,
    @Default('') String fullname,
    @Default('') String username,
    @JsonKey(name: 'is_superuser') @Default(false) bool isSuperuser,
    @JsonKey(name: 'has_usable_password') @Default(true) bool hasUsablePassword,
    @JsonKey(name: 'is_email_verified') @Default(false) bool isEmailVerified,
    String? avatar,
    String? phone,
  }) = _AuthUser;
  const AuthUser._();

  /// From JSON (lenient on missing optional fields).
  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);

  /// Best display name: full name, then first name, then the email's local part.
  String get displayName {
    if (fullname.trim().isNotEmpty) return fullname.trim();
    final parts = [
      firstName,
      lastName,
    ].where((p) => p.trim().isNotEmpty).toList();
    if (parts.isNotEmpty) return parts.join(' ');
    return email.split('@').first;
  }

  /// First name or the display name's first word.
  String get greetingName => firstName.trim().isNotEmpty
      ? firstName.trim()
      : displayName.split(' ').first;
}
