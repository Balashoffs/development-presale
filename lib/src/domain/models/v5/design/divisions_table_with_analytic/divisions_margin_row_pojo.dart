import 'package:freezed_annotation/freezed_annotation.dart';

part 'divisions_margin_row_pojo.freezed.dart';
part 'divisions_margin_row_pojo.g.dart';

@freezed
abstract class DivisionWithAnalyticPojo with _$DivisionWithAnalyticPojo {
  const factory DivisionWithAnalyticPojo({
    required int id,
    required String shifr,
    required String section,
    required double humanHours,
    required double localAnalytic,
    required double outsideAnalytic,
    required double result,
}) = _DivisionWithAnalyticPojo;

  factory DivisionWithAnalyticPojo.fromJson(Map<String, dynamic> json) =>
      _$DivisionWithAnalyticPojoFromJson(json);
}
