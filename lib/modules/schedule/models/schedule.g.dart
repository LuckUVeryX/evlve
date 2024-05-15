// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleListImpl _$$ScheduleListImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleListImpl(
      schedules: (json['events'] as List<dynamic>)
          .map((e) => Schedule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ScheduleListImplToJson(_$ScheduleListImpl instance) =>
    <String, dynamic>{
      'events': instance.schedules,
    };

_$ScheduleImpl _$$ScheduleImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleImpl(
      date: const _DateTimeToLocalConverter().fromJson(json['date'] as String),
      start:
          const _DateTimeToLocalConverter().fromJson(json['start'] as String),
      end: const _DateTimeToLocalConverter().fromJson(json['end'] as String),
      title: json['title'] as String,
      resourceId: $enumDecode(_$AreaEnumMap, json['resourceId']),
      event: ScheduleExtraData.fromJson(json['event'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ScheduleImplToJson(_$ScheduleImpl instance) =>
    <String, dynamic>{
      'date': const _DateTimeToLocalConverter().toJson(instance.date),
      'start': const _DateTimeToLocalConverter().toJson(instance.start),
      'end': const _DateTimeToLocalConverter().toJson(instance.end),
      'title': instance.title,
      'resourceId': _$AreaEnumMap[instance.resourceId]!,
      'event': instance.event,
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

_$ScheduleExtraDataImpl _$$ScheduleExtraDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ScheduleExtraDataImpl(
      id: json['id'] as String,
      createdAt: const _DateTimeToLocalConverter()
          .fromJson(json['createdAt'] as String),
      updatedAt: const _DateTimeToLocalConverter()
          .fromJson(json['updatedAt'] as String),
      classDetails:
          ClassDetails.fromJson(json['classDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ScheduleExtraDataImplToJson(
        _$ScheduleExtraDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': const _DateTimeToLocalConverter().toJson(instance.createdAt),
      'updatedAt': const _DateTimeToLocalConverter().toJson(instance.updatedAt),
      'classDetails': instance.classDetails,
    };

_$ClassDetailsImpl _$$ClassDetailsImplFromJson(Map<String, dynamic> json) =>
    _$ClassDetailsImpl(
      area: $enumDecode(_$AreaEnumMap, json['area']),
      level: $enumDecode(_$LevelEnumMap, json['level']),
      isBookedByMe: json['isBookedByMe'] as bool,
      isWaitingByMe: json['isWaitingByMe'] as bool,
      isBookAvailable: json['isBookAvailable'] as bool,
      isWaitAvailable: json['isWaitAvailable'] as bool,
      isConfirmBook: json['isConfirmBook'] as bool,
      isEarlyBookingAvailable: json['isEarlyBookingAvailable'] as bool,
      isCP: json['isCP'] as bool,
      isFull: json['isFull'] as bool,
      isBookingAvailable: json['isBookingAvailable'] as bool,
      isPast: json['isPast'] as bool,
      isHIIT: json['isHIIT'] as bool,
      isAttendable: json['isAttendable'] as bool,
      isGroupAttendance: json['isGroupAttendance'] as bool,
      isZoom: json['isZoom'] as bool,
    );

Map<String, dynamic> _$$ClassDetailsImplToJson(_$ClassDetailsImpl instance) =>
    <String, dynamic>{
      'area': _$AreaEnumMap[instance.area]!,
      'level': _$LevelEnumMap[instance.level]!,
      'isBookedByMe': instance.isBookedByMe,
      'isWaitingByMe': instance.isWaitingByMe,
      'isBookAvailable': instance.isBookAvailable,
      'isWaitAvailable': instance.isWaitAvailable,
      'isConfirmBook': instance.isConfirmBook,
      'isEarlyBookingAvailable': instance.isEarlyBookingAvailable,
      'isCP': instance.isCP,
      'isFull': instance.isFull,
      'isBookingAvailable': instance.isBookingAvailable,
      'isPast': instance.isPast,
      'isHIIT': instance.isHIIT,
      'isAttendable': instance.isAttendable,
      'isGroupAttendance': instance.isGroupAttendance,
      'isZoom': instance.isZoom,
    };

const _$LevelEnumMap = {
  Level.mtLevel1: 'MT_LEVEL_1',
  Level.mtLevel2: 'MT_LEVEL_2',
  Level.mtLevel3: 'MT_LEVEL_3',
  Level.mtSparring: 'MT_SPARRING',
  Level.mtConditioning: 'MT_CONDITIONING',
  Level.mtClinching: 'MT_CLINCHING',
  Level.mtWomen: 'MT_WOMEN',
  Level.mtKids: 'MT_KIDS',
  Level.mtPreteen: 'MT_PRETEEN',
  Level.mtLittleWarrior: 'MT_LITTLE_WARRIOR',
  Level.boxingLevel1: 'BOXING_LEVEL_1',
  Level.boxingLevel2: 'BOXING_LEVEL_2',
  Level.boxingLevel3: 'BOXING_LEVEL_3',
  Level.boxing2Sparring: 'BOXING_2_SPARRING',
  Level.bjjBlue: 'BJJ_BLUE',
  Level.bjjBlueNogi: 'BJJ_BLUE_NOGI',
  Level.bjjPurple: 'BJJ_PURLE',
  Level.bjjBlack: 'BJJ_BLACK',
  Level.bjjNogi: 'BJJ_NOGI',
  Level.bjjRandori: 'BJJ_RANDORI',
  Level.bjjCompetitorsProgram: 'BJJ_COMPETITORS_PROGRAM',
  Level.bjjKidsCompetitorsProgram: 'BJJ_KIDS_COMPETITORS_PROGRAM',
  Level.bjjPreteen: 'BJJ_PRETEEN',
  Level.bjjPreteenRandori: 'BJJ_PRETEEN_RANDORI',
  Level.bjjKids: 'BJJ_KIDS',
  Level.bjjLittleSamurai: 'BJJ_LITTLE_SAMURAI',
  Level.warriorFit: 'WARRIOR_FIT',
  Level.warriorFit2: 'WARRIOR_FIT_2',
  Level.mma: 'MMA',
  Level.wrestling: 'WRESTLING',
};
