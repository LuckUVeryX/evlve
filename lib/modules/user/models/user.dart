import 'package:evlve/modules/schedule/schedule.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'memberId') required String id,
    required Facility defaultLocation,
    required List<FacilityExtraData> facilities,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  const User._();

  bool get isBlackCard {
    return facilities.length > 1;
  }
}
