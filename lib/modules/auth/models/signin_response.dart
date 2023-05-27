import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_response.freezed.dart';
part 'signin_response.g.dart';

@freezed
class SignInResponse with _$SignInResponse {
  const factory SignInResponse({
    String? token,
  }) = _SignInResponse;

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);
}
