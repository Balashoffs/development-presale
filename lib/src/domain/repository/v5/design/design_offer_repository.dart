import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:presale/src/data/data_sources/v5/design_offer_memory_source.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/extension.dart';
import 'package:presale/src/domain/models/v5/common/person_sign/person_sign_dto.dart';


class DesignOfferRepository {
  final DesignOfferMemorySource _designOfferMemorySource;

  CommercialOfferDTO? get commercialOffer =>
      _designOfferMemorySource.designPresaleDTO?.commercialOfferDTO;

  List<DivisionResultDTO> get divisions =>
      _designOfferMemorySource.commercialOffer?.divisionResults ?? [];


  DesignOfferRepository(DesignOfferMemorySource designOfferMemorySource)
    : _designOfferMemorySource = designOfferMemorySource {
    final divisionResults = _designOfferMemorySource.divisionMargins
        .map((e) => e.toDto())
        .toList();

    CommercialOfferDTO commercialOffer = CommercialOfferDTO.from(
      _designOfferMemorySource.inputDataDesignDTO!,
      divisionResults,
    );

    _designOfferMemorySource.setCommercialOffer(commercialOffer);
  }

  void updateNotes(String result) {
    commercialOffer?.noteText = result;
  }

  void updateAvance(double value) {
    commercialOffer?.updateAvanceValue(value);
  }

  void updatePersonSign(PersonSignDTO personSign){
    commercialOffer?.personSign = personSign;
  }

}
