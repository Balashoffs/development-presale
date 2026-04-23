import 'package:collection/collection.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';

class DesignOfferMemorySource {
  DesignPresaleDTO? _designPresaleDTO;

  set designPresaleDTO(DesignPresaleDTO value) {
    _designPresaleDTO = value;
  }

  DesignPresaleDTO? get designPresaleDTO => _designPresaleDTO;

  InputDataDesignDTO? get inputDataDesignDTO =>
      _designPresaleDTO?.inputDataDesignDTO;

  List<DivisionResourceDTO> get divisionResources =>
      _designPresaleDTO?.divisionResources.values
          .sorted((a, b) => a.id.compareTo(b.id))
          .toList() ??
      [];

  List<DivisionsMarginDTO> get divisionMargins =>
      _designPresaleDTO?.divisionResourceMargins.values
          .sorted((a, b) => a.id.compareTo(b.id))
          .toList() ??
      [];

  List<DivisionsWithAnalyticDTO> get divisionWithAnalytics =>
      _designPresaleDTO?.divisionWithAnalytic.values
          .sorted((a, b) => a.id.compareTo(b.id))
          .toList() ??
      [];

  List<DivisionsResultDTO> get divisionResults =>
      _designPresaleDTO?.divisionsResult.values
          .sorted((a, b) => a.id.compareTo(b.id))
          .toList() ??
          [];


  CommercialOfferDTO? get commercialOffer =>
      _designPresaleDTO?.commercialOfferDTO;

  bool get isAll => _designPresaleDTO?.isAllResources ?? false;

  set isAll(bool isAll) => _designPresaleDTO?.isAllResources = isAll;

  void init() {
    _designPresaleDTO ??= DesignPresaleDTO(
      divisionResources: {},
      divisionResourceMargins: {},
      divisionWithAnalytic: {},
      divisionsResult: {},
    );
  }

  bool isFilled() {
    return _designPresaleDTO != null &&
        _designPresaleDTO?.inputDataDesignDTO != null;
  }

  void setInputData(InputDataDesignDTO value) {
    _designPresaleDTO?.inputDataDesignDTO = value;
  }

  void clearCashed() {
    _designPresaleDTO = DesignPresaleDTO(
      divisionResources: {},
      divisionResourceMargins: {},
      divisionWithAnalytic: {},
      divisionsResult: {},
    );
  }

  void addDivisionResource(DivisionResourceDTO add) {
    _designPresaleDTO?.divisionResources[add.resourceId] = add;
  }

  void addDivisionResourceWithMargin(DivisionsMarginDTO margin) {
    _designPresaleDTO?.divisionResourceMargins[margin.id] = margin;
  }

  void removeDivisionResource(DivisionResourceDTO delete) {
    _designPresaleDTO?.divisionResources.removeWhere(
      (key, value) => key == delete.resourceId,
    );
  }

  void updateDivisionResource(DivisionResourceDTO update) {
    _designPresaleDTO?.divisionResources[update.resourceId] = update;
  }

  void updateDivisionsAnalytic(DivisionsWithAnalyticDTO value) {
    _designPresaleDTO?.divisionWithAnalytic[value.id] = value;
  }

  void clearResource() {
    _designPresaleDTO?.divisionResources.clear();
    _designPresaleDTO?.divisionResourceMargins.clear();
    _designPresaleDTO?.divisionWithAnalytic.clear();
  }


}
