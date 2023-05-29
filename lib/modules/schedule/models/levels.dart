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
  mma,
  wrestling;

  static List<Level> get mt {
    return [
      mtLevel1,
      mtLevel2,
      mtLevel3,
      mtSparring,
      mtConditioning,
      mtClinching,
      mtWomen,
      mtKids,
      mtPreteen,
      mtLittleWarrior
    ];
  }

  static List<Level> get boxing {
    return [
      boxingLevel1,
      boxingLevel2,
      boxingLevel3,
      boxing2Sparring,
    ];
  }

  static List<Level> get bjj {
    return [
      bjjBlue,
      bjjBlueNogi,
      bjjPurple,
      bjjNogi,
      bjjRandori,
      bjjCompetitorsProgram,
      bjjKidsCompetitorsProgram,
      bjjPreteen,
      bjjPreteenRandori,
      bjjKids,
      bjjLittleSamurai
    ];
  }

  static List<Level> get others {
    return [
      warriorFit,
      warriorFit2,
      mma,
      wrestling,
    ];
  }
}

extension LevelX on Level {
  String get key {
    return switch (this) {
      Level.bjjPurple => 'BJJ_PURPLE',
      _ => _$LevelEnumMap[this]!
    };
  }
}
