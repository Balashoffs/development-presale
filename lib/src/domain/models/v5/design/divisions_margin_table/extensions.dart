import 'package:presale/src/domain/models/v5/design/divisions_margin_table/division_with_margin_row_viewmodel.dart';
import 'package:presale/src/domain/models/v5/design/divisions_margin_table/divisions_margin_row_pojo.dart';

extension DivisionWithMarginRowVMExt on DivisionsWithMarginRowVM {
  DivisionsMarginRowPojo toRowPojo() {
    return DivisionsMarginRowPojo(
      id: id,
      margin: marginValue,
      client: clientValue,
      overPrice: overPriceValue,
      divisionName: divisionName,
      divisionShortName: divisionShortName,
      divisionSummaryCost: divisionSummaryCost,
      summaryCostWithMargin: summaryCostWithMarginVN.value,
      summaryCostWithTax: summaryCostWithTaxVN.value,
    );
  }
}
