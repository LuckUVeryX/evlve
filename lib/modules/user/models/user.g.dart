// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['memberId'] as String,
      defaultLocation: $enumDecode(_$FacilityEnumMap, json['defaultLocation']),
      facilities: (json['facilities'] as List<dynamic>)
          .map((e) => FacilityExtraData.fromJson(e as Map<String, dynamic>))
          .toList(),
      mfaMethod: json['mfaMethod'] as String?,
      waitlistNotificationMethod: json['waitlistNotificationMethod'] as String?,
      program: json['program'] as String?,
      title: json['title'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      autoBook: json['autoBook'] as bool?,
      addBuddy: json['addBuddy'] as bool?,
      isEmployee: json['isEmployee'] as bool?,
      accessToRegularClasses: json['accessToRegularClasses'] as bool?,
      renewalType: json['renewalType'] as String?,
      vaccinationStatus: json['vaccinationStatus'] as String?,
      hasActiveTEAP: json['hasActiveTEAP'] as bool?,
      isActiveGeneralMembership: json['isActiveGeneralMembership'] as bool?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'memberId': instance.id,
      'defaultLocation': _$FacilityEnumMap[instance.defaultLocation]!,
      'facilities': instance.facilities,
      'mfaMethod': instance.mfaMethod,
      'waitlistNotificationMethod': instance.waitlistNotificationMethod,
      'program': instance.program,
      'title': instance.title,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'mobile': instance.mobile,
      'autoBook': instance.autoBook,
      'addBuddy': instance.addBuddy,
      'isEmployee': instance.isEmployee,
      'accessToRegularClasses': instance.accessToRegularClasses,
      'renewalType': instance.renewalType,
      'vaccinationStatus': instance.vaccinationStatus,
      'hasActiveTEAP': instance.hasActiveTEAP,
      'isActiveGeneralMembership': instance.isActiveGeneralMembership,
    };

const _$FacilityEnumMap = {
  Facility.cq: 'CQ',
  Facility.fes: 'FES',
  Facility.oc: 'OC',
  Facility.kinex: 'KINEX',
  Facility.sv: 'SV',
};
