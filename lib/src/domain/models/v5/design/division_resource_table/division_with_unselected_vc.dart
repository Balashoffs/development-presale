import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:presale/src/data/data_sources/v3/memory_cashed/design_offer_dto.dart';
import 'package:presale/src/data/data_sources/v3/memory_cashed/extension.dart';
import 'package:presale/src/data/v3/design_calculator.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/division_resource_row_viewmodel.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/extensions.dart';
import 'package:presale/src/presentation/modules/v5/design/division_resource_calculate/viewmodel/division_viewmodel.dart';

import 'divisions_with_resources_dto.dart';

class ResourcesWithUnselectedViewController {
  final List<DivisionDTO> _loadedDivisions = [];
  final List<DivisionViewModel> divisionsVM = [];
  final Map<int, List<int>> _createdResourcedId = {};

  final ValueNotifier<List<DivisionWithResourceViewModel>> selectedRows =
      ValueNotifier([]);

  final ValueNotifier<double> summaryVN = ValueNotifier(0.0);
  final ValueNotifier<bool> isValid = ValueNotifier(false);
  final ValueNotifier<bool> isAllRow = ValueNotifier(false);

  final DesignOfferCalculator _designOfferCalculator = DesignOfferCalculator();

  double get summaryCost => selectedRows.value.isNotEmpty
      ? selectedRows.value
            .map((e) => e.totalResourceRowCostVN.value)
            .reduce((value, element) => value + element)
      : 0.0;

  bool get _isEmptyCostHas =>
      selectedRows.value.isNotEmpty &&
      selectedRows.value
          .where(
            (element) =>
                element.totalResourceRowCostVN.value.compareTo(0.0) == 0,
          )
          .isEmpty;

  void fillDivisions(Map<String, DivisionDTO> divisions) {
    _loadedDivisions.addAll(divisions.values);

    List<DivisionViewModel> vms = divisions.values
        .map((e) => e.toViewModel())
        .sorted((a, b) => a.id.compareTo(b.id));

    divisionsVM.addAll(vms);
  }

  void findLoaded(List<DivisionResourceDTO> list, bool isAllLoad) {
    List<DivisionWithResourceViewModel> loaded = list.map((e) {
      DivisionWithResourceViewModel vm = e.toViewModel();
      vm.complexFactor = e.complexFactor;
      vm.squareFactor = e.squareFactor;
      vm.resourceUsingFactor = e.resourceUsingFactor;
      vm.workDays = e.workDays;
      vm.resourceQnt = e.resourceQnt;
      vm.totalResourceRowCostVN.value = e.totalResourceRowCost;
      return vm;
    }).toList();

    if (isAllLoad) {
      List<DivisionWithResourceViewModel> notFilled = _loadedDivisions
          .where((element) => !element.divisionShortName.contains('ИД'))
          .map((e) => _buildById(e.id))
          .nonNulls
          .where(
            (element) => loaded
                .where((load) => load.resourceId == element.resourceId)
                .isEmpty,
          )
          .toList();
      loaded.addAll(notFilled);
    }

    for (var element in loaded) {
      _designOfferCalculator.calcResourceCost(element);
    }

    loaded.sort((a, b) => a.resourceId.compareTo(b.resourceId));

    selectedRows.value = [...loaded];

    updateResults();
  }

  void updateResults() {
    summaryVN.value = summaryCost;
    isValid.value = _isEmptyCostHas;
  }

  DivisionWithResourceViewModel? onAdd(int id) {
    DivisionWithResourceViewModel? found = _buildById(id);
    if (found != null) {
      List<DivisionWithResourceViewModel> updated = [
        ...selectedRows.value,
        found,
      ];
      updated.sort((a, b) => a.resourceId.compareTo(b.resourceId));
      selectedRows.value = [...updated];
    }
    if (isAllRow.value) {
      isAllRow.value = false;
    }
    return found;
  }

  DivisionWithResourceViewModel? onDelete(int id) {
    DivisionWithResourceViewModel? found = _getById(id);
    if (found != null) {
      _deleteResourceId(found.id, found.resourceId);
      selectedRows.value.removeWhere((element) => element.id == id);
      selectedRows.value = [...selectedRows.value];
      summaryVN.value = summaryCost;
    }
    return found;
  }

  DivisionWithResourceViewModel? onResourceName(int id, String resourceName) {
    DivisionWithResourceViewModel? found = _getById(id);
    if (found != null) {
      DivisionDTO? divisionDTO = _loadedDivisions
          .where(
            (element) => element.divisionShortName == found.divisionShortName,
          )
          .firstOrNull;
      if (divisionDTO != null) {
        ResourceDTO? foundResource = divisionDTO.resources
            .where((element) => element.resourceName == resourceName)
            .firstOrNull;
        if (foundResource != null) {
          found.resourceNameVN.value = foundResource.resourceName;
          found.resourceCostPerDayVN.value = foundResource.resourceCostPerDay;
          _calcResourceTotal(found);
        }
      }
    }

    return found;
  }

  DivisionWithResourceViewModel? onCustomResourceName(
    int id,
    String resourceName,
  ) {
    DivisionWithResourceViewModel? found = _getById(id);
    if (found != null) {
      found.resourceNameVN.value = resourceName;
    }
    return found;
  }

  DivisionWithResourceViewModel? onResourceCostPerDay(int id, double value) {
    DivisionWithResourceViewModel? found = _getById(id);
    if (found != null) {
      found.resourceCostPerDayVN.value = value;
      _calcResourceTotal(found);
    }
    return found;
  }

  DivisionWithResourceViewModel? onResourceQnt(int id, int value) {
    DivisionWithResourceViewModel? found = _getById(id);
    if (found != null) {
      found.resourceQnt = value;
      _calcResourceTotal(found);
    }
    return found;
  }

  DivisionWithResourceViewModel? onWorkDays(int id, int value) {
    DivisionWithResourceViewModel? found = _getById(id);
    if (found != null) {
      found.workDays = value;
      _calcResourceTotal(found);
    }
    return found;
  }

  DivisionWithResourceViewModel? onComplexFactor(int id, double value) {
    DivisionWithResourceViewModel? found = _getById(id);
    if (found != null) {
      found.complexFactor = value;
      _calcResourceTotal(found);
    }
    return found;
  }

  DivisionWithResourceViewModel? onSquareFactor(int id, double value) {
    DivisionWithResourceViewModel? found = _getById(id);
    if (found != null) {
      found.squareFactor = value;
      _calcResourceTotal(found);
    }
    return found;
  }

  DivisionWithResourceViewModel? onResourceUsingFactor(int id, double value) {
    DivisionWithResourceViewModel? found = _getById(id);
    if (found != null) {
      found.resourceUsingFactor = value;
      _calcResourceTotal(found);
    }
    return found;
  }

  void _calcResourceTotal(DivisionWithResourceViewModel value) {
    double total = _designOfferCalculator.calcResourceCost(value);
    if (total.compareTo(0.0) > 0) {
      value.totalResourceRowCostVN.value = total;
      updateResults();
    }
  }

  DropDownResources resourcesByDivisionShortName(
    DivisionWithResourceViewModel row,
    int index,
  ) {
    String divisionShortName = row.divisionShortName;
    String defaultValue = row.resourceNameVN.value;
    ResourceDTO defaultResource;
    List<ResourceDTO> loaded =
        _loadedDivisions
            .where((element) => element.divisionShortName == divisionShortName)
            .firstOrNull
            ?.resources
            .sorted(
              (a, b) => b.resourceCostPerDay.compareTo(a.resourceCostPerDay),
            ) ??
        [];
    if (divisionShortName.isNotEmpty) {
      defaultResource = loaded
          .where((element) => element.resourceName == defaultValue)
          .first;
      loaded.removeWhere((element) => element.resourceName == defaultValue);
    } else {
      defaultResource = loaded.first;
      loaded.removeWhere(
        (element) => element.resourceName == defaultResource.resourceName,
      );
    }

    return DropDownResources(
      defaultValue: defaultResource,
      unloaded: loaded,
      index: index,
      row: row,
      key: Key(row.resourceId.toString()),
      id: row.id,
    );
  }

  int resourcesQnt(String divisionShortName) => _loadedDivisions
      .where((element) => element.divisionShortName == divisionShortName)
      .length;

  DivisionWithResourceViewModel? _buildById(int id) {
    return _loadedDivisions.where((element) => element.id == id).map((e) {
      int resourceId = _createResourceId(id);
      ResourceDTO? resource = e.resources.length == 1
          ? e.resources[0]
          : e.resources
                .sorted(
                  (a, b) =>
                      b.resourceCostPerDay.compareTo(a.resourceCostPerDay),
                )
                .firstOrNull;
      if (resource != null) {
        return e.toDivisionResourceRowVM(
          resourceId,
          e.resources.length,
          resourceName: resource.resourceName,
          resourceCostPerDay: resource.resourceCostPerDay,
        );
      }
    }).firstOrNull;
  }

  int _createResourceId(int id) {
    int resourceId = 0;
    if (!_createdResourcedId.containsKey(id)) {
      _createdResourcedId.putIfAbsent(id, () => []);
      resourceId = id * 10 + 1;
    } else {
      resourceId = _createdResourcedId[id]!.last + 1;
    }
    _createdResourcedId[id]!.add(resourceId);
    print('id: $id, resourceId: $resourceId');
    return resourceId;
  }

  void _deleteResourceId(int id, int resourceId) {
    _createdResourcedId[id]?.removeWhere((element) => element == resourceId);
    if (_createdResourcedId[id]!.isEmpty) {
      _createdResourcedId.remove(id);
    }
  }

  DivisionWithResourceViewModel? _getById(int id) {
    return selectedRows.value
        .where((element) => element.resourceId == id)
        .firstOrNull;
  }

  void sortTable() {
    final sorted = selectedRows.value.sorted((a, b) => a.id.compareTo(b.id));
    selectedRows.value = [...sorted];
  }

  List<DivisionWithResourceViewModel> changeTableView(bool value) {
    selectedRows.value = [];
    summaryVN.value = 0.0;
    _createdResourcedId.clear();
    isValid.value = false;
    List<DivisionWithResourceViewModel> rows;
    if (value) {
      isAllRow.value = true;
      rows = _loadedDivisions
          .where((element) => !element.divisionShortName.contains('ИД'))
          .map((e) => _buildById(e.id))
          .nonNulls
          .toList();
      rows.sorted((a, b) => a.resourceId.compareTo(b.resourceId));
    } else {
      rows = [];
      isAllRow.value = false;
    }
    selectedRows.value = [...rows];

    return rows;
  }
}
