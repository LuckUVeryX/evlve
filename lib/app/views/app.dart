import 'package:evlve/app/app.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/notifications/notifications.dart';
import 'package:evlve/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      await ref.read(resetBadgeCountProvider.future);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeControllerProvider);

    const seedColor = Color(0xFFEC1B23);

    return MaterialApp.router(
      themeMode: themeMode,
      theme: ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
        ),
        textTheme: GoogleFonts.dmSansTextTheme(
          ThemeData.light().textTheme.copyWith(
                headlineMedium: const TextStyle(fontWeight: FontWeight.bold),
                titleLarge: const TextStyle(fontWeight: FontWeight.bold),
                bodyLarge: const TextStyle(fontWeight: FontWeight.bold),
                labelLarge: const TextStyle(fontWeight: FontWeight.bold),
              ),
        ),
      ).copyWith(
        inputDecorationTheme: const InputDecorationTheme(filled: true),
      ),
      darkTheme: ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.dmSansTextTheme(
          ThemeData.dark().textTheme.copyWith(
                headlineMedium: const TextStyle(fontWeight: FontWeight.bold),
                titleLarge: const TextStyle(fontWeight: FontWeight.bold),
                bodyLarge: const TextStyle(fontWeight: FontWeight.bold),
                labelLarge: const TextStyle(fontWeight: FontWeight.bold),
              ),
        ),
      ).copyWith(
        inputDecorationTheme: const InputDecorationTheme(filled: true),
      ),
      routerConfig: router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
