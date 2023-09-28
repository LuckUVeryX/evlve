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
