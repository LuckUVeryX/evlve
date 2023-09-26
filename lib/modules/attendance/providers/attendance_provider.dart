import 'package:evlve/modules/attendance/attendance.dart';
import 'package:evlve/utils/ref_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'attendance_provider.g.dart';

@riverpod
Future<AttendanceResponse> attendance(
  AttendanceRef ref, {
  required int limit,
  required int offset,
}) {
  ref.cache();
  return ref
      .watch(attendanceRepoProvider)
      .getAttendances(limit: limit, offset: offset);
}
