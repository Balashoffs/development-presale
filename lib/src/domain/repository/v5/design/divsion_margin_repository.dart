import 'package:presale/src/data/data_sources/v3/memory_cashed/design_offer_dto.dart';
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
}
