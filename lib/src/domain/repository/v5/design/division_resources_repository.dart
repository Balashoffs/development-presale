import 'package:presale/src/data/data_sources/v3/memory_cashed/design_offer_dto.dart';
import 'package:presale/src/data/data_sources/v3/memory_cashed/design_offer_memory_source.dart';
import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/divisions_with_resources_dto.dart';
import 'package:presale/src/utils/dart_define/model/design_class/design_class.dart';

class DivisionRepository {
  final DesignOfferMemorySource _designOfferMemorySource;

  final DesignClass _designClass;

  DivisionRepository(DependencyInjector di)
    : _designOfferMemorySource = di.inMemoryImpl,
      _designClass = di.dartDefineModel.design;

  Future<Map<String, DivisionDTO>> load() async {
    return await ResourcesDTO.build(
      _designOfferMemorySource.inputDataDesignDTO!.divisionType,
      _designClass,
    );
  }

  List<DivisionResourceDTO> get cashedResources =>
      _designOfferMemorySource.divisionResources;

  bool get isAllResources => _designOfferMemorySource.isAll;

  set isAllResources(bool value) {
    _designOfferMemorySource.isAll = value;
  }

  void addDivisionResourceDto(DivisionResourceDTO dto) {
    _designOfferMemorySource.addDivisionResource(dto);
  }

  void removeDivisionResourceDto(DivisionResourceDTO dto) {
    _designOfferMemorySource.removeDivisionResource(dto);
  }

  void updateDivisionResourceDto(DivisionResourceDTO dto) {
    _designOfferMemorySource.updateDivisionResource(dto);
  }

  void clearResourceDivisions(){
    _designOfferMemorySource.clearResourceDivisions();
  }

  void updateDivisionMargins(List<DivisionResourceDTO> added) {
    final keys =
        _designOfferMemorySource.designPresaleDTO?.divisionResources.keys
            .toSet() ??
        {};
    if (keys.isNotEmpty) {
      final filtered = added
          .where((element) => !keys.contains(element.resourceId))
          .toList();
      if (filtered.isNotEmpty) {
        for (var element in filtered) {
          _designOfferMemorySource
              .designPresaleDTO
              ?.divisionResources
              .putIfAbsent(element.resourceId, () => element);
        }
      }
    }
  }
}
