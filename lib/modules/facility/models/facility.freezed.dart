// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FacilityExtraData _$FacilityExtraDataFromJson(Map<String, dynamic> json) {
  return _FacilityExtraData.fromJson(json);
}

/// @nodoc
mixin _$FacilityExtraData {
  Facility get key => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get shortName => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<AreaExtraData> get areas => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacilityExtraDataCopyWith<FacilityExtraData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityExtraDataCopyWith<$Res> {
  factory $FacilityExtraDataCopyWith(
          FacilityExtraData value, $Res Function(FacilityExtraData) then) =
      _$FacilityExtraDataCopyWithImpl<$Res, FacilityExtraData>;
  @useResult
  $Res call(
      {Facility key,
      String name,
      String shortName,
      String title,
      List<AreaExtraData> areas});
}

/// @nodoc
class _$FacilityExtraDataCopyWithImpl<$Res, $Val extends FacilityExtraData>
    implements $FacilityExtraDataCopyWith<$Res> {
  _$FacilityExtraDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? shortName = null,
    Object? title = null,
    Object? areas = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as Facility,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      areas: null == areas
          ? _value.areas
          : areas // ignore: cast_nullable_to_non_nullable
              as List<AreaExtraData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FacilityExtraDataImplCopyWith<$Res>
    implements $FacilityExtraDataCopyWith<$Res> {
  factory _$$FacilityExtraDataImplCopyWith(_$FacilityExtraDataImpl value,
          $Res Function(_$FacilityExtraDataImpl) then) =
      __$$FacilityExtraDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Facility key,
      String name,
      String shortName,
      String title,
      List<AreaExtraData> areas});
}

/// @nodoc
class __$$FacilityExtraDataImplCopyWithImpl<$Res>
    extends _$FacilityExtraDataCopyWithImpl<$Res, _$FacilityExtraDataImpl>
    implements _$$FacilityExtraDataImplCopyWith<$Res> {
  __$$FacilityExtraDataImplCopyWithImpl(_$FacilityExtraDataImpl _value,
      $Res Function(_$FacilityExtraDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? shortName = null,
    Object? title = null,
    Object? areas = null,
  }) {
    return _then(_$FacilityExtraDataImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as Facility,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      areas: null == areas
          ? _value._areas
          : areas // ignore: cast_nullable_to_non_nullable
              as List<AreaExtraData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FacilityExtraDataImpl implements _FacilityExtraData {
  const _$FacilityExtraDataImpl(
      {required this.key,
      required this.name,
      required this.shortName,
      required this.title,
      required final List<AreaExtraData> areas})
      : _areas = areas;

  factory _$FacilityExtraDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$FacilityExtraDataImplFromJson(json);

  @override
  final Facility key;
  @override
  final String name;
  @override
  final String shortName;
  @override
  final String title;
  final List<AreaExtraData> _areas;
  @override
  List<AreaExtraData> get areas {
    if (_areas is EqualUnmodifiableListView) return _areas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_areas);
  }

  @override
  String toString() {
    return 'FacilityExtraData(key: $key, name: $name, shortName: $shortName, title: $title, areas: $areas)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacilityExtraDataImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._areas, _areas));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, key, name, shortName, title,
      const DeepCollectionEquality().hash(_areas));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FacilityExtraDataImplCopyWith<_$FacilityExtraDataImpl> get copyWith =>
      __$$FacilityExtraDataImplCopyWithImpl<_$FacilityExtraDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FacilityExtraDataImplToJson(
      this,
    );
  }
}

abstract class _FacilityExtraData implements FacilityExtraData {
  const factory _FacilityExtraData(
      {required final Facility key,
      required final String name,
      required final String shortName,
      required final String title,
      required final List<AreaExtraData> areas}) = _$FacilityExtraDataImpl;

  factory _FacilityExtraData.fromJson(Map<String, dynamic> json) =
      _$FacilityExtraDataImpl.fromJson;

  @override
  Facility get key;
  @override
  String get name;
  @override
  String get shortName;
  @override
  String get title;
  @override
  List<AreaExtraData> get areas;
  @override
  @JsonKey(ignore: true)
  _$$FacilityExtraDataImplCopyWith<_$FacilityExtraDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AreaExtraData _$AreaExtraDataFromJson(Map<String, dynamic> json) {
  return _AreaExtraData.fromJson(json);
}

/// @nodoc
mixin _$AreaExtraData {
  Area get key => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get shortName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AreaExtraDataCopyWith<AreaExtraData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AreaExtraDataCopyWith<$Res> {
  factory $AreaExtraDataCopyWith(
          AreaExtraData value, $Res Function(AreaExtraData) then) =
      _$AreaExtraDataCopyWithImpl<$Res, AreaExtraData>;
  @useResult
  $Res call({Area key, String name, String shortName});
}

/// @nodoc
class _$AreaExtraDataCopyWithImpl<$Res, $Val extends AreaExtraData>
    implements $AreaExtraDataCopyWith<$Res> {
  _$AreaExtraDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? shortName = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as Area,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AreaExtraDataImplCopyWith<$Res>
    implements $AreaExtraDataCopyWith<$Res> {
  factory _$$AreaExtraDataImplCopyWith(
          _$AreaExtraDataImpl value, $Res Function(_$AreaExtraDataImpl) then) =
      __$$AreaExtraDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Area key, String name, String shortName});
}

/// @nodoc
class __$$AreaExtraDataImplCopyWithImpl<$Res>
    extends _$AreaExtraDataCopyWithImpl<$Res, _$AreaExtraDataImpl>
    implements _$$AreaExtraDataImplCopyWith<$Res> {
  __$$AreaExtraDataImplCopyWithImpl(
      _$AreaExtraDataImpl _value, $Res Function(_$AreaExtraDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? shortName = null,
  }) {
    return _then(_$AreaExtraDataImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as Area,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AreaExtraDataImpl implements _AreaExtraData {
  const _$AreaExtraDataImpl(
      {required this.key, required this.name, required this.shortName});

  factory _$AreaExtraDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AreaExtraDataImplFromJson(json);

  @override
  final Area key;
  @override
  final String name;
  @override
  final String shortName;

  @override
  String toString() {
    return 'AreaExtraData(key: $key, name: $name, shortName: $shortName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AreaExtraDataImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, key, name, shortName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AreaExtraDataImplCopyWith<_$AreaExtraDataImpl> get copyWith =>
      __$$AreaExtraDataImplCopyWithImpl<_$AreaExtraDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AreaExtraDataImplToJson(
      this,
    );
  }
}

abstract class _AreaExtraData implements AreaExtraData {
  const factory _AreaExtraData(
      {required final Area key,
      required final String name,
      required final String shortName}) = _$AreaExtraDataImpl;

  factory _AreaExtraData.fromJson(Map<String, dynamic> json) =
      _$AreaExtraDataImpl.fromJson;

  @override
  Area get key;
  @override
  String get name;
  @override
  String get shortName;
  @override
  @JsonKey(ignore: true)
  _$$AreaExtraDataImplCopyWith<_$AreaExtraDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
