import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:presale/src/data/v3/design_calculator.dart';
import 'package:presale/src/domain/models/v3/design/input_data/input_data_design.dart';
import 'package:presale/src/domain/models/v4/design/division_resource_table/widget_action_type.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/division_resource_row_viewmodel.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/extensions.dart';

import '../divisions_with_resources_dto.dart';

class ResourcesWithUnselectedViewController {
  final ValueNotifier<List<DivisionDTO>> unselectedDivisionsVN = ValueNotifier(
    [],
  );
  final Map<String, DivisionDTO> _unselectedDivisions = {};
  final Map<String, DivisionDTO> _selectedDivisions = {};

  final ValueNotifier<List<DivisionWithResourceRowVM>> selectedRows =
      ValueNotifier([]);

  final ValueNotifier<double> summaryVN = ValueNotifier(0.0);
  final ValueNotifier<bool> isValid = ValueNotifier(false);
  final ValueNotifier<String> divisionTypeVN = ValueNotifier('');

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

  DivisionWithResourceRowVM? getById(int id) {
    return _unselectedDivisions.values
        .where((element) => element.id == id)
        .map((e) => e.toDivisionResourceRowVM())
        .firstOrNull;
  }

  DivisionWithResourceRowVM? getByIdVM(int id) {
    return selectedRows.value.where((element) => element.id == id).firstOrNull;
  }

  void fill(
    Map<String, DivisionDTO> divisions,
    InputDataDesign inputDataDesign,
  ) {
    _unselectedDivisions.addAll(divisions);
    unselectedDivisionsVN.value = [...divisions.values];
    divisionTypeVN.value = inputDataDesign.divisionType.text;
  }

  List<ResourceDTO> resourcesByDivisionShortName(String divisionShortName) =>
      _unselectedDivisions[divisionShortName]?.resources ?? [];

  void onRowAction(int id, WidgetActionType type) {
    switch (type) {
      case WidgetActionType.add:
        _onAdd(id);
      case WidgetActionType.delete:
        _onDelete(id);
    }
    isValid.value = _isEmptyCostHas;
    summaryVN.value = summaryCost;
  }

  void _onAdd(int id) {
    _updateUnselectedDivision();

    DivisionWithResourceRowVM? found = getById(id);
    if (found != null) {
      String divisionShortName = found.divisionShortName;
      List<ResourceDTO> resources = resourcesByDivisionShortName(
        divisionShortName,
      );
      if (resources.length == 1) {
        found.resourceCostPerDayVN.value = resources[0].resourceCostPerDay;
        found.resourceNameVN.value = resources[0].resourceName;
      } else if (resources.isEmpty) {
        found.resourceCostPerDayVN.value = -1;
        found.resourceNameVN.value = '';
      }
      List<DivisionWithResourceRowVM> updated = [...selectedRows.value, found];
      updated.sort((a, b) => b.id.compareTo(a.id),);
      selectedRows.value = [...updated];
      _updateUnselectedDivision();
    }
  }

  void _onDelete(int id) {
    DivisionWithResourceRowVM? found = getByIdVM(id);
    if (found != null) {
      selectedRows.value.removeWhere((element) => element.id == id);
      selectedRows.value = [...selectedRows.value];
      summaryVN.value = summaryCost;
      _updateSelectedDivision(
        found.divisionShortName,
        found.resourceNameVN.value,
      );
    }
  }

  void onResourceName(int id, String resourceName) {
    DivisionWithResourceRowVM? found = getByIdVM(id);
    if (found != null) {
      DivisionDTO? divisionDTO = _unselectedDivisions[found.divisionShortName];
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
  }

  void onCustomResourceName(int id, String resourceName) {
    DivisionWithResourceRowVM? found = getByIdVM(id);
    if (found != null) {
      if (resourceName.isEmpty) {
        found.resourceNameVN.value = '';
        found.resourceCostPerDayVN.value = 0.0;
      }
      found.resourceNameVN.value = resourceName;
    }
  }

  void onResourceCostPerDay(int id, double value) {
    DivisionWithResourceRowVM? found = getByIdVM(id);
    if (found != null) {
      found.resourceCostPerDayVN.value = value;
      _calcResourceTotal(found);
    }
  }

  void onResourceQnt(int id, int value) {
    DivisionWithResourceRowVM? found = getByIdVM(id);
    if (found != null) {
      found.resourceQnt = value;
      _calcResourceTotal(found);
    }
  }

  void onWorkDays(int id, int value) {
    DivisionWithResourceRowVM? found = getByIdVM(id);
    if (found != null) {
      found.workDays = value;
      _calcResourceTotal(found);
    }
  }

  void onComplexFactor(int id, double value) {
    DivisionWithResourceRowVM? found = getByIdVM(id);
    if (found != null) {
      found.complexFactor = value;
      _calcResourceTotal(found);
    }
  }

  void onSquareFactor(int id, double value) {
    DivisionWithResourceRowVM? found = getByIdVM(id);
    if (found != null) {
      found.squareFactor = value;
      _calcResourceTotal(found);
    }
  }

  void onResourceUsingFactor(int id, double value) {
    DivisionWithResourceRowVM? found = getByIdVM(id);
    if (found != null) {
      found.resourceUsingFactor = value;
      _calcResourceTotal(found);
    }
  }

  void _calcResourceTotal(DivisionWithResourceRowVM value) {
    double total = _designOfferCalculator.calcResourceCost(value);
    if (total.compareTo(0.0) > 0) {
      value.totalResourceRowCostVN.value = total;
      summaryVN.value = summaryCost;
      isValid.value = _isEmptyCostHas;
    }
  }

  void _updateUnselectedDivision() {
    Map<String, Set<String>> selectedResources = {};
    for (var value in selectedRows.value) {
      String divisionShortName = value.divisionShortName;
      String resourcesName = value.resourceNameVN.value;
      selectedResources.putIfAbsent(divisionShortName, () => {});
      selectedResources[divisionShortName]?.add(resourcesName);
    }

    for (var selected in selectedResources.entries) {
      DivisionDTO? unselectedDivisionDTO = _unselectedDivisions[selected.key];

      if (unselectedDivisionDTO != null) {
        List<ResourceDTO> maybeSelected = unselectedDivisionDTO.resources
            .where((element) => selected.value.contains(element.resourceName))
            .toList();
        unselectedDivisionDTO.resources.removeWhere(
          (element) => selected.value.contains(element.resourceName),
        );
        _selectedDivisions.putIfAbsent(
          selected.key,
          () => unselectedDivisionDTO.copyWith(resources: []),
        );
        _selectedDivisions[selected.key]?.resources.addAll(maybeSelected);

        if (unselectedDivisionDTO.resources.isEmpty) {
          _unselectedDivisions.remove(selected.key);
        }
      }
    }

    unselectedDivisionsVN.value = [..._unselectedDivisions.values];
  }

  void _updateSelectedDivision(String divisionShortName, String resourceName) {
    DivisionDTO? selectedDivision = _selectedDivisions[divisionShortName];
    if (selectedDivision != null) {
      ResourceDTO? selectedResource = selectedDivision.resources
          .where((element) => element.resourceName == resourceName)
          .firstOrNull;

      if (selectedResource != null) {
        selectedDivision.resources.removeWhere(
          (element) => element.resourceName == resourceName,
        );

        DivisionDTO? unselectedDivision =
            _unselectedDivisions[divisionShortName];
        if (unselectedDivision == null) {
          _unselectedDivisions.putIfAbsent(
            divisionShortName,
            () => selectedDivision.copyWith(resources: []),
          );
        }
        _unselectedDivisions[divisionShortName]?.resources.add(
          selectedResource,
        );

        unselectedDivisionsVN.value = [..._unselectedDivisions.values];
      }
    }
  }
}
