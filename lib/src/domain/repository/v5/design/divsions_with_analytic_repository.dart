import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:presale/src/data/v3/design_calculator.dart';
import 'package:presale/src/di/di.dart';

class DivisionsWithAnalyticRepository {
  final DesignPresaleDTO? _designPresaleDTO;

  DivisionsWithAnalyticRepository(DependencyInjector di)
    : _designPresaleDTO = di.inMemoryImpl.designPresaleDTO;

  List<DivisionResourceDTO> get divisionResources =>
      _designPresaleDTO?.divisionResources.values.toList() ?? [];

  InputFactorsDTO? get inputFactorsDTO =>
      _designPresaleDTO?.inputDataDesignDTO?.inputFactors;

  List<DivisionsWithAnalyticDTO> getDivisionsWithAnalytic() {
    Map<String, List<DivisionResourceDTO>> map = {};
    for (var element in divisionResources) {
      map.putIfAbsent(element.divisionShortName, () {
        return [];
      });
      map[element.divisionShortName]?.add(element);
    }

    if (inputFactorsDTO != null) {
      final divisionsWithAnalyticBuilders = map.values.map((e) {
        double total = e
            .map((e) => e.totalResourceRowCost)
            .reduce((value, element) => value + element);
        DivisionResourceDTO dto = e.first;
        double result = calcHumaHoursCost(total, inputFactorsDTO!);
        DivisionsWithAnalyticDTOBuilder builder =
            DivisionsWithAnalyticDTOBuilder(
              id: dto.id,
              shifr: dto.divisionShortName,
              section: dto.divisionName,
            );
        builder.setHumanHours(result);
        return builder;
      }).toList();

      for (var value1 in divisionsWithAnalyticBuilders) {
        value1.setLocalAnalytic(0.0);
        value1.setOutsideAnalytic(0.0);
      }

      final olds = _designPresaleDTO!.divisionWithAnalytic;

      if (olds.isEmpty) {
        for (var value1 in divisionsWithAnalyticBuilders) {
          value1.setResult(0.0);
        }
      } else {
        for (var element in divisionsWithAnalyticBuilders) {
          DivisionsWithAnalyticDTO? old = olds[element.id];
          if (old != null) {
            element.setResult(old.result);
          }
        }
      }

      return divisionsWithAnalyticBuilders.map((e) => e.build()).toList();
    }
    return [];
  }

  void updateDivisionWithAnalytic(int id, double value) {
    var res = _designPresaleDTO!.divisionWithAnalytic[id];
    if (res != null) {
      res = res.copyWith(result: value);
      _designPresaleDTO!.divisionWithAnalytic[id] = res;
    }
  }
}
