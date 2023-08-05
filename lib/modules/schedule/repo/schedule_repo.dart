import 'package:dio/dio.dart';
import 'package:evlve/api/api.dart';
import 'package:evlve/modules/facility/facility.dart';
import 'package:evlve/modules/schedule/models/models.dart';
import 'package:evlve/modules/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'schedule_repo.g.dart';

@riverpod
ScheduleRepo scheduleRepo(ScheduleRepoRef ref) {
  return ScheduleRepo(ref.watch(apiProvider), ref.watch(userProvider));
}

class ScheduleRepo {
  ScheduleRepo(this._api, this._user);

  final ApiClient _api;
  final User _user;

  Future<ScheduleList> fetchSchedule(
    DateTime date,
    Area area, [
    CancelToken? cancelToken,
  ]) async {
    final req = ScheduleRequest(memberId: _user.id, date: date, area: area);
    final res =
        await _api.get(ApiPath.getEvents, queryParameters: req.toJson());
    return ScheduleList.fromJson(res.data as Map<String, dynamic>);
  }
}
