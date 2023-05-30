import 'package:evlve/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_controller.g.dart';

@Riverpod(dependencies: [themeRepo])
class ThemeController extends _$ThemeController {
  @override
  ThemeModel build() {
    return ref.watch(themeRepoProvider).theme;
  }

  void onThemeModeChanged(Set<ThemeMode> mode) {
    state = state.copyWith(mode: mode.first);
    ref.read(themeRepoProvider).saveTheme(state);
  }

  void onSeedColorChanged(Color seedColor) {
    state = state.copyWith(seedColor: seedColor);
    ref.read(themeRepoProvider).saveTheme(state);
  }
}
