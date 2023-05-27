import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_request.freezed.dart';
part 'signin_request.g.dart';

@freezed
class SignInRequest with _$SignInRequest {
  const factory SignInRequest({
    required String login,
    required String password,
    @JsonKey(includeIfNull: false) String? verificationCode,
    @Default(false) bool forceEmailMFA,
    @Default(true) bool rememberMe,
  }) = _SignInRequest;

  factory SignInRequest.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestFromJson(json);
}
