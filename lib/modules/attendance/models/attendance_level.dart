import 'package:evlve/modules/attendance/attendance.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_level.g.dart';

@JsonEnum(alwaysCreate: true)
enum AttendanceLevel {
  @JsonValue('Muay Thai (I)')
  mtLevel1,
  @JsonValue('Muay Thai (II)')
  mtLevel2,
  @JsonValue('Muay Thai (III)')
  mtLevel3,
  @JsonValue('Muay Thai Competitors Program')
  mtCompetitorsProgram,
  @JsonValue('Muay Thai Sparring')
  mtSparring,
  @JsonValue('Muay Thai Conditioning')
  mtConditioning,
  @JsonValue('Muay Thai Clinching')
  mtClinching,
  @JsonValue('Muay Thai (Women)')
  mtWomen,
  @JsonValue('Muay Thai Kids')
  mtKids,
  @JsonValue('Muay Thai Preteen')
  mtPreteen,
  @JsonValue('Little Warrior')
  mtLittleWarrior,
  @JsonValue('Boxing (I)')
  boxingLevel1,
  @JsonValue('Boxing (II)')
  boxingLevel2,
  @JsonValue('Boxing (III)')
  boxingLevel3,
  @JsonValue('Boxing Sparring')
  boxing2Sparring,
  @JsonValue('Brazilian Jiu-Jitsu (Blue)')
  bjjBlue,
  @JsonValue('Brazilian Jiu-Jitsu (Blue) Techniques')
  bjjBlueTechniques,
  @JsonValue('Brazilian Jiu-Jitsu (Blue) Grappling')
  bjjBlueGrappling,
  @JsonValue('Brazilian Jiu-Jitsu (Blue) No-Gi')
  bjjBlueNogi,
  @JsonValue('Brazilian Jiu-Jitsu (Purple)')
  bjjPurple,
  @JsonValue('Brazilian Jiu-Jitsu (No-Gi)')
  bjjNogi,
  @JsonValue('Brazilian Jiu-Jitsu (Randori)')
  bjjRandori,
  @JsonValue('Brazilian Jiu-Jitsu Competitors Program')
  bjjCompetitorsProgram,
  @JsonValue('Brazilian Jiu-Jitsu Kids Competitors Program')
  bjjKidsCompetitorsProgram,
  @JsonValue('Brazilian Jiu-Jitsu Preteen')
  bjjPreteen,
  @JsonValue('Brazilian Jiu-Jitsu Preteen (Randori)')
  bjjPreteenRandori,
  @JsonValue('Brazilian Jiu-Jitsu Kids')
  bjjKids,
  @JsonValue('Little Samurai')
  bjjLittleSamurai,
  @JsonValue('Warrior Fit')
  warriorFit,
  @JsonValue('Warrior Fit (II)')
  warriorFit2,
  @JsonValue('Mixed Martial Arts')
  mma,
  @JsonValue('Wrestling')
  wrestling,
  @JsonValue('Outdoor Class')
  outdoorClass,
  @JsonValue('Custom Class')
  customClass;

  static Map<String, AttendanceLevel> get attendanceLevelEnumMap {
    return _$AttendanceLevelEnumMap.map((key, value) => MapEntry(value, key));
  }
}

extension AttendanceLevelX on AttendanceLevel {
  String get key {
    return switch (this) { _ => _$AttendanceLevelEnumMap[this]! };
  }

  AttendanceGraphFilter toType() {
    switch (this) {
      case AttendanceLevel.mtLevel1:
      case AttendanceLevel.mtLevel2:
      case AttendanceLevel.mtLevel3:
      case AttendanceLevel.mtSparring:
      case AttendanceLevel.mtConditioning:
      case AttendanceLevel.mtClinching:
      case AttendanceLevel.mtWomen:
      case AttendanceLevel.mtKids:
      case AttendanceLevel.mtPreteen:
      case AttendanceLevel.mtLittleWarrior:
      case AttendanceLevel.mtCompetitorsProgram:
      case AttendanceLevel.outdoorClass:
      case AttendanceLevel.customClass:
        return AttendanceGraphFilter.muayThai;
      case AttendanceLevel.boxingLevel1:
      case AttendanceLevel.boxingLevel2:
      case AttendanceLevel.boxingLevel3:
      case AttendanceLevel.boxing2Sparring:
        return AttendanceGraphFilter.boxing;
      case AttendanceLevel.bjjBlue:
      case AttendanceLevel.bjjBlueTechniques:
      case AttendanceLevel.bjjBlueGrappling:
      case AttendanceLevel.bjjBlueNogi:
      case AttendanceLevel.bjjPurple:
      case AttendanceLevel.bjjNogi:
      case AttendanceLevel.bjjRandori:
      case AttendanceLevel.bjjCompetitorsProgram:
      case AttendanceLevel.bjjKidsCompetitorsProgram:
      case AttendanceLevel.bjjPreteen:
      case AttendanceLevel.bjjPreteenRandori:
      case AttendanceLevel.bjjKids:
      case AttendanceLevel.bjjLittleSamurai:
        return AttendanceGraphFilter.bjj;
      case AttendanceLevel.warriorFit:
      case AttendanceLevel.warriorFit2:
      case AttendanceLevel.mma:
      case AttendanceLevel.wrestling:
        return AttendanceGraphFilter.others;
    }
  }

  Level toLevel() {
    return switch (this) {
      AttendanceLevel.mtLevel1 => Level.mtLevel1,
      AttendanceLevel.mtLevel2 => Level.mtLevel2,
      AttendanceLevel.mtLevel3 => Level.mtLevel3,
      AttendanceLevel.mtCompetitorsProgram => Level.mtCompetitorsProgram,
      AttendanceLevel.outdoorClass => Level.outdoorClass,
      AttendanceLevel.customClass => Level.customClass,
      AttendanceLevel.mtSparring => Level.mtSparring,
      AttendanceLevel.mtConditioning => Level.mtConditioning,
      AttendanceLevel.mtClinching => Level.mtClinching,
      AttendanceLevel.mtWomen => Level.mtWomen,
      AttendanceLevel.mtKids => Level.mtKids,
      AttendanceLevel.mtPreteen => Level.mtPreteen,
      AttendanceLevel.mtLittleWarrior => Level.mtLittleWarrior,
      AttendanceLevel.boxingLevel1 => Level.boxingLevel1,
      AttendanceLevel.boxingLevel2 => Level.boxingLevel2,
      AttendanceLevel.boxingLevel3 => Level.boxingLevel3,
      AttendanceLevel.boxing2Sparring => Level.boxing2Sparring,
      AttendanceLevel.bjjBlue ||
      AttendanceLevel.bjjBlueGrappling ||
      AttendanceLevel.bjjBlueTechniques =>
        Level.bjjBlue,
      AttendanceLevel.bjjBlueNogi => Level.bjjBlueNogi,
      AttendanceLevel.bjjPurple => Level.bjjPurple,
      AttendanceLevel.bjjNogi => Level.bjjNogi,
      AttendanceLevel.bjjRandori => Level.bjjRandori,
      AttendanceLevel.bjjCompetitorsProgram => Level.bjjCompetitorsProgram,
      AttendanceLevel.bjjKidsCompetitorsProgram =>
        Level.bjjKidsCompetitorsProgram,
      AttendanceLevel.bjjPreteen => Level.bjjPreteen,
      AttendanceLevel.bjjPreteenRandori => Level.bjjPreteenRandori,
      AttendanceLevel.bjjKids => Level.bjjKids,
      AttendanceLevel.bjjLittleSamurai => Level.bjjLittleSamurai,
      AttendanceLevel.warriorFit => Level.warriorFit,
      AttendanceLevel.warriorFit2 => Level.warriorFit2,
      AttendanceLevel.mma => Level.mma,
      AttendanceLevel.wrestling => Level.wrestling
    };
  }
}
