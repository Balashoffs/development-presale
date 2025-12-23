import 'dart:typed_data';

import 'package:presale/src/domain/models/common/metadata_for_saving.dart';
import 'package:presale/src/domain/models/v5/common/offer_template_builder/design_offer_client.dart';
import 'package:presale/src/domain/models/v5/common/offer_template_builder/design_offer_template.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:presale/src/domain/models/v5/common/offer_template_builder/offer_template_builder.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:presale/src/data/helpers/file_saver_helper/save_file_mobile.dart'
    if (dart.library.html) 'package:presale/src/data/helpers/file_saver_helper/save_file_web.dart';

enum ExcelSaveType { manager, client }

class ExcelService {
  ExcelService();

  void saveToExcel(CommercialOfferDTO commercialOffer, ExcelSaveType type) async {
    final Workbook workbook = Workbook(1);
    final Worksheet sheet = workbook.worksheets[0];

    RowPos rowPos = RowPos();
    OfferParts offerParts = OfferParts(sheet, rowPos);
    OfferTemplateBuilder designOfferTemplate = DesignOfferTemplate(
      sheet,
      commercialOffer: commercialOffer,
      offerParts: offerParts,
      rowPos: rowPos,
    );
    await designOfferTemplate.fillRows();

    OfferFileBuilder builder = OfferBuilder.build(type, sheet, designOfferTemplate);
    Uint8List fileBytes = Uint8List.fromList(builder.saveToBytes());
    String fileName = commercialOffer.id + builder.fileLabelTemplate;
    MetadataForSaving metadataForSaving = MetadataForSaving.saveAsExcel(
      fileBytes,
      fileName,
    );
    saveAndLaunchFile(metadataForSaving);
  }
}
