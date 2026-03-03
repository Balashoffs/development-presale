import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:presale/src/data/v3/design_calculator.dart';
import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/models/v7/design/local_analytic/local_analytic_dto.dart';
import 'package:presale/src/utils/dart_define/model/dart_define_model.dart';
import 'package:presale/src/utils/dart_define/model/design_class/design_class.dart';

class DivisionsWithAnalyticRepository {
  final DesignPresaleDTO? _designPresaleDTO;

  DesignPresaleDTO? get designPresaleDTO => _designPresaleDTO;
  final DartDefineModel _dartDefineModel;
  DartDefineModel get dartDefineModel => _dartDefineModel;

  DivisionsWithAnalyticRepository(DependencyInjector di)
    : _designPresaleDTO = di.inMemoryImpl.designPresaleDTO,
        _dartDefineModel = di.dartDefineModel;

  List<DivisionResourceDTO> get divisionResources =>
      _designPresaleDTO?.divisionResources.values.toList() ?? [];

  List<DivisionsWithAnalyticDTO> get divisionWithAnalytic =>
      _designPresaleDTO?.divisionWithAnalytic.values.toList() ?? [];

  InputFactorsDTO? get inputFactorsDTO =>
      _designPresaleDTO?.inputDataDesignDTO?.inputFactors;

  Future<List<DivisionsWithAnalyticDTO>> getDivisionsWithAnalytic() async {
    Map<String, LocalAnalyticDTO> analytics = await _findAtLocalAnalytics(
      _designPresaleDTO!,
      _dartDefineModel.design,
    );

    Map<int, List<DivisionResourceDTO>> founds = {};

    for (var element in divisionResources) {
      founds.putIfAbsent(element.divisionShortName.hashCode, () => []);
      founds[element.divisionShortName.hashCode]!.add(element);
    }

    List<DivisionsWithAnalyticDTO> newList = [];

    for (var elements in founds.values) {
      var firstElement = elements.first;
      DivisionsWithAnalyticDTOBuilder builder = DivisionsWithAnalyticDTOBuilder(
        id: firstElement.divisionShortName.hashCode,
        shifr: firstElement.divisionShortName,
        section: firstElement.divisionName,
      );

      double sum = elements
          .map((e) => e.totalResourceRowCost)
          .reduce((value, element) => value + element);
      //Calc human-hours cost for division
      sum = calcHumaHoursCost(
        sum,
        _designPresaleDTO.inputDataDesignDTO!.inputFactors,
      );
      builder.setHumanHours(sum);

      //Calc local analytic cost for division
      double median =
          analytics[firstElement.divisionShortName]?.median ??
          0.0 * _designPresaleDTO.inputDataDesignDTO!.objectData.square;
      builder.setLocalAnalytic(median);

      //Calc external analytic cost for division
      builder.setOutsideAnalytic(0.0);
      if (_designPresaleDTO.divisionWithAnalytic.containsKey(
        firstElement.divisionShortName.hashCode,
      )) {
        var analytic = _designPresaleDTO
            .divisionWithAnalytic[firstElement.divisionShortName.hashCode];
        if (analytic?.humanHours.compareTo(sum) == 0) {
          builder.setResult(analytic!.result);
          builder.setManualAnalytic(analytic.manualAnalytic);
        } else {
          builder.setResult(0.0);
          builder.setManualAnalytic(0.0);
        }
      } else {
        builder.setResult(0.0);
        builder.setManualAnalytic(0.0);
      }

      DivisionsWithAnalyticDTO built = builder.build();
      newList.add(built);
    }

    return newList;
  }

  Future<Map<String, LocalAnalyticDTO>> _findAtLocalAnalytics(
    DesignPresaleDTO designPresale,
    DesignClass dc,
  ) async {
    List<LocalAnalyticDTO> analytics = await LocalAnalyticsDTO.build(dc);
    Set<String> shifrs = designPresale.divisionResources.values
        .map((e) => e.divisionShortName.toLowerCase())
        .toSet();
    Map<String, LocalAnalyticDTO> foundAnalytics = {};
    List<LocalAnalyticDTO> filtered = analytics
        .where(
          (element) =>
              element.stage ==
              designPresale.inputDataDesignDTO!.divisionType.shortText,
        )
        .where(
          (element) =>
              element.function ==
              designPresale.inputDataDesignDTO!.objectType.text,
        )
        .where(
          (element) => shifrs
              .where((v) => v.contains(element.shifr.toLowerCase()))
              .isNotEmpty,
        )
        .toList();

    for (var value in filtered) {
      foundAnalytics.putIfAbsent(value.shifr, () => value);
    }

    return foundAnalytics;
  }

  double updateDivisionWithAnalytic(int id, double value) {
    double result = calcHumaHoursCost(value, inputFactorsDTO!);
    var res = _designPresaleDTO!.divisionWithAnalytic[id];
    if (res != null) {
      res = res.copyWith(manualAnalytic: value, result: result);
      _designPresaleDTO.divisionWithAnalytic[id] = res;
    }

    return result;
  }

  void save(List<DivisionsWithAnalyticDTO> updated) {
    _designPresaleDTO!.divisionWithAnalytic.clear();
    for (var value in updated) {
      _designPresaleDTO.divisionWithAnalytic.putIfAbsent(value.id, () => value);
    }
  }

  void calculateAnalyticMargin() {
    _designPresaleDTO?.divisionAnalyticMargins.clear();
    List<DivisionsMarginDTO>? divisionMargins = _designPresaleDTO
        ?.divisionWithAnalytic
        .values
        .map(
          (e) => DivisionsMarginDTO(
            id: e.id,
            divisionName: e.section,
            divisionShortName: e.shifr,
            divisionDescription: e.section,
            resourceDivisionSummaryCost: e.manualAnalytic,
          ),
        )
        .map((e) {
          return calcDivisionMarginDTOCost(inputFactorsDTO!, e);
        })
        .toList();

    if (divisionMargins != null) {
      for (var value in divisionMargins) {
        _designPresaleDTO?.divisionAnalyticMargins.putIfAbsent(
          value.id,
          () => value,
        );
      }
    }
  }
}
