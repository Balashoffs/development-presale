import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/pojo_extension.dart';
import 'package:presale/src/data/v3/design_calculator.dart';
import 'package:presale/src/di/di.dart';

class DivisionsMarginRepository {
  final DesignPresaleDTO? _designPresaleDTO;

  DivisionsMarginRepository(DependencyInjector di)
    : _designPresaleDTO = di.inMemoryImpl.designPresaleDTO;

  List<DivisionResourceDTO> get divisionResources =>
      _designPresaleDTO?.divisionResources.values.toList() ?? [];

  List<DivisionsMarginDTO> get divisionMargins =>
      _designPresaleDTO?.divisionMargins.values.toList() ?? [];

  InputFactorsDTO? get inputFactorsDTO =>
      _designPresaleDTO?.inputDataDesignDTO?.inputFactors;

  void add(DivisionsMarginDTO value) {
    _designPresaleDTO?.divisionMargins.putIfAbsent(value.id, () => value);
  }

  void update(DivisionsMarginDTO updated) {
    _designPresaleDTO?.divisionMargins.update(updated.id, (value) => updated);
  }

  List<DivisionsMarginDTO> getDivisionMargins() {
    Map<String, List<DivisionResourceDTO>> map = {};
    for (var element in divisionResources) {
      map.putIfAbsent(element.divisionShortName, () {
        return [];
      });
      map[element.divisionShortName]?.add(element);
    }

    if (inputFactorsDTO != null) {
      final margins = map.values.map((e) {
        double total = e
            .map((e) => e.totalResourceRowCost)
            .reduce((value, element) => value + element);
        DivisionResourceDTO dto = e.first;
        DivisionsMarginDTO margin = calcDivisionMarginDTOCost(
          dto.toMargin(inputFactorsDTO!, total),
        );
        return margin;
      }).toList();

      final olds = _designPresaleDTO!.divisionMargins;
      List<DivisionsMarginDTO> news = [];

      if (olds.isEmpty) {
        for (var element in margins) {
          news.add(element);
        }
      } else {
        for (var element in margins) {
          DivisionsMarginDTO? old = olds[element.id];
          if (old != null) {
            if (old.resourceDivisionSummaryCost.compareTo(
                  element.resourceDivisionSummaryCost,
                ) !=
                0) {
              old = old.copyWith(
                resourceDivisionSummaryCost:
                    element.resourceDivisionSummaryCost,
              );
            }
            old = calcDivisionMarginDTOCost(old);
            news.add(old);
            continue;
          }

          news.add(element);
        }
      }

      return news;
    }

    return [];
  }

  void updates(List<DivisionsMarginDTO> divisions) {
    _designPresaleDTO!.divisionMargins.clear();
    for (var value in divisions) {
      add(value);
    }
  }
}
