import 'package:presale/src/data/data_sources/v3/memory_cashed/design_offer_dto.dart';
import 'package:presale/src/domain/models/v5/common/offer_counter/dto/offer_day_counter_dto.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_row_viewmodel.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';

class DesignOfferResultController {
  late final DesignOfferResultVM? _designOfferResultVM;
  DesignOfferResultVM? get designOfferResultVM => _designOfferResultVM;

  void initController(
    InputDataDesignDTO inputData,
    List<DivisionsMarginDTO> divisions,
  ) {
    final List<DesignOfferResultRowVM> divisionRows = divisions
        .map(
          (e) => DesignOfferResultRowVM(
            id: e.id,
            overPrice: e.overPriceValue,
            divisionName: e.divisionName,
            divisionShortName: e.divisionShortName,
            margin: e.marginValue,
            client: e.clientValue,
            divisionSummary: e.summaryCostWithMargin,
            divisionSummaryWithTax: e.summaryCostWithTax,
          ),
        )
        .toList();

    double overPrice = divisions
        .map((e) => e.overPriceValue)
        .reduce((value, element) => value + element);

    double marginCost = divisions
        .map((e) => e.marginValue)
        .reduce((value, element) => value + element);

    double clientCost = divisions
        .map((e) => e.clientValue)
        .reduce((value, element) => value + element);

    double summary = divisions
        .map((e) => e.summaryCostWithMargin)
        .reduce((value, element) => value + element);

    double summaryWithTax = divisions
        .map((e) => e.summaryCostWithTax)
        .reduce((value, element) => value + element);

    double summaryTax = divisions
        .map((e) => e.taxValue)
        .reduce((value, element) => value + element);

    summary = double.parse(summary.toStringAsFixed(0));
    OfferDayCounterDto counter = inputData.dayCounter;
    _designOfferResultVM = DesignOfferResultVM(
      id: counter.getOfferUniqueNumber(),
      divisionType: inputData.divisionType.text,
      createdDate: counter.localDate,
      objectName: inputData.objectData.name,
      objectLocation: inputData.objectData.address,
      divisionRows: divisionRows,
      overPrice: overPrice,
      margin: marginCost,
      client: clientCost,
      summary: summary,
      summaryWithTax: summaryWithTax,
      tax: summaryTax,
    );
  }

  DesignOfferResultVM? onComments(String value) {
    if (_designOfferResultVM != null) {
      _designOfferResultVM!.notes = value;
    }
    return _designOfferResultVM;
  }

  DesignOfferResultVM? onAvance(String value) {
    int? result = int.tryParse(value);
    if (result != null) {
      if (_designOfferResultVM != null) {
        _designOfferResultVM!.avance =
            _designOfferResultVM!.summary * result / 100;
      }
    } else {
      _designOfferResultVM!.avance = 0;
    }
    return _designOfferResultVM;
  }
}
