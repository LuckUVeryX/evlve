import 'dart:async';
import 'dart:developer';

import 'package:evlve/modules/logs/logs.dart';
import 'package:evlve/providers/providers.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      observers: [AsyncErrorObserver()],
      overrides: [
        sharedPreferencesProvider.overrideWithValue(pref),
      ],
      child: await builder(),
    ),
  );
}
