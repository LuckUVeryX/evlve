// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceResponseImpl _$$AttendanceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceResponseImpl(
      attendances: (json['attendances'] as List<dynamic>)
          .map((e) => Attendance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AttendanceResponseImplToJson(
        _$AttendanceResponseImpl instance) =>
    <String, dynamic>{
      'attendances': instance.attendances,
    };

_$AttendanceImpl _$$AttendanceImplFromJson(Map<String, dynamic> json) =>
    _$AttendanceImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      startTime: json['startTime'] as String,
      facility: $enumDecode(_$FacilityEnumMap, json['facility']),
      name: json['level'] as String,
    );

Map<String, dynamic> _$$AttendanceImplToJson(_$AttendanceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'startTime': instance.startTime,
      'facility': _$FacilityEnumMap[instance.facility]!,
      'level': instance.name,
    };

const _$FacilityEnumMap = {
  Facility.cq: 'CQ',
  Facility.fes: 'FES',
  Facility.oc: 'OC',
  Facility.kinex: 'KINEX',
  Facility.sv: 'SV',
};
