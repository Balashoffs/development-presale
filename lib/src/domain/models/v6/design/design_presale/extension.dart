import 'package:collection/collection.dart';
import 'package:presale/src/data/core/string_converter.dart';
import 'package:presale/src/domain/models/v3/design/division_type/division_type.dart';
import 'package:presale/src/domain/models/v5/common/offer_counter/dto/offer_day_counter_dto.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_row_viewmodel.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/division_resource_row_viewmodel.dart';
import 'package:presale/src/domain/models/v5/design/divisions_margin_table/division_with_margin_row_viewmodel.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_pojo.dart';

extension ResourceDivisionDtoExt on DivisionResourceDTO {
  DivisionsMarginDTO toMargin(InputFactorsDTO factors, double summary) {
    return DivisionsMarginDTO(
      id: id,
      divisionName: divisionName,
      divisionShortName: divisionShortName,
      divisionDescription: divisionDescription,
      resourceDivisionSummaryCost: summary,
      overPriceFactor: factors.overPriceFactor,
      clientFactor: factors.customerFactor,
      marginFactor: factors.marginFactor,
    );
  }

  DivisionWithResourceViewModel toViewModel() {
    return DivisionWithResourceViewModel(
      id: id,
      resourceId: resourceId,
      resourcesQnt: resourcesQnt,
      divisionName: divisionName,
      divisionShortName: divisionShortName,
      divisionDescription: divisionDescription,
      resourceName: resourceName,
      resourceCostPerDay: resourceCostPerDay,
    );
  }
}

extension DivisionResourcesViewModelExt on DivisionWithResourceViewModel {
  DivisionResourceDTO toDto() {
    return DivisionResourceDTO(
      id: id,
      resourceId: resourceId,
      resourcesQnt: resourcesQnt,
      divisionName: divisionName,
      divisionShortName: divisionShortName,
      divisionDescription: divisionDescription,
      resourceName: resourceNameVN.value,
      resourceQnt: resourceQnt,
      workDays: workDays,
      complexFactor: complexFactor,
      squareFactor: squareFactor,
      resourceUsingFactor: resourceUsingFactor,
      resourceCostPerDay: resourceCostPerDayVN.value,
      totalResourceRowCost: totalResourceRowCostVN.value,
    );
  }
}

extension DivisionMarginsViewModelExt on DivisionsWithMarginRowVM {
  DivisionsMarginDTO toDto() {
    return DivisionsMarginDTO(
      id: id,
      divisionName: divisionName,
      divisionShortName: divisionShortName,
      divisionDescription: divisionDescription,
      resourceDivisionSummaryCost: divisionSummaryCost,
      overPriceFactor: overPriceFactor,
      marginFactor: marginFactor,
      clientFactor: clientFactor,
      summaryCostWithTax: summaryCostWithTaxVN.value,
      summaryCostWithMargin: summaryCostWithMarginVN.value,
      marginValue: marginValue,
      clientValue: clientValue,
      overPriceValue: overPriceValue,
      taxValue: taxValue,
    );
  }
}

extension DivisionMarginsDtoExt on DivisionsMarginDTO {
  DivisionsWithMarginRowVM toViewModel() {
    return DivisionsWithMarginRowVM(
      id: id,
      divisionName: divisionName,
      divisionShortName: divisionShortName,
      divisionDescription: divisionDescription,
      divisionSummaryCost: resourceDivisionSummaryCost,
      overPriceFactor: overPriceFactor,
      overPriceValue: resourceDivisionSummaryCost * overPriceFactor,
      marginFactor: marginFactor,
      marginValue: resourceDivisionSummaryCost * marginFactor,
      clientFactor: clientFactor,
      clientValue: resourceDivisionSummaryCost * clientFactor,
      taxValue: taxValue,

      summaryCostWithMargin: summaryCostWithMargin,
      summaryCostWithTax: summaryCostWithTax,
    );
  }

  DivisionResultDTO toDto() {
    return DivisionResultDTO(
      id: id,
      divisionShortName: divisionShortName,
      divisionName: divisionName,
      divisionClearCost: resourceDivisionSummaryCost,
      divisionOverPriceCost: overPriceValue,
      divisionMarginCost: marginValue,
      divisionClientCost: clientValue,
      divisionSummary: summaryCostWithMargin,
      divisionSummaryWithTax: summaryCostWithTax,
    );
  }
}

extension CommercialOfferDtoExt on CommercialOfferDTO {
  DesignOfferResultVM toViewModel() {
    return DesignOfferResultVM(
      divisionType: divisionType,
      createdDate: created,
      id: id,
      objectAddress: objectAddress,
      objectLocation: objectLocation,
      divisionRows: divisionResults.map((e) => e.toViewModel()).toList(),
      overPriceSummary: convertToString(summaryOverPriceCost, 2),
      marginSummary: convertToString(summaryMarginCost, 2),
      clientSummary: convertToString(summaryClientCost, 2),
      summary: convertToString(summary, 2),
      summaryWithTax: convertToString(summaryWithTax, 2),
      tax: convertToString(tax, 2),
      deadline: deadline,
      objectSquare: objectSquare,
    );
  }
}

extension DivisionResultDtoExt on DivisionResultDTO {
  DesignOfferResultRowVM toViewModel() {
    return DesignOfferResultRowVM(
      id: id,
      divisionShortName: divisionShortName,
      divisionName: divisionName,
      overPriceCost: convertToString(divisionOverPriceCost, 2),
      marginCost: convertToString(divisionMarginCost, 2),
      clientCost: convertToString(divisionClientCost, 2),
      clearCost: convertToString(divisionClearCost, 2),
      summary: convertToString(divisionSummary, 2),
      summaryWithTax: convertToString(divisionSummaryWithTax, 2),
    );
  }
}

extension DesignPresalePojoExt on DesignPresalePojo {
  DesignPresaleDTO toDto() {
    return DesignPresaleDTO(
      inputDataDesignDTO: toInputDataDto(),
      divisionResources: divisionResources
          .map((e) => e.toResourceDto())
          .toList()
          .sorted((a, b) => a.resourceId.compareTo(b.resourceId))
          .asMap(),
      divisionMargins: divisionMargins
          .map((e) => e.toMarginDto())
          .toList()
          .sorted((a, b) => a.id.compareTo(b.id))
          .asMap(),
      isAllResources: isAllResources,
    );
  }

  InputDataDesignDTO toInputDataDto() {
    return InputDataDesignDTO(
      dayCounter: dayCounter.toDayCounterDto(),
      objectData: objectData.toObjectDataDto(),
      inputFactors: inputFactors.toInputFactorsDto(),
      divisionType: DivisionType.fromText(divisionType),
    );
  }
}

extension DayCounterPojoExt on OfferDayCounterPojo {
  OfferDayCounterDto toDayCounterDto() {
    return OfferDayCounterDto(timestamp: timeStamp, point: offerId);
  }
}

extension ObjectDataDesignPojoExt on ObjectDataDesignPojo {
  ObjectDataDesignDTO toObjectDataDto() {
    return ObjectDataDesignDTO(
      name: name,
      address: address,
      square: square,
      deadline: deadline,
    );
  }
}

extension InputFactorsDTOPojoExt on InputFactorsPojo {
  InputFactorsDTO toInputFactorsDto() {
    return InputFactorsDTO(
      speedFactor: speedFactor,
      heightFactor: heightFactor,
      overPriceFactor: overPriceFactor,
      remotingFactor: remotingFactor,
      complexityFactor: complexityFactor,
      customerFactor: customerFactor,
      marginFactor: marginFactor,
      squareFactor: squareFactor,
    );
  }
}

extension DivisionResourcePojoExt on DivisionResourcePojo {
  DivisionResourceDTO toResourceDto() {
    return DivisionResourceDTO(
      id: id,
      resourceId: resourceId,
      resourcesQnt: resourcesQnt,
      divisionName: divisionName,
      divisionShortName: divisionShortName,
      divisionDescription: divisionDescription,
      resourceName: resourceName,
      resourceQnt: resourceQnt,
      workDays: workDays,
      complexFactor: complexFactor,
      squareFactor: squareFactor,
      resourceUsingFactor: resourceUsingFactor,
      resourceCostPerDay: resourceCostPerDay,
      totalResourceRowCost: totalResourceRowCost,
    );
  }
}

extension DivisionsMarginPojoExt on DivisionsMarginPojo {
  DivisionsMarginDTO toMarginDto() {
    return DivisionsMarginDTO(
      id: id,
      divisionName: divisionName,
      divisionShortName: divisionShortName,
      divisionDescription: divisionDescription,
      resourceDivisionSummaryCost: resourceDivisionSummaryCost,
      overPriceFactor: overPriceFactor,
      marginFactor: marginFactor,
      clientFactor: clientFactor,
    );
  }
}
