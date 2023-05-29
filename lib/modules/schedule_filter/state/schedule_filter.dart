import 'package:evlve/modules/schedule/schedule.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_filter.freezed.dart';

@freezed
class ScheduleFilter with _$ScheduleFilter {
  const factory ScheduleFilter({
    @Default(false) bool filterBooked,
    @Default({}) Set<Level> levelFilters,
  }) = _ScheduleFilter;
}
