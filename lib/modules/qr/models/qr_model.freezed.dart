// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QRModel _$QRModelFromJson(Map<String, dynamic> json) {
  return _QRModel.fromJson(json);
}

/// @nodoc
mixin _$QRModel {
  QrEyeShape get eyeShape => throw _privateConstructorUsedError;
  QrDataModuleShape get dataModuleShape => throw _privateConstructorUsedError;
  double get shakeThresholdForce => throw _privateConstructorUsedError;
  Duration get debounce => throw _privateConstructorUsedError;
  Duration get shakeCountReset => throw _privateConstructorUsedError;
  int get shakeCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QRModelCopyWith<QRModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QRModelCopyWith<$Res> {
  factory $QRModelCopyWith(QRModel value, $Res Function(QRModel) then) =
      _$QRModelCopyWithImpl<$Res, QRModel>;
  @useResult
  $Res call(
      {QrEyeShape eyeShape,
      QrDataModuleShape dataModuleShape,
      double shakeThresholdForce,
      Duration debounce,
      Duration shakeCountReset,
      int shakeCount});
}

/// @nodoc
class _$QRModelCopyWithImpl<$Res, $Val extends QRModel>
    implements $QRModelCopyWith<$Res> {
  _$QRModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eyeShape = null,
    Object? dataModuleShape = null,
    Object? shakeThresholdForce = null,
    Object? debounce = null,
    Object? shakeCountReset = null,
    Object? shakeCount = null,
  }) {
    return _then(_value.copyWith(
      eyeShape: null == eyeShape
          ? _value.eyeShape
          : eyeShape // ignore: cast_nullable_to_non_nullable
              as QrEyeShape,
      dataModuleShape: null == dataModuleShape
          ? _value.dataModuleShape
          : dataModuleShape // ignore: cast_nullable_to_non_nullable
              as QrDataModuleShape,
      shakeThresholdForce: null == shakeThresholdForce
          ? _value.shakeThresholdForce
          : shakeThresholdForce // ignore: cast_nullable_to_non_nullable
              as double,
      debounce: null == debounce
          ? _value.debounce
          : debounce // ignore: cast_nullable_to_non_nullable
              as Duration,
      shakeCountReset: null == shakeCountReset
          ? _value.shakeCountReset
          : shakeCountReset // ignore: cast_nullable_to_non_nullable
              as Duration,
      shakeCount: null == shakeCount
          ? _value.shakeCount
          : shakeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QRModelImplCopyWith<$Res> implements $QRModelCopyWith<$Res> {
  factory _$$QRModelImplCopyWith(
          _$QRModelImpl value, $Res Function(_$QRModelImpl) then) =
      __$$QRModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {QrEyeShape eyeShape,
      QrDataModuleShape dataModuleShape,
      double shakeThresholdForce,
      Duration debounce,
      Duration shakeCountReset,
      int shakeCount});
}

/// @nodoc
class __$$QRModelImplCopyWithImpl<$Res>
    extends _$QRModelCopyWithImpl<$Res, _$QRModelImpl>
    implements _$$QRModelImplCopyWith<$Res> {
  __$$QRModelImplCopyWithImpl(
      _$QRModelImpl _value, $Res Function(_$QRModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eyeShape = null,
    Object? dataModuleShape = null,
    Object? shakeThresholdForce = null,
    Object? debounce = null,
    Object? shakeCountReset = null,
    Object? shakeCount = null,
  }) {
    return _then(_$QRModelImpl(
      eyeShape: null == eyeShape
          ? _value.eyeShape
          : eyeShape // ignore: cast_nullable_to_non_nullable
              as QrEyeShape,
      dataModuleShape: null == dataModuleShape
          ? _value.dataModuleShape
          : dataModuleShape // ignore: cast_nullable_to_non_nullable
              as QrDataModuleShape,
      shakeThresholdForce: null == shakeThresholdForce
          ? _value.shakeThresholdForce
          : shakeThresholdForce // ignore: cast_nullable_to_non_nullable
              as double,
      debounce: null == debounce
          ? _value.debounce
          : debounce // ignore: cast_nullable_to_non_nullable
              as Duration,
      shakeCountReset: null == shakeCountReset
          ? _value.shakeCountReset
          : shakeCountReset // ignore: cast_nullable_to_non_nullable
              as Duration,
      shakeCount: null == shakeCount
          ? _value.shakeCount
          : shakeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QRModelImpl extends _QRModel {
  const _$QRModelImpl(
      {this.eyeShape = QrEyeShape.circle,
      this.dataModuleShape = QrDataModuleShape.circle,
      this.shakeThresholdForce = 2.5,
      this.debounce = const Duration(milliseconds: 250),
      this.shakeCountReset = const Duration(seconds: 3),
      this.shakeCount = 1})
      : super._();

  factory _$QRModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QRModelImplFromJson(json);

  @override
  @JsonKey()
  final QrEyeShape eyeShape;
  @override
  @JsonKey()
  final QrDataModuleShape dataModuleShape;
  @override
  @JsonKey()
  final double shakeThresholdForce;
  @override
  @JsonKey()
  final Duration debounce;
  @override
  @JsonKey()
  final Duration shakeCountReset;
  @override
  @JsonKey()
  final int shakeCount;

  @override
  String toString() {
    return 'QRModel(eyeShape: $eyeShape, dataModuleShape: $dataModuleShape, shakeThresholdForce: $shakeThresholdForce, debounce: $debounce, shakeCountReset: $shakeCountReset, shakeCount: $shakeCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QRModelImpl &&
            (identical(other.eyeShape, eyeShape) ||
                other.eyeShape == eyeShape) &&
            (identical(other.dataModuleShape, dataModuleShape) ||
                other.dataModuleShape == dataModuleShape) &&
            (identical(other.shakeThresholdForce, shakeThresholdForce) ||
                other.shakeThresholdForce == shakeThresholdForce) &&
            (identical(other.debounce, debounce) ||
                other.debounce == debounce) &&
            (identical(other.shakeCountReset, shakeCountReset) ||
                other.shakeCountReset == shakeCountReset) &&
            (identical(other.shakeCount, shakeCount) ||
                other.shakeCount == shakeCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eyeShape, dataModuleShape,
      shakeThresholdForce, debounce, shakeCountReset, shakeCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QRModelImplCopyWith<_$QRModelImpl> get copyWith =>
      __$$QRModelImplCopyWithImpl<_$QRModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QRModelImplToJson(
      this,
    );
  }
}

abstract class _QRModel extends QRModel {
  const factory _QRModel(
      {final QrEyeShape eyeShape,
      final QrDataModuleShape dataModuleShape,
      final double shakeThresholdForce,
      final Duration debounce,
      final Duration shakeCountReset,
      final int shakeCount}) = _$QRModelImpl;
  const _QRModel._() : super._();

  factory _QRModel.fromJson(Map<String, dynamic> json) = _$QRModelImpl.fromJson;

  @override
  QrEyeShape get eyeShape;
  @override
  QrDataModuleShape get dataModuleShape;
  @override
  double get shakeThresholdForce;
  @override
  Duration get debounce;
  @override
  Duration get shakeCountReset;
  @override
  int get shakeCount;
  @override
  @JsonKey(ignore: true)
  _$$QRModelImplCopyWith<_$QRModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
