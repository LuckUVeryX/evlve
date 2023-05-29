import 'package:evlve/modules/schedule/schedule.dart';
import 'package:evlve/modules/schedule_filter/controllers/schedule_filter_controller.dart';
import 'package:evlve/modules/schedule_filter/schedule_filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'schedule_filter_dialog_controller.g.dart';

@riverpod
class ScheduleFilterDialogController extends _$ScheduleFilterDialogController {
  @override
  ScheduleFilter build() {
    return ref.watch(scheduleFilterControllerProvider);
  }

  void onLevelFilterSelected(Level level) {
    final filter = Set<Level>.from(state.levelFilters);
    filter.contains(level) ? filter.remove(level) : filter.add(level);
    state = state.copyWith(levelFilters: filter);
  }
}
