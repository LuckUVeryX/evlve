import 'package:evlve/modules/attendance/attendance.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'attendance_view_controller.g.dart';

enum AttendanceView { listGrid, grid, list }

extension AttendanceViewX on AttendanceView {
  IconData get icon {
    return switch (this) {
      AttendanceView.grid => Icons.list,
      AttendanceView.list => Icons.grid_view,
      AttendanceView.listGrid => Icons.list_alt,
    };
  }
}

@riverpod
class AttendanceViewController extends _$AttendanceViewController {
  @override
  AttendanceView build() {
    return ref.watch(attendanceViewRepoProvider).attendanceView ??
        AttendanceView.grid;
  }

  void onToggle() {
    state =
        AttendanceView.values[(state.index + 1) % AttendanceView.values.length];
    ref.read(attendanceViewRepoProvider).saveAttendanceView(state);
  }
}
