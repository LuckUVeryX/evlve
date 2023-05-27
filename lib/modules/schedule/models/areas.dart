import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum Facilities {
  cq,
  fes,
  oc,
  kinex,
  sv,
}

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum Area {
  cqMt,
  cqJj,
  fesWarrior,
  fesChampion,
  fesLegend,
  ocMt,
  ocJj,
  kinexMt,
  kinexJj,
  svMt,
  svJj
}
