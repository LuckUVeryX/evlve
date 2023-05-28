import 'package:evlve/modules/schedule/models/models.dart';
import 'package:evlve/utils/date_utils.dart';
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

  bool get isLateBooking {
    final now = DateTime.now();

    final isWeekday =
        start.weekday >= DateTime.monday && start.weekday <= DateTime.friday;

    bool isWithinWindow(List<DateTime> window) {
      return start.isAfter(window.first) && start.isBefore(window.last);
    }

    // Weekdays 6.30-7.45 am
    final earlyWindow = [
      start.stripTime().add(const Duration(hours: 6, minutes: 30)),
      start.stripTime().add(const Duration(hours: 7, minutes: 45)),
    ];
    // Late cancellation: After 10 pm The Night Before
    if (isWeekday && isWithinWindow(earlyWindow)) {
      return now.isAfter(start.stripTime().subtract(const Duration(hours: 2)));
    }

    // Weekdays 12-12:45 pm
    final lunchWindow = [
      start.stripTime().add(const Duration(hours: 12)),
      start.stripTime().add(const Duration(hours: 12, minutes: 45)),
    ];
    if (isWeekday && isWithinWindow(lunchWindow)) {
      return now.isAfter(start.subtract(const Duration(hours: 6)));
    }

    final eveningWindow = [
      start.stripTime().add(const Duration(hours: 6)),
      start.stripTime().add(const Duration(hours: 8, minutes: 45)),
    ];
    if (isWeekday && isWithinWindow(eveningWindow)) {
      return now.isAfter(start.subtract(const Duration(hours: 6)));
    }

    return now.isAfter(start.subtract(const Duration(hours: 3)));
  }
}

@freezed
class ScheduleExtraData with _$ScheduleExtraData {
  const factory ScheduleExtraData({
    required String id,
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
