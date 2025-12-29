import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';

import 'offer_parts.dart';

class OfferFooter extends OfferBase {
  OfferFooter({required super.worksheet, required super.rowPos})
    : offerPays = OfferPay(worksheet: worksheet, rowPos: rowPos),
      offerNotes = OfferNotes(worksheet: worksheet, rowPos: rowPos),
      offerCompanySign = OfferCompanySign(worksheet: worksheet, rowPos: rowPos),
      offerPersonSign = OfferPersonSign(worksheet: worksheet, rowPos: rowPos);

  final OfferPay offerPays;
  final OfferNotes offerNotes;
  final OfferCompanySign offerCompanySign;
  final OfferPersonSign offerPersonSign;

  void addAdditions(CommercialOfferDTO commercialOffer) {
    offerPays.addPays(commercialOffer.payValues);
    rowPos.increment(2);
    offerNotes.addNotes(commercialOffer.notes);
  }

  void addSigns(CommercialOfferDTO commercialOffer) {
    offerCompanySign.addSign(commercialOffer.companyInfo);
    rowPos.increment(2);
    offerPersonSign.addSign(commercialOffer.personSign);
  }
}
