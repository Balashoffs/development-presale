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
import 'package:presale/src/presentation/bloc/v5/design/input/object_input_data/object_input_data_cubit.dart';

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
  DesignOfferResultViewController toViewModel() {
    return DesignOfferResultViewController(
      id: id,
      divisionType: divisionType,
      createdDate: created,
      objectName: objectName,
      objectAddress: objectAddress,
      divisionRows: divisionResults.map((e) => e.toViewModel()).toList(),
      overPriceSummary: convertToString(summaryOverPriceCost, 0),
      marginSummary: convertToString(summaryMarginCost, 0),
      clientSummary: convertToString(summaryClientCost, 0),
      summary: convertToString(divisionSummary, 0),
      summaryWithTax: convertToString(summaryWithTax, 0),
      tax: convertToString(tax, 0),
      deadline: deadline,
      objectSquare: objectSquare,
      inputNotes: noteText,
      presaleFactor: presaleCostFactor,
      presaleCost: presaleCostFactor * summaryWithTax,
    );
  }
}

extension DivisionResultDtoExt on DivisionResultDTO {
  DesignOfferResultRowVM toViewModel() {
    return DesignOfferResultRowVM(
      id: id,
      divisionShortName: divisionShortName,
      divisionName: divisionName,
      overPriceCost: convertToString(divisionOverPriceCost, 0),
      marginCost: convertToString(divisionMarginCost, 0),
      clientCost: convertToString(divisionClientCost, 0),
      clearCost: convertToString(divisionClearCost, 0),
      summary: convertToString(divisionSummary, 0),
      summaryWithTax: convertToString(divisionSummaryWithTax, 0),
    );
  }
}

extension InputDataDesignDtoExt on InputDataDesignDTO {
  InputDataViewModel toVM() {
    return InputDataViewModel(
      name: objectData.name,
      address: objectData.address,
      type: divisionType.text,
      square: objectData.square,
      deadline: objectData.deadline,
      marginFactor: inputFactors.marginFactor,
      overPriceFactor: inputFactors.overPriceFactor,
      clientFactor: inputFactors.customerFactor,
    );
  }
}

extension DesignPresalePojoExt on DesignPresalePojo {
  DesignPresaleDTO toDto() {
    final resources = divisionResources
        .map((e) => e.toResourceDto())
        .sorted((a, b) => a.resourceId.compareTo(b.resourceId))
        .toList();

    Map<int, DivisionResourceDTO> updatesResources = {};
    for (var value in resources) {
      updatesResources.putIfAbsent(value.resourceId, () => value);
    }

    final margins = divisionMargins
        .map((e) => e.toMarginDto())
        .sorted((a, b) => a.id.compareTo(b.id))
        .toList();

    Map<int, DivisionsMarginDTO> updatesMargins = {};
    for (var value in margins) {
      updatesMargins.putIfAbsent(value.id, () => value);
    }

    return DesignPresaleDTO(
      inputDataDesignDTO: toInputDataDto(),
      divisionResources: updatesResources,
      divisionMargins: updatesMargins,
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
  OfferDayCounterDTO toDayCounterDto() {
    return OfferDayCounterDTO(timestamp: timeStamp, point: offerId);
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
