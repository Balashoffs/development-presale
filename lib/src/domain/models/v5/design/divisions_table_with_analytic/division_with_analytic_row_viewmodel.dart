
import 'package:flutter/cupertino.dart';

class DivisionsWithAnalyticRowVM {
  final int id;
  final String shifr;
  final String section;
  final double humanHours;
  final double localAnalytic;
  final double outsideAnalytic;
  double manualAnalytic;
  final ValueNotifier<double> resultVN;

  DivisionsWithAnalyticRowVM({
    required this.id,
    required this.shifr,
    required this.section,
    required this.humanHours,
    required this.outsideAnalytic,
    required this.localAnalytic,
    required this.manualAnalytic,
    required double result,
  }):resultVN = ValueNotifier(result);
}
