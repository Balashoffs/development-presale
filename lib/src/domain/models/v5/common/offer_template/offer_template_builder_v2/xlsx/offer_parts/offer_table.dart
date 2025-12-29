import 'dart:ui';

import 'package:presale/src/data/core/string_converter.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import 'offer_base.dart';

class OfferTable extends OfferBase {
  OfferTable({required super.worksheet, required super.rowPos});

  void addTable(
      ResultsTableDTO resultTable,
      String jobTitle) {
    int start = rowPos.Pos;
    addTableHeader();
    rowPos.increment();
    addTableRows(resultTable.divisionRows);
    addTableFooter(resultTable);
    int end = rowPos.Pos;
    setTableBorder(start, end);
  }

  void addTableHeader() {
    buildCell(
      '№',
      currentCell(1),
      width: 7.5,
      alignType: HAlignType.center,
      isBold: true,
      cellColor: Color.fromARGB(255, 232, 230, 251),
    );
    buildCell(
      'Наименование раздела/вида работ',
      currentCell(2),
      width: 20,
      alignType: HAlignType.center,
      isBold: true,
      cellColor: Color.fromARGB(255, 232, 230, 251),
    );
    buildCell(
      'Стоимость, руб. без НДС',
      currentCell(3),
      width: 15,
      alignType: HAlignType.center,
      isBold: true,
      cellColor: Color.fromARGB(255, 232, 230, 251),
    );
  }

  void addTableRows(List<RowDivisionResultDTO> rows) {
    for (int i = 0; i < rows.length; i++) {
      RowDivisionResultDTO result = rows[i];
      buildCell(
        '${i + 1}',
        currentCell(1),
        width: 5,
        alignType: HAlignType.center,
      );
      buildCell(
        result.divisionName,
        currentCell(2),
        width: 61,
        alignType: HAlignType.left,
        isWrap: true,
      );
      buildCell(
        convertToRubleString(result.divisionSummary, 0),
        currentCell(3),
        width: 38,
        alignType: HAlignType.right,
      );
      if (i + 1 < rows.length) {
        rowPos.increment();
      }
    }
    rowPos.increment();
  }

  //offerResult.summaryWithTax.toStringAsFixed(2),
  void addTableFooter(ResultsTableDTO result) {
    for (int i = 0; i < 3; i++) {
      String key = switch (i) {
        0 => 'Общая стоимость без НДС, руб.',
        1 => 'НДС, 22%, руб.',
        2 => 'Общая стоимость с учетом НДС 22%, руб.',
        _ => '',
      };
      String value = switch (i) {
        0 => convertToRubleString(result.fullSummary, 0),
        1 => convertToRubleString(result.tax, 0),
        2 => convertToRubleString(result.fullSummaryWithTax, 0),
        _ => '',
      };
      buildCell(
        '',
        currentCell(1),
        alignType: HAlignType.center,
        width: 5,
        cellColor: Color.fromARGB(255, 232, 230, 251),
      );
      buildCell(
        key,
        currentCell(2),
        alignType: HAlignType.right,
        width: 61,
        cellColor: Color.fromARGB(255, 232, 230, 251),
      );
      buildCell(
        value,
        currentCell(3),
        alignType: HAlignType.right,
        width: 38,
        cellColor: Color.fromARGB(255, 232, 230, 251),
      );
      if (i + 1 < 3) {
        rowPos.increment();
      }
    }
  }

  void setTableBorder(int start, int end) {
    final Range headerRange = worksheet.getRangeByName('B$start:D$end');
    headerRange.cellStyle.borders.all.lineStyle = LineStyle.thin;
    headerRange.cellStyle.borders.left.lineStyle = LineStyle.thick;
    headerRange.cellStyle.borders.right.lineStyle = LineStyle.thick;
    headerRange.cellStyle.borders.top.lineStyle = LineStyle.thick;
    headerRange.cellStyle.borders.bottom.lineStyle = LineStyle.thick;
  }
}
