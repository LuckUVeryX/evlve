import 'package:evlve/modules/schedule/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

@freezed
class ScheduleList with _$ScheduleList {
  const factory ScheduleList({
    @JsonKey(name: 'events') required List<Schedule> schedules,
  }) = _ScheduleList;

  factory ScheduleList.fromJson(Map<String, dynamic> json) =>
      _$ScheduleListFromJson(json);
}

@freezed
class Schedule with _$Schedule {
  const factory Schedule({
    @_DateTimeToLocalConverter() required DateTime date,
    @_DateTimeToLocalConverter() required DateTime start,
    @_DateTimeToLocalConverter() required DateTime end,
    required String title,
    required Area resourceId,
    required ScheduleExtraData event,
  }) = _Schedule;

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);

  const Schedule._();
}

@freezed
class ScheduleExtraData with _$ScheduleExtraData {
  const factory ScheduleExtraData({
    @_DateTimeToLocalConverter() required DateTime createdAt,
    @_DateTimeToLocalConverter() required DateTime updatedAt,
    required ClassDetails classDetails,
  }) = _ScheduleExtraData;

  factory ScheduleExtraData.fromJson(Map<String, dynamic> json) =>
      _$ScheduleExtraDataFromJson(json);
}

@freezed
class ClassDetails with _$ClassDetails {
  const factory ClassDetails({
    required Area area,
    required Level level,
    required bool isBookedByMe,
    required bool isWaitingByMe,
    required bool isBookAvailable,
    required bool isWaitAvailable,
    required bool isConfirmBook,
    required bool isEarlyBookingAvailable,
    required bool isCP,
    required bool isFull,
    required bool isBookingAvailable,
    required bool isPast,
    required bool isHIIT,
    required bool isAttendable,
    required bool isGroupAttendance,
    required bool isZoom,
  }) = _ClassDetails;

  factory ClassDetails.fromJson(Map<String, dynamic> json) =>
      _$ClassDetailsFromJson(json);

  const ClassDetails._();

  bool get canBook {
    return !isPast && !isCP && isBookAvailable && isBookingAvailable;
  }
}

class _DateTimeToLocalConverter extends JsonConverter<DateTime, String> {
  const _DateTimeToLocalConverter();

  @override
  DateTime fromJson(String json) => DateTime.tryParse(json)!.toLocal();

  @override
  String toJson(DateTime object) => object.toUtc().toIso8601String();
}
