import 'package:evlve/modules/schedule/schedule.dart';
import 'package:evlve/modules/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'schedule_facility_controller.g.dart';

@riverpod
class ScheduleFacilityController extends _$ScheduleFacilityController {
  @override
  FacilityExtraData build() {
    final user = ref.watch(userProvider);
    return user.facilities
        .firstWhere((facility) => facility.key == user.defaultLocation);
  }

  void onFacilityChanged(FacilityExtraData facility) {
    if (state == facility) return;
    state = facility;
  }
}
