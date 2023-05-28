import 'package:freezed_annotation/freezed_annotation.dart';

part 'areas.freezed.dart';
part 'areas.g.dart';

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum Facility {
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

extension FacilityX on Facility {
  String get key => _$FacilityEnumMap[this]!;
}

extension AreaX on Area {
  String get key => _$AreaEnumMap[this]!;
}

@freezed
class FacilityExtraData with _$FacilityExtraData {
  const factory FacilityExtraData({
    required Facility key,
    required String name,
    required String shortName,
    required String title,
    required List<AreaExtraData> areas,
  }) = _FacilityExtraData;

  factory FacilityExtraData.fromJson(Map<String, dynamic> json) =>
      _$FacilityExtraDataFromJson(json);
}

@freezed
class AreaExtraData with _$AreaExtraData {
  const factory AreaExtraData({
    required Area key,
    required String name,
    required String shortName,
  }) = _AreaExtraData;

  factory AreaExtraData.fromJson(Map<String, dynamic> json) =>
      _$AreaExtraDataFromJson(json);
}
