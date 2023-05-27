import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_response.freezed.dart';
part 'signin_response.g.dart';

@freezed
class SignInResponse with _$SignInResponse {
  const factory SignInResponse({
    String? token,
    MFAMethod? mfaMethod,
  }) = _SignInResponse;

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);
}

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum MFAMethod { sms, email }
