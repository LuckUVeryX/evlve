import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_fonts/google_fonts.dart';

part 'theme_model.freezed.dart';
part 'theme_model.g.dart';

@freezed
class ThemeModel with _$ThemeModel {
  const factory ThemeModel({
    @Default(ThemeMode.system) ThemeMode mode,
    @Default(Color(0xFF395BA9)) @_ColorConverter() Color seedColor,
  }) = _ThemeModel;

  factory ThemeModel.fromJson(Map<String, dynamic> json) =>
      _$ThemeModelFromJson(json);

  const ThemeModel._();

  ThemeData get light {
    return ThemeData.from(
      useMaterial3: true,
      textTheme: GoogleFonts.notoSansMonoTextTheme(ThemeData.light().textTheme),
      colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
    );
  }

  ThemeData get dark {
    return ThemeData.from(
      useMaterial3: true,
      textTheme: GoogleFonts.notoSansMonoTextTheme(ThemeData.dark().textTheme),
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: Brightness.dark,
      ),
    );
  }
}

class _ColorConverter extends JsonConverter<Color, Map<String, dynamic>> {
  const _ColorConverter();

  @override
  Color fromJson(Map<String, dynamic> json) {
    final red = json['red'] as int;
    final green = json['green'] as int;
    final blue = json['blue'] as int;
    final alpha = json['alpha'] as int;

    return Color.fromARGB(alpha, red, green, blue);
  }

  @override
  Map<String, dynamic> toJson(Color color) {
    return {
      'red': color.red,
      'green': color.green,
      'blue': color.blue,
      'alpha': color.alpha,
    };
  }
}
