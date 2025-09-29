import 'package:presale/src/data/data_sources/v3/memory_cashed/design_offer_dto.dart';
import 'package:presale/src/data/data_sources/v3/memory_cashed/design_offer_memory_source.dart';
import 'package:presale/src/data/data_sources/v3/memory_cashed/extension.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';

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

}
