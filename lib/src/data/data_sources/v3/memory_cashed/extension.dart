import 'package:presale/src/data/data_sources/v3/memory_cashed/design_offer_dto.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/division_resource_row_viewmodel.dart';
import 'package:presale/src/domain/models/v5/design/divisions_margin_table/division_with_margin_row_viewmodel.dart';

extension ResourceDivisionDtoExt on DivisionResourceDTO {
  DivisionsMarginDTO toMargin(InputFactorsDTO factors, double summary) {
    return DivisionsMarginDTO(
      id: resourceId,
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
      marginValue: divisionSummaryCost * marginFactor,
      clientValue: divisionSummaryCost * clientFactor,
      overPriceValue: divisionSummaryCost * overPriceValue,
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
      marginFactor: marginFactor,
      clientFactor: clientFactor,
      taxValue: taxValue,
      overPriceValue: overPriceValue,
      clientValue: clientValue,
      marginValue: marginValue,
      summaryCostWithMargin: summaryCostWithMargin,
      summaryCostWithTax: summaryCostWithTax,
    );
  }
}
