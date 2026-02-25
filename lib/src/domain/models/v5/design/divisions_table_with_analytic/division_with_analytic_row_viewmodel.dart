
class DivisionsWithAnalyticRowVM {
  final int id;
  final String shifr;
  final String section;
  final double humanHours;
  final double localAnalytic;
  final double outsideAnalytic;
  double result;

  DivisionsWithAnalyticRowVM({
    required this.id,
    required this.shifr,
    required this.section,
    required this.humanHours,
    required this.outsideAnalytic,
    required this.localAnalytic,
    this.result = 0.0
  });
}
