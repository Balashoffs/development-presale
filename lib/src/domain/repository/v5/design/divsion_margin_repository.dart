import 'package:collection/collection.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/extension.dart';
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

  void fill(List<DivisionsMarginDTO> divisions) {
    for (var element in divisions) {
      _designPresaleDTO?.divisionMargins.putIfAbsent(element.id, () => element);
    }
  }

  void update(DivisionsMarginDTO updated) {
    _designPresaleDTO?.divisionMargins.update(updated.id, (value) => updated);
  }

  List<DivisionsMarginDTO> getDivisionMargins() {
    _designPresaleDTO?.divisionMargins.clear();
    return _fillDivisionMargins();
  }

  List<DivisionsMarginDTO> _fillDivisionMargins() {
    Map<String, List<DivisionResourceDTO>> map = {};
    for (var element in divisionResources) {
      map.putIfAbsent(element.divisionShortName, () {
        return [];
      });
      map[element.divisionShortName]?.add(element);
    }
    if (inputFactorsDTO != null) {
      DesignOfferCalculator calculator = DesignOfferCalculator();
      final margins = map.values.map((e) {
        double total = e
            .map((e) => e.totalResourceRowCost)
            .reduce((value, element) => value + element);
        DivisionResourceDTO dto = e.first;
        DivisionsMarginDTO margin = calculator.calcDivisionMarginDTOCost(
          dto.toMargin(inputFactorsDTO!, total),
        );
        return margin;
      }).toList();

      for (var element in margins) {
        _designPresaleDTO?.divisionMargins.putIfAbsent(
          element.id,
          () => element,
        );
      }

      return margins;
    }

    return [];
  }
}
