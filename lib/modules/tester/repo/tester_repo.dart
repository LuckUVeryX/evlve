import 'package:evlve/modules/user/user.dart';
import 'package:evlve/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'tester_repo.g.dart';

@riverpod
TesterRepo testerRepo(TesterRepoRef ref) {
  return TesterRepo(ref.watch(sharedPreferencesProvider));
}

class TesterRepo {
  const TesterRepo(this._pref);

  final SharedPreferences _pref;

  static const _testerKey = 'kTester';

  /// Returns `true` only when secret handshake is done in
  /// [AccountSettingsPage] to enable tester acc to actually book classes.
  bool get overrideTester {
    return _pref.getBool(_testerKey) ?? false;
  }

  Future<void> saveOverrideTesterPref() {
    return _pref.setBool(_testerKey, true);
  }
}
