// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationSettingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration notifyBefore) enabled,
    required TResult Function() disabled,
    required TResult Function() noPermissions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Duration notifyBefore)? enabled,
    TResult? Function()? disabled,
    TResult? Function()? noPermissions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration notifyBefore)? enabled,
    TResult Function()? disabled,
    TResult Function()? noPermissions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Enabled value) enabled,
    required TResult Function(_Disabled value) disabled,
    required TResult Function(_NoPermissions value) noPermissions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Enabled value)? enabled,
    TResult? Function(_Disabled value)? disabled,
    TResult? Function(_NoPermissions value)? noPermissions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Enabled value)? enabled,
    TResult Function(_Disabled value)? disabled,
    TResult Function(_NoPermissions value)? noPermissions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSettingsStateCopyWith<$Res> {
  factory $NotificationSettingsStateCopyWith(NotificationSettingsState value,
          $Res Function(NotificationSettingsState) then) =
      _$NotificationSettingsStateCopyWithImpl<$Res, NotificationSettingsState>;
}

/// @nodoc
class _$NotificationSettingsStateCopyWithImpl<$Res,
        $Val extends NotificationSettingsState>
    implements $NotificationSettingsStateCopyWith<$Res> {
  _$NotificationSettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EnabledImplCopyWith<$Res> {
  factory _$$EnabledImplCopyWith(
          _$EnabledImpl value, $Res Function(_$EnabledImpl) then) =
      __$$EnabledImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Duration notifyBefore});
}

/// @nodoc
class __$$EnabledImplCopyWithImpl<$Res>
    extends _$NotificationSettingsStateCopyWithImpl<$Res, _$EnabledImpl>
    implements _$$EnabledImplCopyWith<$Res> {
  __$$EnabledImplCopyWithImpl(
      _$EnabledImpl _value, $Res Function(_$EnabledImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifyBefore = null,
  }) {
    return _then(_$EnabledImpl(
      notifyBefore: null == notifyBefore
          ? _value.notifyBefore
          : notifyBefore // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$EnabledImpl extends _Enabled {
  const _$EnabledImpl({required this.notifyBefore}) : super._();

  @override
  final Duration notifyBefore;

  @override
  String toString() {
    return 'NotificationSettingsState.enabled(notifyBefore: $notifyBefore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnabledImpl &&
            (identical(other.notifyBefore, notifyBefore) ||
                other.notifyBefore == notifyBefore));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notifyBefore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnabledImplCopyWith<_$EnabledImpl> get copyWith =>
      __$$EnabledImplCopyWithImpl<_$EnabledImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration notifyBefore) enabled,
    required TResult Function() disabled,
    required TResult Function() noPermissions,
  }) {
    return enabled(notifyBefore);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Duration notifyBefore)? enabled,
    TResult? Function()? disabled,
    TResult? Function()? noPermissions,
  }) {
    return enabled?.call(notifyBefore);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration notifyBefore)? enabled,
    TResult Function()? disabled,
    TResult Function()? noPermissions,
    required TResult orElse(),
  }) {
    if (enabled != null) {
      return enabled(notifyBefore);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Enabled value) enabled,
    required TResult Function(_Disabled value) disabled,
    required TResult Function(_NoPermissions value) noPermissions,
  }) {
    return enabled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Enabled value)? enabled,
    TResult? Function(_Disabled value)? disabled,
    TResult? Function(_NoPermissions value)? noPermissions,
  }) {
    return enabled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Enabled value)? enabled,
    TResult Function(_Disabled value)? disabled,
    TResult Function(_NoPermissions value)? noPermissions,
    required TResult orElse(),
  }) {
    if (enabled != null) {
      return enabled(this);
    }
    return orElse();
  }
}

abstract class _Enabled extends NotificationSettingsState {
  const factory _Enabled({required final Duration notifyBefore}) =
      _$EnabledImpl;
  const _Enabled._() : super._();

  Duration get notifyBefore;
  @JsonKey(ignore: true)
  _$$EnabledImplCopyWith<_$EnabledImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DisabledImplCopyWith<$Res> {
  factory _$$DisabledImplCopyWith(
          _$DisabledImpl value, $Res Function(_$DisabledImpl) then) =
      __$$DisabledImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DisabledImplCopyWithImpl<$Res>
    extends _$NotificationSettingsStateCopyWithImpl<$Res, _$DisabledImpl>
    implements _$$DisabledImplCopyWith<$Res> {
  __$$DisabledImplCopyWithImpl(
      _$DisabledImpl _value, $Res Function(_$DisabledImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DisabledImpl extends _Disabled {
  const _$DisabledImpl() : super._();

  @override
  String toString() {
    return 'NotificationSettingsState.disabled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DisabledImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration notifyBefore) enabled,
    required TResult Function() disabled,
    required TResult Function() noPermissions,
  }) {
    return disabled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Duration notifyBefore)? enabled,
    TResult? Function()? disabled,
    TResult? Function()? noPermissions,
  }) {
    return disabled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration notifyBefore)? enabled,
    TResult Function()? disabled,
    TResult Function()? noPermissions,
    required TResult orElse(),
  }) {
    if (disabled != null) {
      return disabled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Enabled value) enabled,
    required TResult Function(_Disabled value) disabled,
    required TResult Function(_NoPermissions value) noPermissions,
  }) {
    return disabled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Enabled value)? enabled,
    TResult? Function(_Disabled value)? disabled,
    TResult? Function(_NoPermissions value)? noPermissions,
  }) {
    return disabled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Enabled value)? enabled,
    TResult Function(_Disabled value)? disabled,
    TResult Function(_NoPermissions value)? noPermissions,
    required TResult orElse(),
  }) {
    if (disabled != null) {
      return disabled(this);
    }
    return orElse();
  }
}

abstract class _Disabled extends NotificationSettingsState {
  const factory _Disabled() = _$DisabledImpl;
  const _Disabled._() : super._();
}

/// @nodoc
abstract class _$$NoPermissionsImplCopyWith<$Res> {
  factory _$$NoPermissionsImplCopyWith(
          _$NoPermissionsImpl value, $Res Function(_$NoPermissionsImpl) then) =
      __$$NoPermissionsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoPermissionsImplCopyWithImpl<$Res>
    extends _$NotificationSettingsStateCopyWithImpl<$Res, _$NoPermissionsImpl>
    implements _$$NoPermissionsImplCopyWith<$Res> {
  __$$NoPermissionsImplCopyWithImpl(
      _$NoPermissionsImpl _value, $Res Function(_$NoPermissionsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoPermissionsImpl extends _NoPermissions {
  const _$NoPermissionsImpl() : super._();

  @override
  String toString() {
    return 'NotificationSettingsState.noPermissions()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoPermissionsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration notifyBefore) enabled,
    required TResult Function() disabled,
    required TResult Function() noPermissions,
  }) {
    return noPermissions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Duration notifyBefore)? enabled,
    TResult? Function()? disabled,
    TResult? Function()? noPermissions,
  }) {
    return noPermissions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration notifyBefore)? enabled,
    TResult Function()? disabled,
    TResult Function()? noPermissions,
    required TResult orElse(),
  }) {
    if (noPermissions != null) {
      return noPermissions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Enabled value) enabled,
    required TResult Function(_Disabled value) disabled,
    required TResult Function(_NoPermissions value) noPermissions,
  }) {
    return noPermissions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Enabled value)? enabled,
    TResult? Function(_Disabled value)? disabled,
    TResult? Function(_NoPermissions value)? noPermissions,
  }) {
    return noPermissions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Enabled value)? enabled,
    TResult Function(_Disabled value)? disabled,
    TResult Function(_NoPermissions value)? noPermissions,
    required TResult orElse(),
  }) {
    if (noPermissions != null) {
      return noPermissions(this);
    }
    return orElse();
  }
}

abstract class _NoPermissions extends NotificationSettingsState {
  const factory _NoPermissions() = _$NoPermissionsImpl;
  const _NoPermissions._() : super._();
}
