import 'package:evlve/modules/schedule_filter/schedule_filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'schedule_filter_controller.g.dart';

@riverpod
class ScheduleFilterController extends _$ScheduleFilterController {
  @override
  ScheduleFilter build() {
    return const ScheduleFilter();
  }

  // ignore: use_setters_to_change_properties
  void filter(ScheduleFilter filter) {
    state = filter;
  }
}
