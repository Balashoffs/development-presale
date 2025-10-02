import 'dart:typed_data';

import 'package:presale/src/domain/models/common/metadata_for_saving.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:presale/src/domain/models/v5/common/offer_template_builder/offer_template_builder.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:presale/src/data/helpers/file_saver_helper/save_file_mobile.dart'
    if (dart.library.html) 'package:presale/src/data/helpers/file_saver_helper/save_file_web.dart';

enum ExcelSaveType { number, client }

class ExcelService {
  ExcelService();

  void saveToExcel(CommercialOfferDTO dto, ExcelSaveType type) async {
    final Workbook workbook = Workbook(1);
    final Worksheet sheet = workbook.worksheets[0];

    BaseTemplateBuilder builder = BaseTemplateBuilder.build(type, sheet, dto);
    await builder.fillRows();
    Uint8List fileBytes = Uint8List.fromList(builder.saveToBytes());
    String fileName = dto.id + builder.fileLabelTemplate;
    MetadataForSaving metadataForSaving = MetadataForSaving.saveAsExcel(
      fileBytes,
      fileName,
    );
    saveAndLaunchFile(metadataForSaving);
  }
}
