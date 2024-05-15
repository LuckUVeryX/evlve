// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$attendanceHash() => r'8b8b2a2ff56393759a052bcd78f55c0f44e91b86';

/// See also [attendance].
@ProviderFor(attendance)
final attendanceProvider =
    AutoDisposeFutureProvider<List<AttendanceState>>.internal(
  attendance,
  name: r'attendanceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$attendanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AttendanceRef = AutoDisposeFutureProviderRef<List<AttendanceState>>;
String _$attendanceDayHash() => r'9f93b451d00c6d80c93d98bec91859ad90ced17e';

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

/// See also [attendanceDay].
@ProviderFor(attendanceDay)
const attendanceDayProvider = AttendanceDayFamily();

/// See also [attendanceDay].
class AttendanceDayFamily
    extends Family<AsyncValue<Map<DateTime, List<AttendanceState>>>> {
  /// See also [attendanceDay].
  const AttendanceDayFamily();

  /// See also [attendanceDay].
  AttendanceDayProvider call({
    required AttendanceGraphFilter filter,
  }) {
    return AttendanceDayProvider(
      filter: filter,
    );
  }

  @override
  AttendanceDayProvider getProviderOverride(
    covariant AttendanceDayProvider provider,
  ) {
    return call(
      filter: provider.filter,
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
  String? get name => r'attendanceDayProvider';
}

/// See also [attendanceDay].
class AttendanceDayProvider
    extends AutoDisposeFutureProvider<Map<DateTime, List<AttendanceState>>> {
  /// See also [attendanceDay].
  AttendanceDayProvider({
    required AttendanceGraphFilter filter,
  }) : this._internal(
          (ref) => attendanceDay(
            ref as AttendanceDayRef,
            filter: filter,
          ),
          from: attendanceDayProvider,
          name: r'attendanceDayProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$attendanceDayHash,
          dependencies: AttendanceDayFamily._dependencies,
          allTransitiveDependencies:
              AttendanceDayFamily._allTransitiveDependencies,
          filter: filter,
        );

  AttendanceDayProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filter,
  }) : super.internal();

  final AttendanceGraphFilter filter;

  @override
  Override overrideWith(
    FutureOr<Map<DateTime, List<AttendanceState>>> Function(
            AttendanceDayRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AttendanceDayProvider._internal(
        (ref) => create(ref as AttendanceDayRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        filter: filter,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<DateTime, List<AttendanceState>>>
      createElement() {
    return _AttendanceDayProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AttendanceDayProvider && other.filter == filter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filter.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AttendanceDayRef
    on AutoDisposeFutureProviderRef<Map<DateTime, List<AttendanceState>>> {
  /// The parameter `filter` of this provider.
  AttendanceGraphFilter get filter;
}

class _AttendanceDayProviderElement extends AutoDisposeFutureProviderElement<
    Map<DateTime, List<AttendanceState>>> with AttendanceDayRef {
  _AttendanceDayProviderElement(super.provider);

  @override
  AttendanceGraphFilter get filter => (origin as AttendanceDayProvider).filter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
