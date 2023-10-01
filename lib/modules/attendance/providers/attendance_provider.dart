import 'package:evlve/modules/attendance/attendance.dart';
import 'package:evlve/utils/ref_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'attendance_provider.g.dart';

@riverpod
Future<List<AttendanceState>> attendance(
  AttendanceRef ref, {
  required int limit,
  required int page,
}) {
  ref.cache();
  return ref
      .watch(attendanceRepoProvider)
      .getAttendances(limit: limit, offset: page * limit)
      .then(
    (value) {
      return value.attendances.map(AttendanceState.fromAttendance).toList();
    },
  );
}

@riverpod
Future<Map<DateTime, List<AttendanceState>>> allAttendanceDay(
  AllAttendanceDayRef ref,
) async {
  ref.cache();
  final attendances =
      await ref.watch(attendanceRepoProvider).getAllAttendances().then(
            (value) => value.map(AttendanceState.fromAttendance).toList(),
          );

  final result = <DateTime, List<AttendanceState>>{};
  var curr = <AttendanceState>[];

  for (final attendance in attendances) {
    if (curr.isEmpty || curr.first.date == attendance.date) {
      curr.add(attendance);
    } else {
      result[curr.first.date] = curr;
      curr = [attendance];
    }
  }

  // Handle the last group of items
  if (curr.isNotEmpty) {
    result[curr.first.date] = curr;
  }

  return result;
}
