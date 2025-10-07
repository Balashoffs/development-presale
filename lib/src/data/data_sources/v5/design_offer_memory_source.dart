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
      _designPresaleDTO?.divisionMargins.values
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
      divisionMargins: {},
    );
  }

  bool isFilled(){
    return _designPresaleDTO != null &&  _designPresaleDTO?.inputDataDesignDTO != null;
  }

  void setInputData(InputDataDesignDTO value) {
    _designPresaleDTO?.inputDataDesignDTO = value;
  }

  void clearCashed() {
    _designPresaleDTO = null;
  }

  void addDivisionResource(DivisionResourceDTO add) {
    _designPresaleDTO?.divisionResources[add.resourceId] = add;
  }

  void removeDivisionResource(DivisionResourceDTO delete) {
    _designPresaleDTO?.divisionResources.removeWhere(
      (key, value) => key == delete.resourceId,
    );
  }

  void updateDivisionResource(DivisionResourceDTO update) {
    _designPresaleDTO?.divisionResources[update.resourceId] = update;
  }

  void updateDivisionsMargin(DivisionsMarginDTO value) {
    _designPresaleDTO?.divisionMargins[value.id] = value;
  }

  void setAllResources(bool isAll) {
    _designPresaleDTO?.isAllResources = isAll;
  }

  void setCommercialOffer(CommercialOfferDTO commercialOffer) {
    _designPresaleDTO?.commercialOfferDTO = commercialOffer;
  }

  void clearResource() {
    _designPresaleDTO?.divisionResources.clear();
    _designPresaleDTO?.divisionMargins.clear();
  }
}
