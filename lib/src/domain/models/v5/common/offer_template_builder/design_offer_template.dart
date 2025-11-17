import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:presale/src/domain/models/v5/common/offer_template_builder/offer_template_builder.dart';
import 'package:presale/src/domain/models/v5/common/person_sign/person_sign_dto.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import 'offer_dto.dart';

abstract class OfferTemplateBuilder {
  final Worksheet worksheet;

  OfferTemplateBuilder(this.worksheet);

  Future<void> fillRows();
}

class DesignOfferTemplate extends OfferTemplateBuilder {
  final RowPos rowPos;
  final OfferHeader offerHeader;
  final OfferTable offerTable;
  final OfferFooter offerFooter;
  final OfferDTO offerResult;

  DesignOfferTemplate(
    super.worksheet, {
    required OfferParts offerParts,
    required this.offerResult,
    required this.rowPos,
  }) : offerHeader = offerParts.offerHeader,
       offerTable = offerParts.offerTable,
       offerFooter = offerParts.offerFooter;

  @override
  Future<void> fillRows() async {
    rowPos.increment();
    await offerHeader.addHeaderImg();
    rowPos.increment(2);
    offerHeader.addOfferId(offerResult.id);
    offerHeader.addDate(offerResult.created);
    rowPos.increment(2);
    offerHeader.addTitle('Коммерческое предложение');
    rowPos.increment();
    offerHeader.addKey1Value('Объект: ', offerResult.objectName);
    rowPos.increment();
    offerHeader.addKey1Value('Адрес: ', offerResult.objectAddress);
    rowPos.increment();
    if (offerResult.deadline.isNotEmpty) {
      offerHeader.addKey2Value('Срок выполнения работ, дн.: ', offerResult.deadline);
      rowPos.increment(2);
    }else{
      rowPos.increment();
    }
    offerHeader.addTitle('Расчет стоимости');
    rowPos.increment();
    offerTable.addTable(
      offerResult.rows,
      summary: offerResult.summaryWithTax,
      tax: offerResult.tax,
    );
    rowPos.increment(2);
    if (offerResult.objectSquare.isNotEmpty) {
      offerFooter.addKey2Value(
        'Площадь объекта, м\u00B2: ',
        '${offerResult.objectSquare}',
      );
      rowPos.increment();
    }
    offerFooter.addKey2Value('Авансирование, руб.: ', offerResult.presaleCostValue);
    rowPos.increment();
    if (offerResult.noteText.isNotEmpty) {
      offerFooter.addOfferNotes(offerResult.noteText);
    }
    rowPos.increment(2);
    if (offerResult.isPersonSing) {
      offerFooter.addSignPlace(
        companyTitle: offerResult.companyTitle,
        jobTitle: offerResult.jobTitle,
        fullName: offerResult.fullName,
      );
    }
  }
}
