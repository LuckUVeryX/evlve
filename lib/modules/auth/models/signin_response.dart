import 'package:evlve/modules/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_response.freezed.dart';
part 'signin_response.g.dart';

@freezed
class SignInResponse with _$SignInResponse {
  @Assert('(token == null) ^ (memberships == null)')
  const factory SignInResponse({
    String? token,
    List<User>? memberships,
  }) = _SignInResponse;

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);

  const SignInResponse._();

  User get user => memberships!.first;
}
