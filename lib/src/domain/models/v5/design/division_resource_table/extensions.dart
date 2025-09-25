import 'package:presale/src/domain/models/v4/design/division_resource_table/division_resource_row_pojo.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/resource_csv.dart';

import 'division_csv.dart';
import 'division_resource_row_viewmodel.dart';
import 'divisions_with_resources_dto.dart';

extension DivisionCsvExt on DivisionCSV {
  DivisionDTO from(List<ResourceDTO> resources) {
    return DivisionDTO(
      id: int.tryParse(id.trim()) ?? -1,
      divisionDescription: divisionDescription.trim(),
      divisionName: divisionName.trim(),
      divisionShortName: divisionShortName.trim().toUpperCase(),
      resources: resources,
    );
  }
}

extension ResourceCsvExt on ResourceCSV {
  ResourceDTO from() {
    return ResourceDTO(
      id: int.tryParse(id.trim()) ?? -1,
      resourceCode: resourceCode.trim().toUpperCase(),
      resourceName: resourceName.trim(),
      resourceCostPerDay: double.tryParse(resourceCostPerDay.trim()) ?? -1.0,
      resourceCostPerHour: double.tryParse(resourceCostPerHour.trim()) ?? -1.0,
    );
  }
}

extension DivisionDtoExt on DivisionDTO {
  DivisionWithResourceViewModel toDivisionResourceRowVM(
    int resourceId, int resourcesQnt,{
    String resourceName = '',
    double resourceCostPerDay = 0.0,
  }) {
    return DivisionWithResourceViewModel(
      id: id,
      resourceId: resourceId,
      resourcesQnt: resourcesQnt,
      divisionDescription: divisionDescription,
      divisionShortName: divisionShortName,
      divisionName: divisionName,
      resourceName: resourceName,
      resourceCostPerDay: resourceCostPerDay,
    );
  }
}


extension DivisionWithResourceRowExt on DivisionWithResourceViewModel {
  DivisionResourceRowPojo toPojo({
    double overPriceFactor = 1.0,
    double marginFactor = 1.0,
  }) {
    return DivisionResourceRowPojo(
      divisionDescription: divisionDescription,
      divisionName: divisionName,
      divisionShortName: divisionShortName,
      resourceName: resourceNameVN.value,
      resourceQnt: resourceQnt,
      workDays: workDays,
      complexFactor: complexFactor,
      squareFactor: squareFactor,
      resourceUsingFactor: resourceUsingFactor,
      resourceRowCost: totalResourceRowCostVN.value,
      resourceCostPerDay: resourceCostPerDayVN.value,
      marginFactor: marginFactor,
      overPriceFactor: overPriceFactor,
      resourceSummaryCost: totalResourceRowCostVN.value,
    );
  }
}
