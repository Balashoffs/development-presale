import 'package:presale/src/data/data_sources/v3/memory_cashed/design_offer_dto.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/division_resource_row_viewmodel.dart';

extension ResourceDivisionDtoExt on DivisionResourceDTO {
  DivisionsMarginDTO toMargin(InputFactorsDTO factors) {
    return DivisionsMarginDTO(
      id: resourceId,
      divisionName: divisionName,
      divisionShortName: divisionShortName,
      divisionDescription: divisionDescription,
      resourceDivisionSummaryCost: totalResourceRowCost,
      overPriceFactor: factors.overPriceFactor,
      clientFactor: factors.customerFactor,
      marginFactor: factors.marginFactor,
      clientValue: factors.overPriceFactor * totalResourceRowCost,
      marginValue: factors.marginFactor * totalResourceRowCost,
      overPriceValue: factors.overPriceFactor * totalResourceRowCost,
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

extension ResourceDivisionViewModelExt on DivisionWithResourceViewModel {
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
