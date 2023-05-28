import 'dart:developer' as developer;

import 'package:evlve/modules/logs/logs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncErrorObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (newValue is! AsyncError) return;
    final name = '${provider.name ?? provider.runtimeType}';
    developer.log('${AnsiCode.red}$name${AnsiCode.reset}');
    developer.log('${AnsiCode.yellow}$newValue${AnsiCode.reset}');
  }
}
