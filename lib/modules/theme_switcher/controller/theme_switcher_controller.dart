import 'package:evlve/modules/theme_switcher/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_switcher_controller.g.dart';

@riverpod
class ThemeSwitcherController extends _$ThemeSwitcherController {
  @override
  ThemeMode build() {
    return ref.watch(themeSwitcherRepoProvider).themeMode;
  }

  void onThemeModeChanged(Set<ThemeMode> themeModes) {
    final themeMode = themeModes.single;
    state = themeMode;
    ref.read(themeSwitcherRepoProvider).saveThemeMode(themeMode);
  }
}
