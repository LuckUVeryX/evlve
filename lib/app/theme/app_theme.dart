import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme._();

  static const seedColor = Color(0xFFEC1B23);

  static ThemeData theme(Brightness brightness, [Color? color]) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: color ?? seedColor,
      primary: color ?? seedColor,
      brightness: brightness,
    );

    final textTheme = GoogleFonts.dmSansTextTheme(
      ThemeData(brightness: brightness).textTheme,
    ).copyWith(
      headlineMedium: const TextStyle(fontWeight: FontWeight.bold),
      titleLarge: const TextStyle(fontWeight: FontWeight.bold),
      bodyLarge: const TextStyle(fontWeight: FontWeight.bold),
      labelLarge: const TextStyle(fontWeight: FontWeight.bold),
    );

    final listTileTheme = ListTileThemeData(
      titleTextStyle: textTheme.bodyLarge,
      subtitleTextStyle: textTheme.labelLarge,
      textColor: colorScheme.onBackground,
    );

    final inputDecorationTheme = InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surfaceVariant,
      errorStyle: textTheme.bodyMedium?.copyWith(
        color: colorScheme.errorContainer,
      ),
    );

    return ThemeData.from(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
    ).copyWith(
      listTileTheme: listTileTheme,
      inputDecorationTheme: inputDecorationTheme,
    );
  }
}
