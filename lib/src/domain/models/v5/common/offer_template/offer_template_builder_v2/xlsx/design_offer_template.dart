import 'package:presale/src/domain/models/v5/common/offer_template/offer_template_builder_v2/xlsx/offer_parts.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import 'offer_parts/offer_parts.dart';


abstract class OfferTemplateBuilder {
  final Worksheet worksheet;

  OfferTemplateBuilder(this.worksheet);

  Future<void> fillRows();
}

class DesignOfferTemplate extends OfferTemplateBuilder {
  final RowPos rowPos;
  final OfferHeader offerHeader;
  final OfferTable offerTable;
  final OfferFooter offerFooter;
  final CommercialOfferDTO commercialOffer;

  DesignOfferTemplate(
    super.worksheet, {
    required OfferParts offerParts,
    required this.commercialOffer,
    required this.rowPos,
  }) : offerHeader = offerParts.offerHeader,
       offerTable = offerParts.offerTable,
       offerFooter = offerParts.offerFooter;

  @override
  Future<void> fillRows() async {
    rowPos.increment();
    await offerHeader.addHeaderImg(commercialOffer.companyInfo.pathToColonType, rowPos.Pos);
    rowPos.increment(5);
    offerHeader.addConsumer(commercialOffer.objectCustomer);
    rowPos.increment();
    offerHeader.addObjectName(commercialOffer.objectName);
    rowPos.increment();
    offerHeader.addObjectAddress(commercialOffer.objectAddress);
    rowPos.increment();
    offerHeader.addObjectSquare(commercialOffer.objectSquare);
    rowPos.increment();
    offerHeader.addDate(commercialOffer.created);
    rowPos.increment(3);
    offerTable.addTable(commercialOffer.resultsTable);
    rowPos.increment();
    offerFooter.addAdditions(commercialOffer);
    rowPos.increment(2);
    worksheet.getRangeByName('A1:A${rowPos.Pos}').rowHeight = 28.0;
    offerFooter.addSigns(commercialOffer);



    final PageSetup pageSetup = worksheet.pageSetup;

    // Установка узких полей (в дюймах)
    // Стандартные узкие поля:
    pageSetup.leftMargin = 0.5;      // Левое поле
    pageSetup.rightMargin = 0.5;     // Правое поле
    pageSetup.topMargin = 0.5;       // Верхнее поле
    pageSetup.bottomMargin = 0.5;    // Нижнее поле
    pageSetup.headerMargin = 0.3;    // Поле для заголовка
    pageSetup.footerMargin = 0.3;

   pageSetup.paperSize =  ExcelPaperSize.paperA4Small;
   pageSetup.printArea = 'A1:E${rowPos.Pos}';
   pageSetup.orientation = ExcelPageOrientation.portrait;
   pageSetup.isCenterHorizontally = true;
   pageSetup.isCenterVertically = true;
   pageSetup.isFitToPage= true;
   pageSetup.fitToPagesTall = 1;
   pageSetup.fitToPagesWide = 1;




  }
}
