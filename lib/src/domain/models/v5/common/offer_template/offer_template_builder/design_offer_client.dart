// import 'package:syncfusion_flutter_xlsio/xlsio.dart';
//
// abstract class OfferFileBuilder {
//   final Worksheet worksheet;
//   final OfferTemplateBuilder offerTemplateBuilder;
//
//   OfferFileBuilder(this.worksheet, this.offerTemplateBuilder);
//
//   String get fileLabelTemplate;
//
//   List<int> saveToBytes() {
//     return worksheet.workbook.saveSync();
//   }
// }
//
// class DesignOfferClient extends OfferFileBuilder{
//   DesignOfferClient(super.worksheet, super.offerTemplateBuilder);
//
//   @override
//   String get fileLabelTemplate => '_с_НДС_.xlsx';
// }
//
// class DesignOfferManager extends OfferFileBuilder{
//   DesignOfferManager(super.worksheet, super.offerTemplateBuilder);
//
//   @override
//   String get fileLabelTemplate => '_без_НДС_.xlsx';
// }