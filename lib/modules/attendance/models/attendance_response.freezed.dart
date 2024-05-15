// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttendanceResponse _$AttendanceResponseFromJson(Map<String, dynamic> json) {
  return _AttendanceResponse.fromJson(json);
}

/// @nodoc
mixin _$AttendanceResponse {
  List<Attendance> get attendances => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceResponseCopyWith<AttendanceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceResponseCopyWith<$Res> {
  factory $AttendanceResponseCopyWith(
          AttendanceResponse value, $Res Function(AttendanceResponse) then) =
      _$AttendanceResponseCopyWithImpl<$Res, AttendanceResponse>;
  @useResult
  $Res call({List<Attendance> attendances});
}

/// @nodoc
class _$AttendanceResponseCopyWithImpl<$Res, $Val extends AttendanceResponse>
    implements $AttendanceResponseCopyWith<$Res> {
  _$AttendanceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendances = null,
  }) {
    return _then(_value.copyWith(
      attendances: null == attendances
          ? _value.attendances
          : attendances // ignore: cast_nullable_to_non_nullable
              as List<Attendance>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceResponseImplCopyWith<$Res>
    implements $AttendanceResponseCopyWith<$Res> {
  factory _$$AttendanceResponseImplCopyWith(_$AttendanceResponseImpl value,
          $Res Function(_$AttendanceResponseImpl) then) =
      __$$AttendanceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Attendance> attendances});
}

/// @nodoc
class __$$AttendanceResponseImplCopyWithImpl<$Res>
    extends _$AttendanceResponseCopyWithImpl<$Res, _$AttendanceResponseImpl>
    implements _$$AttendanceResponseImplCopyWith<$Res> {
  __$$AttendanceResponseImplCopyWithImpl(_$AttendanceResponseImpl _value,
      $Res Function(_$AttendanceResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendances = null,
  }) {
    return _then(_$AttendanceResponseImpl(
      attendances: null == attendances
          ? _value._attendances
          : attendances // ignore: cast_nullable_to_non_nullable
              as List<Attendance>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceResponseImpl implements _AttendanceResponse {
  const _$AttendanceResponseImpl({required final List<Attendance> attendances})
      : _attendances = attendances;

  factory _$AttendanceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceResponseImplFromJson(json);

  final List<Attendance> _attendances;
  @override
  List<Attendance> get attendances {
    if (_attendances is EqualUnmodifiableListView) return _attendances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attendances);
  }

  @override
  String toString() {
    return 'AttendanceResponse(attendances: $attendances)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._attendances, _attendances));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_attendances));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceResponseImplCopyWith<_$AttendanceResponseImpl> get copyWith =>
      __$$AttendanceResponseImplCopyWithImpl<_$AttendanceResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceResponseImplToJson(
      this,
    );
  }
}

abstract class _AttendanceResponse implements AttendanceResponse {
  const factory _AttendanceResponse(
      {required final List<Attendance> attendances}) = _$AttendanceResponseImpl;

  factory _AttendanceResponse.fromJson(Map<String, dynamic> json) =
      _$AttendanceResponseImpl.fromJson;

  @override
  List<Attendance> get attendances;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceResponseImplCopyWith<_$AttendanceResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Attendance _$AttendanceFromJson(Map<String, dynamic> json) {
  return _Attendance.fromJson(json);
}

/// @nodoc
mixin _$Attendance {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError;
  Facility get facility => throw _privateConstructorUsedError;
  @JsonKey(name: 'level')
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceCopyWith<Attendance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceCopyWith<$Res> {
  factory $AttendanceCopyWith(
          Attendance value, $Res Function(Attendance) then) =
      _$AttendanceCopyWithImpl<$Res, Attendance>;
  @useResult
  $Res call(
      {String id,
      DateTime date,
      String startTime,
      Facility facility,
      @JsonKey(name: 'level') String name});
}

/// @nodoc
class _$AttendanceCopyWithImpl<$Res, $Val extends Attendance>
    implements $AttendanceCopyWith<$Res> {
  _$AttendanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? startTime = null,
    Object? facility = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      facility: null == facility
          ? _value.facility
          : facility // ignore: cast_nullable_to_non_nullable
              as Facility,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceImplCopyWith<$Res>
    implements $AttendanceCopyWith<$Res> {
  factory _$$AttendanceImplCopyWith(
          _$AttendanceImpl value, $Res Function(_$AttendanceImpl) then) =
      __$$AttendanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime date,
      String startTime,
      Facility facility,
      @JsonKey(name: 'level') String name});
}

/// @nodoc
class __$$AttendanceImplCopyWithImpl<$Res>
    extends _$AttendanceCopyWithImpl<$Res, _$AttendanceImpl>
    implements _$$AttendanceImplCopyWith<$Res> {
  __$$AttendanceImplCopyWithImpl(
      _$AttendanceImpl _value, $Res Function(_$AttendanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? startTime = null,
    Object? facility = null,
    Object? name = null,
  }) {
    return _then(_$AttendanceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      facility: null == facility
          ? _value.facility
          : facility // ignore: cast_nullable_to_non_nullable
              as Facility,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceImpl implements _Attendance {
  const _$AttendanceImpl(
      {required this.id,
      required this.date,
      required this.startTime,
      required this.facility,
      @JsonKey(name: 'level') required this.name});

  factory _$AttendanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final String startTime;
  @override
  final Facility facility;
  @override
  @JsonKey(name: 'level')
  final String name;

  @override
  String toString() {
    return 'Attendance(id: $id, date: $date, startTime: $startTime, facility: $facility, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.facility, facility) ||
                other.facility == facility) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, date, startTime, facility, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceImplCopyWith<_$AttendanceImpl> get copyWith =>
      __$$AttendanceImplCopyWithImpl<_$AttendanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceImplToJson(
      this,
    );
  }
}

abstract class _Attendance implements Attendance {
  const factory _Attendance(
      {required final String id,
      required final DateTime date,
      required final String startTime,
      required final Facility facility,
      @JsonKey(name: 'level') required final String name}) = _$AttendanceImpl;

  factory _Attendance.fromJson(Map<String, dynamic> json) =
      _$AttendanceImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  String get startTime;
  @override
  Facility get facility;
  @override
  @JsonKey(name: 'level')
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceImplCopyWith<_$AttendanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
