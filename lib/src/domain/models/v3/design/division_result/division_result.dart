import 'package:freezed_annotation/freezed_annotation.dart';

part 'division_result.freezed.dart';
part 'division_result.g.dart';


@freezed
abstract class DivisionResult with _$DivisionResult {
  const factory DivisionResult({
    required final int id,
    required final String divisionShortName,
    required final String divisionName,
    required final double divisionOverPrice,
    required final double divisionMargin,
    required final double divisionClient,
    required final double divisionSummary,
    required final double divisionSummaryWithTax,
  }) = _DivisionResult;

  factory DivisionResult.fromJson(Map<String, dynamic> json) =>
      _$DivisionResultFromJson(json);
}
