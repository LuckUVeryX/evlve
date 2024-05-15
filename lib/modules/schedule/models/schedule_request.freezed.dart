// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScheduleRequest _$ScheduleRequestFromJson(Map<String, dynamic> json) {
  return _ScheduleRequest.fromJson(json);
}

/// @nodoc
mixin _$ScheduleRequest {
  String get memberId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  Area get area => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleRequestCopyWith<ScheduleRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleRequestCopyWith<$Res> {
  factory $ScheduleRequestCopyWith(
          ScheduleRequest value, $Res Function(ScheduleRequest) then) =
      _$ScheduleRequestCopyWithImpl<$Res, ScheduleRequest>;
  @useResult
  $Res call({String memberId, DateTime date, Area area});
}

/// @nodoc
class _$ScheduleRequestCopyWithImpl<$Res, $Val extends ScheduleRequest>
    implements $ScheduleRequestCopyWith<$Res> {
  _$ScheduleRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberId = null,
    Object? date = null,
    Object? area = null,
  }) {
    return _then(_value.copyWith(
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as Area,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleRequestImplCopyWith<$Res>
    implements $ScheduleRequestCopyWith<$Res> {
  factory _$$ScheduleRequestImplCopyWith(_$ScheduleRequestImpl value,
          $Res Function(_$ScheduleRequestImpl) then) =
      __$$ScheduleRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String memberId, DateTime date, Area area});
}

/// @nodoc
class __$$ScheduleRequestImplCopyWithImpl<$Res>
    extends _$ScheduleRequestCopyWithImpl<$Res, _$ScheduleRequestImpl>
    implements _$$ScheduleRequestImplCopyWith<$Res> {
  __$$ScheduleRequestImplCopyWithImpl(
      _$ScheduleRequestImpl _value, $Res Function(_$ScheduleRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberId = null,
    Object? date = null,
    Object? area = null,
  }) {
    return _then(_$ScheduleRequestImpl(
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as Area,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleRequestImpl implements _ScheduleRequest {
  const _$ScheduleRequestImpl(
      {required this.memberId, required this.date, required this.area});

  factory _$ScheduleRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleRequestImplFromJson(json);

  @override
  final String memberId;
  @override
  final DateTime date;
  @override
  final Area area;

  @override
  String toString() {
    return 'ScheduleRequest(memberId: $memberId, date: $date, area: $area)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleRequestImpl &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.area, area) || other.area == area));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, memberId, date, area);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleRequestImplCopyWith<_$ScheduleRequestImpl> get copyWith =>
      __$$ScheduleRequestImplCopyWithImpl<_$ScheduleRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleRequestImplToJson(
      this,
    );
  }
}

abstract class _ScheduleRequest implements ScheduleRequest {
  const factory _ScheduleRequest(
      {required final String memberId,
      required final DateTime date,
      required final Area area}) = _$ScheduleRequestImpl;

  factory _ScheduleRequest.fromJson(Map<String, dynamic> json) =
      _$ScheduleRequestImpl.fromJson;

  @override
  String get memberId;
  @override
  DateTime get date;
  @override
  Area get area;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleRequestImplCopyWith<_$ScheduleRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
