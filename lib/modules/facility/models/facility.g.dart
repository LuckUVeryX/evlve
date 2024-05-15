// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FacilityExtraDataImpl _$$FacilityExtraDataImplFromJson(
        Map<String, dynamic> json) =>
    _$FacilityExtraDataImpl(
      key: $enumDecode(_$FacilityEnumMap, json['key']),
      name: json['name'] as String,
      shortName: json['shortName'] as String,
      title: json['title'] as String,
      areas: (json['areas'] as List<dynamic>)
          .map((e) => AreaExtraData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FacilityExtraDataImplToJson(
        _$FacilityExtraDataImpl instance) =>
    <String, dynamic>{
      'key': _$FacilityEnumMap[instance.key]!,
      'name': instance.name,
      'shortName': instance.shortName,
      'title': instance.title,
      'areas': instance.areas,
    };

const _$FacilityEnumMap = {
  Facility.cq: 'CQ',
  Facility.fes: 'FES',
  Facility.oc: 'OC',
  Facility.kinex: 'KINEX',
  Facility.sv: 'SV',
};

_$AreaExtraDataImpl _$$AreaExtraDataImplFromJson(Map<String, dynamic> json) =>
    _$AreaExtraDataImpl(
      key: $enumDecode(_$AreaEnumMap, json['key']),
      name: json['name'] as String,
      shortName: json['shortName'] as String,
    );

Map<String, dynamic> _$$AreaExtraDataImplToJson(_$AreaExtraDataImpl instance) =>
    <String, dynamic>{
      'key': _$AreaEnumMap[instance.key]!,
      'name': instance.name,
      'shortName': instance.shortName,
    };

const _$AreaEnumMap = {
  Area.cqMt: 'CQ_MT',
  Area.cqJj: 'CQ_JJ',
  Area.fesWarrior: 'FES_WARRIOR',
  Area.fesChampion: 'FES_CHAMPION',
  Area.fesLegend: 'FES_LEGEND',
  Area.ocMt: 'OC_MT',
  Area.ocJj: 'OC_JJ',
  Area.kinexMt: 'KINEX_MT',
  Area.kinexJj: 'KINEX_JJ',
  Area.svMt: 'SV_MT',
  Area.svJj: 'SV_JJ',
};
