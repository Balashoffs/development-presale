import 'package:flutter/cupertino.dart';

class DivisionsWithMarginRowVM {
  final int id;
  final String divisionName;
  final String divisionShortName;
  final String divisionDescription;
  final double divisionSummaryCost;

  double _overPriceValue;

  set overPriceValue(double value) {
    _overPriceValue = value;
  }

  double get overPriceValue => _overPriceValue;

  double _marginValue;

  set marginValue(double value) {
    _marginValue = value;
  }

  double get marginValue => _marginValue;

  double _clientValue;

  set clientValue(double value) {
    _clientValue = value;
  }

  double get clientValue => _clientValue;

  final ValueNotifier<double> summaryCostWithMarginVN;
  final ValueNotifier<double> summaryCostWithTaxVN;

  double _taxValue;

  double overPriceFactor = 0.0;

  double marginFactor = 0.0;

  double clientFactor = 0.0;

  set taxValue(double value) {
    _taxValue = value;
  }

  double get taxValue => _taxValue;

  DivisionsWithMarginRowVM({
    required this.id,
    required this.divisionName,
    required this.divisionShortName,
    required this.divisionDescription,
    required this.divisionSummaryCost,
    double taxValue = 0.0,
    double marginValue = 1.0,
    double clientValue = 1.0,
    double overPriceValue = 1.0 ,
    double summaryCostWithMargin = 0.0,
    double summaryCostWithTax = 0.0,
  }) : _taxValue = taxValue,
       _marginValue = marginValue,
       _clientValue = clientValue,
       _overPriceValue = overPriceValue,
       summaryCostWithMarginVN = ValueNotifier(summaryCostWithMargin),
       summaryCostWithTaxVN = ValueNotifier(summaryCostWithTax);
}
