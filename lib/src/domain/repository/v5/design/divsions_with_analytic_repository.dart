import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:presale/src/data/v3/design_calculator.dart';
import 'package:presale/src/di/di.dart';

class DivisionsWithAnalyticRepository {
  final DesignPresaleDTO? _designPresaleDTO;

  DivisionsWithAnalyticRepository(DependencyInjector di)
    : _designPresaleDTO = di.inMemoryImpl.designPresaleDTO;

  List<DivisionResourceDTO> get divisionResources =>
      _designPresaleDTO?.divisionResources.values.toList() ?? [];

  List<DivisionsWithAnalyticDTO> get divisionWithAnalytic =>
      _designPresaleDTO?.divisionWithAnalytic.values.toList() ?? [];

  InputFactorsDTO? get inputFactorsDTO =>
      _designPresaleDTO?.inputDataDesignDTO?.inputFactors;

  List<DivisionsWithAnalyticDTO> getDivisionsWithAnalytic() {
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
        _designPresaleDTO!.inputDataDesignDTO!.inputFactors,
      );
      builder.setHumanHours(sum);

      //Calc local analytic cost for division
      builder.setLocalAnalytic(0.0);

      //Calc external analytic cost for division
      builder.setOutsideAnalytic(0.0);
      if (_designPresaleDTO.divisionWithAnalytic.containsKey(
        firstElement.divisionShortName.hashCode,
      )) {
        var analytic = _designPresaleDTO.divisionWithAnalytic[firstElement.divisionShortName.hashCode];
        if(analytic?.humanHours.compareTo(sum) == 0){
          builder.setResult(analytic!.result );
        }else{
          builder.setResult(0.0);
        }
      }else{
        builder.setResult(0.0);
      }

      DivisionsWithAnalyticDTO built = builder.build();
      newList.add(built);
    }

    return newList;
  }

  void updateDivisionWithAnalytic(int id, double value) {
    var res = _designPresaleDTO!.divisionWithAnalytic[id];
    if (res != null) {
      res = res.copyWith(result: value);
      _designPresaleDTO.divisionWithAnalytic[id] = res;
    }
  }

  void save(List<DivisionsWithAnalyticDTO> updated) {
    _designPresaleDTO!.divisionWithAnalytic.clear();
    for (var value in updated) {
      _designPresaleDTO.divisionWithAnalytic.putIfAbsent(
        value.id,
        () => value,
      );
    }
  }
}
