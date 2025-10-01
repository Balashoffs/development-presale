import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:presale/src/data/core/string_converter.dart';
import 'package:presale/src/data/data_sources/v3/memory_cashed/design_offer_dto.dart';
import 'package:presale/src/domain/models/v5/common/offer_template_builder/offer_template_builder.dart';
import 'package:presale/src/domain/models/v5/common/person_sign/person_sign_dto.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

class DesignOfferClient extends BaseTemplateBuilder {

  DesignOfferClient({
    required super.worksheet,
    required super.offerResult,
  });

  @override
  Future<void> fillRows() async {
    increment();
    await _addLogoImg();
    await _addHeaderImg();
    increment(2);
    _addOfferId();
    _addDate();
    increment(2);
    _addTitle();
    increment();
    _addObjectName();
    increment();
    _addObjectLocation();
    _addDeadLine();
    increment(2);
    _addTableTitle();
    increment();
    _addTable();
    _addObjectSquare();
    _addAvance();
    _addOfferNotes();
    _increment(2);
    if (offerResult.personSign != null) {
      _addSignRows(offerResult.personSign!);
    }
    _addSignPlace();
    increment();
    _addText('м.п.');
  }

  @override
  String get fileLabelTemplate => '_с_НДС_.xlsx';
  void _addSignRows(PersonSignDTO personSign) {
    _addCompanySignHeader();
    _increment();
    _addCompanyJobTitle(personSign.jobTitle, personSign.companyTitle);
    _increment();
    _addCreatorName(personSign.fullName);
    _increment();
  }

  void _addTable() {
    int start = rowPos;
    _addTableHeader();
    _increment();
    _addTableRows();
    _increment();
    _addTableFooter1();
    _increment();
    _addTableFooter2();
    int end = rowPos;
    _setTableBorder(start, end);
  }

  void _increment([int i = 1]) {
    rowPos += i;
  }

  Future<Picture> _addLogoImg() async {
    final imageBytes = await rootBundle
        .load('assets/calculator_data/template/logo.png')
        .then((value) => value.buffer);
    var m = base64.encode(Uint8List.view(imageBytes));
    return worksheet.pictures.addBase64(rowPos, 2, m);
  }

  Future<Picture> _addHeaderImg() async {
    final imageBytes = await rootBundle
        .load('assets/calculator_data/template/header.png')
        .then((value) => value.buffer);
    var m = base64.encode(Uint8List.view(imageBytes));
    return worksheet.pictures.addBase64(rowPos, 4, m);
  }

  void _addOfferId() {
    String id = offerResult.id;
    String offerId = 'исх. №$id';
    _buildCell(offerId, "B$rowPos");
  }

  void _addDate() {
    String created = offerResult.created;
    String dateAsText = 'Дата: $created г.';
    _buildCell(dateAsText, "G$rowPos");
  }

  void _addTitle() {
    rowPos += 2;
    String title = 'Коммерческое предложение';
    _buildCell(
      title,
      'B$rowPos:D$rowPos',
      alignType: HAlignType.center,
      fontSize: 14,
      isBold: true,
      isMerge: true,
    );
  }

  void _addObjectName() {
    _buildCell(
      'Объект:',
      'B$rowPos',
      alignType: HAlignType.left,
      fontSize: 12,
      isBold: true,
    );
    _buildCell(
      offerResult.objectAddress,
      'C$rowPos:E$rowPos',
      alignType: HAlignType.left,
      fontSize: 14,
      isMerge: true,
    );
  }

  void _addObjectLocation() {
    _buildCell(
      'Адрес:',
      'B$rowPos',
      alignType: HAlignType.left,
      fontSize: 12,
      isBold: true,
    );
    _buildCell(
      offerResult.objectAddress,
      'C$rowPos:E$rowPos',
      alignType: HAlignType.left,
      fontSize: 14,
      isMerge: true,
    );
  }

  void _addObjectSquare() {
    if (offerResult.objectSquare != 0) {
      _increment();
      String objectLocation =
          'Площадь объекта: ${offerResult.objectSquare} м\u00B2';
      _buildCell(
        objectLocation,
        'B$rowPos:D$rowPos',
        alignType: HAlignType.left,
        fontSize: 14,
        isMerge: true,
      );
    }
  }

  void _addTableTitle() {
    String title = 'Рассчет стоимости';
    _buildCell(
      title,
      'B$rowPos:E$rowPos',
      alignType: HAlignType.center,
      fontSize: 14,
      isBold: true,
      isMerge: true,
    );
  }

  void _addTableHeader() {
    _buildCell(
      '№ п/п',
      'B$rowPos',
      width: 7.5,
      alignType: HAlignType.center,
      isBold: true,
    );
    _buildCell(
      'Наименование услуги',
      'C$rowPos:E$rowPos',
      width: 20,
      alignType: HAlignType.center,
      isBold: true,
      isMerge: true,
    );
    _buildCell(
      'Кол-во',
      'F$rowPos',
      width: 7.5,
      alignType: HAlignType.center,
      isBold: true,
    );
    _buildCell(
      'Стоимость с НДС',
      'G$rowPos',
      width: 25,
      alignType: HAlignType.center,
      isBold: true,
    );
  }

  void _addTableRows() {
    for (int i = 0; i < offerResult.divisionResults.length; i++) {
      DivisionResultDTO result = offerResult.divisionResults[i];
      _buildCell(
        result.id.toString(),
        'B$rowPos',
        width: 7.5,
        alignType: HAlignType.center,
      );
      _buildCell(
        result.divisionName,
        'C$rowPos:E$rowPos',
        width: 20,
        alignType: HAlignType.center,
        isMerge: true,
      );
      _buildCell(
        1.toString(),
        'F$rowPos',
        width: 7.5,
        alignType: HAlignType.center,
      );
      _buildCell(
        convertToString(result.divisionSummaryWithTax, 0),
        'G$rowPos',
        width: 25,
        alignType: HAlignType.center,
      );
      if (i != offerResult.divisionResults.length - 1) {
        _increment();
      }
    }
  }

  void _addTableFooter1() {
    _buildCell(
      'ИТОГО с НДС 20%:',
      'B$rowPos:F$rowPos',
      isMerge: true,
      alignType: HAlignType.right,
    );
    _buildCell(
      convertToString(offerResult.summaryWithTax, 0),
      'G$rowPos',
      width: 25,
      alignType: HAlignType.center,
    );
  }

  void _addTableFooter2() {
    _buildCell(
      'НДС 20%:',
      'B$rowPos:F$rowPos',
      isMerge: true,
      alignType: HAlignType.right,
    );
    _buildCell(
      convertToString(offerResult.tax, 0),
      'G$rowPos',
      width: 25,
      alignType: HAlignType.center,
    );
  }

  void _addOfferNotes() {
    if (offerResult.noteText.isNotEmpty) {
      _increment(2);
      _buildCell(
        'Примечания:',
        'B$rowPos:D$rowPos',
        isMerge: true,
        alignType: HAlignType.left,
        fontSize: 12,
        isBold: true,
      );
      String note = offerResult.noteText;
      if (note.contains('\n')) {
        List<String> lines = note.split('\n');
        for (final line in lines) {
          _increment(1);
          _buildCell(
            line,
            'B$rowPos:D$rowPos',
            isMerge: true,
            fontSize: 14,
            alignType: HAlignType.left,
          );
        }
      } else {
        _increment(1);
        _buildCell(
          note,
          fontSize: 14,
          'B$rowPos:D$rowPos',
          isMerge: true,
          alignType: HAlignType.left,
        );
      }
    }
  }

  void _addAvance() {
    _increment(1);
    _buildCell(
      'Авансирование',
      'B$rowPos:D$rowPos',
      isMerge: true,
      alignType: HAlignType.left,
      fontSize: 12,
      isBold: true,
    );
    _increment(1);
    _buildCell(
      convertToString(offerResult.avanceValue, 2),
      'B$rowPos:D$rowPos',
      isMerge: true,
      fontSize: 14,
      alignType: HAlignType.left,
    );
  }

  void _buildCell(
      String value,
      String range, {
        bool isMerge = false,
        double? width,
        HAlignType? alignType,
        double fontSize = 12,
        bool isBold = false,
      }) {
    if (isMerge) {
      worksheet.getRangeByName(range).merge();
    }
    if (width != null) {
      worksheet.getRangeByName(range).columnWidth = width;
    }
    if (isBold) {
      worksheet.getRangeByName(range).cellStyle.bold = true;
    }
    if (alignType != null) {
      worksheet.getRangeByName(range).cellStyle.hAlign = alignType;
    }
    worksheet.getRangeByName(range).cellStyle.fontSize = fontSize;
    worksheet.getRangeByName(range).cellStyle.fontName = 'Times New Roman';
    worksheet.getRangeByName(range).setText(value);
  }

  void _addDeadLine() {
    if (offerResult.deadline != 0) {
      _increment();
      _buildCell(
        'Срок выполнения работ: ${offerResult.deadline} дн.',
        'B$rowPos',
      );
    }
  }

  void _addCompanySignHeader() {
    _buildCell('Подписант', 'B$rowPos', fontSize: 12, isBold: true);
  }

  void _addCompanyJobTitle(String jobTitle, String companyTitle) {
    _buildCell(
      '$jobTitle - $companyTitle',
      'B$rowPos',
      fontSize: 14,
    );
  }

  void _addCreatorName(String fullName) {
    _buildCell(fullName, 'B$rowPos', fontSize: 14);
  }

  void _addSignPlace() {
    _buildCell('____________________________', 'B$rowPos');
  }

  void _addText(String s) {
    _buildCell(s, 'B$rowPos');
  }

  void _setTableBorder(int start, int end) {
    final Range headerRange = worksheet.getRangeByName('B$start:G$end');
    headerRange.cellStyle.borders.all.lineStyle = LineStyle.thin;
    headerRange.cellStyle.borders.left.lineStyle = LineStyle.thick;
    headerRange.cellStyle.borders.right.lineStyle = LineStyle.thick;
    headerRange.cellStyle.borders.top.lineStyle = LineStyle.thick;
    headerRange.cellStyle.borders.bottom.lineStyle = LineStyle.thick;
  }
}