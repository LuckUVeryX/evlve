import 'package:evlve/modules/attendance/attendance.dart';
import 'package:evlve/utils/ref_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'attendance_provider.g.dart';

@riverpod
Future<List<AttendanceState>> attendance(AttendanceRef ref) async {
  ref.cache();
  return ref.watch(attendanceRepoProvider).getAllAttendances().then(
        (value) => value.map(AttendanceState.fromAttendance).toList(),
      );
}

@riverpod
Future<Map<DateTime, List<AttendanceState>>> attendanceDay(
  AttendanceDayRef ref,
) async {
  final attendances = await ref.watch(attendanceProvider.future);
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
  if (curr.isNotEmpty) result[curr.first.date] = curr;
  return result;
}
