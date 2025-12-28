import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import 'offer_base.dart';

class OfferPay extends OfferBase {
  OfferPay({required super.worksheet, required super.rowPos});

  void addPays(PayValuesDTO payValues) {
    if (payValues.isValid) {
      String header = 'Условия оплаты и проведения работ (при необходимости):';
      buildCell(
        header,
        currentRangeFromStartAndEnd,
        alignType: HAlignType.left,
        isBold: true,
        isMerge: true,
      );
      rowPos.increment();
      if (payValues.presaleFactor.compareTo(0.0) > 0) {
        String val1 = (payValues.presaleFactor * 100).toStringAsFixed(0);
        String line1 = '$val1% авансовый платеж';
        buildCell(
          line1,
          currentRangeFromStartAndEnd,
          alignType: HAlignType.left,
          isMerge: true,
        );
        rowPos.increment();
      }
      if (payValues.afterPayFactor.compareTo(0.0) > 0) {
        String val1 = (payValues.afterPayFactor * 100).toStringAsFixed(0);
        String line1 = '$val1% оплата после ${payValues.afterPayDate}';
        buildCell(
          line1,
          currentRangeFromStartAndEnd,
          alignType: HAlignType.left,
          isMerge: true,
        );
        rowPos.increment();
      }
      if (payValues.afterActsSignFactor.compareTo(0.0) > 0) {
        String val1 = (payValues.afterActsSignFactor * 100).toStringAsFixed(0);
        String line1 = '$val1% оплата после подписания актов';
        buildCell(
          line1,
          currentRangeFromStartAndEnd,
          alignType: HAlignType.left,
          isMerge: true,
        );
        rowPos.increment();
      }

    }
  }
}

class OfferNotes extends OfferBase {
  OfferNotes({required super.worksheet, required super.rowPos});

  void addNotes(String notes) {
    String header = 'Примечания:';
    buildCell(
      header,
      currentRangeFromStartAndEnd,
      alignType: HAlignType.left,
      isBold: true,
      isMerge: true,
    );
    rowPos.increment();
    List<String> lines = notes.split('\n').toList();
    for (String line in lines) {
      if(line.isEmpty) continue;
      buildCell(
        line,
        currentRangeFromStartAndEnd,
        alignType: HAlignType.left,
        isMerge: true,
      );
      if (line != lines.last) {
        rowPos.increment();
      }
    }
  }
}
