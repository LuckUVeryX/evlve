import 'package:collection/collection.dart';
import 'package:evlve/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_repo.g.dart';

@riverpod
ThemeRepo themeRepo(ThemeRepoRef ref) {
  return ThemeRepo(ref.watch(sharedPreferencesProvider));
}

class ThemeRepo {
  const ThemeRepo(this._pref);

  final SharedPreferences _pref;

  static const _themeModeKey = 'kThemeMode';

  ThemeMode get mode {
    final enumName = _pref.getString(_themeModeKey);
    if (enumName == null) return ThemeMode.system;
    return ThemeMode.values.firstWhereOrNull((e) => e.name == enumName) ??
        ThemeMode.system;
  }

  Future<void> saveTheme(ThemeMode mode) async {
    await _pref.setString(_themeModeKey, mode.name);
  }
}
