import 'package:presale/src/data/helpers/excel/worksheet_util.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import 'offer_base.dart';

class OfferHeader extends OfferBase {
  OfferHeader({required super.worksheet, required super.rowPos});

  Future<Picture> addHeaderImg() async {
    final baseData = await toExcelImage(headerImagePath);
    return worksheet.pictures.addBase64(1, 2, baseData);
  }

  void addConsumer(String value) {
    String offerId = 'Заказчик: $value';
    buildCell(
      offerId,
      currentRangeFromStartAndEnd,
      alignType: HAlignType.right,
      isMerge: true,
      isWrap: true,
    );
  }

  void addObjectName(String value) {
    String offerId = 'Объект: $value';
    buildCell(
      offerId,
      currentRangeFromStartAndEnd,
      alignType: HAlignType.right,
      isMerge: true,
      isWrap: true,
    );
  }

  void addObjectAddress(String value) {
    String offerId = 'Адрес: $value';
    buildCell(
      offerId,
      currentRangeFromStartAndEnd,
      alignType: HAlignType.right,
      isMerge: true,
      isWrap: true,
    );
    worksheet.autoFitColumn(rowPos.Pos);
  }

  void addObjectSquare(num value) {
    String offerId = 'Площадь: $value';
    buildCell(
      offerId,
      currentRangeFromStartAndEnd,
      alignType: HAlignType.right,
      isMerge: true,
    );
  }

  void addDate(String value) {
    String offerId = 'Дата: $value';
    buildCell(
      offerId,
      currentRangeFromStartAndEnd,
      alignType: HAlignType.right,
      isMerge: true,
    );
  }
}
