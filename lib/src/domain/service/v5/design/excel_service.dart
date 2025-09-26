import 'package:date_format/date_format.dart';
import 'package:presale/src/data/data_sources/v3/memory_cashed/design_offer_dto.dart';
import 'package:presale/src/domain/models/v5/common/offer_template_builder.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:presale/src/data/helpers/xlsx_helper/save_file_mobile.dart'
if (dart.library.html) 'package:presale/src/data/helpers/xlsx_helper/save_file_web.dart';


enum ExcelSaveType{
  number,
  client
}

class ExcelService{
  ExcelService();

  void saveToExcel(CommercialOfferDTO dto, ExcelSaveType type)async{
    final Workbook workbook = Workbook(1);
    final Worksheet sheet = workbook.worksheets[1];

    ITemplateBuilder builder = build(type, sheet, dto);
    await builder.fillRows();
    List<int> fileBytes = builder.saveToBytes();
    String id = dto.id + builder.fileLabelTemplate;

    saveAndLaunchFile(fileBytes, id);
  }
}