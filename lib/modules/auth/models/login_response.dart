import 'package:evlve/modules/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  @Assert('(token == null) == (memberships == null)')
  const factory LoginResponse({
    String? token,
    List<User>? memberships,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  const LoginResponse._();

  User get user => memberships!.first;
}
