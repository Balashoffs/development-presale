import 'package:freezed_annotation/freezed_annotation.dart';

part 'divisions_result_pojo.g.dart';

part 'divisions_result_pojo.freezed.dart';

@freezed
abstract class DivisionsResultPojo with _$DivisionsResultPojo {
  const factory DivisionsResultPojo({
    required int id,
    required String divisionName,
    required String divisionShortName,
    required String divisionDescription,
    required double resultValue,
    required double summaryCostWithTax,
    required double taxValue,
  }) = _DivisionsResultPojo;

  factory DivisionsResultPojo.fromJson(Map<String, dynamic> json) =>
      _$DivisionsResultPojoFromJson(json);
}
