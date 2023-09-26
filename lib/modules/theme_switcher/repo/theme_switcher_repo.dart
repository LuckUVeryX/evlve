import 'package:collection/collection.dart';
import 'package:evlve/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_switcher_repo.g.dart';

@riverpod
ThemeSwitcherRepo themeSwitcherRepo(ThemeSwitcherRepoRef ref) {
  return ThemeSwitcherRepo(ref.watch(sharedPreferencesProvider));
}

class ThemeSwitcherRepo {
  ThemeSwitcherRepo(this._pref);

  final SharedPreferences _pref;

  static const _themeModeKey = 'kThemeMode';
  ThemeMode get themeMode {
    final enumName = _pref.getString(_themeModeKey);
    if (enumName == null) return ThemeMode.system;
    return ThemeMode.values.firstWhereOrNull((e) => e.name == enumName) ??
        ThemeMode.system;
  }

  Future<void> saveThemeMode(ThemeMode themeMode) {
    return _pref.setString(_themeModeKey, themeMode.name);
  }
}
