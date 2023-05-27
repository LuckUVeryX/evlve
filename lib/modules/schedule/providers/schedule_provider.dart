import 'package:evlve/modules/schedule/models/models.dart';
import 'package:evlve/modules/schedule/repo/repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

part 'schedule_provider.g.dart';

@riverpod
Future<ScheduleList> schedule(
  ScheduleRef ref, {
  required DateTime date,
  required Area area,
}) {
  return ref.watch(scheduleRepoProvider).fetchSchedule(date, area);
}

class ScheduleDataSource extends CalendarDataSource<Schedule> {
  ScheduleDataSource(List<Schedule> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return (appointments?[index] as Schedule).start;
  }

  @override
  DateTime getEndTime(int index) {
    return (appointments?[index] as Schedule).end;
  }

  @override
  String getSubject(int index) {
    return (appointments?[index] as Schedule).title;
  }
}
