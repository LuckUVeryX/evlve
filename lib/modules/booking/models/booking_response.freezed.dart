// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookingResponse _$BookingResponseFromJson(Map<String, dynamic> json) {
  return _BookingResponse.fromJson(json);
}

/// @nodoc
mixin _$BookingResponse {
  @JsonKey(name: 'event')
  Schedule get schedule => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingResponseCopyWith<BookingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingResponseCopyWith<$Res> {
  factory $BookingResponseCopyWith(
          BookingResponse value, $Res Function(BookingResponse) then) =
      _$BookingResponseCopyWithImpl<$Res, BookingResponse>;
  @useResult
  $Res call({@JsonKey(name: 'event') Schedule schedule, String? message});

  $ScheduleCopyWith<$Res> get schedule;
}

/// @nodoc
class _$BookingResponseCopyWithImpl<$Res, $Val extends BookingResponse>
    implements $BookingResponseCopyWith<$Res> {
  _$BookingResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schedule = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      schedule: null == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ScheduleCopyWith<$Res> get schedule {
    return $ScheduleCopyWith<$Res>(_value.schedule, (value) {
      return _then(_value.copyWith(schedule: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookingResponseImplCopyWith<$Res>
    implements $BookingResponseCopyWith<$Res> {
  factory _$$BookingResponseImplCopyWith(_$BookingResponseImpl value,
          $Res Function(_$BookingResponseImpl) then) =
      __$$BookingResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'event') Schedule schedule, String? message});

  @override
  $ScheduleCopyWith<$Res> get schedule;
}

/// @nodoc
class __$$BookingResponseImplCopyWithImpl<$Res>
    extends _$BookingResponseCopyWithImpl<$Res, _$BookingResponseImpl>
    implements _$$BookingResponseImplCopyWith<$Res> {
  __$$BookingResponseImplCopyWithImpl(
      _$BookingResponseImpl _value, $Res Function(_$BookingResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schedule = null,
    Object? message = freezed,
  }) {
    return _then(_$BookingResponseImpl(
      schedule: null == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingResponseImpl implements _BookingResponse {
  const _$BookingResponseImpl(
      {@JsonKey(name: 'event') required this.schedule, required this.message});

  factory _$BookingResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingResponseImplFromJson(json);

  @override
  @JsonKey(name: 'event')
  final Schedule schedule;
  @override
  final String? message;

  @override
  String toString() {
    return 'BookingResponse(schedule: $schedule, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingResponseImpl &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, schedule, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingResponseImplCopyWith<_$BookingResponseImpl> get copyWith =>
      __$$BookingResponseImplCopyWithImpl<_$BookingResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingResponseImplToJson(
      this,
    );
  }
}

abstract class _BookingResponse implements BookingResponse {
  const factory _BookingResponse(
      {@JsonKey(name: 'event') required final Schedule schedule,
      required final String? message}) = _$BookingResponseImpl;

  factory _BookingResponse.fromJson(Map<String, dynamic> json) =
      _$BookingResponseImpl.fromJson;

  @override
  @JsonKey(name: 'event')
  Schedule get schedule;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$BookingResponseImplCopyWith<_$BookingResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
