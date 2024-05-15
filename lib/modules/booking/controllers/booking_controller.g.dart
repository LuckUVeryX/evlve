// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bookingControllerHash() => r'9b78bdc73006f0b23017d41cf6a9c5e86fa1e2a7';

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

abstract class _$BookingController
    extends BuildlessAutoDisposeAsyncNotifier<BookingResponse> {
  late final Schedule schedule;

  FutureOr<BookingResponse> build({
    required Schedule schedule,
  });
}

/// See also [BookingController].
@ProviderFor(BookingController)
const bookingControllerProvider = BookingControllerFamily();

/// See also [BookingController].
class BookingControllerFamily extends Family<AsyncValue<BookingResponse>> {
  /// See also [BookingController].
  const BookingControllerFamily();

  /// See also [BookingController].
  BookingControllerProvider call({
    required Schedule schedule,
  }) {
    return BookingControllerProvider(
      schedule: schedule,
    );
  }

  @override
  BookingControllerProvider getProviderOverride(
    covariant BookingControllerProvider provider,
  ) {
    return call(
      schedule: provider.schedule,
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
  String? get name => r'bookingControllerProvider';
}

/// See also [BookingController].
class BookingControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    BookingController, BookingResponse> {
  /// See also [BookingController].
  BookingControllerProvider({
    required Schedule schedule,
  }) : this._internal(
          () => BookingController()..schedule = schedule,
          from: bookingControllerProvider,
          name: r'bookingControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bookingControllerHash,
          dependencies: BookingControllerFamily._dependencies,
          allTransitiveDependencies:
              BookingControllerFamily._allTransitiveDependencies,
          schedule: schedule,
        );

  BookingControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.schedule,
  }) : super.internal();

  final Schedule schedule;

  @override
  FutureOr<BookingResponse> runNotifierBuild(
    covariant BookingController notifier,
  ) {
    return notifier.build(
      schedule: schedule,
    );
  }

  @override
  Override overrideWith(BookingController Function() create) {
    return ProviderOverride(
      origin: this,
      override: BookingControllerProvider._internal(
        () => create()..schedule = schedule,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        schedule: schedule,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<BookingController, BookingResponse>
      createElement() {
    return _BookingControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BookingControllerProvider && other.schedule == schedule;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, schedule.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BookingControllerRef
    on AutoDisposeAsyncNotifierProviderRef<BookingResponse> {
  /// The parameter `schedule` of this provider.
  Schedule get schedule;
}

class _BookingControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<BookingController,
        BookingResponse> with BookingControllerRef {
  _BookingControllerProviderElement(super.provider);

  @override
  Schedule get schedule => (origin as BookingControllerProvider).schedule;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
