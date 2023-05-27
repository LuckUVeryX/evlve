import 'package:flutter/material.dart';

class Palette {
  const Palette._();

  static const _seedColor = Color(0xFF395BA9);

  static final light = ColorScheme.fromSeed(
    seedColor: _seedColor,
  );

  static final dark = ColorScheme.fromSeed(
    seedColor: _seedColor,
    brightness: Brightness.dark,
  );
}
