import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/theme/theme.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeSettingsPage extends StatelessWidget {
  const ThemeSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.settingsApperance),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: const [
          _ThemeModeButton(),
          Expanded(child: _ColorPicker()),
        ],
      ),
    );
  }
}

class _ThemeModeButton extends ConsumerWidget {
  const _ThemeModeButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode =
        ref.watch(themeControllerProvider.select((value) => value.mode));

    return SegmentedButton<ThemeMode>(
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
    );
  }
}

class _ColorPicker extends ConsumerWidget {
  const _ColorPicker();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seedColor =
        ref.watch(themeControllerProvider.select((value) => value.seedColor));
    return ColorPicker(
      pickersEnabled: const {
        ColorPickerType.both: false,
        ColorPickerType.primary: false,
        ColorPickerType.accent: false,
        ColorPickerType.bw: false,
        ColorPickerType.custom: false,
        ColorPickerType.wheel: true,
      },
      showColorName: true,
      color: seedColor,
      onColorChanged:
          ref.read(themeControllerProvider.notifier).onSeedColorChanged,
    );
  }
}
