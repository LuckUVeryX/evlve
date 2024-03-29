import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'levels.g.dart';

@JsonEnum(alwaysCreate: true, fieldRename: FieldRename.screamingSnake)
enum Level {
  none,
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
  customClass;
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
      Level.none => Colors.grey.shade300,
      Level.customClass => Colors.black,
      Level.mtLevel1 => Colors.grey,
      Level.mtLevel2 || Level.mtSparring || Level.mtClinching => Colors.red,
      Level.mtLevel3 || Level.outdoorClass => Colors.lime,
      Level.mtWomen || Level.bjjWomen => Colors.pink,
      Level.mtConditioning => Colors.blueGrey,
      Level.mtKids => Colors.orange,
      Level.mtPreteen => Colors.brown,
      Level.mtLittleWarrior => Colors.orange.shade100,
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
}
