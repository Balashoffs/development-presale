import 'package:freezed_annotation/freezed_annotation.dart';

import 'cost_struct.dart';

part 'section_data.g.dart';

part 'section_data.freezed.dart';

@freezed
abstract class SectionData with _$SectionData {
  const factory SectionData({
    required String id,
    required String parentId,
    required String className,
    required String typeName,
    required String subtypeName,
    required String um,
    required String costRange,
    required double cost,
    required List<CostStruct> jobCosts,
}) = _SectionData;

  factory SectionData.fromJson(Map<String, dynamic> json) =>
      _$SectionDataFromJson(json);
}



