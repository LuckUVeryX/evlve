// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginRequestImpl _$$LoginRequestImplFromJson(Map<String, dynamic> json) =>
    _$LoginRequestImpl(
      login: json['login'] as String,
      password: json['password'] as String,
      verificationCode: json['verificationCode'] as String?,
      forceEmailMFA: json['forceEmailMFA'] as bool? ?? false,
      rememberMe: json['rememberMe'] as bool? ?? true,
    );

Map<String, dynamic> _$$LoginRequestImplToJson(_$LoginRequestImpl instance) {
  final val = <String, dynamic>{
    'login': instance.login,
    'password': instance.password,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('verificationCode', instance.verificationCode);
  val['forceEmailMFA'] = instance.forceEmailMFA;
  val['rememberMe'] = instance.rememberMe;
  return val;
}
