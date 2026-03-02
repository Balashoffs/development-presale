import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presale/src/data/data_sources/v5/design_offer_memory_source.dart';
import 'package:presale/src/data/v3/design_calculator.dart';

import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/pojo_extension.dart';
import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/division_resource_row_viewmodel.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/division_with_unselected_vc.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/divisions_with_resources_dto.dart';
import 'package:presale/src/domain/repository/v5/design/divsion_margin_repository.dart';
import 'package:presale/src/presentation/bloc/core/core/cubit_state_enum.dart';
import 'package:presale/src/domain/repository/v5/design/division_resources_repository.dart';

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
      var resourceDto = result.toDto();
      _divisionRepository.addDivisionResourceDto(resourceDto);
    }
  }

  void onRemoveRow(int resourceId) {
    DivisionWithResourceViewModel? result;
    result = _resourcesViewController.onDelete(resourceId);
    if (result != null) {
      var resourceDto = result.toDto();
      _divisionRepository.removeDivisionResourceDto(resourceDto);
    }
  }

  void onResourceName(int resourceId, String resourceName) {
    DivisionWithResourceViewModel? result = _resourcesViewController
        .onResourceName(resourceId, resourceName);
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

  void onCalculateResourceMargin() {
    _divisionRepository.calculateResourceMargin();
  }
}
