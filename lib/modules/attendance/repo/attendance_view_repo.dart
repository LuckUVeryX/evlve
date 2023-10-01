import 'package:collection/collection.dart';
import 'package:evlve/modules/attendance/attendance.dart';
import 'package:evlve/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'attendance_view_repo.g.dart';

@riverpod
AttendanceViewRepo attendanceViewRepo(AttendanceViewRepoRef ref) {
  return AttendanceViewRepo(ref.watch(sharedPreferencesProvider));
}

class AttendanceViewRepo {
  const AttendanceViewRepo(this._pref);

  final SharedPreferences _pref;

  static const _attendanceViewKey = 'kAttendanceView';
  AttendanceView? get attendanceView {
    final enumName = _pref.getString(_attendanceViewKey);
    if (enumName == null) return null;
    return AttendanceView.values.firstWhereOrNull((e) => e.name == enumName);
  }

  Future<void> saveAttendanceView(AttendanceView value) {
    return _pref.setString(_attendanceViewKey, value.name);
  }
}
