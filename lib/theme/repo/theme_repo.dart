import 'dart:convert';

import 'package:evlve/providers/providers.dart';
import 'package:evlve/theme/theme.dart';
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

  static const _themeKey = 'kTheme';

  ThemeModel get theme {
    final json = _pref.getString(_themeKey);
    if (json == null) return const ThemeModel();
    return ThemeModel.fromJson(jsonDecode(json) as Map<String, dynamic>);
  }

  Future<void> saveTheme(ThemeModel theme) async {
    await _pref.setString(_themeKey, jsonEncode(theme.toJson()));
  }
}
