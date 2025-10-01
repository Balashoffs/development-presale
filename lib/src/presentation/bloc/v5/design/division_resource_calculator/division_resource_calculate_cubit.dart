import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:presale/src/data/data_sources/v3/memory_cashed/design_offer_dto.dart';
import 'package:presale/src/data/data_sources/v3/memory_cashed/extension.dart';
import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/division_resource_row_viewmodel.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/division_with_unselected_vc.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/divisions_with_resources_dto.dart';
import 'package:presale/src/presentation/bloc/core/core/cubit_state_enum.dart';
import 'package:presale/src/domain/repository/v5/design/division_resources_repository.dart';
import 'package:presale/src/domain/models/v4/design/division_resource_table/widget_action_type.dart';

part 'division_resource_calculate_state.dart';

part 'division_resource_calculate_cubit.freezed.dart';

class DivisionResourceCalculateCubit
    extends Cubit<DivisionResourceCalculateState> {
  final ResourcesWithUnselectedViewController _resourcesViewController;

  ResourcesWithUnselectedViewController get controller =>
      _resourcesViewController;

  final DivisionRepository _divisionRepository;

  DivisionResourceCalculateCubit({required DependencyInjector di})
    : _divisionRepository = DivisionRepository(di),
      _resourcesViewController = ResourcesWithUnselectedViewController(),
      super(const DivisionResourceCalculateState()) {
    _init();
  }

  void _init() async {
    Map<String, DivisionDTO> divisions = await _divisionRepository.load();
    _resourcesViewController.fillDivisions(divisions);

    List<DivisionResourceDTO> cached = _divisionRepository.cashedResources;
    bool flag = _divisionRepository.isAllResources;
    if (cached.isNotEmpty) {
      _resourcesViewController.findLoaded(cached, flag);
    }
    emit(
      DivisionResourceCalculateState(
        stateEnum: StateEnum.showing,
        isAllResourcesShow: flag,
      ),
    );
  }

  void onAddRow(int id) {
    DivisionWithResourceViewModel? result;
    result = _resourcesViewController.onAdd(id);
    if (result != null) {
      _divisionRepository.addDivisionResourceDto(result.toDto());
    }
  }

  void onRemoveRow(int resourceId) {
    DivisionWithResourceViewModel? result;
    result = _resourcesViewController.onDelete(resourceId);
    if (result != null) {
      _divisionRepository.removeDivisionResourceDto(result.toDto());
    }
  }

  void onResourceName(int resourceId, String resourceName) {
    DivisionWithResourceViewModel? result = _resourcesViewController
        .onResourceName(resourceId, resourceName);
    if (result != null) {
      _divisionRepository.updateDivisionResourceDto(result.toDto());
    }
  }

  void onCustomResourceName(int resourceId, String resourceName) {
    DivisionWithResourceViewModel? result = _resourcesViewController
        .onCustomResourceName(resourceId, resourceName);
    if (result != null) {
      _divisionRepository.updateDivisionResourceDto(result.toDto());
    }
  }

  void onResourceCostPerDay(int resourceId, double value) {
    DivisionWithResourceViewModel? result = _resourcesViewController
        .onResourceCostPerDay(resourceId, value);
    if (result != null) {
      _divisionRepository.updateDivisionResourceDto(result.toDto());
    }
  }

  void onResourceQnt(int resourceId, int value) {
    DivisionWithResourceViewModel? result = _resourcesViewController
        .onResourceQnt(resourceId, value);
    if (result != null) {
      _divisionRepository.updateDivisionResourceDto(result.toDto());
    }
  }

  void onWorkDays(int resourceId, int value) {
    DivisionWithResourceViewModel? result = _resourcesViewController.onWorkDays(
      resourceId,
      value,
    );
    if (result != null) {
      _divisionRepository.updateDivisionResourceDto(result.toDto());
    }
  }

  void onComplexFactor(int resourceId, double value) {
    DivisionWithResourceViewModel? result = _resourcesViewController
        .onComplexFactor(resourceId, value);
    if (result != null) {
      _divisionRepository.updateDivisionResourceDto(result.toDto());
    }
  }

  void onSquareFactor(int resourceId, double value) {
    DivisionWithResourceViewModel? result = _resourcesViewController
        .onSquareFactor(resourceId, value);
    if (result != null) {
      _divisionRepository.updateDivisionResourceDto(result.toDto());
    }
  }

  void onResourceUsingFactor(int resourceId, double value) {
    DivisionWithResourceViewModel? result = _resourcesViewController
        .onResourceUsingFactor(resourceId, value);
    if (result != null) {
      _divisionRepository.updateDivisionResourceDto(result.toDto());
    }
  }

  void changeTableView(bool value) {
    final viewModelRows = _resourcesViewController.changeTableView(value);
    final dtoRows = viewModelRows.map((e) => e.toDto()).toList();
    _divisionRepository.updateResourceDivision(dtoRows);
  }
}
