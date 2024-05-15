// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScheduleList _$ScheduleListFromJson(Map<String, dynamic> json) {
  return _ScheduleList.fromJson(json);
}

/// @nodoc
mixin _$ScheduleList {
  @JsonKey(name: 'events')
  List<Schedule> get schedules => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleListCopyWith<ScheduleList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleListCopyWith<$Res> {
  factory $ScheduleListCopyWith(
          ScheduleList value, $Res Function(ScheduleList) then) =
      _$ScheduleListCopyWithImpl<$Res, ScheduleList>;
  @useResult
  $Res call({@JsonKey(name: 'events') List<Schedule> schedules});
}

/// @nodoc
class _$ScheduleListCopyWithImpl<$Res, $Val extends ScheduleList>
    implements $ScheduleListCopyWith<$Res> {
  _$ScheduleListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schedules = null,
  }) {
    return _then(_value.copyWith(
      schedules: null == schedules
          ? _value.schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<Schedule>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleListImplCopyWith<$Res>
    implements $ScheduleListCopyWith<$Res> {
  factory _$$ScheduleListImplCopyWith(
          _$ScheduleListImpl value, $Res Function(_$ScheduleListImpl) then) =
      __$$ScheduleListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'events') List<Schedule> schedules});
}

/// @nodoc
class __$$ScheduleListImplCopyWithImpl<$Res>
    extends _$ScheduleListCopyWithImpl<$Res, _$ScheduleListImpl>
    implements _$$ScheduleListImplCopyWith<$Res> {
  __$$ScheduleListImplCopyWithImpl(
      _$ScheduleListImpl _value, $Res Function(_$ScheduleListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schedules = null,
  }) {
    return _then(_$ScheduleListImpl(
      schedules: null == schedules
          ? _value._schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<Schedule>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleListImpl implements _ScheduleList {
  const _$ScheduleListImpl(
      {@JsonKey(name: 'events') required final List<Schedule> schedules})
      : _schedules = schedules;

  factory _$ScheduleListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleListImplFromJson(json);

  final List<Schedule> _schedules;
  @override
  @JsonKey(name: 'events')
  List<Schedule> get schedules {
    if (_schedules is EqualUnmodifiableListView) return _schedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schedules);
  }

  @override
  String toString() {
    return 'ScheduleList(schedules: $schedules)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleListImpl &&
            const DeepCollectionEquality()
                .equals(other._schedules, _schedules));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_schedules));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleListImplCopyWith<_$ScheduleListImpl> get copyWith =>
      __$$ScheduleListImplCopyWithImpl<_$ScheduleListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleListImplToJson(
      this,
    );
  }
}

abstract class _ScheduleList implements ScheduleList {
  const factory _ScheduleList(
          {@JsonKey(name: 'events') required final List<Schedule> schedules}) =
      _$ScheduleListImpl;

  factory _ScheduleList.fromJson(Map<String, dynamic> json) =
      _$ScheduleListImpl.fromJson;

  @override
  @JsonKey(name: 'events')
  List<Schedule> get schedules;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleListImplCopyWith<_$ScheduleListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return _Schedule.fromJson(json);
}

/// @nodoc
mixin _$Schedule {
  @_DateTimeToLocalConverter()
  DateTime get date => throw _privateConstructorUsedError;
  @_DateTimeToLocalConverter()
  DateTime get start => throw _privateConstructorUsedError;
  @_DateTimeToLocalConverter()
  DateTime get end => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  Area get resourceId => throw _privateConstructorUsedError;
  ScheduleExtraData get event => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleCopyWith<Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleCopyWith<$Res> {
  factory $ScheduleCopyWith(Schedule value, $Res Function(Schedule) then) =
      _$ScheduleCopyWithImpl<$Res, Schedule>;
  @useResult
  $Res call(
      {@_DateTimeToLocalConverter() DateTime date,
      @_DateTimeToLocalConverter() DateTime start,
      @_DateTimeToLocalConverter() DateTime end,
      String title,
      Area resourceId,
      ScheduleExtraData event});

  $ScheduleExtraDataCopyWith<$Res> get event;
}

/// @nodoc
class _$ScheduleCopyWithImpl<$Res, $Val extends Schedule>
    implements $ScheduleCopyWith<$Res> {
  _$ScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? start = null,
    Object? end = null,
    Object? title = null,
    Object? resourceId = null,
    Object? event = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      resourceId: null == resourceId
          ? _value.resourceId
          : resourceId // ignore: cast_nullable_to_non_nullable
              as Area,
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as ScheduleExtraData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ScheduleExtraDataCopyWith<$Res> get event {
    return $ScheduleExtraDataCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScheduleImplCopyWith<$Res>
    implements $ScheduleCopyWith<$Res> {
  factory _$$ScheduleImplCopyWith(
          _$ScheduleImpl value, $Res Function(_$ScheduleImpl) then) =
      __$$ScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@_DateTimeToLocalConverter() DateTime date,
      @_DateTimeToLocalConverter() DateTime start,
      @_DateTimeToLocalConverter() DateTime end,
      String title,
      Area resourceId,
      ScheduleExtraData event});

  @override
  $ScheduleExtraDataCopyWith<$Res> get event;
}

/// @nodoc
class __$$ScheduleImplCopyWithImpl<$Res>
    extends _$ScheduleCopyWithImpl<$Res, _$ScheduleImpl>
    implements _$$ScheduleImplCopyWith<$Res> {
  __$$ScheduleImplCopyWithImpl(
      _$ScheduleImpl _value, $Res Function(_$ScheduleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? start = null,
    Object? end = null,
    Object? title = null,
    Object? resourceId = null,
    Object? event = null,
  }) {
    return _then(_$ScheduleImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      resourceId: null == resourceId
          ? _value.resourceId
          : resourceId // ignore: cast_nullable_to_non_nullable
              as Area,
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as ScheduleExtraData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleImpl extends _Schedule {
  const _$ScheduleImpl(
      {@_DateTimeToLocalConverter() required this.date,
      @_DateTimeToLocalConverter() required this.start,
      @_DateTimeToLocalConverter() required this.end,
      required this.title,
      required this.resourceId,
      required this.event})
      : super._();

  factory _$ScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleImplFromJson(json);

  @override
  @_DateTimeToLocalConverter()
  final DateTime date;
  @override
  @_DateTimeToLocalConverter()
  final DateTime start;
  @override
  @_DateTimeToLocalConverter()
  final DateTime end;
  @override
  final String title;
  @override
  final Area resourceId;
  @override
  final ScheduleExtraData event;

  @override
  String toString() {
    return 'Schedule(date: $date, start: $start, end: $end, title: $title, resourceId: $resourceId, event: $event)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.resourceId, resourceId) ||
                other.resourceId == resourceId) &&
            (identical(other.event, event) || other.event == event));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, start, end, title, resourceId, event);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleImplCopyWith<_$ScheduleImpl> get copyWith =>
      __$$ScheduleImplCopyWithImpl<_$ScheduleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleImplToJson(
      this,
    );
  }
}

abstract class _Schedule extends Schedule {
  const factory _Schedule(
      {@_DateTimeToLocalConverter() required final DateTime date,
      @_DateTimeToLocalConverter() required final DateTime start,
      @_DateTimeToLocalConverter() required final DateTime end,
      required final String title,
      required final Area resourceId,
      required final ScheduleExtraData event}) = _$ScheduleImpl;
  const _Schedule._() : super._();

  factory _Schedule.fromJson(Map<String, dynamic> json) =
      _$ScheduleImpl.fromJson;

  @override
  @_DateTimeToLocalConverter()
  DateTime get date;
  @override
  @_DateTimeToLocalConverter()
  DateTime get start;
  @override
  @_DateTimeToLocalConverter()
  DateTime get end;
  @override
  String get title;
  @override
  Area get resourceId;
  @override
  ScheduleExtraData get event;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleImplCopyWith<_$ScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ScheduleExtraData _$ScheduleExtraDataFromJson(Map<String, dynamic> json) {
  return _ScheduleExtraData.fromJson(json);
}

/// @nodoc
mixin _$ScheduleExtraData {
  String get id => throw _privateConstructorUsedError;
  @_DateTimeToLocalConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @_DateTimeToLocalConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  ClassDetails get classDetails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleExtraDataCopyWith<ScheduleExtraData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleExtraDataCopyWith<$Res> {
  factory $ScheduleExtraDataCopyWith(
          ScheduleExtraData value, $Res Function(ScheduleExtraData) then) =
      _$ScheduleExtraDataCopyWithImpl<$Res, ScheduleExtraData>;
  @useResult
  $Res call(
      {String id,
      @_DateTimeToLocalConverter() DateTime createdAt,
      @_DateTimeToLocalConverter() DateTime updatedAt,
      ClassDetails classDetails});

  $ClassDetailsCopyWith<$Res> get classDetails;
}

/// @nodoc
class _$ScheduleExtraDataCopyWithImpl<$Res, $Val extends ScheduleExtraData>
    implements $ScheduleExtraDataCopyWith<$Res> {
  _$ScheduleExtraDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? classDetails = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      classDetails: null == classDetails
          ? _value.classDetails
          : classDetails // ignore: cast_nullable_to_non_nullable
              as ClassDetails,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClassDetailsCopyWith<$Res> get classDetails {
    return $ClassDetailsCopyWith<$Res>(_value.classDetails, (value) {
      return _then(_value.copyWith(classDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScheduleExtraDataImplCopyWith<$Res>
    implements $ScheduleExtraDataCopyWith<$Res> {
  factory _$$ScheduleExtraDataImplCopyWith(_$ScheduleExtraDataImpl value,
          $Res Function(_$ScheduleExtraDataImpl) then) =
      __$$ScheduleExtraDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @_DateTimeToLocalConverter() DateTime createdAt,
      @_DateTimeToLocalConverter() DateTime updatedAt,
      ClassDetails classDetails});

  @override
  $ClassDetailsCopyWith<$Res> get classDetails;
}

/// @nodoc
class __$$ScheduleExtraDataImplCopyWithImpl<$Res>
    extends _$ScheduleExtraDataCopyWithImpl<$Res, _$ScheduleExtraDataImpl>
    implements _$$ScheduleExtraDataImplCopyWith<$Res> {
  __$$ScheduleExtraDataImplCopyWithImpl(_$ScheduleExtraDataImpl _value,
      $Res Function(_$ScheduleExtraDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? classDetails = null,
  }) {
    return _then(_$ScheduleExtraDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      classDetails: null == classDetails
          ? _value.classDetails
          : classDetails // ignore: cast_nullable_to_non_nullable
              as ClassDetails,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleExtraDataImpl implements _ScheduleExtraData {
  const _$ScheduleExtraDataImpl(
      {required this.id,
      @_DateTimeToLocalConverter() required this.createdAt,
      @_DateTimeToLocalConverter() required this.updatedAt,
      required this.classDetails});

  factory _$ScheduleExtraDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleExtraDataImplFromJson(json);

  @override
  final String id;
  @override
  @_DateTimeToLocalConverter()
  final DateTime createdAt;
  @override
  @_DateTimeToLocalConverter()
  final DateTime updatedAt;
  @override
  final ClassDetails classDetails;

  @override
  String toString() {
    return 'ScheduleExtraData(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, classDetails: $classDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleExtraDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.classDetails, classDetails) ||
                other.classDetails == classDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, createdAt, updatedAt, classDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleExtraDataImplCopyWith<_$ScheduleExtraDataImpl> get copyWith =>
      __$$ScheduleExtraDataImplCopyWithImpl<_$ScheduleExtraDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleExtraDataImplToJson(
      this,
    );
  }
}

abstract class _ScheduleExtraData implements ScheduleExtraData {
  const factory _ScheduleExtraData(
      {required final String id,
      @_DateTimeToLocalConverter() required final DateTime createdAt,
      @_DateTimeToLocalConverter() required final DateTime updatedAt,
      required final ClassDetails classDetails}) = _$ScheduleExtraDataImpl;

  factory _ScheduleExtraData.fromJson(Map<String, dynamic> json) =
      _$ScheduleExtraDataImpl.fromJson;

  @override
  String get id;
  @override
  @_DateTimeToLocalConverter()
  DateTime get createdAt;
  @override
  @_DateTimeToLocalConverter()
  DateTime get updatedAt;
  @override
  ClassDetails get classDetails;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleExtraDataImplCopyWith<_$ScheduleExtraDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClassDetails _$ClassDetailsFromJson(Map<String, dynamic> json) {
  return _ClassDetails.fromJson(json);
}

/// @nodoc
mixin _$ClassDetails {
  Area get area => throw _privateConstructorUsedError;
  Level get level => throw _privateConstructorUsedError;
  bool get isBookedByMe => throw _privateConstructorUsedError;
  bool get isWaitingByMe => throw _privateConstructorUsedError;
  bool get isBookAvailable => throw _privateConstructorUsedError;
  bool get isWaitAvailable => throw _privateConstructorUsedError;
  bool get isConfirmBook => throw _privateConstructorUsedError;
  bool get isEarlyBookingAvailable => throw _privateConstructorUsedError;
  bool get isCP => throw _privateConstructorUsedError;
  bool get isFull => throw _privateConstructorUsedError;
  bool get isBookingAvailable => throw _privateConstructorUsedError;
  bool get isPast => throw _privateConstructorUsedError;
  bool get isHIIT => throw _privateConstructorUsedError;
  bool get isAttendable => throw _privateConstructorUsedError;
  bool get isGroupAttendance => throw _privateConstructorUsedError;
  bool get isZoom => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClassDetailsCopyWith<ClassDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassDetailsCopyWith<$Res> {
  factory $ClassDetailsCopyWith(
          ClassDetails value, $Res Function(ClassDetails) then) =
      _$ClassDetailsCopyWithImpl<$Res, ClassDetails>;
  @useResult
  $Res call(
      {Area area,
      Level level,
      bool isBookedByMe,
      bool isWaitingByMe,
      bool isBookAvailable,
      bool isWaitAvailable,
      bool isConfirmBook,
      bool isEarlyBookingAvailable,
      bool isCP,
      bool isFull,
      bool isBookingAvailable,
      bool isPast,
      bool isHIIT,
      bool isAttendable,
      bool isGroupAttendance,
      bool isZoom});
}

/// @nodoc
class _$ClassDetailsCopyWithImpl<$Res, $Val extends ClassDetails>
    implements $ClassDetailsCopyWith<$Res> {
  _$ClassDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? area = null,
    Object? level = null,
    Object? isBookedByMe = null,
    Object? isWaitingByMe = null,
    Object? isBookAvailable = null,
    Object? isWaitAvailable = null,
    Object? isConfirmBook = null,
    Object? isEarlyBookingAvailable = null,
    Object? isCP = null,
    Object? isFull = null,
    Object? isBookingAvailable = null,
    Object? isPast = null,
    Object? isHIIT = null,
    Object? isAttendable = null,
    Object? isGroupAttendance = null,
    Object? isZoom = null,
  }) {
    return _then(_value.copyWith(
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as Area,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as Level,
      isBookedByMe: null == isBookedByMe
          ? _value.isBookedByMe
          : isBookedByMe // ignore: cast_nullable_to_non_nullable
              as bool,
      isWaitingByMe: null == isWaitingByMe
          ? _value.isWaitingByMe
          : isWaitingByMe // ignore: cast_nullable_to_non_nullable
              as bool,
      isBookAvailable: null == isBookAvailable
          ? _value.isBookAvailable
          : isBookAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      isWaitAvailable: null == isWaitAvailable
          ? _value.isWaitAvailable
          : isWaitAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmBook: null == isConfirmBook
          ? _value.isConfirmBook
          : isConfirmBook // ignore: cast_nullable_to_non_nullable
              as bool,
      isEarlyBookingAvailable: null == isEarlyBookingAvailable
          ? _value.isEarlyBookingAvailable
          : isEarlyBookingAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      isCP: null == isCP
          ? _value.isCP
          : isCP // ignore: cast_nullable_to_non_nullable
              as bool,
      isFull: null == isFull
          ? _value.isFull
          : isFull // ignore: cast_nullable_to_non_nullable
              as bool,
      isBookingAvailable: null == isBookingAvailable
          ? _value.isBookingAvailable
          : isBookingAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      isPast: null == isPast
          ? _value.isPast
          : isPast // ignore: cast_nullable_to_non_nullable
              as bool,
      isHIIT: null == isHIIT
          ? _value.isHIIT
          : isHIIT // ignore: cast_nullable_to_non_nullable
              as bool,
      isAttendable: null == isAttendable
          ? _value.isAttendable
          : isAttendable // ignore: cast_nullable_to_non_nullable
              as bool,
      isGroupAttendance: null == isGroupAttendance
          ? _value.isGroupAttendance
          : isGroupAttendance // ignore: cast_nullable_to_non_nullable
              as bool,
      isZoom: null == isZoom
          ? _value.isZoom
          : isZoom // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClassDetailsImplCopyWith<$Res>
    implements $ClassDetailsCopyWith<$Res> {
  factory _$$ClassDetailsImplCopyWith(
          _$ClassDetailsImpl value, $Res Function(_$ClassDetailsImpl) then) =
      __$$ClassDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Area area,
      Level level,
      bool isBookedByMe,
      bool isWaitingByMe,
      bool isBookAvailable,
      bool isWaitAvailable,
      bool isConfirmBook,
      bool isEarlyBookingAvailable,
      bool isCP,
      bool isFull,
      bool isBookingAvailable,
      bool isPast,
      bool isHIIT,
      bool isAttendable,
      bool isGroupAttendance,
      bool isZoom});
}

/// @nodoc
class __$$ClassDetailsImplCopyWithImpl<$Res>
    extends _$ClassDetailsCopyWithImpl<$Res, _$ClassDetailsImpl>
    implements _$$ClassDetailsImplCopyWith<$Res> {
  __$$ClassDetailsImplCopyWithImpl(
      _$ClassDetailsImpl _value, $Res Function(_$ClassDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? area = null,
    Object? level = null,
    Object? isBookedByMe = null,
    Object? isWaitingByMe = null,
    Object? isBookAvailable = null,
    Object? isWaitAvailable = null,
    Object? isConfirmBook = null,
    Object? isEarlyBookingAvailable = null,
    Object? isCP = null,
    Object? isFull = null,
    Object? isBookingAvailable = null,
    Object? isPast = null,
    Object? isHIIT = null,
    Object? isAttendable = null,
    Object? isGroupAttendance = null,
    Object? isZoom = null,
  }) {
    return _then(_$ClassDetailsImpl(
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as Area,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as Level,
      isBookedByMe: null == isBookedByMe
          ? _value.isBookedByMe
          : isBookedByMe // ignore: cast_nullable_to_non_nullable
              as bool,
      isWaitingByMe: null == isWaitingByMe
          ? _value.isWaitingByMe
          : isWaitingByMe // ignore: cast_nullable_to_non_nullable
              as bool,
      isBookAvailable: null == isBookAvailable
          ? _value.isBookAvailable
          : isBookAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      isWaitAvailable: null == isWaitAvailable
          ? _value.isWaitAvailable
          : isWaitAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmBook: null == isConfirmBook
          ? _value.isConfirmBook
          : isConfirmBook // ignore: cast_nullable_to_non_nullable
              as bool,
      isEarlyBookingAvailable: null == isEarlyBookingAvailable
          ? _value.isEarlyBookingAvailable
          : isEarlyBookingAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      isCP: null == isCP
          ? _value.isCP
          : isCP // ignore: cast_nullable_to_non_nullable
              as bool,
      isFull: null == isFull
          ? _value.isFull
          : isFull // ignore: cast_nullable_to_non_nullable
              as bool,
      isBookingAvailable: null == isBookingAvailable
          ? _value.isBookingAvailable
          : isBookingAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      isPast: null == isPast
          ? _value.isPast
          : isPast // ignore: cast_nullable_to_non_nullable
              as bool,
      isHIIT: null == isHIIT
          ? _value.isHIIT
          : isHIIT // ignore: cast_nullable_to_non_nullable
              as bool,
      isAttendable: null == isAttendable
          ? _value.isAttendable
          : isAttendable // ignore: cast_nullable_to_non_nullable
              as bool,
      isGroupAttendance: null == isGroupAttendance
          ? _value.isGroupAttendance
          : isGroupAttendance // ignore: cast_nullable_to_non_nullable
              as bool,
      isZoom: null == isZoom
          ? _value.isZoom
          : isZoom // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClassDetailsImpl extends _ClassDetails {
  const _$ClassDetailsImpl(
      {required this.area,
      required this.level,
      required this.isBookedByMe,
      required this.isWaitingByMe,
      required this.isBookAvailable,
      required this.isWaitAvailable,
      required this.isConfirmBook,
      required this.isEarlyBookingAvailable,
      required this.isCP,
      required this.isFull,
      required this.isBookingAvailable,
      required this.isPast,
      required this.isHIIT,
      required this.isAttendable,
      required this.isGroupAttendance,
      required this.isZoom})
      : super._();

  factory _$ClassDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClassDetailsImplFromJson(json);

  @override
  final Area area;
  @override
  final Level level;
  @override
  final bool isBookedByMe;
  @override
  final bool isWaitingByMe;
  @override
  final bool isBookAvailable;
  @override
  final bool isWaitAvailable;
  @override
  final bool isConfirmBook;
  @override
  final bool isEarlyBookingAvailable;
  @override
  final bool isCP;
  @override
  final bool isFull;
  @override
  final bool isBookingAvailable;
  @override
  final bool isPast;
  @override
  final bool isHIIT;
  @override
  final bool isAttendable;
  @override
  final bool isGroupAttendance;
  @override
  final bool isZoom;

  @override
  String toString() {
    return 'ClassDetails(area: $area, level: $level, isBookedByMe: $isBookedByMe, isWaitingByMe: $isWaitingByMe, isBookAvailable: $isBookAvailable, isWaitAvailable: $isWaitAvailable, isConfirmBook: $isConfirmBook, isEarlyBookingAvailable: $isEarlyBookingAvailable, isCP: $isCP, isFull: $isFull, isBookingAvailable: $isBookingAvailable, isPast: $isPast, isHIIT: $isHIIT, isAttendable: $isAttendable, isGroupAttendance: $isGroupAttendance, isZoom: $isZoom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassDetailsImpl &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.isBookedByMe, isBookedByMe) ||
                other.isBookedByMe == isBookedByMe) &&
            (identical(other.isWaitingByMe, isWaitingByMe) ||
                other.isWaitingByMe == isWaitingByMe) &&
            (identical(other.isBookAvailable, isBookAvailable) ||
                other.isBookAvailable == isBookAvailable) &&
            (identical(other.isWaitAvailable, isWaitAvailable) ||
                other.isWaitAvailable == isWaitAvailable) &&
            (identical(other.isConfirmBook, isConfirmBook) ||
                other.isConfirmBook == isConfirmBook) &&
            (identical(
                    other.isEarlyBookingAvailable, isEarlyBookingAvailable) ||
                other.isEarlyBookingAvailable == isEarlyBookingAvailable) &&
            (identical(other.isCP, isCP) || other.isCP == isCP) &&
            (identical(other.isFull, isFull) || other.isFull == isFull) &&
            (identical(other.isBookingAvailable, isBookingAvailable) ||
                other.isBookingAvailable == isBookingAvailable) &&
            (identical(other.isPast, isPast) || other.isPast == isPast) &&
            (identical(other.isHIIT, isHIIT) || other.isHIIT == isHIIT) &&
            (identical(other.isAttendable, isAttendable) ||
                other.isAttendable == isAttendable) &&
            (identical(other.isGroupAttendance, isGroupAttendance) ||
                other.isGroupAttendance == isGroupAttendance) &&
            (identical(other.isZoom, isZoom) || other.isZoom == isZoom));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      area,
      level,
      isBookedByMe,
      isWaitingByMe,
      isBookAvailable,
      isWaitAvailable,
      isConfirmBook,
      isEarlyBookingAvailable,
      isCP,
      isFull,
      isBookingAvailable,
      isPast,
      isHIIT,
      isAttendable,
      isGroupAttendance,
      isZoom);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassDetailsImplCopyWith<_$ClassDetailsImpl> get copyWith =>
      __$$ClassDetailsImplCopyWithImpl<_$ClassDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClassDetailsImplToJson(
      this,
    );
  }
}

abstract class _ClassDetails extends ClassDetails {
  const factory _ClassDetails(
      {required final Area area,
      required final Level level,
      required final bool isBookedByMe,
      required final bool isWaitingByMe,
      required final bool isBookAvailable,
      required final bool isWaitAvailable,
      required final bool isConfirmBook,
      required final bool isEarlyBookingAvailable,
      required final bool isCP,
      required final bool isFull,
      required final bool isBookingAvailable,
      required final bool isPast,
      required final bool isHIIT,
      required final bool isAttendable,
      required final bool isGroupAttendance,
      required final bool isZoom}) = _$ClassDetailsImpl;
  const _ClassDetails._() : super._();

  factory _ClassDetails.fromJson(Map<String, dynamic> json) =
      _$ClassDetailsImpl.fromJson;

  @override
  Area get area;
  @override
  Level get level;
  @override
  bool get isBookedByMe;
  @override
  bool get isWaitingByMe;
  @override
  bool get isBookAvailable;
  @override
  bool get isWaitAvailable;
  @override
  bool get isConfirmBook;
  @override
  bool get isEarlyBookingAvailable;
  @override
  bool get isCP;
  @override
  bool get isFull;
  @override
  bool get isBookingAvailable;
  @override
  bool get isPast;
  @override
  bool get isHIIT;
  @override
  bool get isAttendable;
  @override
  bool get isGroupAttendance;
  @override
  bool get isZoom;
  @override
  @JsonKey(ignore: true)
  _$$ClassDetailsImplCopyWith<_$ClassDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
