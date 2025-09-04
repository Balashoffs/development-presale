import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:presale/src/domain/models/v3/design/custom_factors/custom_factors.dart';
import 'package:presale/src/domain/models/v4/design/design_presale_pojo.dart';
import 'package:presale/src/domain/models/v4/design/division_resource_table/divisions_margin_table_with_type_pojo.dart';
import 'package:presale/src/domain/models/v5/common/person_sign/person_sign_dto.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_row_viewmodel.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';

class DesignOfferResultController {
  late final DesignOfferResultVM? designOfferResultVM;
  final ValueNotifier<bool> isCorrect = ValueNotifier(false);

  final StreamController<PersonSignDTO> _streamController = StreamController();

  StreamSink<PersonSignDTO> get personSignSink => _streamController.sink;
  late final PersonSignDTO? _personSignDTO;

  DesignOfferResultController() {
    _streamController.stream.listen((event) {
      _personSignDTO = event;
    });
  }

  bool buildModel(DesignPresalePojo designPresalePojo) {
    designOfferResultVM = _buildFrom(designPresalePojo);
    return designOfferResultVM != null;
  }

  void onComments(String value) {
    if (designOfferResultVM != null) {
      designOfferResultVM!.notes = value;
    }
  }

  void onAvance(String value) {
    int? result = int.tryParse(value);
    if (result != null) {
      if (designOfferResultVM != null) {
        designOfferResultVM!.avance = result;
      }
    }else{
      designOfferResultVM!.avance = 0;
    }
    _check();
  }

  void _check(){
    if(_personSignDTO != null && designOfferResultVM!.avance != 0){
      isCorrect.value = true;
    }
  }

  DesignOfferResultVM? _buildFrom(DesignPresalePojo designPresalePojo) {
    DivisionsMarginTableWithTypePojo? divisionResult =
        designPresalePojo.divisions;
    if (divisionResult != null) {
      final List<DesignOfferResultRowVM> divisionRows = divisionResult.rows
          .map(
            (e) => DesignOfferResultRowVM(
              overPrice: e.overPrice,
              id: e.id,
              divisionName: e.divisionName,
              divisionShortName: e.divisionShortName,
              margin: e.margin,
              client: e.client,
              divisionSummary: e.summaryCostWithMargin,
              divisionSummaryWithTax: e.summaryCostWithTax,
            ),
          )
          .toList();

      double overPrice =
          designPresalePojo.divisions?.rows
              .map((e) => e.overPrice)
              .reduce((value, element) => value + element) ??
          0.0;

      double marginCost =
          designPresalePojo.divisions?.rows
              .map((e) => e.margin)
              .reduce((value, element) => value + element) ??
          0.0;

      double clientCost =
          designPresalePojo.divisions?.rows
              .map((e) => e.client)
              .reduce((value, element) => value + element) ??
          0.0;

      double summary =
          designPresalePojo.divisions?.rows
              .map((e) => e.summaryCostWithMargin)
              .reduce((value, element) => value + element) ??
          0.0;

      double summaryWithTax =
          designPresalePojo.divisions?.rows
              .map((e) => e.summaryCostWithTax)
              .reduce((value, element) => value + element) ??
          0.0;
      summary = double.parse(summaryWithTax.toStringAsFixed(0));
      double tax = (summaryWithTax - summaryWithTax * RussianTax).abs();

      return DesignOfferResultVM(
        summaryWithTax: summaryWithTax,
        divisionType: designPresalePojo.inputDataDesign.divisionType.text,
        createdDesignOffer: designPresalePojo.inputDataDesign.created!
            .toLocal()
            .toString()
            .split(' ')[0],
        objectName: designPresalePojo.inputDataDesign.objectData.name,
        objectLocation: designPresalePojo.inputDataDesign.objectData.address,
        divisionRows: divisionRows,
        summary: summary,
        totalDays: designPresalePojo.inputDataDesign.objectData.deadlineValue,
        client: clientCost,
        margin: marginCost,
        tax: tax,
        overPrice: overPrice,
        objectSquare: designPresalePojo.inputDataDesign.objectData.square,
      );
    }
    return null;
  }
}
