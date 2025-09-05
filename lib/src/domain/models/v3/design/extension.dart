import 'package:presale/src/domain/models/v3/design/commercial_offer/footer_data.dart';
import 'package:presale/src/domain/models/v5/common/person_sign/person_sign_pojo.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_row_viewmodel.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';

import 'commercial_offer/commercial_offer.dart';
import 'division_result/division_result.dart';
import 'input_data/input_data_design.dart';

extension DesignOfferResultExt on DesignOfferResultVM {
  CommercialOfferResult toPojo(InputDataDesign inputDataDesign, PersonSignPojo personSign) {
    return CommercialOfferResult(
      divisionResults: divisionRows.map((e) => e.toPojo()).toList(),
      inputDataDesign: inputDataDesign,
      designOfferSummaryCost: summary,
      designOfferSummaryTax: tax,
      footerData: FooterData(
        workCompletionTime: totalDays.toString(),
        prepayment: avance.toStringAsFixed(2),
        noteText: notes,
        personSign: personSign,
      ),
    );
  }
}

extension DesignOfferResultRowExt on DesignOfferResultRowVM {
  DivisionResult toPojo() {
    return DivisionResult(
      id: id,
      divisionShortName: divisionShortName,
      divisionName: divisionName,
      divisionSummaryWithTax: divisionSummaryWithTax,
      divisionSummary: divisionSummary,
      divisionClient: client,
      divisionMargin: margin,
      divisionOverPrice: overPrice,
    );
  }
}

extension AddFullName on PersonSignPojo{
  String get fullName => id == 0 ? '' : '$lastName ${fistName[0]}. ${secondName[0]}.';
}
