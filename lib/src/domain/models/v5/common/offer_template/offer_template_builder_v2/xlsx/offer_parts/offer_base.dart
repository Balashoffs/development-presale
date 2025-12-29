import 'dart:ui';

import 'package:presale/src/data/helpers/excel/worksheet_util.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

class RowPos {
  int _pos = 1;

  int get Pos => _pos;

  void increment([int i = 1]) {
    _pos += i;
  }
}

class OfferBase {
  final RowPos rowPos;
  static const String startCell = 'A';
  static const String endCell = 'E';
  final Worksheet worksheet;

  int _endMergePos = 0;
  int _startMergePos = 0;

  void startCountForMerge() {
    _startMergePos = rowPos.Pos;
  }

  void stopCountForMerge() {
    _endMergePos = rowPos.Pos;
  }

  ({int start, int end}) getRangeWithClear() {
    int start = _startMergePos;
    int end = _endMergePos;
    _startMergePos = 0;
    _endMergePos = 0;
    return (start: start, end: end);
  }

  String get currentRangeFromStartAndEnd =>
      getRangeFromStartAndEnd(1, 1, rowPos.Pos, rowPos.Pos);

  String currentRangeFromStartToEnd(int start, int end) =>
      getRangeFromStartToEnd(start, end, rowPos.Pos, rowPos.Pos);

  String currentCell(int pos) {
    int charI = startCell.codeUnitAt(0) + pos;
    String charNum = String.fromCharCode(charI);
    return '$charNum${rowPos.Pos}';
  }

  OfferBase({required this.worksheet, required this.rowPos});

  void buildCell(
    Object value,
    String range, {
    bool isMerge = false,
    double? width,
    HAlignType? alignType,
    double fontSize = 12,
    double height = 0.0,
    bool isBold = false,
    bool isWrap = false,
    String fontName = 'Calibri Light',
    Color? cellColor,
  }) {
    print('Object: ${value}');
    print('range: $range');
    if (isMerge) {
      worksheet.getRangeByName(range).merge();
    }
    if (width != null) {
      worksheet.getRangeByName(range).columnWidth = width;
    }
    if (alignType != null) {
      worksheet.getRangeByName(range).cellStyle.hAlign = alignType;
    }

    worksheet.getRangeByName(range).cellStyle.bold = isBold;
    worksheet.getRangeByName(range).cellStyle.wrapText = isWrap;
    worksheet.getRangeByName(range).cellStyle.vAlign = VAlignType.center;
    worksheet.getRangeByName(range).cellStyle.fontSize = fontSize;
    worksheet.getRangeByName(range).cellStyle.fontName = fontName;
    if (height.compareTo(0.0) > 0) {
      worksheet.getRangeByName(range).rowHeight = height;
    }
    if (cellColor != null) {
      worksheet.getRangeByName(range).cellStyle.backColorRgb = cellColor;
    }
    if (value is double) {
      worksheet.getRangeByName(range).setNumber(value);
    } else if (value is String) {
      worksheet.getRangeByName(range).setText(value);
    }
  }
}
