import 'package:collection/collection.dart';
import 'package:evlve/modules/facility/facility.dart';
import 'package:evlve/modules/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'facility_controller.g.dart';

@riverpod
class FacilityContoller extends _$FacilityContoller {
  @override
  FacilityExtraData build() {
    final facilityPref = ref.watch(facilityPrefRepoProvider).facilityPref;
    final user = ref.watch(userProvider);

    return user.facilities.firstWhereOrNull(
          (e) => e.key == facilityPref,
        ) ??
        user.facilities.firstWhereOrNull(
          (e) => e.key == user.defaultLocation,
        ) ??
        user.facilities.first;
  }

  void onFacilityChanged(FacilityExtraData facility) {
    if (state == facility) return;
    state = facility;
    ref.read(facilityPrefRepoProvider).saveFacilityPref(facility.key);
  }
}
