import 'package:dio/dio.dart';
import 'package:evlve/modules/facility/facility.dart';
import 'package:evlve/modules/schedule/models/models.dart';
import 'package:evlve/modules/schedule/repo/repo.dart';
import 'package:evlve/utils/ref_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'schedule_provider.g.dart';

@riverpod
Future<ScheduleList> schedule(
  ScheduleRef ref, {
  required DateTime date,
  required Area area,
}) async {
  final cancelToken = CancelToken();
  final repo = ref.watch(scheduleRepoProvider);
  ref.cache(cancelToken: cancelToken);

  final rawSchedules = await repo.fetchSchedule(date, area, cancelToken);

  return rawSchedules.copyWith(
    schedules: [...rawSchedules.schedules]
      ..removeWhere((s) => !s.date.isAtSameMomentAs(date))
      ..sort((a, b) => a.start.compareTo(b.start)),
  );
}
