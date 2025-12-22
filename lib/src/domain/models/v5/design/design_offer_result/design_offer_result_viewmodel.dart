import 'package:flutter/foundation.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_row_viewmodel.dart';

class DesignOfferResultViewController {
  final String id;
  final String divisionType;
  final String createdDate;
  final String objectCustomer;
  final String objectName;
  final String objectAddress;
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
  double factors;
  final ValueNotifier<double> presaleCostVN;

  DesignOfferResultViewController({
    required this.divisionType,
    required this.createdDate,
    required this.id,
    required this.objectCustomer,
    required this.objectName,
    required this.objectAddress,
    required this.divisionRows,
    required this.overPriceSummary,
    required this.marginSummary,
    required this.clientSummary,
    required this.summary,
    required this.summaryWithTax,
    required this.tax,
    required this.deadline,
    required this.objectSquare,
    String inputNotes = '',
    required double presaleFactor,
    required double presaleCost,
  }) : notes = inputNotes,
       factors = presaleFactor,
       presaleCostVN = ValueNotifier(presaleCost);
}
