import 'dart:async';
import 'dart:developer';

import 'package:evlve/modules/logs/logs.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runApp(
    ProviderScope(observers: [AsyncErrorObserver()], child: await builder()),
  );
}
