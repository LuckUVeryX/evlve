import 'package:evlve/app/theme/theme.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/auth/auth.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeConfig.light,
      darkTheme: ThemeConfig.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const SigninPage(),
    );
  }
}
