import 'package:flutter/material.dart';
import 'package:presale/src/domain/models/v5/design/divisions_table_with_analytic/division_with_analytic_row_viewmodel.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/pojo_extension.dart';

class DivisionsWithAnalyticViewController {
  final List<DivisionsWithAnalyticRowVM> rows = [];
  final ValueNotifier<double> divisionSummaryVN = ValueNotifier(0.0);

  DivisionsWithAnalyticRowVM? getById(int id) =>
      rows
          .where((element) => element.id == id)
          .firstOrNull;

  final ValueNotifier<bool> isValid = ValueNotifier(false);

  void fill(List<DivisionsWithAnalyticDTO> divisions) {
    for (var division in divisions) {
      DivisionsWithAnalyticRowVM row = division.toViewModel();
      rows.add(row);
    }

    _calcTotal();
    _allowNext();
  }

  void onResult(int id, double value) {
    DivisionsWithAnalyticRowVM? found = getById(id);
    if (found != null) {
      found.result = value;
    }
    _calcTotal();
    _allowNext();
  }

  void _calcTotal() {
    divisionSummaryVN.value = rows
        .map((e) => e.result)
        .reduce((value, element) => value + element);
  }

  void _allowNext() {
    bool isAllow = rows
        .where((element) => element.result.compareTo(0.0) == 0,).isEmpty;
    isValid.value = isAllow;
  }
}
