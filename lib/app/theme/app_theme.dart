import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme._();

  static const seedColor = Color(0xFFEC1B23);

  static ThemeData theme(Brightness brightness, [Color? color]) {
    final flexColor = FlexSchemeColor.from(primary: color ?? seedColor);
    final fontFamily = GoogleFonts.dmSans().fontFamily;

    final base = switch (brightness) {
      Brightness.light => FlexThemeData.light(
          colors: flexColor,
          fontFamily: fontFamily,
        ),
      Brightness.dark => FlexThemeData.dark(
          colors: flexColor,
          fontFamily: fontFamily,
        ),
    };

    final textTheme = base.textTheme.copyWith(
      headlineMedium: const TextStyle(fontWeight: FontWeight.bold),
      titleLarge: const TextStyle(fontWeight: FontWeight.bold),
      bodyLarge: const TextStyle(fontWeight: FontWeight.bold),
      labelLarge: const TextStyle(fontWeight: FontWeight.bold),
    );

    final listTileTheme = ListTileThemeData(
      titleTextStyle: textTheme.bodyLarge,
      subtitleTextStyle: textTheme.labelLarge,
    );

    final navigationBarThemeData = NavigationBarThemeData(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      indicatorColor: base.colorScheme.primaryContainer,
      indicatorShape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(double.infinity),
      ),
      iconTheme: MaterialStateProperty.resolveWith((states) {
        if (!states.contains(MaterialState.selected)) return base.iconTheme;
        return base.iconTheme.copyWith(
          color: base.colorScheme.onPrimaryContainer,
        );
      }),
    );

    return base.copyWith(
      textTheme: textTheme,
      listTileTheme: listTileTheme,
      navigationBarTheme: navigationBarThemeData,
    );
  }
}
