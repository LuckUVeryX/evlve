import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class DebugObserver extends ProviderObserver {
  const DebugObserver(
    this._logger,
  );

  final Logger _logger;

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    final output =
        '[${provider.name ?? provider.runtimeType}] value: $newValue';

    if (newValue is AsyncError) return _logger.e(output);
    _logger.t('[${provider.name ?? provider.runtimeType}] value: $newValue');
  }

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    _logger.d('Add: ${provider.name ?? provider.runtimeType}');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    _logger.d('Dispose: ${provider.name ?? provider.runtimeType}');
  }
}
