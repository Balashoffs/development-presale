import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presale/src/data/core/db_client.dart';
import 'package:presale/src/di/di.dart';
import 'package:presale/src/data/data_sources/v3/input_result_design_source.dart';
import 'package:presale/src/domain/models/v4/design/design_presale_pojo.dart';
import 'package:presale/src/domain/models/v4/design/division_resource_table/division_resource_row_pojo.dart';
import 'package:presale/src/domain/models/v4/design/division_resource_table/division_resource_table_pojo.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/vc/division_with_all_vc.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/vc/division_with_unselected_vc.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/divisions_with_resources_dto.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/extensions.dart';
import 'package:presale/src/utils/dart_define/model/design_class/design_class.dart';

part 'division_resource_calculate_state.dart';

part 'division_resource_calculate_cubit.freezed.dart';

class DivisionResourceCalculateCubit
    extends Cubit<DivisionResourceCalculateState> {
  final ResourcesWithUnselectedViewController _resourcesViewController;
  // final ResourcesViewController _resourcesViewController;.
  final DesignPresaleDataSourceLocal _dataSourceLocal;

  DivisionResourceCalculateCubit({
    required DBClient dbClient,
    required ResourcesWithUnselectedViewController resourcesViewController,
    // required ResourcesViewController resourcesViewController,
  }) : _dataSourceLocal = DesignPresaleDataSourceLocal(dbClient),
       _resourcesViewController = resourcesViewController,
       super(const DivisionResourceCalculateState.initial());

  void init() async {
    DesignPresalePojo designPresalePojo;
    designPresalePojo = await _dataSourceLocal.getDesignPresale(
      DesignPresaleDataSourceLocal.key,
    );
    DesignClass dc = di.dartDefineModel.design;
    Map<String, DivisionDTO> divisions = await ResourcesDTO.build(
      designPresalePojo.inputDataDesign.divisionType,
      dc,
    );

    _resourcesViewController.fill(divisions, designPresalePojo.inputDataDesign);
    emit(DivisionResourceCalculateState.showPage());
  }

  void onNextPage() async {
    List<DivisionResourceRowPojo> rows = _resourcesViewController
        .selectedRows
        .value
        .map((e) => e.toPojo())
        .toList();

    DesignPresalePojo designPresalePojo = await _dataSourceLocal
        .getDesignPresale(DesignPresaleDataSourceLocal.key);

    DivisionResourceTableWithTypePojo updatedResources =
        DivisionResourceTableWithTypePojo(
          divisionType: designPresalePojo.inputDataDesign.divisionType,
          rows: rows,
        );

    DesignPresalePojo updated = designPresalePojo.copyWith(
      resource: updatedResources,
    );

    if (kDebugMode) {
      String result = json.encode(updated.toJson());
      ;
    }

    bool isSaves = await _dataSourceLocal.addDesignPresale(updated);
    if (isSaves) {
      emit(DivisionResourceCalculateState.nextPage());
    }
  }
}
