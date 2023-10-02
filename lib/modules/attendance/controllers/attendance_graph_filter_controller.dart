import 'package:evlve/modules/attendance/attendance.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'attendance_graph_filter_controller.g.dart';

@riverpod
class AttendanceGraphFilterController
    extends _$AttendanceGraphFilterController {
  @override
  AttendanceGraphFilter build() {
    return AttendanceGraphFilter.all;
  }

  void onToggle() {
    state = AttendanceGraphFilter
        .values[(state.index + 1) % AttendanceGraphFilter.values.length];
  }
}
