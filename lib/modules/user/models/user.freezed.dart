// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: 'memberId')
  String get id => throw _privateConstructorUsedError;
  Facility get defaultLocation => throw _privateConstructorUsedError;
  List<FacilityExtraData> get facilities => throw _privateConstructorUsedError;
  String? get mfaMethod => throw _privateConstructorUsedError;
  String? get waitlistNotificationMethod => throw _privateConstructorUsedError;
  String? get program => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get mobile => throw _privateConstructorUsedError;
  bool? get autoBook => throw _privateConstructorUsedError;
  bool? get addBuddy => throw _privateConstructorUsedError;
  bool? get isEmployee => throw _privateConstructorUsedError;
  bool? get accessToRegularClasses => throw _privateConstructorUsedError;
  String? get renewalType => throw _privateConstructorUsedError;
  String? get vaccinationStatus => throw _privateConstructorUsedError;
  bool? get hasActiveTEAP => throw _privateConstructorUsedError;
  bool? get isActiveGeneralMembership => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: 'memberId') String id,
      Facility defaultLocation,
      List<FacilityExtraData> facilities,
      String? mfaMethod,
      String? waitlistNotificationMethod,
      String? program,
      String? title,
      String? firstName,
      String? lastName,
      String? email,
      String? mobile,
      bool? autoBook,
      bool? addBuddy,
      bool? isEmployee,
      bool? accessToRegularClasses,
      String? renewalType,
      String? vaccinationStatus,
      bool? hasActiveTEAP,
      bool? isActiveGeneralMembership});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? defaultLocation = null,
    Object? facilities = null,
    Object? mfaMethod = freezed,
    Object? waitlistNotificationMethod = freezed,
    Object? program = freezed,
    Object? title = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? mobile = freezed,
    Object? autoBook = freezed,
    Object? addBuddy = freezed,
    Object? isEmployee = freezed,
    Object? accessToRegularClasses = freezed,
    Object? renewalType = freezed,
    Object? vaccinationStatus = freezed,
    Object? hasActiveTEAP = freezed,
    Object? isActiveGeneralMembership = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      defaultLocation: null == defaultLocation
          ? _value.defaultLocation
          : defaultLocation // ignore: cast_nullable_to_non_nullable
              as Facility,
      facilities: null == facilities
          ? _value.facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<FacilityExtraData>,
      mfaMethod: freezed == mfaMethod
          ? _value.mfaMethod
          : mfaMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      waitlistNotificationMethod: freezed == waitlistNotificationMethod
          ? _value.waitlistNotificationMethod
          : waitlistNotificationMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      program: freezed == program
          ? _value.program
          : program // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      autoBook: freezed == autoBook
          ? _value.autoBook
          : autoBook // ignore: cast_nullable_to_non_nullable
              as bool?,
      addBuddy: freezed == addBuddy
          ? _value.addBuddy
          : addBuddy // ignore: cast_nullable_to_non_nullable
              as bool?,
      isEmployee: freezed == isEmployee
          ? _value.isEmployee
          : isEmployee // ignore: cast_nullable_to_non_nullable
              as bool?,
      accessToRegularClasses: freezed == accessToRegularClasses
          ? _value.accessToRegularClasses
          : accessToRegularClasses // ignore: cast_nullable_to_non_nullable
              as bool?,
      renewalType: freezed == renewalType
          ? _value.renewalType
          : renewalType // ignore: cast_nullable_to_non_nullable
              as String?,
      vaccinationStatus: freezed == vaccinationStatus
          ? _value.vaccinationStatus
          : vaccinationStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      hasActiveTEAP: freezed == hasActiveTEAP
          ? _value.hasActiveTEAP
          : hasActiveTEAP // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActiveGeneralMembership: freezed == isActiveGeneralMembership
          ? _value.isActiveGeneralMembership
          : isActiveGeneralMembership // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'memberId') String id,
      Facility defaultLocation,
      List<FacilityExtraData> facilities,
      String? mfaMethod,
      String? waitlistNotificationMethod,
      String? program,
      String? title,
      String? firstName,
      String? lastName,
      String? email,
      String? mobile,
      bool? autoBook,
      bool? addBuddy,
      bool? isEmployee,
      bool? accessToRegularClasses,
      String? renewalType,
      String? vaccinationStatus,
      bool? hasActiveTEAP,
      bool? isActiveGeneralMembership});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? defaultLocation = null,
    Object? facilities = null,
    Object? mfaMethod = freezed,
    Object? waitlistNotificationMethod = freezed,
    Object? program = freezed,
    Object? title = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? mobile = freezed,
    Object? autoBook = freezed,
    Object? addBuddy = freezed,
    Object? isEmployee = freezed,
    Object? accessToRegularClasses = freezed,
    Object? renewalType = freezed,
    Object? vaccinationStatus = freezed,
    Object? hasActiveTEAP = freezed,
    Object? isActiveGeneralMembership = freezed,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      defaultLocation: null == defaultLocation
          ? _value.defaultLocation
          : defaultLocation // ignore: cast_nullable_to_non_nullable
              as Facility,
      facilities: null == facilities
          ? _value._facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<FacilityExtraData>,
      mfaMethod: freezed == mfaMethod
          ? _value.mfaMethod
          : mfaMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      waitlistNotificationMethod: freezed == waitlistNotificationMethod
          ? _value.waitlistNotificationMethod
          : waitlistNotificationMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      program: freezed == program
          ? _value.program
          : program // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      autoBook: freezed == autoBook
          ? _value.autoBook
          : autoBook // ignore: cast_nullable_to_non_nullable
              as bool?,
      addBuddy: freezed == addBuddy
          ? _value.addBuddy
          : addBuddy // ignore: cast_nullable_to_non_nullable
              as bool?,
      isEmployee: freezed == isEmployee
          ? _value.isEmployee
          : isEmployee // ignore: cast_nullable_to_non_nullable
              as bool?,
      accessToRegularClasses: freezed == accessToRegularClasses
          ? _value.accessToRegularClasses
          : accessToRegularClasses // ignore: cast_nullable_to_non_nullable
              as bool?,
      renewalType: freezed == renewalType
          ? _value.renewalType
          : renewalType // ignore: cast_nullable_to_non_nullable
              as String?,
      vaccinationStatus: freezed == vaccinationStatus
          ? _value.vaccinationStatus
          : vaccinationStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      hasActiveTEAP: freezed == hasActiveTEAP
          ? _value.hasActiveTEAP
          : hasActiveTEAP // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActiveGeneralMembership: freezed == isActiveGeneralMembership
          ? _value.isActiveGeneralMembership
          : isActiveGeneralMembership // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl extends _User {
  const _$UserImpl(
      {@JsonKey(name: 'memberId') required this.id,
      required this.defaultLocation,
      required final List<FacilityExtraData> facilities,
      this.mfaMethod,
      this.waitlistNotificationMethod,
      this.program,
      this.title,
      this.firstName,
      this.lastName,
      this.email,
      this.mobile,
      this.autoBook,
      this.addBuddy,
      this.isEmployee,
      this.accessToRegularClasses,
      this.renewalType,
      this.vaccinationStatus,
      this.hasActiveTEAP,
      this.isActiveGeneralMembership})
      : _facilities = facilities,
        super._();

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: 'memberId')
  final String id;
  @override
  final Facility defaultLocation;
  final List<FacilityExtraData> _facilities;
  @override
  List<FacilityExtraData> get facilities {
    if (_facilities is EqualUnmodifiableListView) return _facilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_facilities);
  }

  @override
  final String? mfaMethod;
  @override
  final String? waitlistNotificationMethod;
  @override
  final String? program;
  @override
  final String? title;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? email;
  @override
  final String? mobile;
  @override
  final bool? autoBook;
  @override
  final bool? addBuddy;
  @override
  final bool? isEmployee;
  @override
  final bool? accessToRegularClasses;
  @override
  final String? renewalType;
  @override
  final String? vaccinationStatus;
  @override
  final bool? hasActiveTEAP;
  @override
  final bool? isActiveGeneralMembership;

  @override
  String toString() {
    return 'User(id: $id, defaultLocation: $defaultLocation, facilities: $facilities, mfaMethod: $mfaMethod, waitlistNotificationMethod: $waitlistNotificationMethod, program: $program, title: $title, firstName: $firstName, lastName: $lastName, email: $email, mobile: $mobile, autoBook: $autoBook, addBuddy: $addBuddy, isEmployee: $isEmployee, accessToRegularClasses: $accessToRegularClasses, renewalType: $renewalType, vaccinationStatus: $vaccinationStatus, hasActiveTEAP: $hasActiveTEAP, isActiveGeneralMembership: $isActiveGeneralMembership)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.defaultLocation, defaultLocation) ||
                other.defaultLocation == defaultLocation) &&
            const DeepCollectionEquality()
                .equals(other._facilities, _facilities) &&
            (identical(other.mfaMethod, mfaMethod) ||
                other.mfaMethod == mfaMethod) &&
            (identical(other.waitlistNotificationMethod,
                    waitlistNotificationMethod) ||
                other.waitlistNotificationMethod ==
                    waitlistNotificationMethod) &&
            (identical(other.program, program) || other.program == program) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.autoBook, autoBook) ||
                other.autoBook == autoBook) &&
            (identical(other.addBuddy, addBuddy) ||
                other.addBuddy == addBuddy) &&
            (identical(other.isEmployee, isEmployee) ||
                other.isEmployee == isEmployee) &&
            (identical(other.accessToRegularClasses, accessToRegularClasses) ||
                other.accessToRegularClasses == accessToRegularClasses) &&
            (identical(other.renewalType, renewalType) ||
                other.renewalType == renewalType) &&
            (identical(other.vaccinationStatus, vaccinationStatus) ||
                other.vaccinationStatus == vaccinationStatus) &&
            (identical(other.hasActiveTEAP, hasActiveTEAP) ||
                other.hasActiveTEAP == hasActiveTEAP) &&
            (identical(other.isActiveGeneralMembership,
                    isActiveGeneralMembership) ||
                other.isActiveGeneralMembership == isActiveGeneralMembership));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        defaultLocation,
        const DeepCollectionEquality().hash(_facilities),
        mfaMethod,
        waitlistNotificationMethod,
        program,
        title,
        firstName,
        lastName,
        email,
        mobile,
        autoBook,
        addBuddy,
        isEmployee,
        accessToRegularClasses,
        renewalType,
        vaccinationStatus,
        hasActiveTEAP,
        isActiveGeneralMembership
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User extends User {
  const factory _User(
      {@JsonKey(name: 'memberId') required final String id,
      required final Facility defaultLocation,
      required final List<FacilityExtraData> facilities,
      final String? mfaMethod,
      final String? waitlistNotificationMethod,
      final String? program,
      final String? title,
      final String? firstName,
      final String? lastName,
      final String? email,
      final String? mobile,
      final bool? autoBook,
      final bool? addBuddy,
      final bool? isEmployee,
      final bool? accessToRegularClasses,
      final String? renewalType,
      final String? vaccinationStatus,
      final bool? hasActiveTEAP,
      final bool? isActiveGeneralMembership}) = _$UserImpl;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: 'memberId')
  String get id;
  @override
  Facility get defaultLocation;
  @override
  List<FacilityExtraData> get facilities;
  @override
  String? get mfaMethod;
  @override
  String? get waitlistNotificationMethod;
  @override
  String? get program;
  @override
  String? get title;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get email;
  @override
  String? get mobile;
  @override
  bool? get autoBook;
  @override
  bool? get addBuddy;
  @override
  bool? get isEmployee;
  @override
  bool? get accessToRegularClasses;
  @override
  String? get renewalType;
  @override
  String? get vaccinationStatus;
  @override
  bool? get hasActiveTEAP;
  @override
  bool? get isActiveGeneralMembership;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
