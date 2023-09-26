import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme._();

  static const seedColor = Color(0xFFEC1B23);
  static const colorScheme = ColorScheme.highContrastLight(
    shadow: Colors.black54,
  );
  static const colorSchemeDark = ColorScheme.highContrastDark(
    shadow: Colors.black54,
  );
  static final textTheme = GoogleFonts.dmSansTextTheme(
    ThemeData.light().textTheme.copyWith(
          headlineMedium: const TextStyle(fontWeight: FontWeight.bold),
          titleLarge: const TextStyle(fontWeight: FontWeight.bold),
          bodyLarge: const TextStyle(fontWeight: FontWeight.bold),
          labelLarge: const TextStyle(fontWeight: FontWeight.bold),
        ),
  );
  static final textThemeDark = GoogleFonts.dmSansTextTheme(
    ThemeData.dark().textTheme.copyWith(
          headlineMedium: const TextStyle(fontWeight: FontWeight.bold),
          titleLarge: const TextStyle(fontWeight: FontWeight.bold),
          bodyLarge: const TextStyle(fontWeight: FontWeight.bold),
          labelLarge: const TextStyle(fontWeight: FontWeight.bold),
        ),
  );

  static final theme = ThemeData.from(
    useMaterial3: true,
    colorScheme: colorScheme,
    textTheme: textTheme,
  ).copyWith(
    shadowColor: Colors.black87,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      errorStyle: textTheme.bodyMedium?.copyWith(
        color: colorScheme.errorContainer,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
  );

  static final darkTheme = ThemeData.from(
    useMaterial3: true,
    colorScheme: colorSchemeDark,
    textTheme: textThemeDark,
  ).copyWith(
    shadowColor: Colors.black87,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      errorStyle: textTheme.bodyMedium?.copyWith(
        color: colorScheme.errorContainer,
      ),
    ),
  );
}
