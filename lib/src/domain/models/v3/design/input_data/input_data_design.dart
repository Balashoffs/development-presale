import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presale/src/domain/models/v3/design/division_type/division_type.dart';
import 'package:presale/src/domain/models/v3/design/input_factors/input_factors_pojo.dart';
import 'package:presale/src/domain/models/v5/common/offer_counter/pojo/offer_day_counter.dart';

import 'object_data_design.dart';

part 'input_data_design.freezed.dart';
part 'input_data_design.g.dart';


@freezed
abstract class InputDataDesign with _$InputDataDesign {
  const factory InputDataDesign({
    // Дата и время создание КП
    required OfferDayCounterPojo offerCounter,
    // Данные об объекте
     required ObjectDataDesign objectData,
    required InputFactorsPojo inputFactors,
    // Тип проектной документации на выходе
    required DivisionType divisionType,
  }) = _InputDataDesign;

  factory InputDataDesign.fromJson(Map<String, dynamic> json) =>
      _$InputDataDesignFromJson(json);
}


