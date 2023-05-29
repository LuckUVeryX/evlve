import 'package:evlve/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConfig {
  const ThemeConfig._();

  static const _useM3 = true;

  static ThemeData get light {
    return ThemeData.from(
      useMaterial3: _useM3,
      textTheme: GoogleFonts.notoSansMonoTextTheme(ThemeData.light().textTheme),
      colorScheme: Palette.light,
    );
  }

  static ThemeData get dark {
    return ThemeData.from(
      useMaterial3: _useM3,
      textTheme: GoogleFonts.notoSansMonoTextTheme(ThemeData.dark().textTheme),
      colorScheme: Palette.dark,
    );
  }
}
