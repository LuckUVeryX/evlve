import 'package:evlve/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_controller.g.dart';

@riverpod
class ThemeController extends _$ThemeController {
  @override
  ThemeMode build() {
    return ref.watch(themeRepoProvider).mode;
  }

  void onThemeModeChanged(Set<ThemeMode> mode) {
    state = mode.first;
    ref.read(themeRepoProvider).saveTheme(state);
  }
}
