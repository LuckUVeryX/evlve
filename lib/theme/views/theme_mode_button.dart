import 'package:evlve/app/app.dart';
import 'package:evlve/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeModeButton extends ConsumerWidget {
  const ThemeModeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeControllerProvider);

    return NeuContainer(
      color: context.colorScheme.background,
      child: SegmentedButton<ThemeMode>(
        style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith((_) {
            return const RoundedRectangleBorder();
          }),
        ),
        selected: {themeMode},
        segments: const [
          ButtonSegment(
            value: ThemeMode.light,
            icon: Icon(Icons.light_mode_outlined),
          ),
          ButtonSegment(
            value: ThemeMode.system,
            icon: Icon(Icons.settings_suggest_outlined),
          ),
          ButtonSegment(
            value: ThemeMode.dark,
            icon: Icon(Icons.dark_mode_outlined),
          ),
        ],
        onSelectionChanged:
            ref.read(themeControllerProvider.notifier).onThemeModeChanged,
      ),
    );
  }
}
