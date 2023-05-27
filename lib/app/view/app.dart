import 'package:evlve/app/theme/theme.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts.notoSansMonoTextTheme();

    return MaterialApp(
      theme: ThemeData.from(
        useMaterial3: true,
        textTheme: textTheme,
        colorScheme: Palette.light,
      ),
      darkTheme: ThemeData.from(
        useMaterial3: true,
        textTheme: textTheme,
        colorScheme: Palette.dark,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
