import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presale/src/data/core/db_client.dart';
import 'package:presale/src/data/data_sources/v3/input_result_design_source.dart';
import 'package:presale/src/domain/models/v3/design/input_factors/input_factors_pojo.dart';
import 'package:presale/src/domain/models/v4/design/design_presale_pojo.dart';
import 'package:presale/src/domain/models/v4/design/division_resource_table/division_resource_row_pojo.dart';
import 'package:presale/src/domain/models/v4/design/division_resource_table/divisions_margin_table_with_type_pojo.dart';
import 'package:presale/src/domain/models/v5/design/divisions_margin_table/divisions_margin_row_pojo.dart';
import 'package:presale/src/domain/models/v5/design/divisions_margin_table/divisions_margin_summary_viewmodel.dart';
import 'package:presale/src/domain/models/v5/design/divisions_margin_table/extensions.dart';

part 'divisions_margin_calculate_state.dart';

part 'divisions_margin_calculate_cubit.freezed.dart';

class DivisionsMarginCalculateCubit
    extends Cubit<DivisionsMarginCalculateState> {
  final DivisionsViewController _divisionsViewController;
  final DesignPresaleDataSourceLocal _dataSourceLocal;

  DivisionsMarginCalculateCubit({
    required DBClient dbClient,
    required DivisionsViewController resourceSummaryViewModel,
  }) : _dataSourceLocal = DesignPresaleDataSourceLocal(dbClient),
       _divisionsViewController = resourceSummaryViewModel,
       super(const DivisionsMarginCalculateState.initial());

  void init() async {
    DesignPresalePojo designPresalePojo;

    designPresalePojo = await _dataSourceLocal.read(
      DesignPresaleDataSourceLocal.key,
    );

    List<DivisionResourceRowPojo> divisionsByType =
        designPresalePojo.resource?.rows ?? [];
    if (divisionsByType.isNotEmpty) {
      InputFactorsPojo inputFactors  = designPresalePojo.inputDataDesign.inputFactors;
      _divisionsViewController.fill(inputFactors, divisionsByType);
      emit(DivisionsMarginCalculateState.showPage());
    }
  }

  void onNextPage() async {
    List<DivisionsMarginRowPojo> rows = _divisionsViewController.rows
        .map((e) => e.toRowPojo())
        .toList();

    DesignPresalePojo designPresalePojo = await _dataSourceLocal
        .read(DesignPresaleDataSourceLocal.key);

    final updatesDivisions = DivisionsMarginTableWithTypePojo(
      divisionType: designPresalePojo.inputDataDesign.divisionType,
      rows: rows,
    );

    DesignPresalePojo updated = designPresalePojo.copyWith(
      divisions: updatesDivisions,
    );

    bool isSaves = await _dataSourceLocal.add(updated);
    if (isSaves) {
      emit(DivisionsMarginCalculateState.nextPage());
    }
  }
}
