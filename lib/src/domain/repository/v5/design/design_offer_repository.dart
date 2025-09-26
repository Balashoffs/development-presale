import 'package:presale/src/data/data_sources/v3/memory_cashed/design_offer_dto.dart';
import 'package:presale/src/data/data_sources/v3/memory_cashed/design_offer_memory_source.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';

class DesignOfferRepository {
  final DesignOfferMemorySource _designOfferMemorySource;

  InputDataDesignDTO? get inputData =>
      _designOfferMemorySource.designPresaleDTO?.inputDataDesignDTO;

  List<DivisionsMarginDTO> get divisions =>
      _designOfferMemorySource.divisionMargins;

  CommercialOfferDTO? get commercialOffer => _designOfferMemorySource.commercialOffer;

  DesignOfferRepository(this._designOfferMemorySource);

  //TODO
  CommercialOfferDTO? buildOffer() {

  }

  //TODO
  void updateOffer(DesignOfferResultVM result) {}
}
