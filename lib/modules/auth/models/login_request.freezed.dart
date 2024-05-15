// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) {
  return _LoginRequest.fromJson(json);
}

/// @nodoc
mixin _$LoginRequest {
  String get login => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get verificationCode => throw _privateConstructorUsedError;
  bool get forceEmailMFA => throw _privateConstructorUsedError;
  bool get rememberMe => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginRequestCopyWith<LoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginRequestCopyWith<$Res> {
  factory $LoginRequestCopyWith(
          LoginRequest value, $Res Function(LoginRequest) then) =
      _$LoginRequestCopyWithImpl<$Res, LoginRequest>;
  @useResult
  $Res call(
      {String login,
      String password,
      @JsonKey(includeIfNull: false) String? verificationCode,
      bool forceEmailMFA,
      bool rememberMe});
}

/// @nodoc
class _$LoginRequestCopyWithImpl<$Res, $Val extends LoginRequest>
    implements $LoginRequestCopyWith<$Res> {
  _$LoginRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? password = null,
    Object? verificationCode = freezed,
    Object? forceEmailMFA = null,
    Object? rememberMe = null,
  }) {
    return _then(_value.copyWith(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      verificationCode: freezed == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      forceEmailMFA: null == forceEmailMFA
          ? _value.forceEmailMFA
          : forceEmailMFA // ignore: cast_nullable_to_non_nullable
              as bool,
      rememberMe: null == rememberMe
          ? _value.rememberMe
          : rememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginRequestImplCopyWith<$Res>
    implements $LoginRequestCopyWith<$Res> {
  factory _$$LoginRequestImplCopyWith(
          _$LoginRequestImpl value, $Res Function(_$LoginRequestImpl) then) =
      __$$LoginRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String login,
      String password,
      @JsonKey(includeIfNull: false) String? verificationCode,
      bool forceEmailMFA,
      bool rememberMe});
}

/// @nodoc
class __$$LoginRequestImplCopyWithImpl<$Res>
    extends _$LoginRequestCopyWithImpl<$Res, _$LoginRequestImpl>
    implements _$$LoginRequestImplCopyWith<$Res> {
  __$$LoginRequestImplCopyWithImpl(
      _$LoginRequestImpl _value, $Res Function(_$LoginRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? password = null,
    Object? verificationCode = freezed,
    Object? forceEmailMFA = null,
    Object? rememberMe = null,
  }) {
    return _then(_$LoginRequestImpl(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      verificationCode: freezed == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      forceEmailMFA: null == forceEmailMFA
          ? _value.forceEmailMFA
          : forceEmailMFA // ignore: cast_nullable_to_non_nullable
              as bool,
      rememberMe: null == rememberMe
          ? _value.rememberMe
          : rememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginRequestImpl implements _LoginRequest {
  const _$LoginRequestImpl(
      {required this.login,
      required this.password,
      @JsonKey(includeIfNull: false) this.verificationCode,
      this.forceEmailMFA = false,
      this.rememberMe = true});

  factory _$LoginRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginRequestImplFromJson(json);

  @override
  final String login;
  @override
  final String password;
  @override
  @JsonKey(includeIfNull: false)
  final String? verificationCode;
  @override
  @JsonKey()
  final bool forceEmailMFA;
  @override
  @JsonKey()
  final bool rememberMe;

  @override
  String toString() {
    return 'LoginRequest(login: $login, password: $password, verificationCode: $verificationCode, forceEmailMFA: $forceEmailMFA, rememberMe: $rememberMe)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginRequestImpl &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.verificationCode, verificationCode) ||
                other.verificationCode == verificationCode) &&
            (identical(other.forceEmailMFA, forceEmailMFA) ||
                other.forceEmailMFA == forceEmailMFA) &&
            (identical(other.rememberMe, rememberMe) ||
                other.rememberMe == rememberMe));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, login, password,
      verificationCode, forceEmailMFA, rememberMe);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginRequestImplCopyWith<_$LoginRequestImpl> get copyWith =>
      __$$LoginRequestImplCopyWithImpl<_$LoginRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginRequestImplToJson(
      this,
    );
  }
}

abstract class _LoginRequest implements LoginRequest {
  const factory _LoginRequest(
      {required final String login,
      required final String password,
      @JsonKey(includeIfNull: false) final String? verificationCode,
      final bool forceEmailMFA,
      final bool rememberMe}) = _$LoginRequestImpl;

  factory _LoginRequest.fromJson(Map<String, dynamic> json) =
      _$LoginRequestImpl.fromJson;

  @override
  String get login;
  @override
  String get password;
  @override
  @JsonKey(includeIfNull: false)
  String? get verificationCode;
  @override
  bool get forceEmailMFA;
  @override
  bool get rememberMe;
  @override
  @JsonKey(ignore: true)
  _$$LoginRequestImplCopyWith<_$LoginRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
