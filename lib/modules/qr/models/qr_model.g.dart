// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QRModelImpl _$$QRModelImplFromJson(Map<String, dynamic> json) =>
    _$QRModelImpl(
      eyeShape: $enumDecodeNullable(_$QrEyeShapeEnumMap, json['eyeShape']) ??
          QrEyeShape.circle,
      dataModuleShape: $enumDecodeNullable(
              _$QrDataModuleShapeEnumMap, json['dataModuleShape']) ??
          QrDataModuleShape.circle,
      shakeThresholdForce:
          (json['shakeThresholdForce'] as num?)?.toDouble() ?? 2.5,
      debounce: json['debounce'] == null
          ? const Duration(milliseconds: 250)
          : Duration(microseconds: json['debounce'] as int),
      shakeCountReset: json['shakeCountReset'] == null
          ? const Duration(seconds: 3)
          : Duration(microseconds: json['shakeCountReset'] as int),
      shakeCount: json['shakeCount'] as int? ?? 1,
    );

Map<String, dynamic> _$$QRModelImplToJson(_$QRModelImpl instance) =>
    <String, dynamic>{
      'eyeShape': _$QrEyeShapeEnumMap[instance.eyeShape]!,
      'dataModuleShape': _$QrDataModuleShapeEnumMap[instance.dataModuleShape]!,
      'shakeThresholdForce': instance.shakeThresholdForce,
      'debounce': instance.debounce.inMicroseconds,
      'shakeCountReset': instance.shakeCountReset.inMicroseconds,
      'shakeCount': instance.shakeCount,
    };

const _$QrEyeShapeEnumMap = {
  QrEyeShape.square: 'square',
  QrEyeShape.circle: 'circle',
};

const _$QrDataModuleShapeEnumMap = {
  QrDataModuleShape.square: 'square',
  QrDataModuleShape.circle: 'circle',
};
