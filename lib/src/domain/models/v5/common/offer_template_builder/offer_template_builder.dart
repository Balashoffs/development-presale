import 'package:presale/src/data/data_sources/v3/memory_cashed/design_offer_dto.dart';
import 'package:presale/src/domain/models/v5/common/offer_template_builder/design_offer_client.dart';
import 'package:presale/src/domain/models/v5/common/offer_template_builder/design_offer_number.dart';
import 'package:presale/src/domain/service/v5/design/excel_service.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';


abstract class BaseTemplateBuilder{
  int rowPos = 1;

  final Worksheet worksheet;
  final CommercialOfferDTO offerResult;

  Future<void> fillRows();

  String get fileLabelTemplate;

  void increment([int i = 1]) {
    rowPos += i;
  }

  BaseTemplateBuilder({
    required this.worksheet,
    required this.offerResult,
  });

  List<int> saveToBytes() {
    return worksheet.workbook.saveSync();
  }

  static BaseTemplateBuilder build(
      ExcelSaveType type,
      Worksheet worksheet,
      CommercialOfferDTO offerResult,
      ) {
    switch (type) {
      case ExcelSaveType.number:
        return DesignOfferNumber(
          worksheet: worksheet,
          offerResult: offerResult,
        );
      case ExcelSaveType.client:
        return DesignOfferClient(
          worksheet: worksheet,
          offerResult: offerResult,
        );
    }
  }
}




