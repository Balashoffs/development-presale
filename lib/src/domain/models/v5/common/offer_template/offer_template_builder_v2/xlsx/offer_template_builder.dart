import 'package:presale/src/domain/models/v5/common/offer_template/offer_template_builder_v2/xlsx/design_offer_client.dart';
import 'package:presale/src/domain/models/v5/common/offer_template/offer_template_builder_v2/xlsx/design_offer_template.dart';
import 'package:presale/src/domain/service/v5/design/excel_service_v2.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

class OfferBuilder {
  static OfferFileBuilder build(
      ExcelSaveType type,
      Worksheet worksheet,
      OfferTemplateBuilder designOfferTemplate,
      ) {
    switch (type) {
      case ExcelSaveType.number:
        return DesignOfferOnNumbers(worksheet, designOfferTemplate);
      case ExcelSaveType.char:
        return DesignOfferOnChars(worksheet, designOfferTemplate);
    }
  }
}













