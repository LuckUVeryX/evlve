// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_notification_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$scheduleNotificationHash() =>
    r'6fe17ad9a491bd63d01bf9c4e774d15c6e8c0efa';

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

/// See also [scheduleNotification].
@ProviderFor(scheduleNotification)
const scheduleNotificationProvider = ScheduleNotificationFamily();

/// See also [scheduleNotification].
class ScheduleNotificationFamily extends Family<AsyncValue<void>> {
  /// See also [scheduleNotification].
  const ScheduleNotificationFamily();

  /// See also [scheduleNotification].
  ScheduleNotificationProvider call({
    required Schedule schedule,
  }) {
    return ScheduleNotificationProvider(
      schedule: schedule,
    );
  }

  @override
  ScheduleNotificationProvider getProviderOverride(
    covariant ScheduleNotificationProvider provider,
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
  String? get name => r'scheduleNotificationProvider';
}

/// See also [scheduleNotification].
class ScheduleNotificationProvider extends AutoDisposeFutureProvider<void> {
  /// See also [scheduleNotification].
  ScheduleNotificationProvider({
    required Schedule schedule,
  }) : this._internal(
          (ref) => scheduleNotification(
            ref as ScheduleNotificationRef,
            schedule: schedule,
          ),
          from: scheduleNotificationProvider,
          name: r'scheduleNotificationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$scheduleNotificationHash,
          dependencies: ScheduleNotificationFamily._dependencies,
          allTransitiveDependencies:
              ScheduleNotificationFamily._allTransitiveDependencies,
          schedule: schedule,
        );

  ScheduleNotificationProvider._internal(
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
  Override overrideWith(
    FutureOr<void> Function(ScheduleNotificationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ScheduleNotificationProvider._internal(
        (ref) => create(ref as ScheduleNotificationRef),
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ScheduleNotificationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ScheduleNotificationProvider && other.schedule == schedule;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, schedule.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ScheduleNotificationRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `schedule` of this provider.
  Schedule get schedule;
}

class _ScheduleNotificationProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with ScheduleNotificationRef {
  _ScheduleNotificationProviderElement(super.provider);

  @override
  Schedule get schedule => (origin as ScheduleNotificationProvider).schedule;
}

String _$cancelScheduleHash() => r'd3edac4eec8ba4e4517cbc69ddce934a31b2b624';

/// See also [cancelSchedule].
@ProviderFor(cancelSchedule)
const cancelScheduleProvider = CancelScheduleFamily();

/// See also [cancelSchedule].
class CancelScheduleFamily extends Family<AsyncValue<void>> {
  /// See also [cancelSchedule].
  const CancelScheduleFamily();

  /// See also [cancelSchedule].
  CancelScheduleProvider call({
    required int scheduleId,
  }) {
    return CancelScheduleProvider(
      scheduleId: scheduleId,
    );
  }

  @override
  CancelScheduleProvider getProviderOverride(
    covariant CancelScheduleProvider provider,
  ) {
    return call(
      scheduleId: provider.scheduleId,
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
  String? get name => r'cancelScheduleProvider';
}

/// See also [cancelSchedule].
class CancelScheduleProvider extends AutoDisposeFutureProvider<void> {
  /// See also [cancelSchedule].
  CancelScheduleProvider({
    required int scheduleId,
  }) : this._internal(
          (ref) => cancelSchedule(
            ref as CancelScheduleRef,
            scheduleId: scheduleId,
          ),
          from: cancelScheduleProvider,
          name: r'cancelScheduleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cancelScheduleHash,
          dependencies: CancelScheduleFamily._dependencies,
          allTransitiveDependencies:
              CancelScheduleFamily._allTransitiveDependencies,
          scheduleId: scheduleId,
        );

  CancelScheduleProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.scheduleId,
  }) : super.internal();

  final int scheduleId;

  @override
  Override overrideWith(
    FutureOr<void> Function(CancelScheduleRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CancelScheduleProvider._internal(
        (ref) => create(ref as CancelScheduleRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        scheduleId: scheduleId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CancelScheduleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CancelScheduleProvider && other.scheduleId == scheduleId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, scheduleId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CancelScheduleRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `scheduleId` of this provider.
  int get scheduleId;
}

class _CancelScheduleProviderElement
    extends AutoDisposeFutureProviderElement<void> with CancelScheduleRef {
  _CancelScheduleProviderElement(super.provider);

  @override
  int get scheduleId => (origin as CancelScheduleProvider).scheduleId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
