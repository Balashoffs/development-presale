import 'package:flutter/material.dart';
import 'package:presale/src/data/v3/design_calculator.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/pojo_extension.dart';
import 'package:presale/src/domain/models/v5/design/divisions_margin_table/division_with_margin_row_viewmodel.dart';

class DivisionsViewController {
  final List<DivisionsWithMarginRowVM> rows = [];
  final ValueNotifier<double> divisionClearSummaryVN = ValueNotifier(0.0);
  final ValueNotifier<double> divisionsWithMarginSummaryVN = ValueNotifier(0.0);
  final ValueNotifier<double> divisionsWithTaxSummaryVN = ValueNotifier(0.0);
  final InputFactorsDTO _inputFactorsDTO;

  DivisionsViewController({required InputFactorsDTO inputFactorsDTO})
    : _inputFactorsDTO = inputFactorsDTO;

  DivisionsWithMarginRowVM? getById(int id) =>
      rows.where((element) => element.id == id).firstOrNull;

  void fill(List<DivisionsMarginDTO> divisions) {
    for (var division in divisions) {
      DivisionsWithMarginRowVM row = division.toViewModel(_inputFactorsDTO);
      _calcRowValues(row);
      rows.add(row);
    }

    divisionClearSummaryVN.value = rows
        .map((e) => e.divisionSummaryCost)
        .reduce((value, element) => value + element);

    _calcTotal();
  }

  DivisionsWithMarginRowVM? onOverPriceFactor(int id, double value) {
    DivisionsWithMarginRowVM? found = getById(id);
    if (found != null) {
      found.overPriceFactor = value;
      _calcRowValues(found);
    }
    _calcTotal();
    return found;
  }

  DivisionsWithMarginRowVM? onMarginFactor(int id, double value) {
    DivisionsWithMarginRowVM? found = getById(id);
    if (found != null) {
      found.marginFactor = value;
      _calcRowValues(found);
    }
    _calcTotal();
    return found;
  }

  DivisionsWithMarginRowVM? onClientFactor(int id, double value) {
    DivisionsWithMarginRowVM? found = getById(id);
    if (found != null) {
      found.clientFactor = value;
      _calcRowValues(found);
    }
    _calcTotal();
    return found;
  }

  void _calcRowValues(DivisionsWithMarginRowVM value) {
    calcDivisionCost(value);
  }

  void _calcTotal() {
    divisionsWithMarginSummaryVN.value = rows
        .map((e) => e.summaryCostWithMarginVN.value)
        .reduce((value, element) => value + element);
    divisionsWithTaxSummaryVN.value = rows
        .map((e) => e.summaryCostWithTaxVN.value)
        .reduce((value, element) => value + element);
  }
}
