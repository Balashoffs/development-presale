import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:presale/src/data/data_sources/v5/design_offer_memory_source.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/pojo_extension.dart';
import 'package:presale/src/domain/models/v5/common/person_sign/person_sign_dto.dart';

class DesignOfferRepository {
  final DesignOfferMemorySource _designOfferMemorySource;

  CommercialOfferDTO? get commercialOffer =>
      _designOfferMemorySource.designPresaleDTO?.commercialOfferDTO;

  List<DivisionResultDTO> get divisions =>
      _designOfferMemorySource.commercialOffer?.divisionResults ?? [];

  DesignOfferRepository(DesignOfferMemorySource designOfferMemorySource)
    : _designOfferMemorySource = designOfferMemorySource {


    CommercialOfferDTO commercialOffer = CommercialOfferDTO.from(
      _designOfferMemorySource,
    );

    _designOfferMemorySource.setCommercialOffer(commercialOffer);
  }

  void updateNotes(String result) {
    commercialOffer?.noteText = result;
    _designOfferMemorySource.commercialOffer?.noteText = result;
  }


  void updatePresaleCostFactor(double value) {
    commercialOffer?.updatePresaleCost(value);
    _designOfferMemorySource.commercialOffer?.presaleCostFactor = value;
  }

  void updatePersonSign(PersonSignDTO personSign) {
    commercialOffer?.personSign = personSign;
  }
}
