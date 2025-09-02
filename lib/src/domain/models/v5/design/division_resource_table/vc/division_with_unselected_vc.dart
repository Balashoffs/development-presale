import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:presale/src/data/v3/design_calculator.dart';
import 'package:presale/src/domain/models/v3/design/input_data/input_data_design.dart';
import 'package:presale/src/domain/models/v4/design/division_resource_table/widget_action_type.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/division_resource_row_viewmodel.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/extensions.dart';
import 'package:presale/src/presentation/modules/v5/design/division_resource_calculate/viewmodel/division_viewmodel.dart';

import '../divisions_with_resources_dto.dart';

class ResourcesWithUnselectedViewController {
  final List<DivisionDTO> _loadedDivisions = [];
  final List<DivisionViewModel> divisionsVM = [];
  final Map<int, List<int>> _createdResourcedId = {};

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

  void fill(
    Map<String, DivisionDTO> divisions,
    InputDataDesign inputDataDesign,
  ) {
    _loadedDivisions.addAll(divisions.values);
    List<DivisionViewModel> vms = divisions.values
        .map((e) => e.toViewModel())
        .sorted((a, b) => a.id.compareTo(b.id));
    divisionsVM.addAll(vms);
    divisionTypeVN.value = inputDataDesign.divisionType.text;
  }

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
    DivisionWithResourceRowVM? found = _buildById(id);
    if (found != null) {
      String divisionShortName = found.divisionShortName;
      List<ResourceDTO> resources = resourcesByDivisionShortName(
        divisionShortName,
      );
      if (resources.length == 1) {
        found.resourceCostPerDayVN.value = resources[0].resourceCostPerDay;
        found.resourceNameVN.value = resources[0].resourceName;
      }
      List<DivisionWithResourceRowVM> updated = [...selectedRows.value, found];
      updated.sort((a, b) => a.id.compareTo(b.id));
      selectedRows.value = [...updated];
    }
  }

  void _onDelete(int id) {
    DivisionWithResourceRowVM? found = _getById(id);
    if (found != null) {
      selectedRows.value.removeWhere((element) => element.id == id);
      selectedRows.value = [...selectedRows.value];
      summaryVN.value = summaryCost;
      _deleteResourceId(id, found.id);
    }
  }

  void onResourceName(int id, String resourceName) {
    DivisionWithResourceRowVM? found = _getById(id);
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
  }

  void onCustomResourceName(int id, String resourceName) {
    DivisionWithResourceRowVM? found = _getById(id);
    if (found != null) {
      if (resourceName.isEmpty) {
        found.resourceNameVN.value = '';
        found.resourceCostPerDayVN.value = 0.0;
      }
      found.resourceNameVN.value = resourceName;
    }
  }

  void onResourceCostPerDay(int id, double value) {
    DivisionWithResourceRowVM? found = _getById(id);
    if (found != null) {
      found.resourceCostPerDayVN.value = value;
      _calcResourceTotal(found);
    }
  }

  void onResourceQnt(int id, int value) {
    DivisionWithResourceRowVM? found = _getById(id);
    if (found != null) {
      found.resourceQnt = value;
      _calcResourceTotal(found);
    }
  }

  void onWorkDays(int id, int value) {
    DivisionWithResourceRowVM? found = _getById(id);
    if (found != null) {
      found.workDays = value;
      _calcResourceTotal(found);
    }
  }

  void onComplexFactor(int id, double value) {
    DivisionWithResourceRowVM? found = _getById(id);
    if (found != null) {
      found.complexFactor = value;
      _calcResourceTotal(found);
    }
  }

  void onSquareFactor(int id, double value) {
    DivisionWithResourceRowVM? found = _getById(id);
    if (found != null) {
      found.squareFactor = value;
      _calcResourceTotal(found);
    }
  }

  void onResourceUsingFactor(int id, double value) {
    DivisionWithResourceRowVM? found = _getById(id);
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

  List<ResourceDTO> resourcesByDivisionShortName(String divisionShortName) =>
      _loadedDivisions
          .where((element) => element.divisionShortName == divisionShortName)
          .firstOrNull
          ?.resources ??
      [];

  int resourcesQnt(String divisionShortName) => _loadedDivisions
      .where((element) => element.divisionShortName == divisionShortName)
      .length;

  DivisionWithResourceRowVM? _buildById(int id) {
    return _loadedDivisions.where((element) => element.id == id).map((e) {
      int resourceId = _createResourceId(id);
      return e.toDivisionResourceRowVM(resourceId);
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
    return resourceId;
  }

  void _deleteResourceId(int id, int resourceId) {
    _createdResourcedId[id]!.removeWhere((element) => element == resourceId);
    if (_createdResourcedId[id]!.isEmpty) {
      _createdResourcedId.remove(id);
    }
  }

  DivisionWithResourceRowVM? _getById(int id) {
    return selectedRows.value.where((element) => element.id == id).firstOrNull;
  }

  void sortTable() {
    final sorted = selectedRows.value.sorted((a, b) => a.id.compareTo(b.id));
    selectedRows.value = [...sorted];
  }
}
