// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upcoming_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpcomingNotification {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  DateTime get dt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpcomingNotificationCopyWith<UpcomingNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpcomingNotificationCopyWith<$Res> {
  factory $UpcomingNotificationCopyWith(UpcomingNotification value,
          $Res Function(UpcomingNotification) then) =
      _$UpcomingNotificationCopyWithImpl<$Res, UpcomingNotification>;
  @useResult
  $Res call({int id, String title, String body, DateTime dt});
}

/// @nodoc
class _$UpcomingNotificationCopyWithImpl<$Res,
        $Val extends UpcomingNotification>
    implements $UpcomingNotificationCopyWith<$Res> {
  _$UpcomingNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? dt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      dt: null == dt
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpcomingNotificationImplCopyWith<$Res>
    implements $UpcomingNotificationCopyWith<$Res> {
  factory _$$UpcomingNotificationImplCopyWith(_$UpcomingNotificationImpl value,
          $Res Function(_$UpcomingNotificationImpl) then) =
      __$$UpcomingNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String body, DateTime dt});
}

/// @nodoc
class __$$UpcomingNotificationImplCopyWithImpl<$Res>
    extends _$UpcomingNotificationCopyWithImpl<$Res, _$UpcomingNotificationImpl>
    implements _$$UpcomingNotificationImplCopyWith<$Res> {
  __$$UpcomingNotificationImplCopyWithImpl(_$UpcomingNotificationImpl _value,
      $Res Function(_$UpcomingNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? dt = null,
  }) {
    return _then(_$UpcomingNotificationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      dt: null == dt
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$UpcomingNotificationImpl extends _UpcomingNotification {
  const _$UpcomingNotificationImpl(
      {required this.id,
      required this.title,
      required this.body,
      required this.dt})
      : super._();

  @override
  final int id;
  @override
  final String title;
  @override
  final String body;
  @override
  final DateTime dt;

  @override
  String toString() {
    return 'UpcomingNotification(id: $id, title: $title, body: $body, dt: $dt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpcomingNotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.dt, dt) || other.dt == dt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, body, dt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpcomingNotificationImplCopyWith<_$UpcomingNotificationImpl>
      get copyWith =>
          __$$UpcomingNotificationImplCopyWithImpl<_$UpcomingNotificationImpl>(
              this, _$identity);
}

abstract class _UpcomingNotification extends UpcomingNotification {
  const factory _UpcomingNotification(
      {required final int id,
      required final String title,
      required final String body,
      required final DateTime dt}) = _$UpcomingNotificationImpl;
  const _UpcomingNotification._() : super._();

  @override
  int get id;
  @override
  String get title;
  @override
  String get body;
  @override
  DateTime get dt;
  @override
  @JsonKey(ignore: true)
  _$$UpcomingNotificationImplCopyWith<_$UpcomingNotificationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
