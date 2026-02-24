import 'package:freezed_annotation/freezed_annotation.dart';

part 'design_offer_pojo.g.dart';

part 'design_offer_pojo.freezed.dart';

@freezed
abstract class DesignPresalePojo with _$DesignPresalePojo {
  const factory DesignPresalePojo({
    required OfferDayCounterPojo dayCounter,
    required ObjectDataDesignPojo objectData,
    required InputFactorsPojo inputFactors,
    required String divisionType,
    required String objectType,
    @Default([]) List<DivisionResourcePojo> divisionResources,
    @Default([]) List<DivisionsMarginPojo> divisionMargins,
    @Default(false) bool isAllResources,
}) = _DesignPresalePojo;

  factory DesignPresalePojo.fromJson(Map<String, dynamic> json) =>
      _$DesignPresalePojoFromJson(json);
}

@freezed
abstract class OfferDayCounterPojo with _$OfferDayCounterPojo {
  const factory OfferDayCounterPojo({
    required int timeStamp,
    required int offerId,
}) = _OfferDayCounterPojo;

  factory OfferDayCounterPojo.fromJson(Map<String, dynamic> json) =>
      _$OfferDayCounterPojoFromJson(json);
}

@freezed
abstract class ObjectDataDesignPojo with _$ObjectDataDesignPojo {
  const factory ObjectDataDesignPojo({
    required String customer,
    required String name,
    required String address,
    required int square,
    required int deadline,
  }) = _ObjectDataDesignPojo;

  factory ObjectDataDesignPojo.fromJson(Map<String, dynamic> json) =>
      _$ObjectDataDesignPojoFromJson(json);
}

@freezed
abstract class InputFactorsPojo with _$InputFactorsPojo {
  const factory InputFactorsPojo({
    @Default(1.0) double speedFactor,
    @Default(1.0) double heightFactor,
    @Default(1.0) double overPriceFactor,
    @Default(1.0) double remotingFactor,
    @Default(1.0) double complexityFactor,
    @Default(1.0) double customerFactor,
    @Default(1.0) double marginFactor,
    @Default(1.0) double squareFactor,
  }) = _InputFactorsPojo;

  factory InputFactorsPojo.fromJson(Map<String, dynamic> json) =>
      _$InputFactorsPojoFromJson(json);
}

@freezed
abstract class DivisionResourcePojo with _$DivisionResourcePojo {
  const factory DivisionResourcePojo({
    required int id,
    required int resourceId,
    required int resourcesQnt,
    required String divisionName,
    required String divisionShortName,
    required String divisionDescription,
    required String resourceName,
    required int resourceQnt,
    required int workDays,
    required double complexFactor,
    required double squareFactor,
    required double resourceUsingFactor,
    required double resourceCostPerDay,
    required double totalResourceRowCost,
  }) = _DivisionResourcePojo;

  factory DivisionResourcePojo.fromJson(Map<String, dynamic> json) =>
      _$DivisionResourcePojoFromJson(json);
}

@freezed
abstract class DivisionsMarginPojo with _$DivisionsMarginPojo {
  const factory DivisionsMarginPojo({
    required int id,
    required String divisionName,
    required String divisionShortName,
    required String divisionDescription,
    required double resourceDivisionSummaryCost,
    required double overPriceFactor,
    required double marginFactor,
    required double clientFactor,
    @Default(0.0) double overPriceValue,
    @Default(0.0) double marginValue,
    @Default(0.0) double clientValue,
    @Default(0.0) double summaryCostWithMargin,
    @Default(0.0) double summaryCostWithTax,
    @Default(0.0) double taxValue,
  }) = _DivisionsMarginPojo;

  factory DivisionsMarginPojo.fromJson(Map<String, dynamic> json) =>
      _$DivisionsMarginPojoFromJson(json);
}
