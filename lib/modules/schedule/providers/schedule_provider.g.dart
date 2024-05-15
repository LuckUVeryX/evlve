// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$scheduleHash() => r'e0848d5c0dcde5bed2e437a73b9761185052eb53';

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

/// See also [schedule].
@ProviderFor(schedule)
const scheduleProvider = ScheduleFamily();

/// See also [schedule].
class ScheduleFamily extends Family<AsyncValue<ScheduleList>> {
  /// See also [schedule].
  const ScheduleFamily();

  /// See also [schedule].
  ScheduleProvider call({
    required DateTime date,
    required Area area,
  }) {
    return ScheduleProvider(
      date: date,
      area: area,
    );
  }

  @override
  ScheduleProvider getProviderOverride(
    covariant ScheduleProvider provider,
  ) {
    return call(
      date: provider.date,
      area: provider.area,
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
  String? get name => r'scheduleProvider';
}

/// See also [schedule].
class ScheduleProvider extends AutoDisposeFutureProvider<ScheduleList> {
  /// See also [schedule].
  ScheduleProvider({
    required DateTime date,
    required Area area,
  }) : this._internal(
          (ref) => schedule(
            ref as ScheduleRef,
            date: date,
            area: area,
          ),
          from: scheduleProvider,
          name: r'scheduleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$scheduleHash,
          dependencies: ScheduleFamily._dependencies,
          allTransitiveDependencies: ScheduleFamily._allTransitiveDependencies,
          date: date,
          area: area,
        );

  ScheduleProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.date,
    required this.area,
  }) : super.internal();

  final DateTime date;
  final Area area;

  @override
  Override overrideWith(
    FutureOr<ScheduleList> Function(ScheduleRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ScheduleProvider._internal(
        (ref) => create(ref as ScheduleRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        date: date,
        area: area,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ScheduleList> createElement() {
    return _ScheduleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ScheduleProvider &&
        other.date == date &&
        other.area == area;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);
    hash = _SystemHash.combine(hash, area.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ScheduleRef on AutoDisposeFutureProviderRef<ScheduleList> {
  /// The parameter `date` of this provider.
  DateTime get date;

  /// The parameter `area` of this provider.
  Area get area;
}

class _ScheduleProviderElement
    extends AutoDisposeFutureProviderElement<ScheduleList> with ScheduleRef {
  _ScheduleProviderElement(super.provider);

  @override
  DateTime get date => (origin as ScheduleProvider).date;
  @override
  Area get area => (origin as ScheduleProvider).area;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
