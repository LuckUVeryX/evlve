import 'package:evlve/modules/schedule/models/models.dart';
import 'package:evlve/modules/schedule/repo/repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'schedule_provider.g.dart';

@riverpod
Future<ScheduleList> schedule(
  ScheduleRef ref, {
  required DateTime date,
  required Area area,
}) async {
  final rawSchedules =
      await ref.watch(scheduleRepoProvider).fetchSchedule(date, area);
  return rawSchedules.copyWith(
    schedules: [...rawSchedules.schedules]
      ..removeWhere(
        (s) => !s.date.isAtSameMomentAs(date),
      )
      ..sort((a, b) => a.start.compareTo(b.start)),
  );
}
