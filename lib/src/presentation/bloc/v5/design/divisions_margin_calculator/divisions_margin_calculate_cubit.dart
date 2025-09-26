import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presale/src/data/core/db_client.dart';
import 'package:presale/src/data/data_sources/v3/input_result_design_source.dart';
import 'package:presale/src/data/data_sources/v3/memory_cashed/design_offer_dto.dart';
import 'package:presale/src/data/data_sources/v3/memory_cashed/design_offer_memory_source.dart';
import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/models/v3/design/input_factors/input_factors_pojo.dart';
import 'package:presale/src/domain/models/v4/design/design_presale_pojo.dart';
import 'package:presale/src/domain/models/v4/design/division_resource_table/division_resource_row_pojo.dart';
import 'package:presale/src/domain/models/v4/design/division_resource_table/divisions_margin_table_with_type_pojo.dart';
import 'package:presale/src/domain/models/v5/design/divisions_margin_table/divisions_margin_row_pojo.dart';
import 'package:presale/src/domain/models/v5/design/divisions_margin_table/divisions_margin_summary_viewmodel.dart';
import 'package:presale/src/domain/models/v5/design/divisions_margin_table/extensions.dart';
import 'package:presale/src/presentation/bloc/core/core/cubit_state_enum.dart';

part 'divisions_margin_calculate_state.dart';

part 'divisions_margin_calculate_cubit.freezed.dart';

class DivisionsMarginRepository {
  final DesignPresaleDTO? _designPresaleDTO;

  DivisionsMarginRepository(DependencyInjector di)
    : _designPresaleDTO = di.inMemoryImpl.designPresaleDTO;

  List<DivisionResourceDTO> get divisionResources =>
      _designPresaleDTO?.divisionResources.values.toList() ?? [];

  List<DivisionsMarginDTO> get divisionMargins =>
      _designPresaleDTO?.divisionMargins.values.toList() ?? [];

  InputFactorsDTO? get inputFactorsDTO =>
      _designPresaleDTO?.inputDataDesignDTO?.inputFactors;


}

class DivisionsMarginCalculateCubit
    extends Cubit<DivisionsMarginCalculateState> {
  final DivisionsViewController _divisionsViewController;
  final DivisionsMarginRepository _repository;

  DivisionsMarginCalculateCubit({required DependencyInjector di})
    : _divisionsViewController = DivisionsViewController(),
        _repository = DivisionsMarginRepository(di),
      super(const DivisionsMarginCalculateState()) {
    _init();
  }

  void _init() async {
    _repository.divisionResources
    // DesignPresalePojo designPresalePojo;
    //
    // designPresalePojo = await _dataSourceLocal.read(
    //   DesignPresaleDataSourceLocal.key,
    // );
    //
    // List<DivisionResourceRowPojo> divisionsByType =
    //     designPresalePojo.resource?.rows ?? [];
    // if (divisionsByType.isNotEmpty) {
    //   InputFactorsPojo inputFactors =
    //       designPresalePojo.inputDataDesign.inputFactors;
    //   _divisionsViewController.fill(inputFactors, divisionsByType);
    //   emit(DivisionsMarginCalculateState(stateEnum: StateEnum.showing));
    // }
  }

  void onOverPriceFactor(int id, double value) {
    _divisionsViewController.onOverPriceFactor(id, value);
  }

  void onMarginFactor(int id, double value) {
    _divisionsViewController.onMarginFactor(id, value);
  }

  void onClientFactor(int id, double value) {
    _divisionsViewController.onClientFactor(id, value);
  }

  void updateCashed() async {
    // List<DivisionsMarginRowPojo> rows = _divisionsViewController.rows
    //     .map((e) => e.toRowPojo())
    //     .toList();
    //
    // DesignPresalePojo designPresalePojo = await _dataSourceLocal.read(
    //   DesignPresaleDataSourceLocal.key,
    // );
    //
    // final updatesDivisions = DivisionsMarginTableWithTypePojo(
    //   divisionType: designPresalePojo.inputDataDesign.divisionType,
    //   rows: rows,
    // );
    //
    // DesignPresalePojo updated = designPresalePojo.copyWith(
    //   divisions: updatesDivisions,
    // );
    //
    // bool isSaves = await _dataSourceLocal.add(updated);
  }
}
