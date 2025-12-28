import 'package:presale/src/domain/models/v5/common/offer_template/offer_template_builder_v2/xlsx/design_offer_template.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

abstract class OfferFileBuilder {
  final Worksheet worksheet;
  final OfferTemplateBuilder offerTemplateBuilder;

  OfferFileBuilder(this.worksheet, this.offerTemplateBuilder);

  String get fileLabelTemplate;

  List<int> saveToBytes() {
    return worksheet.workbook.saveSync();
  }
}

class DesignOfferOnNumbers extends OfferFileBuilder{
  DesignOfferOnNumbers(super.worksheet, super.offerTemplateBuilder);

  @override
  String get fileLabelTemplate => '_с_НДС_.xlsx';
}

class DesignOfferOnChars extends OfferFileBuilder{
  DesignOfferOnChars(super.worksheet, super.offerTemplateBuilder);

  @override
  String get fileLabelTemplate => '_без_НДС_.xlsx';
}