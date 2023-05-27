import 'package:evlve/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConfig {
  const ThemeConfig._();

  static const _useM3 = true;
  static final _textTheme = GoogleFonts.notoSansMonoTextTheme();

  static ThemeData get light {
    return ThemeData.from(
      useMaterial3: _useM3,
      textTheme: _textTheme,
      colorScheme: Palette.light,
    );
  }

  static ThemeData get dark {
    return ThemeData.from(
      useMaterial3: _useM3,
      textTheme: _textTheme,
      colorScheme: Palette.dark,
    );
  }
}
