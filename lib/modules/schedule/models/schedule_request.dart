import 'package:evlve/modules/facility/facility.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_request.freezed.dart';
part 'schedule_request.g.dart';

@freezed
class ScheduleRequest with _$ScheduleRequest {
  const factory ScheduleRequest({
    required String memberId,
    required DateTime date,
    required Area area,
  }) = _ScheduleRequest;

  factory ScheduleRequest.fromJson(Map<String, dynamic> json) =>
      _$ScheduleRequestFromJson(json);
}
