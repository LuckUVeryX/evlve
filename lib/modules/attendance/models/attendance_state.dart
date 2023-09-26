import 'package:evlve/modules/attendance/attendance.dart';
import 'package:evlve/modules/facility/facility.dart';
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
