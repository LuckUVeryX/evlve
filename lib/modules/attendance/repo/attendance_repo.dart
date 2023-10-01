import 'package:evlve/api/api.dart';
import 'package:evlve/modules/attendance/attendance.dart';
import 'package:evlve/modules/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'attendance_repo.g.dart';

@riverpod
AttendanceRepo attendanceRepo(AttendanceRepoRef ref) {
  return AttendanceRepo(ref.watch(apiProvider), ref.watch(userProvider));
}

class AttendanceRepo {
  const AttendanceRepo(this._api, this._user);

  final ApiClient _api;
  final User _user;

  Future<AttendanceResponse> getAttendances({
    required int limit,
    required int offset,
  }) async {
    final res = await _api.get(
      ApiPath.getAttendances,
      queryParameters: {
        'memberId': _user.id,
        'limit': limit,
        'offset': offset,
      },
    );
    return AttendanceResponse.fromJson(res.data as Map<String, dynamic>);
  }

  Future<List<Attendance>> getAllAttendances() async {
    const limit = 1000;
    var offset = 0;

    const maxIter = 50;
    var count = 0;

    final attendances = <Attendance>[];

    while (attendances.length == offset && count < maxIter) {
      attendances.addAll(
        (await getAttendances(limit: limit, offset: offset)).attendances,
      );
      offset += limit;
      count += 1;
    }
    return attendances;
  }
}
