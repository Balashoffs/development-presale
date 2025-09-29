import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_row_viewmodel.dart';

import '../../../v3/design/custom_factors/custom_factors.dart';

class DesignOfferResultVM {
  final String id;
  final String divisionType;
  final String createdDate;
  final String objectAddress;
  final String objectLocation;
  final int deadline;
  final int objectSquare;

  final List<DesignOfferResultRowVM> divisionRows;
  final String overPriceSummary;
  final String marginSummary;
  final String clientSummary;
  final String summary;
  final String summaryWithTax;
  final String tax;
  String notes;
  double avancePercent;

  DesignOfferResultVM({
    required this.divisionType,
    required this.createdDate,
    required this.id,
    required this.objectAddress,
    required this.objectLocation,
    required this.divisionRows,
    required this.overPriceSummary,
    required this.marginSummary,
    required this.clientSummary,
    required this.summary,
    required this.summaryWithTax,
    required this.tax,
    required this.deadline,
    required this.objectSquare,
    this.notes = '',
  }) : avancePercent = Default_Avance_Factor * 100;
}
