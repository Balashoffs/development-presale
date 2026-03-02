import 'package:presale/src/data/v3/design_calculator.dart' show calcDivisionMarginDTOCost;
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:presale/src/data/data_sources/v5/design_offer_memory_source.dart';
import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/divisions_with_resources_dto.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/pojo_extension.dart';
import 'package:presale/src/utils/dart_define/model/design_class/design_class.dart';

class DivisionRepository {
  final DesignOfferMemorySource _memorySource;

  final DesignClass _designClass;

  DivisionRepository(DependencyInjector di)
    : _memorySource = di.inMemoryImpl,
      _designClass = di.dartDefineModel.design;

  Future<Map<String, DivisionDTO>> load() async {
    return await ResourcesDTO.build(
      _memorySource.inputDataDesignDTO!.divisionType,
      _designClass,
    );
  }

  List<DivisionResourceDTO> get cashedResources =>
      _memorySource.divisionResources;

  bool get isAllResources => _memorySource.isAll;

  set isAllResources(bool value) {
    _memorySource.isAll = value;
  }

  void addDivisionResourceDto(DivisionResourceDTO dto) {
    _memorySource.addDivisionResource(dto);
  }

  void removeDivisionResourceDto(DivisionResourceDTO dto) {
    _memorySource.removeDivisionResource(dto);
  }

  void updateDivisionResourceDto(DivisionResourceDTO dto) {
    _memorySource.updateDivisionResource(dto);
  }

  void updateResourceDivision(List<DivisionResourceDTO> rows) {
    _memorySource.clearResource();
    if (rows.isNotEmpty) {
      for (var element in rows) {
        _memorySource.updateDivisionResource(element);
      }
    }
  }

  void calculateResourceMargin() {
    Map<String, List<DivisionResourceDTO>> map = {};
    for (var element in cashedResources) {
      map.putIfAbsent(element.divisionShortName, () {
        return [];
      });
      map[element.divisionShortName]?.add(element);
    }
    _memorySource.designPresaleDTO?.divisionResourceMargins.clear();
    var inputFactors = _memorySource.inputDataDesignDTO?.inputFactors;
    if (inputFactors != null) {
      final margins = map.values.map((e) {
        double total = e
            .map((e) => e.totalResourceRowCost)
            .reduce((value, element) => value + element);
        DivisionResourceDTO dto = e.first;
        DivisionsMarginDTO margin = calcDivisionMarginDTOCost(
          inputFactors,
          dto.toMargin(total),
        );
        return margin;
      }).toList();
      for (var margin in margins) {
        _memorySource.addDivisionResourceWithMargin(margin);
      }
    }
  }
}
