import 'package:presale/src/domain/models/v3/design/custom_factors/custom_factors.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/division_resource_row_viewmodel.dart';
import 'package:presale/src/domain/models/v5/design/divisions_margin_table/division_with_margin_row_viewmodel.dart';

class DesignOfferCalculator {
  /*

    Алгоритм расчета одного раздела

   Себестоимость =
     Ставка специалиста (за 1 день)
     * Срок выполнения (в днях)
     * Коэфициент сложности
     * Коэфициент по площади
     * Коэфициент использования специалиста

     Н =  (Себестоимость * Накладные расходы)
     П = (Себестоимость * Норма прибыли)
     Итого =  Себестоимость *  Накладные расходы *  Норма прибыли * 1.2
     */

  double calcResourceCost(DivisionWithResourceViewModel divisionResourceViewModel) {
    return divisionResourceViewModel.resourceCostPerDayVN.value *
        divisionResourceViewModel.resourceUsingFactor *
        divisionResourceViewModel.squareFactor *
        divisionResourceViewModel.complexFactor *
        divisionResourceViewModel.workDays *
        divisionResourceViewModel.resourceQnt;
  }

  void calcDivisionCost(DivisionsWithMarginRowVM model) {
    double total = model.overPriceFactor * model.divisionSummaryCost;
    model.overPriceValue = total - model.divisionSummaryCost;

    total = model.divisionSummaryCost * model.marginFactor;
    model.marginValue = total - model.divisionSummaryCost;

    total = model.divisionSummaryCost * model.clientFactor;
    model.clientValue = total - model.divisionSummaryCost;

    total =
        model.divisionSummaryCost +
        model.overPriceValue +
        model.marginValue +
        model.clientValue;

    double withTax = total * Russian_Tax_Factor;
    model.summaryCostWithMarginVN.value = total;
    model.summaryCostWithTaxVN.value = withTax;
    model.taxValue = withTax * Russian_Tax_Factor_Reverce;
  }
}
