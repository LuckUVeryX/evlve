import 'package:evlve/modules/schedule/schedule.dart';
import 'package:evlve/modules/schedule_filter/schedule_filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../schedule_filter_dialog_controller.g.dart';

@riverpod
class ScheduleFilterDialogController extends _$ScheduleFilterDialogController {
  @override
  ScheduleFilter build() {
    return const ScheduleFilter();
  }

  void onLevelFilterSelected(Level level) {
    final filter = Set<Level>.from(state.levelFilters);
    filter.contains(level) ? filter.remove(level) : filter.add(level);
    state = state.copyWith(levelFilters: filter);
  }
}
