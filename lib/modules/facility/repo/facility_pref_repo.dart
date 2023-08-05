import 'package:collection/collection.dart';
import 'package:evlve/modules/facility/facility.dart';
import 'package:evlve/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'facility_pref_repo.g.dart';

@riverpod
FacilityPrefRepo facilityPrefRepo(FacilityPrefRepoRef ref) {
  return FacilityPrefRepo(ref.watch(sharedPreferencesProvider));
}

class FacilityPrefRepo {
  const FacilityPrefRepo(this._pref);

  final SharedPreferences _pref;

  static const _facilityKey = 'kFacility';
  Facility? get facilityPref {
    final enumName = _pref.getString(_facilityKey);
    if (enumName == null) return null;
    return Facility.values.firstWhereOrNull((e) => e.name == enumName);
  }

  Future<void> saveFacilityPref(Facility facility) {
    return _pref.setString(_facilityKey, facility.name);
  }
}
