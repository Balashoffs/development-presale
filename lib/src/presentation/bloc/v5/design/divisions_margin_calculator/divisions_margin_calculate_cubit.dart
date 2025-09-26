import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presale/src/data/core/db_client.dart';
import 'package:presale/src/data/data_sources/v3/input_result_design_source.dart';
import 'package:presale/src/data/data_sources/v3/memory_cashed/design_offer_dto.dart';
import 'package:presale/src/data/data_sources/v3/memory_cashed/design_offer_memory_source.dart';
import 'package:presale/src/data/data_sources/v3/memory_cashed/extension.dart';
import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/models/v3/design/input_factors/input_factors_pojo.dart';
import 'package:presale/src/domain/models/v4/design/design_presale_pojo.dart';
import 'package:presale/src/domain/models/v4/design/division_resource_table/division_resource_row_pojo.dart';
import 'package:presale/src/domain/models/v4/design/division_resource_table/divisions_margin_table_with_type_pojo.dart';
import 'package:presale/src/domain/models/v5/design/divisions_margin_table/divisions_margin_row_pojo.dart';
import 'package:presale/src/domain/models/v5/design/divisions_margin_table/divisions_margin_summary_viewmodel.dart';
import 'package:presale/src/domain/models/v5/design/divisions_margin_table/extensions.dart';
import 'package:presale/src/presentation/bloc/core/core/cubit_state_enum.dart';
import 'package:presale/src/domain/repository/v5/design/divsion_margin_repository.dart';

part 'divisions_margin_calculate_state.dart';

part 'divisions_margin_calculate_cubit.freezed.dart';
class DivisionsMarginCalculateCubit
    extends Cubit<DivisionsMarginCalculateState> {
  final DivisionsViewController _divisionsViewController;
  final DivisionsMarginRepository _repository;

  DivisionsViewController get controller => _divisionsViewController;

  DivisionsMarginCalculateCubit({required DependencyInjector di})
    : _divisionsViewController = DivisionsViewController(),
      _repository = DivisionsMarginRepository(di),
      super(const DivisionsMarginCalculateState()) {
    _init();
  }

  void _init() async {
    Map<String, List<DivisionResourceDTO>> map = {};
    for (var element in _repository.divisionResources) {
      map.putIfAbsent(element.divisionShortName, () {
        return [];
      });
      map[element.divisionShortName]?.add(element);
    }
    InputFactorsDTO? inputFactorsDTO = _repository.inputFactorsDTO;
    if (inputFactorsDTO != null) {
      final divisions = map.values.map((e) {
        double total = e
            .map((e) => e.totalResourceRowCost)
            .reduce((value, element) => value + element);
        DivisionResourceDTO dto = e.first;
        return dto.toMargin(inputFactorsDTO, total);
      }).toList();
      _repository.fill(divisions);
      _divisionsViewController.fill(divisions);
      emit(DivisionsMarginCalculateState(stateEnum: StateEnum.showing));
    }

  }

  void onOverPriceFactor(int id, double value) {
    final updated = _divisionsViewController.onOverPriceFactor(id, value);
    if (updated != null) {
      final dto = updated.toDto();
      _repository.update(dto);
    }
  }

  void onMarginFactor(int id, double value) {
    final updated = _divisionsViewController.onMarginFactor(id, value);
    if (updated != null) {
      final dto = updated.toDto();
      _repository.update(dto);
    }
  }

  void onClientFactor(int id, double value) {
    final updated = _divisionsViewController.onClientFactor(id, value);
    if (updated != null) {
      final dto = updated.toDto();
      _repository.update(dto);
    }
  }

  void updateCashed() {

  }
}
