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

  void onRowAction(int id, WidgetActionType type) {
    DivisionWithResourceViewModel? result;
    switch (type) {
      case WidgetActionType.add:
        result = _resourcesViewController.onAdd(id);
        if (result != null) {
          _divisionRepository.addDivisionResourceDto(result.toDto());
        }
        break;
      case WidgetActionType.delete:
        result = _resourcesViewController.onDelete(id);
        if (result != null) {
          _divisionRepository.removeDivisionResourceDto(result.toDto());
        }
        break;
    }
    _resourcesViewController.updateResults();
  }

  void onResourceName(int id, String resourceName) {
    DivisionWithResourceViewModel? result = _resourcesViewController
        .onResourceName(id, resourceName);
    if (result != null) {
      _divisionRepository.updateDivisionResourceDto(result.toDto());
    }
  }

  void onCustomResourceName(int id, String resourceName) {
    DivisionWithResourceViewModel? result = _resourcesViewController
        .onCustomResourceName(id, resourceName);
    if (result != null) {
      _divisionRepository.updateDivisionResourceDto(result.toDto());
    }
  }

  void onResourceCostPerDay(int id, double value) {
    DivisionWithResourceViewModel? result = _resourcesViewController
        .onResourceCostPerDay(id, value);
    if (result != null) {
      _divisionRepository.updateDivisionResourceDto(result.toDto());
    }
  }

  void onResourceQnt(int id, int value) {
    DivisionWithResourceViewModel? result = _resourcesViewController
        .onResourceQnt(id, value);
    if (result != null) {
      _divisionRepository.updateDivisionResourceDto(result.toDto());
    }
  }

  void onWorkDays(int id, int value) {
    DivisionWithResourceViewModel? result = _resourcesViewController.onWorkDays(
      id,
      value,
    );
    if (result != null) {
      _divisionRepository.updateDivisionResourceDto(result.toDto());
    }
  }

  void onComplexFactor(int id, double value) {
    DivisionWithResourceViewModel? result = _resourcesViewController
        .onComplexFactor(id, value);
    if (result != null) {
      _divisionRepository.updateDivisionResourceDto(result.toDto());
    }
  }

  void onSquareFactor(int id, double value) {
    DivisionWithResourceViewModel? result = _resourcesViewController
        .onSquareFactor(id, value);
    if (result != null) {
      _divisionRepository.updateDivisionResourceDto(result.toDto());
    }
  }

  void onResourceUsingFactor(int id, double value) {
    DivisionWithResourceViewModel? result = _resourcesViewController
        .onResourceUsingFactor(id, value);
    if (result != null) {
      _divisionRepository.updateDivisionResourceDto(result.toDto());
    }
  }

  void changeTableView(bool value) {
    _divisionRepository.isAllResources = value;
    if (!value) {
      _divisionRepository.clearResourceDivisions();
    }
    _resourcesViewController.changeTableView(value);
  }
}
