import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'levels.g.dart';

@JsonEnum(alwaysCreate: true, fieldRename: FieldRename.screamingSnake)
enum Level {
  @JsonValue('MT_LEVEL_1')
  mtLevel1,
  @JsonValue('MT_LEVEL_2')
  mtLevel2,
  @JsonValue('MT_LEVEL_3')
  mtLevel3,
  mtSparring,
  mtConditioning,
  mtClinching,
  mtWomen,
  mtKids,
  mtPreteen,
  mtLittleWarrior,
  mtCompetitorsProgram,
  @JsonValue('BOXING_LEVEL_1')
  boxingLevel1,
  @JsonValue('BOXING_LEVEL_2')
  boxingLevel2,
  @JsonValue('BOXING_LEVEL_3')
  boxingLevel3,
  @JsonValue('BOXING_2_SPARRING')
  boxing2Sparring,
  bjjBlue,
  bjjBlueNogi,
  @JsonValue('BJJ_PURLE')
  bjjPurple,
  bjjTakedowns,
  bjjBlack,
  bjjWomen,
  bjjNogi,
  bjjRandori,
  bjjCompetitorsProgram,
  bjjKidsCompetitorsProgram,
  bjjPreteen,
  bjjPreteenRandori,
  bjjKids,
  bjjLittleSamurai,
  warriorFit,
  @JsonValue('WARRIOR_FIT_2')
  warriorFit2,
  warriorFitHiit,
  mma,
  wrestling,
  outdoorClass,
  customClass,
}

extension LevelX on Level {
  String get key {
    return switch (this) {
      Level.bjjPurple => 'BJJ_PURPLE',
      _ => _$LevelEnumMap[this]!
    };
  }

  Color get color {
    return switch (this) {
      Level.customClass => Colors.grey.shade300,
      Level.mtLevel1 => Colors.grey,
      Level.mtLevel2 || Level.mtSparring || Level.mtClinching => Colors.red,
      Level.mtLevel3 || Level.outdoorClass => Colors.lime,
      Level.mtWomen || Level.bjjWomen => Colors.pink,
      Level.mtConditioning => Colors.blueGrey,
      Level.mtKids => Colors.orange,
      Level.mtPreteen => Colors.brown,
      Level.mtLittleWarrior => Colors.orange.shade100,
      Level.mtCompetitorsProgram => Colors.purple.shade200,
      Level.boxingLevel1 => Colors.green,
      Level.boxingLevel2 ||
      Level.boxingLevel3 ||
      Level.boxing2Sparring =>
        Colors.brown,
      Level.warriorFit => Colors.yellow,
      Level.warriorFit2 || Level.warriorFitHiit => Colors.orange,
      Level.bjjBlue || Level.bjjTakedowns || Level.bjjBlueNogi => Colors.blue,
      Level.bjjPurple || Level.bjjNogi || Level.bjjRandori => Colors.purple,
      Level.bjjBlack => Colors.grey.shade700,
      Level.bjjCompetitorsProgram => Colors.blueGrey,
      Level.bjjPreteen || Level.bjjPreteenRandori => Colors.green,
      Level.bjjKids || Level.bjjKidsCompetitorsProgram => Colors.orange,
      Level.bjjLittleSamurai => Colors.blue.shade100,
      Level.mma => Colors.blue.shade900,
      Level.wrestling => Colors.brown.shade900,
    };
  }

  String get attendanceLevel {
    return switch (this) {
      Level.mtLevel1 => 'Muay Thai (I)',
      Level.mtLevel2 => 'Muay Thai (II)',
      Level.mtLevel3 => 'Muay Thai (III)',
      Level.mtCompetitorsProgram => 'Muay Thai Competitors Program',
      Level.mtSparring => 'Muay Thai Sparring',
      Level.mtConditioning => 'Muay Thai Conditioning',
      Level.mtClinching => 'Muay Thai Clinching',
      Level.mtWomen => 'Muay Thai (Women)',
      Level.mtKids => 'Muay Thai Kids',
      Level.mtPreteen => 'Muay Thai Preteen',
      Level.mtLittleWarrior => 'Little Warrior',
      Level.boxingLevel1 => 'Boxing (I)',
      Level.boxingLevel2 => 'Boxing (II)',
      Level.boxingLevel3 => 'Boxing (III)',
      Level.boxing2Sparring => 'Boxing Sparring',
      Level.bjjBlue => 'Brazilian Jiu-Jitsu (Blue)',
      Level.bjjBlueNogi => 'Brazilian Jiu-Jitsu (Blue Nogi)',
      Level.bjjPurple => 'Brazilian Jiu-Jitsu (Purple)',
      Level.bjjNogi => 'Brazilian Jiu-Jitsu (Nogi)',
      Level.bjjRandori => 'Brazilian Jiu-Jitsu (Randori)',
      Level.bjjCompetitorsProgram => 'Brazilian Jiu-Jitsu Competitors Program',
      Level.bjjKidsCompetitorsProgram =>
        'Brazilian Jiu-Jitsu Kids Competitors Program',
      Level.bjjPreteen => 'Brazilian Jiu-Jitsu Preteen',
      Level.bjjPreteenRandori => 'Brazilian Jiu-Jitsu Preteen Randori',
      Level.bjjKids => 'Brazilian Jiu-Jitsu Kids',
      Level.bjjLittleSamurai => 'Brazilian Jiu-Jitsu Little Samurai',
      Level.warriorFit => 'Warrior Fit',
      Level.warriorFit2 => 'Warrior Fit (II)',
      Level.warriorFitHiit => 'Warrior Fit Hiit',
      Level.mma => 'Mixed Martial Arts',
      Level.wrestling => 'Wrestling',
      Level.bjjTakedowns => 'Brazilian Jiu-Jitsu Takedowns',
      Level.bjjBlack => 'Brazilian Jiu-Jitsu (Black)',
      Level.bjjWomen => 'Brazilian Jiu-Jitsu (Women)',
      Level.outdoorClass => 'Outdoor Class',
      Level.customClass => 'Custom Class',
    };
  }
}
