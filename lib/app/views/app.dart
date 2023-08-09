import 'package:evlve/app/app.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/notifications/notifications.dart';
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

    const seedColor = Color(0xFFEC1B23);
    final colorScheme = ColorScheme.fromSeed(seedColor: seedColor);
    final textTheme = GoogleFonts.dmSansTextTheme(
      ThemeData.light().textTheme.copyWith(
            headlineMedium: const TextStyle(fontWeight: FontWeight.bold),
            titleLarge: const TextStyle(fontWeight: FontWeight.bold),
            bodyLarge: const TextStyle(fontWeight: FontWeight.bold),
            labelLarge: const TextStyle(fontWeight: FontWeight.bold),
          ),
    );
    return MaterialApp.router(
      theme: ThemeData.from(
        useMaterial3: true,
        colorScheme: colorScheme,
        textTheme: textTheme,
      ).copyWith(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          errorStyle: textTheme.bodyMedium?.copyWith(
            color: colorScheme.errorContainer,
          ),
        ),
      ),
      routerConfig: router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
