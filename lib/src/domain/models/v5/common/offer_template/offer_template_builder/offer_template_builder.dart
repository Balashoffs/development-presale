// import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
// import 'package:presale/src/domain/service/v5/design/excel_service.dart';
// import 'package:syncfusion_flutter_xlsio/xlsio.dart';
//
// class RowPos {
//   int _pos = 1;
//
//   int get Pos => _pos;
//
//   void increment([int i = 1]) {
//     _pos += i;
//   }
// }
//
// class OfferBase {
//   final RowPos rowPos;
//   final String startCell = 'B';
//   final String endCell = 'G';
//   final String headerImagePath =
//       'assets/data/template/header_logo.png';
//
//   String get _fullRange => '$startCell${rowPos.Pos}:$endCell${rowPos.Pos}';
//
//   final Worksheet worksheet;
//
//   OfferBase({required this.worksheet, required this.rowPos});
//
//   void addTitle(String value) {
//     buildCell(
//       value,
//       _fullRange,
//       alignType: HAlignType.center,
//       fontSize: 14,
//       isBold: true,
//       isMerge: true,
//     );
//   }
//
//   void addKey1Value(String key, Object value) {
//     buildCell(
//       key,
//       '$startCell${rowPos.Pos}',
//       alignType: HAlignType.left,
//       fontSize: 12,
//       isBold: true,
//     );
//     buildCell(
//       value,
//       'C${rowPos.Pos}:$endCell${rowPos.Pos}',
//       alignType: HAlignType.left,
//       fontSize: 14,
//       isMerge: true,
//     );
//   }
//
//   void addKey2Value(String key, Object value) {
//     buildCell(
//       key,
//       'B${rowPos.Pos}:C${rowPos.Pos}',
//       isMerge: true,
//       alignType: HAlignType.left,
//       fontSize: 12,
//       isBold: true,
//     );
//     buildCell(
//       value,
//       'D${rowPos.Pos}:$endCell${rowPos.Pos}',
//       isMerge: true,
//       fontSize: 14,
//       alignType: HAlignType.left,
//     );
//   }
//
//   void buildCell(
//     Object value,
//     String range, {
//     bool isMerge = false,
//     double? width,
//     HAlignType? alignType,
//     double fontSize = 12,
//     double height = 20,
//     bool isBold = false,
//     bool isWrap = false,
//   }) {
//     if (isMerge) {
//       worksheet.getRangeByName(range).merge();
//     }
//     if (width != null) {
//       worksheet.getRangeByName(range).columnWidth = width;
//     }
//
//     if (alignType != null) {
//       worksheet.getRangeByName(range).cellStyle.hAlign = alignType;
//     }
//     worksheet.getRangeByName(range).cellStyle.bold = isBold;
//     worksheet.getRangeByName(range).cellStyle.wrapText = isWrap;
//     worksheet.getRangeByName(range).cellStyle.vAlign = VAlignType.center;
//     worksheet.getRangeByName(range).cellStyle.fontSize = fontSize;
//     worksheet.getRangeByName(range).rowHeight = height;
//     worksheet.getRangeByName(range).cellStyle.fontName = 'Times New Roman';
//     if (value is double) {
//       worksheet.getRangeByName(range).setNumber(value);
//     } else if (value is String) {
//       worksheet.getRangeByName(range).setText(value);
//     }
//   }
// }
//
// class OfferHeader extends OfferBase {
//   OfferHeader({required super.worksheet, required super.rowPos});
//
//   Future<Picture> addHeaderImg() async {
//     final baseData = await WorksheetUtil.fromImage(headerImagePath);
//     return worksheet.pictures.addBase64(rowPos.Pos, 3, baseData);
//   }
//
//   void addOfferId(String id) {
//     String offerId = 'исх. №$id';
//     buildCell(offerId, "$startCell${rowPos.Pos}");
//   }
//
//   void addDate(String created) {
//     String dateAsText = 'Дата: $created г.';
//     buildCell(dateAsText, "$endCell${rowPos.Pos}");
//   }
// }
//
// class OfferTable extends OfferBase {
//   OfferTable({required super.worksheet, required super.rowPos});
//
//   void addTable(ResultsTableDTO resultTable) {
//     // int start = rowPos.Pos;
//     // addTableHeader();
//     // rowPos.increment();
//     // addTableRows(resultTable.divisionRows);
//     // if (resultTablesummary != null) {
//     //   rowPos.increment();
//     //   addTableFooter(
//     //     summary is double ? 'ИТОГО: ' : 'ИТОГО с НДС 20%: ',
//     //     summary,
//     //   );
//     // }
//     // if (resultTable. != null) {
//     //   rowPos.increment();
//     //   addTableFooter('НДС, 20%: ', tax);
//     // }
//     // int end = rowPos.Pos;
//     // setTableBorder(start, end);
//   }
//
//   void addTableHeader() {
//     buildCell(
//       '№ п/п',
//       'B${rowPos.Pos}',
//       width: 7.5,
//       alignType: HAlignType.center,
//       isBold: true,
//     );
//     buildCell(
//       'Наименование услуги',
//       'C${rowPos.Pos}:E${rowPos.Pos}',
//       width: 20,
//       alignType: HAlignType.center,
//       isBold: true,
//       isMerge: true,
//     );
//     buildCell(
//       'Кол-во',
//       'F${rowPos.Pos}',
//       width: 7.5,
//       alignType: HAlignType.center,
//       isBold: true,
//     );
//     buildCell(
//       'Стоимость / руб.',
//       'G${rowPos.Pos}',
//       width: 25,
//       alignType: HAlignType.center,
//       isBold: true,
//     );
//   }
//
//   void addTableRows(List<RowDivisionResultDTO> rows) {
//     for (int i = 0; i < rows.length; i++) {
//       RowDivisionResultDTO result = rows[i];
//       buildCell(
//         result.id,
//         'B${rowPos.Pos}',
//         width: 7.5,
//         alignType: HAlignType.center,
//       );
//       buildCell(
//         result.divisionName,
//         'C${rowPos.Pos}:E${rowPos.Pos}',
//         width: 20,
//         alignType: HAlignType.center,
//         isMerge: true,
//       );
//       buildCell(
//         1.toString(),
//         'F${rowPos.Pos}',
//         width: 7.5,
//         alignType: HAlignType.center,
//       );
//       buildCell(
//         result.divisionSummary,
//         '$endCell${rowPos.Pos}',
//         width: 25,
//         alignType: HAlignType.center,
//       );
//       if (i + 1 < rows.length) {
//         rowPos.increment();
//       }
//     }
//   }
//
//   //offerResult.summaryWithTax.toStringAsFixed(2),
//   void addTableFooter(String head, Object value) {
//     buildCell(
//       head,
//       '$startCell${rowPos.Pos}:F${rowPos.Pos}',
//       isMerge: true,
//       alignType: HAlignType.right,
//     );
//     buildCell(
//       value,
//       '$endCell${rowPos.Pos}',
//       width: 25,
//       alignType: HAlignType.center,
//     );
//   }
//
//   void setTableBorder(int start, int end) {
//     final Range headerRange = worksheet.getRangeByName('B$start:G$end');
//     headerRange.cellStyle.borders.all.lineStyle = LineStyle.thin;
//     headerRange.cellStyle.borders.left.lineStyle = LineStyle.thick;
//     headerRange.cellStyle.borders.right.lineStyle = LineStyle.thick;
//     headerRange.cellStyle.borders.top.lineStyle = LineStyle.thick;
//     headerRange.cellStyle.borders.bottom.lineStyle = LineStyle.thick;
//   }
// }
//
// class OfferFooter extends OfferBase {
//   OfferFooter({required super.worksheet, required super.rowPos});
//
//   void setPersonSignRows({
//     required String title,
//     required String company,
//     required String fullName,
//   }) {
//     addCompanySignHeader();
//     rowPos.increment();
//     addCompanyJobTitle(title, company);
//     rowPos.increment();
//     addCreaterName(fullName);
//     rowPos.increment();
//   }
//
//   void addOfferNotes(String note) {
//     buildCell(
//       'Примечания:',
//       'B${rowPos.Pos}:G${rowPos.Pos}',
//       isMerge: true,
//       alignType: HAlignType.left,
//       fontSize: 12,
//       isBold: true,
//     );
//     rowPos.increment();
//     if (note.length < 80) {
//       buildCell(
//         note,
//         fontSize: 14,
//         '$startCell${rowPos.Pos}:$endCell${rowPos.Pos}',
//         isMerge: true,
//         alignType: HAlignType.left,
//       );
//     } else {
//       List<String> lines = note.split('\n');
//       for (var line in lines) {
//         if (line.isEmpty) {
//           continue;
//         }
//         if (line.length < 80) {
//           buildCell(
//             line,
//             fontSize: 14,
//             '$startCell${rowPos.Pos}:$endCell${rowPos.Pos}',
//             isMerge: true,
//             alignType: HAlignType.left,
//           );
//           rowPos.increment();
//         } else {
//           int qntCarets = (line.length / 80).toInt();
//           int cellRow = qntCarets + rowPos.Pos;
//           List<String> words = line.split(' ');
//           StringBuffer stringBuffer = StringBuffer();
//           int currentLenght = 0;
//           print(words);
//           for (var word in words) {
//             if (currentLenght + word.length > 80) {
//               stringBuffer.writeln();
//               currentLenght = 0;
//             }
//             stringBuffer.write(' ${word}');
//             stringBuffer.write(' ');
//           }
//           print(stringBuffer.toString());
//           buildCell(
//             stringBuffer.toString(),
//             fontSize: 14,
//             '$startCell${rowPos.Pos}:$endCell$cellRow',
//             isMerge: true,
//             alignType: HAlignType.left,
//             isWrap: true,
//             height: 25,
//           );
//
//           rowPos.increment(qntCarets + 1);
//         }
//       }
//     }
//   }
//
//   void addSignPlace({
//     required String jobTitle,
//     required String companyTitle,
//     required String fullName,
//   }) {
//     addCompanySignHeader();
//     rowPos.increment();
//     addCompanyJobTitle(jobTitle, companyTitle);
//     rowPos.increment();
//     addCreaterName(fullName);
//     rowPos.increment();
//     buildCell(
//       '____________________________',
//       'B${rowPos.Pos}:C${rowPos.Pos}',
//       isMerge: true,
//     );
//     rowPos.increment();
//     buildCell('м.п.', 'B${rowPos.Pos}');
//   }
//
//   void addCompanySignHeader() {
//     buildCell('Подписант', 'B${rowPos.Pos}', fontSize: 12, isBold: true);
//   }
//
//   void addCompanyJobTitle(String jobTitle, String companyTitle) {
//     buildCell('$jobTitle - $companyTitle', 'B${rowPos.Pos}', fontSize: 14);
//   }
//
//   void addCreaterName(String fullName) {
//     buildCell(fullName, 'B${rowPos.Pos}', fontSize: 14);
//   }
// }
//
// class OfferParts {
//   OfferParts(Worksheet worksheet, RowPos rowPos)
//     : offerHeader = OfferHeader(worksheet: worksheet, rowPos: rowPos),
//       offerTable = OfferTable(worksheet: worksheet, rowPos: rowPos),
//       offerFooter = OfferFooter(worksheet: worksheet, rowPos: rowPos);
//
//   final OfferHeader offerHeader;
//
//   final OfferTable offerTable;
//
//   final OfferFooter offerFooter;
// }
//
// class OfferBuilder {
//   static OfferFileBuilder build(
//     ExcelSaveType type,
//     Worksheet worksheet,
//     OfferTemplateBuilder designOfferTemplate,
//   ) {
//     switch (type) {
//       case ExcelSaveType.client:
//         return DesignOfferClient(worksheet, designOfferTemplate);
//       case ExcelSaveType.manager:
//         return DesignOfferManager(worksheet, designOfferTemplate);
//     }
//   }
// }
