import 'package:flutter/foundation.dart';
import 'package:presale/src/data/core/string_converter.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_row_viewmodel.dart';

class DesignOfferResultViewModel {
  final String offerId;
  final String divisionType;
  final String createdDate;
  final String objectCustomer;
  final String objectName;
  final String objectAddress;
  final String deadline;
  final String objectSquare;
  final PayValueViewModel payValueViewModel;
  final ResultTableViewModel resultTableViewModel;
  final String notes;

  final String defaultPresalePayPercent;

  final String defaultAfterPayPercent;

  final String defaultDateValue;

  final String defaultAfterActsSignPayPercent;


  DesignOfferResultViewModel({
    required this.divisionType,
    required this.createdDate,
    required this.offerId,
    required this.objectCustomer,
    required this.objectName,
    required this.objectAddress,
    required this.deadline,
    required this.objectSquare,
    required this.resultTableViewModel,
    required this.defaultPresalePayPercent,
    required this.defaultAfterPayPercent,
    required this.defaultAfterActsSignPayPercent,
    required String defaultPresalePayValue,
    required String defaultAfterPayValue,
    required String defaultAfterActsSignPayValue,
    required this.defaultDateValue,
    required this.notes,
  }) : payValueViewModel = PayValueViewModel() {
    updatePresaleResult('$defaultPresalePayValue рубл.');
    updateAfterPayResult('$defaultAfterPayValue рубл.');
    updatePayAfterActsSignResult('$defaultAfterActsSignPayValue рубл.');
  }

  void updatePresaleResult(String value) {
    if (value.isEmpty) return;
    payValueViewModel.presaleFactorVN.value = value;
  }

  void updateAfterPayResult(String value) {
    if (value.isEmpty) return;
    payValueViewModel.afterPayFactorVN.value = value;
  }

  void updatePayAfterActsSignResult(String value) {
    if (value.isEmpty) return;
    payValueViewModel.onAfterActsSignFactorVN.value = value;
  }

  ValueNotifier<String> get presalePayValueVN =>
      payValueViewModel.presaleFactorVN;

  ValueNotifier<String> get afterPayValueVN =>
      payValueViewModel.afterPayFactorVN;

  ValueNotifier<String> get afterActsSignPayValueVN =>
      payValueViewModel.onAfterActsSignFactorVN;
}

class PayValueViewModel {
  final ValueNotifier<String> presaleFactorVN;
  final ValueNotifier<String> afterPayFactorVN;
  final ValueNotifier<String> onAfterActsSignFactorVN;

  PayValueViewModel()
    : presaleFactorVN = ValueNotifier<String>(zeroRubbles),
      afterPayFactorVN = ValueNotifier<String>(zeroRubbles),
      onAfterActsSignFactorVN = ValueNotifier<String>(zeroRubbles);
}

class ResultTableViewModel {
  final List<DesignOfferResultRowViewModel> divisionRows;
  final String clearSummary;
  final String overPriceSummary;
  final String marginSummary;
  final String clientSummary;
  final String fullSummary;
  final String tax;
  final String fullSummaryWithTax;

  const ResultTableViewModel({
    required this.divisionRows,
    required this.clearSummary,
    required this.overPriceSummary,
    required this.marginSummary,
    required this.clientSummary,
    required this.fullSummary,
    required this.tax,
    required this.fullSummaryWithTax,
  });
}
