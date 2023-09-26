import 'package:evlve/modules/theme_switcher/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeSwitcherButton extends ConsumerWidget {
  const ThemeSwitcherButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeSwitcherControllerProvider);
    return SegmentedButton<ThemeMode>(
      selected: {themeMode},
      segments: [ThemeMode.dark, ThemeMode.system, ThemeMode.light]
          .map(
            (e) => ButtonSegment(
              value: e,
              icon: Icon(themeMode == e ? e.selectedIcon : e.icon),
            ),
          )
          .toList(),
      onSelectionChanged:
          ref.read(themeSwitcherControllerProvider.notifier).onThemeModeChanged,
    );
  }
}

extension on ThemeMode {
  IconData get icon {
    return switch (this) {
      ThemeMode.system => Icons.brightness_4_outlined,
      ThemeMode.light => Icons.light_mode_outlined,
      ThemeMode.dark => Icons.dark_mode_outlined,
    };
  }

  IconData get selectedIcon {
    return switch (this) {
      ThemeMode.system => Icons.brightness_4,
      ThemeMode.light => Icons.light_mode,
      ThemeMode.dark => Icons.dark_mode,
    };
  }
}
