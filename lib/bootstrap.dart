import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:evlve/app/observers/observers.dart';
import 'package:evlve/modules/notifications/notifications.dart';
import 'package:evlve/providers/providers.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  final log = Logger(
    level: Level.debug,
    printer: AppPrinter(),
    output: ConsoleLogOutput(),
  );

  FlutterError.onError = (details) {
    log.f(details.exceptionAsString(), stackTrace: details.stack);
  };

  final pref = await SharedPreferences.getInstance();

  final notificationRepo = NotificationRepo(AwesomeNotifications());
  await notificationRepo.init();

  runApp(
    ProviderScope(
      observers: [
        DebugObserver(log),
      ],
      overrides: [
        logProvider.overrideWithValue(log),
        sharedPreferencesProvider.overrideWithValue(pref),
        notificationRepoProvider.overrideWithValue(notificationRepo),
      ],
      child: await builder(),
    ),
  );
}
