// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_brightness_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$raiseBrightnessHash() => r'a1bf98b7be75b572a2e40e49ae04d190bc891e31';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Raises screenbrightness for the duration of callback.
///
/// Copied from [raiseBrightness].
@ProviderFor(raiseBrightness)
const raiseBrightnessProvider = RaiseBrightnessFamily();

/// Raises screenbrightness for the duration of callback.
///
/// Copied from [raiseBrightness].
class RaiseBrightnessFamily extends Family<AsyncValue<void>> {
  /// Raises screenbrightness for the duration of callback.
  ///
  /// Copied from [raiseBrightness].
  const RaiseBrightnessFamily();

  /// Raises screenbrightness for the duration of callback.
  ///
  /// Copied from [raiseBrightness].
  RaiseBrightnessProvider call(
    Future<void> Function() callback,
  ) {
    return RaiseBrightnessProvider(
      callback,
    );
  }

  @override
  RaiseBrightnessProvider getProviderOverride(
    covariant RaiseBrightnessProvider provider,
  ) {
    return call(
      provider.callback,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'raiseBrightnessProvider';
}

/// Raises screenbrightness for the duration of callback.
///
/// Copied from [raiseBrightness].
class RaiseBrightnessProvider extends AutoDisposeFutureProvider<void> {
  /// Raises screenbrightness for the duration of callback.
  ///
  /// Copied from [raiseBrightness].
  RaiseBrightnessProvider(
    Future<void> Function() callback,
  ) : this._internal(
          (ref) => raiseBrightness(
            ref as RaiseBrightnessRef,
            callback,
          ),
          from: raiseBrightnessProvider,
          name: r'raiseBrightnessProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$raiseBrightnessHash,
          dependencies: RaiseBrightnessFamily._dependencies,
          allTransitiveDependencies:
              RaiseBrightnessFamily._allTransitiveDependencies,
          callback: callback,
        );

  RaiseBrightnessProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.callback,
  }) : super.internal();

  final Future<void> Function() callback;

  @override
  Override overrideWith(
    FutureOr<void> Function(RaiseBrightnessRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RaiseBrightnessProvider._internal(
        (ref) => create(ref as RaiseBrightnessRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        callback: callback,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _RaiseBrightnessProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RaiseBrightnessProvider && other.callback == callback;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, callback.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RaiseBrightnessRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `callback` of this provider.
  Future<void> Function() get callback;
}

class _RaiseBrightnessProviderElement
    extends AutoDisposeFutureProviderElement<void> with RaiseBrightnessRef {
  _RaiseBrightnessProviderElement(super.provider);

  @override
  Future<void> Function() get callback =>
      (origin as RaiseBrightnessProvider).callback;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
