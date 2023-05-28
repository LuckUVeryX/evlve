import 'package:evlve/modules/schedule/schedule.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_response.freezed.dart';
part 'booking_response.g.dart';

@freezed
class BookingResponse with _$BookingResponse {
  const factory BookingResponse({
    @JsonKey(name: 'event') required Schedule schedule,
    required String? message,
  }) = _BookingResponse;

  factory BookingResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingResponseFromJson(json);
}
