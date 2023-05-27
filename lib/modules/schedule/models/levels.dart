import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum Level {
  unknown,
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
  wrestling,
}
