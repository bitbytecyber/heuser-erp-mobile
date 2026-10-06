import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_precheck.freezed.dart';
part 'social_precheck.g.dart';

/// Which provider produced an identity.
enum SocialProvider {
  /// Google (`google_sign_in`).
  google,

  /// Apple (`sign_in_with_apple`, iOS only).
  apple,
}

/// Outcome of `POST /api/v1/auth/social/precheck/`.
///
/// `known == false` means the backend created **nothing** and is waiting
/// for the person to say what they wanted ("Apply for admission"). The
/// [pendingToken] is short-lived and carries the provider identity, including
/// the email Apple only sends on the first authorization.
@freezed
abstract class SocialPrecheck with _$SocialPrecheck {
  /// Creates a precheck result.
  const factory SocialPrecheck({
    required bool known,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(SocialProvider.google)
    SocialProvider provider,
    @JsonKey(name: 'pending_token') @Default('') String pendingToken,
    @JsonKey(name: 'expires_in') @Default(0) int expiresIn,
    @Default('') String email,
    @JsonKey(name: 'first_name') @Default('') String firstName,
    @JsonKey(name: 'last_name') @Default('') String lastName,
    @JsonKey(name: 'card_signup_enabled')
    @Default(false)
    bool cardSignupEnabled,
  }) = _SocialPrecheck;
  const SocialPrecheck._();

  /// From JSON.
  factory SocialPrecheck.fromJson(Map<String, dynamic> json) =>
      _$SocialPrecheckFromJson(json);

  /// Name to greet the person with on the choice screen.
  String get greetingName =>
      firstName.trim().isNotEmpty ? firstName.trim() : email;
}
