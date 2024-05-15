// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingResponseImpl _$$BookingResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BookingResponseImpl(
      schedule: Schedule.fromJson(json['event'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$BookingResponseImplToJson(
        _$BookingResponseImpl instance) =>
    <String, dynamic>{
      'event': instance.schedule,
      'message': instance.message,
    };
