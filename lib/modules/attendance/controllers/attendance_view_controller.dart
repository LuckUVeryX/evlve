import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'attendance_view_controller.g.dart';

enum AttendanceView { grid, list }

extension AttendanceViewX on AttendanceView {
  IconData get icon {
    return switch (this) {
      AttendanceView.grid => Icons.list,
      AttendanceView.list => Icons.grid_view,
    };
  }
}

@riverpod
class AttendanceViewController extends _$AttendanceViewController {
  @override
  AttendanceView build() {
    return AttendanceView.grid;
  }

  void onToggle() {
    state =
        AttendanceView.values[(state.index + 1) % AttendanceView.values.length];
  }
}
