import 'package:presale/src/domain/models/v6/company_info/company_info_dto.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:presale/src/data/data_sources/v5/design_offer_memory_source.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/pojo_extension.dart';
import 'package:presale/src/domain/models/v5/common/person_sign/person_sign_dto.dart';
import 'package:presale/src/domain/models/v6/selected_company/selected_company_dto.dart';

class DesignOfferRepository {
  final DesignOfferMemorySource _designOfferMemorySource;

  CommercialOfferDTO? get commercialOffer =>
      _designOfferMemorySource.designPresaleDTO?.commercialOfferDTO;

  List<RowDivisionResultDTO> get divisions =>
      _designOfferMemorySource.commercialOffer?.resultsTable.divisionRows ?? [];

  DesignOfferRepository(DesignOfferMemorySource designOfferMemorySource)
    : _designOfferMemorySource = designOfferMemorySource {
    if (_designOfferMemorySource.commercialOffer == null) {
      _designOfferMemorySource.designPresaleDTO?.commercialOfferDTO =
          CommercialOfferDTO.from(_designOfferMemorySource);
    }
  }

  void updatePresaleFactor(double value) {
    _designOfferMemorySource.commercialOffer?.payValues.presaleFactor = value;
  }

  void updateAfterDayPayFactor(double value) {
    _designOfferMemorySource.commercialOffer?.payValues.afterPayFactor = value;
  }

  void updateAfterPayDate(String value) {
    _designOfferMemorySource.commercialOffer?.payValues.afterPayDate = value;
  }

  void updateAfterActsSignFactor(double value) {
    _designOfferMemorySource.commercialOffer?.payValues.afterActsSignFactor =
        value;
  }

  void updateNotes(String result) {
    _designOfferMemorySource.commercialOffer?.notes = result;
  }

  void updatePersonSign(PersonSignDTO personSign) {
    commercialOffer?.personSign = personSign;
  }

  void selectCompany(SelectedCompanyDTO companyInfo) {
    commercialOffer?.companyInfo = companyInfo;
  }

}
