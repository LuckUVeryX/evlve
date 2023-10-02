import 'dart:math';

import 'package:evlve/modules/attendance/attendance.dart';
import 'package:evlve/modules/facility/facility.dart';
import 'package:evlve/utils/date_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_state.freezed.dart';

@freezed
class AttendanceState with _$AttendanceState {
  const factory AttendanceState({
    required String id,
    required DateTime date,
    required String startTime,
    required Facility facility,
    required String name,
    AttendanceLevel? level,
  }) = _AttendanceState;

  const AttendanceState._();

  factory AttendanceState.fromAttendance(Attendance attendance) {
    return AttendanceState(
      id: attendance.id,
      date: attendance.date,
      startTime: attendance.startTime,
      facility: attendance.facility,
      name: attendance.name,
      level: AttendanceLevel.attendanceLevelEnumMap[attendance.name],
    );
  }
}

extension AttendanceStateListX on List<AttendanceState> {
  int? get daysSinceFirstClass {
    final now = DateTime.now().stripTime();
    return now.difference(lastOrNull?.date ?? now).inDays;
  }

  ({int curr, int longest}) get streak {
    final dates = map((e) => e.date.stripTime()).toList();

    var count = 1;
    int? curr;
    var longest = 0;

    for (var i = 1; i < dates.length; i++) {
      final next = dates[i];
      final prev = dates[i - 1];
      if (next.isAtSameMomentAs(prev)) continue;
      final diff = prev.difference(next);

      if (diff.inDays == 1) {
        count += 1;
      } else {
        curr ??= count;
        count = 1;
      }

      longest = max(count, longest);
    }

    final nowMoreThanOneDaySinceLatest = DateTime.now()
        .stripTime()
        .isAfter(dates.first.add(const Duration(days: 1)));
    if (nowMoreThanOneDaySinceLatest) curr = 0;

    return (curr: curr ?? 0, longest: longest);
  }
}
