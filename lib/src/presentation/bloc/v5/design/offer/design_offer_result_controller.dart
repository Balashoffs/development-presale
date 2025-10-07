import 'package:flutter/foundation.dart';

import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';

import '../../../../../domain/models/v3/design/custom_factors/custom_factors.dart';

class DesignOfferResultController {
  late final ValueNotifier<DesignOfferResultVM>? designOfferResultVN;
  ValueNotifier<double> avanceVN = ValueNotifier(0.0);


  void setViewModel(DesignOfferResultVM value) {
    designOfferResultVN = ValueNotifier(value);
  }

  void setAvanveValue(double designOfferSummaryTax, [double defaultAvanceFactor = Default_Avance_Factor]) {
    avanceVN.value = designOfferSummaryTax * defaultAvanceFactor;
  }
}
