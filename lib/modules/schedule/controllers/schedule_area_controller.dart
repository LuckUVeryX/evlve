import 'package:evlve/modules/schedule/schedule.dart';
import 'package:evlve/modules/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'schedule_area_controller.g.dart';

@riverpod
class ScheduleAreaController extends _$ScheduleAreaController {
  @override
  AreaExtraData build() {
    final facility = ref.watch(scheduleFacilityControllerProvider);
    return facility.areas.first;
  }
}

@riverpod
class ScheduleFacilityController extends _$ScheduleFacilityController {
  @override
  FacilityExtraData build() {
    final user = ref.watch(userProvider);
    return user.facilities
        .firstWhere((element) => element.key == user.defaultLocation);
  }
}
