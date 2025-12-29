class DesignOfferResultRowViewModel {
  final int id;
  final String divisionShortName;
  final String divisionName;
  final String clearCost;
  final String overPriceCost;
  final String marginCost;
  final String clientCost;
  final String summary;
  final String summaryWithTax;

  const DesignOfferResultRowViewModel({
    required this.id,
    required this.divisionShortName,
    required this.divisionName,
    required this.clearCost,
    required this.overPriceCost,
    required this.marginCost,
    required this.clientCost,
    required this.summary,
    required this.summaryWithTax,
  });
}
