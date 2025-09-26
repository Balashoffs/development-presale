import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:presale/src/data/common/extensions/date.dart';
import 'package:presale/src/data/common/utils/date_utils.dart';
import 'package:presale/src/data/core/string_converter.dart';
import 'package:presale/src/data/data_sources/v3/memory_cashed/design_offer_dto.dart';
import 'package:presale/src/domain/models/v3/design/commercial_offer/commercial_offer.dart';
import 'package:presale/src/domain/models/v3/design/division_result/division_result.dart';
import 'package:presale/src/domain/models/v3/design/extension.dart';
import 'package:presale/src/domain/models/v5/common/offer_counter/extension.dart';
import 'package:presale/src/domain/service/v5/design/excel_service.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

abstract class ITemplateBuilder {
  Future<void> fillRows();

  List<int> saveToBytes();

  String get fileLabelTemplate;
}

ITemplateBuilder build(ExcelSaveType type, Worksheet worksheet,
    CommercialOfferDTO offerResult,) {
  switch (type) {
    case ExcelSaveType.number:
      return DesignOfferNoTaxTemplateBuilder(worksheet: worksheet, offerResult: offerResult);
    case ExcelSaveType.client:
      return DesignOfferWithTaxTemplateBuilder(worksheet: worksheet, offerResult: offerResult);
  }
}

class DesignOfferNoTaxTemplateBuilder implements ITemplateBuilder {
  final CommercialOfferDTO _offerResult;
  final Worksheet _worksheet;
  int _rowPos = 1;


  DesignOfferNoTaxTemplateBuilder({
    required Worksheet worksheet,
    required CommercialOfferDTO offerResult,
  })
      : _offerResult = offerResult,
        _worksheet = worksheet;

  @override
  Future<void> fillRows() async {
    _increment();
    await _addLogoImg();
    await _addHeaderImg();
    _increment(2);
    _addOfferId();
    _addDate();
    _increment(2);
    _addTitle();
    _increment();
    _addObjectName();
    _increment();
    _addObjectLocation();
    _addDeadLine();
    _increment(2);
    _addTableTitle();
    _increment();
    _addTable();
    _addObjectSquare();
    _addAvance();
    _addOfferNotes();
    _increment(2);
    _addSignRows();
    _addSignPlace();
    _increment();
    _addText('м.п.');
  }

  @override
  List<int> saveToBytes() {
    return _worksheet.workbook.saveSync();
  }

  void _addSignRows() {
    _addCompanySignHeader();
    _increment();
    _addCompanyJobTitle();
    _increment();
    _addCreaterName();
    _increment();
  }

  void _addTable() {
    int start = _rowPos;
    _addTableHeader();
    _increment();
    _addTableRows();
    _increment();
    _addTableFooter1();
    int end = _rowPos;
    _setTableBorder(start, end);
  }

  void _increment([int i = 1]) {
    _rowPos += i;
  }

  Future<Picture> _addLogoImg() async {
    final imageBytes = await rootBundle
        .load('assets/calculator_data/template/logo.png')
        .then((value) => value.buffer);
    var m = base64.encode(Uint8List.view(imageBytes));
    return _worksheet.pictures.addBase64(_rowPos, 2, m);
  }

  Future<Picture> _addHeaderImg() async {
    final imageBytes = await rootBundle
        .load('assets/calculator_data/template/header.png')
        .then((value) => value.buffer);
    var m = base64.encode(Uint8List.view(imageBytes));
    return _worksheet.pictures.addBase64(_rowPos, 4, m);
  }

  void _addOfferId() {
    String id = _offerResult.inputDataDesign.offerCounter
        .toDto()
        .getOfferUniqueNumber();
    String offerId = 'исх. №${id}';
    _buildCell(offerId, "B$_rowPos");
  }

  void _addDate() {
    String created = _offerResult.inputDataDesign.offerCounter
        .toDto()
        .localDate;
    String dateAsText = 'Дата: $created г.';
    _buildCell(dateAsText, "G$_rowPos");
  }

  void _addTitle() {
    _rowPos += 2;
    String title = 'Коммерческое предложение';
    _buildCell(
      title,
      'B$_rowPos:D$_rowPos',
      alignType: HAlignType.center,
      fontSize: 16,
      isBold: true,
      isMerge: true,
    );
  }

  void _addObjectName() {
    _buildCell(
      'Объект:',
      'B$_rowPos',
      alignType: HAlignType.left,
      fontSize: 12,
      isBold: true,
    );
    _buildCell(
      _offerResult.inputDataDesign.objectData.name,
      'C$_rowPos:E$_rowPos',
      alignType: HAlignType.left,
      fontSize: 14,
      isMerge: true,
    );
  }

  void _addObjectLocation() {
    _buildCell(
      'Адрес:',
      'B$_rowPos',
      alignType: HAlignType.left,
      fontSize: 12,
      isBold: true,
    );
    _buildCell(
      _offerResult.inputDataDesign.objectData.address,
      'C$_rowPos:E$_rowPos',
      alignType: HAlignType.left,
      fontSize: 14,
      isMerge: true,
    );
  }

  void _addObjectSquare() {
    if (_offerResult.inputDataDesign.objectData.square != 0) {
      _increment();
      String objectLocation =
          'Площадь объекта: ${_offerResult.inputDataDesign.objectData
          .square} м\u00B2';
      _buildCell(
        objectLocation,
        'B$_rowPos:D$_rowPos',
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
      'B$_rowPos:E$_rowPos',
      alignType: HAlignType.center,
      fontSize: 14,
      isBold: true,
      isMerge: true,
    );
  }

  void _addTableHeader() {
    _buildCell(
      '№ п/п',
      'B$_rowPos',
      width: 7.5,
      alignType: HAlignType.center,
      isBold: true,
    );
    _buildCell(
      'Наименование услуги',
      'C$_rowPos:E$_rowPos',
      width: 20,
      alignType: HAlignType.center,
      isBold: true,
      isMerge: true,
    );
    _buildCell(
      'Кол-во',
      'F$_rowPos',
      width: 7.5,
      alignType: HAlignType.center,
      isBold: true,
    );
    _buildCell(
      'Стоимость / руб.',
      'G$_rowPos',
      width: 25,
      alignType: HAlignType.center,
      isBold: true,
    );
  }

  void _addTableRows() {
    for (int i = 0; i < _offerResult.divisionResults.length; i++) {
      DivisionResult result = _offerResult.divisionResults[i];
      _buildCell(
        result.id.toString(),
        'B$_rowPos',
        width: 7.5,
        alignType: HAlignType.center,
      );
      _buildCell(
        result.divisionName,
        'C$_rowPos:E$_rowPos',
        width: 20,
        alignType: HAlignType.center,
        isMerge: true,
      );
      _buildCell(
        1.toString(),
        'F$_rowPos',
        width: 7.5,
        alignType: HAlignType.center,
      );
      _buildCell(
        '${result.divisionSummary}',
        'G$_rowPos',
        width: 25,
        alignType: HAlignType.center,
      );
      if (i != _offerResult.divisionResults.length - 1) {
        _increment();
      }
    }
  }

  void _addTableFooter1() {
    _buildCell(
      'ИТОГО: ',
      'B$_rowPos:F$_rowPos',
      isMerge: true,
      alignType: HAlignType.right,
    );
    _buildCell(
      '${_offerResult.designOfferSummaryCost}',
      'G$_rowPos',
      width: 25,
      alignType: HAlignType.center,
    );
  }

  void _addOfferNotes() {
    if (_offerResult.footerData.noteText.isNotEmpty) {
      _increment(2);
      _buildCell(
        'Примечания:',
        'B$_rowPos:D$_rowPos',
        isMerge: true,
        alignType: HAlignType.left,
        fontSize: 12,
        isBold: true,
      );
      String note = _offerResult.footerData.noteText;
      if (note.contains('\n')) {
        List<String> lines = note.split('\n');
        for (final line in lines) {
          _increment(1);
          _buildCell(
            line,
            'B$_rowPos:D$_rowPos',
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
          'B$_rowPos:D$_rowPos',
          isMerge: true,
          alignType: HAlignType.left,
        );
      }
    }
  }

  void _addAvance() {
    if (_offerResult.footerData.prepayment.isNotEmpty) {
      _increment(1);
      _buildCell(
        'Авансирование, руб',
        'B$_rowPos:D$_rowPos',
        isMerge: true,
        alignType: HAlignType.left,
        fontSize: 12,
        isBold: true,
      );
      _increment(1);
      _buildCell(
        _offerResult.footerData.prepayment,
        'B$_rowPos:D$_rowPos',
        isMerge: true,
        fontSize: 14,
        alignType: HAlignType.left,
      );
    }
  }

  _buildCell(String value,
      String range, {
        bool isMerge = false,
        double? width,
        HAlignType? alignType,
        double fontSize = 12,
        bool isBold = false,
      }) {
    if (isMerge) {
      _worksheet.getRangeByName(range).merge();
    }
    if (width != null) {
      _worksheet
          .getRangeByName(range)
          .columnWidth = width;
    }
    if (isBold) {
      _worksheet
          .getRangeByName(range)
          .cellStyle
          .bold = true;
    }
    if (alignType != null) {
      _worksheet
          .getRangeByName(range)
          .cellStyle
          .hAlign = alignType;
    }
    _worksheet
        .getRangeByName(range)
        .cellStyle
        .fontSize = fontSize;
    _worksheet
        .getRangeByName(range)
        .cellStyle
        .fontName = 'Times New Roman';
    _worksheet.getRangeByName(range).setText(value);
  }

  void _addDeadLine() {
    if (_offerResult.inputDataDesign.objectData.deadlineValue != 0) {
      _increment();
      _buildCell(
        'Срок выполнения работ: ${_offerResult.inputDataDesign.objectData
            .deadlineValue} дн.',
        'B$_rowPos',
      );
    }
  }

  void _addCompanySignHeader() {
    _buildCell('Подписант', 'B$_rowPos', fontSize: 12, isBold: true);
  }

  void _addCompanyJobTitle() {
    _buildCell(
      '${_offerResult.footerData.personSign.jobTitle} - ${_offerResult
          .footerData.personSign.companyTitle}',
      'B$_rowPos',
      fontSize: 14,
    );
  }

  void _addCreaterName() {
    _buildCell(
      _offerResult.footerData.personSign.fullName,
      'B$_rowPos',
      fontSize: 14,
    );
  }

  void _addSignPlace() {
    _buildCell('____________________________', 'B$_rowPos');
  }

  void _addText(String s) {
    _buildCell(s, 'B$_rowPos');
  }

  void _setTableBorder(int start, int end) {
    final Range headerRange = _worksheet.getRangeByName('B$start:G$end');
    headerRange.cellStyle.borders.all.lineStyle = LineStyle.thin;
    headerRange.cellStyle.borders.left.lineStyle = LineStyle.thick;
    headerRange.cellStyle.borders.right.lineStyle = LineStyle.thick;
    headerRange.cellStyle.borders.top.lineStyle = LineStyle.thick;
    headerRange.cellStyle.borders.bottom.lineStyle = LineStyle.thick;
  }

  @override
  String get fileLabelTemplate => '_без_НДС_.xlsx';
}

class DesignOfferWithTaxTemplateBuilder implements ITemplateBuilder {
  final CommercialOfferResult _offerResult;
  final Worksheet _worksheet;
  int _rowPos = 1;

  DesignOfferWithTaxTemplateBuilder({
    required Worksheet worksheet,
    required CommercialOfferResult offerResult,
  })
      : _offerResult = offerResult,
        _worksheet = worksheet;

  @override
  Future<void> fillRows() async {
    _increment();
    await _addLogoImg();
    await _addHeaderImg();
    _increment(2);
    _addOfferId();
    _addDate();
    _increment(2);
    _addTitle();
    _increment();
    _addObjectName();
    _increment();
    _addObjectLocation();
    _addDeadLine();
    _increment(2);
    _addTableTitle();
    _increment();
    _addTable();
    _addObjectSquare();
    _addAvance();
    _addOfferNotes();
    _increment(2);
    _addSignRows();
    _addSignPlace();
    _increment();
    _addText('м.п.');
  }

  List<int> saveToBytes() {
    return _worksheet.workbook.saveSync();
  }

  void _addSignRows() {
    _addCompanySignHeader();
    _increment();
    _addCompanyJobTitle();
    _increment();
    _addCreaterName();
    _increment();
  }

  void _addTable() {
    int start = _rowPos;
    _addTableHeader();
    _increment();
    _addTableRows();
    _increment();
    _addTableFooter1();
    _increment();
    _addTableFooter2();
    int end = _rowPos;
    _setTableBorder(start, end);
  }

  void _increment([int i = 1]) {
    _rowPos += i;
  }

  Future<Picture> _addLogoImg() async {
    final imageBytes = await rootBundle
        .load('assets/calculator_data/template/logo.png')
        .then((value) => value.buffer);
    var m = base64.encode(Uint8List.view(imageBytes));
    return _worksheet.pictures.addBase64(_rowPos, 2, m);
  }

  Future<Picture> _addHeaderImg() async {
    final imageBytes = await rootBundle
        .load('assets/calculator_data/template/header.png')
        .then((value) => value.buffer);
    var m = base64.encode(Uint8List.view(imageBytes));
    return _worksheet.pictures.addBase64(_rowPos, 4, m);
  }

  void _addOfferId() {
    String id = _offerResult.inputDataDesign.offerCounter
        .toDto()
        .getOfferUniqueNumber();
    String offerId = 'исх. №${id}';
    _buildCell(offerId, "B$_rowPos");
  }

  void _addDate() {
    String created = _offerResult.inputDataDesign.offerCounter
        .toDto()
        .localDate;
    String dateAsText = 'Дата: $created г.';
    _buildCell(dateAsText, "G$_rowPos");
  }

  void _addTitle() {
    _rowPos += 2;
    String title = 'Коммерческое предложение';
    _buildCell(
      title,
      'B$_rowPos:D$_rowPos',
      alignType: HAlignType.center,
      fontSize: 16,
      isBold: true,
      isMerge: true,
    );
  }

  void _addObjectName() {
    _buildCell(
      'Объект:',
      'B$_rowPos',
      alignType: HAlignType.left,
      fontSize: 12,
      isBold: true,
    );
    _buildCell(
      _offerResult.inputDataDesign.objectData.name,
      'C$_rowPos:E$_rowPos',
      alignType: HAlignType.left,
      fontSize: 14,
      isMerge: true,
    );
  }

  void _addObjectLocation() {
    _buildCell(
      'Адрес:',
      'B$_rowPos',
      alignType: HAlignType.left,
      fontSize: 12,
      isBold: true,
    );
    _buildCell(
      _offerResult.inputDataDesign.objectData.address,
      'C$_rowPos:E$_rowPos',
      alignType: HAlignType.left,
      fontSize: 14,
      isMerge: true,
    );
  }

  void _addObjectSquare() {
    if (_offerResult.inputDataDesign.objectData.square != 0) {
      _increment();
      String objectLocation =
          'Площадь объекта: ${_offerResult.inputDataDesign.objectData
          .square} м\u00B2';
      _buildCell(
        objectLocation,
        'B$_rowPos:D$_rowPos',
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
      'B$_rowPos:E$_rowPos',
      alignType: HAlignType.center,
      fontSize: 14,
      isBold: true,
      isMerge: true,
    );
  }

  void _addTableHeader() {
    _buildCell(
      '№ п/п',
      'B$_rowPos',
      width: 7.5,
      alignType: HAlignType.center,
      isBold: true,
    );
    _buildCell(
      'Наименование услуги',
      'C$_rowPos:E$_rowPos',
      width: 20,
      alignType: HAlignType.center,
      isBold: true,
      isMerge: true,
    );
    _buildCell(
      'Кол-во',
      'F$_rowPos',
      width: 7.5,
      alignType: HAlignType.center,
      isBold: true,
    );
    _buildCell(
      'Стоимость с НДС',
      'G$_rowPos',
      width: 25,
      alignType: HAlignType.center,
      isBold: true,
    );
  }

  void _addTableRows() {
    for (int i = 0; i < _offerResult.divisionResults.length; i++) {
      DivisionResult result = _offerResult.divisionResults[i];
      _buildCell(
        result.id.toString(),
        'B$_rowPos',
        width: 7.5,
        alignType: HAlignType.center,
      );
      _buildCell(
        result.divisionName,
        'C$_rowPos:E$_rowPos',
        width: 20,
        alignType: HAlignType.center,
        isMerge: true,
      );
      _buildCell(
        1.toString(),
        'F$_rowPos',
        width: 7.5,
        alignType: HAlignType.center,
      );
      _buildCell(
        convertToString(result.divisionSummaryWithTax, 0),
        'G$_rowPos',
        width: 25,
        alignType: HAlignType.center,
      );
      if (i != _offerResult.divisionResults.length - 1) {
        _increment();
      }
    }
  }

  void _addTableFooter1() {
    _buildCell(
      'ИТОГО с НДС 20%:',
      'B$_rowPos:F$_rowPos',
      isMerge: true,
      alignType: HAlignType.right,
    );
    _buildCell(
      convertToString(_offerResult.designOfferSummaryTax, 0),
      'G$_rowPos',
      width: 25,
      alignType: HAlignType.center,
    );
  }

  void _addTableFooter2() {
    _buildCell(
      'НДС 20%:',
      'B$_rowPos:F$_rowPos',
      isMerge: true,
      alignType: HAlignType.right,
    );
    _buildCell(
      convertToString(_offerResult.designOfferTax, 0),
      'G$_rowPos',
      width: 25,
      alignType: HAlignType.center,
    );
  }

  void _addOfferNotes() {
    if (_offerResult.footerData.noteText.isNotEmpty) {
      _increment(2);
      _buildCell(
        'Примечания:',
        'B$_rowPos:D$_rowPos',
        isMerge: true,
        alignType: HAlignType.left,
        fontSize: 12,
        isBold: true,
      );
      String note = _offerResult.footerData.noteText;
      if (note.contains('\n')) {
        List<String> lines = note.split('\n');
        for (final line in lines) {
          _increment(1);
          _buildCell(
            line,
            'B$_rowPos:D$_rowPos',
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
          'B$_rowPos:D$_rowPos',
          isMerge: true,
          alignType: HAlignType.left,
        );
      }
    }
  }

  void _addAvance() {
    if (_offerResult.footerData.prepayment.isNotEmpty) {
      _increment(1);
      _buildCell(
        'Авансирование',
        'B$_rowPos:D$_rowPos',
        isMerge: true,
        alignType: HAlignType.left,
        fontSize: 12,
        isBold: true,
      );
      _increment(1);
      _buildCell(
        '${_offerResult.footerData.prepayment} руб.',
        'B$_rowPos:D$_rowPos',
        isMerge: true,
        fontSize: 14,
        alignType: HAlignType.left,
      );
    }
  }

  _buildCell(String value,
      String range, {
        bool isMerge = false,
        double? width,
        HAlignType? alignType,
        double fontSize = 12,
        bool isBold = false,
      }) {
    if (isMerge) {
      _worksheet.getRangeByName(range).merge();
    }
    if (width != null) {
      _worksheet
          .getRangeByName(range)
          .columnWidth = width;
    }
    if (isBold) {
      _worksheet
          .getRangeByName(range)
          .cellStyle
          .bold = true;
    }
    if (alignType != null) {
      _worksheet
          .getRangeByName(range)
          .cellStyle
          .hAlign = alignType;
    }
    _worksheet
        .getRangeByName(range)
        .cellStyle
        .fontSize = fontSize;
    _worksheet
        .getRangeByName(range)
        .cellStyle
        .fontName = 'Times New Roman';
    _worksheet.getRangeByName(range).setText(value);
  }

  void _addDeadLine() {
    if (_offerResult.inputDataDesign.objectData.deadlineValue != 0) {
      _increment();
      _buildCell(
        'Срок выполнения работ: ${_offerResult.inputDataDesign.objectData
            .deadlineValue} дн.',
        'B$_rowPos',
      );
    }
  }

  void _addCompanySignHeader() {
    _buildCell('Подписант', 'B$_rowPos', fontSize: 12, isBold: true);
  }

  void _addCompanyJobTitle() {
    _buildCell(
      '${_offerResult.footerData.personSign.jobTitle} - ${_offerResult
          .footerData.personSign.companyTitle}',
      'B$_rowPos',
      fontSize: 14,
    );
  }

  void _addCreaterName() {
    _buildCell(
      _offerResult.footerData.personSign.fullName,
      'B$_rowPos',
      fontSize: 14,
    );
  }

  void _addSignPlace() {
    _buildCell('____________________________', 'B$_rowPos');
  }

  void _addText(String s) {
    _buildCell(s, 'B$_rowPos');
  }

  void _setTableBorder(int start, int end) {
    final Range headerRange = _worksheet.getRangeByName('B$start:G$end');
    headerRange.cellStyle.borders.all.lineStyle = LineStyle.thin;
    headerRange.cellStyle.borders.left.lineStyle = LineStyle.thick;
    headerRange.cellStyle.borders.right.lineStyle = LineStyle.thick;
    headerRange.cellStyle.borders.top.lineStyle = LineStyle.thick;
    headerRange.cellStyle.borders.bottom.lineStyle = LineStyle.thick;
  }

  @override
  // TODO: implement fileLabelTemplate
  String get fileLabelTemplate => '_с_НДС_.xlsx';
}
