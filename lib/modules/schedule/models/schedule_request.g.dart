// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleRequestImpl _$$ScheduleRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ScheduleRequestImpl(
      memberId: json['memberId'] as String,
      date: DateTime.parse(json['date'] as String),
      area: $enumDecode(_$AreaEnumMap, json['area']),
    );

Map<String, dynamic> _$$ScheduleRequestImplToJson(
        _$ScheduleRequestImpl instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'date': instance.date.toIso8601String(),
      'area': _$AreaEnumMap[instance.area]!,
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
