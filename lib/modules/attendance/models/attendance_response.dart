import 'package:evlve/modules/facility/facility.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_response.freezed.dart';
part 'attendance_response.g.dart';

@freezed
class AttendanceResponse with _$AttendanceResponse {
  const factory AttendanceResponse({
    required List<Attendance> attendances,
  }) = _AttendanceResponse;

  factory AttendanceResponse.fromJson(Map<String, dynamic> json) =>
      _$AttendanceResponseFromJson(json);
}

@freezed
class Attendance with _$Attendance {
  const factory Attendance({
    required String id,
    required DateTime date,
    required String startTime,
    required Facility facility,
    required String level,
  }) = _Attendance;
  factory Attendance.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);
}
