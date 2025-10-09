import 'package:flutter/cupertino.dart';
import 'package:presale/src/domain/models/v2/constructing/model/calculator/section_info_repository.dart';
import 'package:presale/src/domain/models/v2/constructing/model/input/construction_state/section_data.dart';

class SectionDataNotifier extends ChangeNotifier {
  final List<SectionData> _sectionDataList = [];
  final SectionInfoRepository _sectionInfoRepository;

  Set<String> get ids => _sectionDataList.map( (e) => e.id,).toSet();

  List<SectionData> get sectionData => _sectionDataList;

  SectionDataNotifier({
    required SectionInfoRepository sectionInfoRepository,
  }) : _sectionInfoRepository = sectionInfoRepository;

  void addSectionData(String id, Set<String> forAdding) {
    List<SectionData> added = _sectionInfoRepository.selectOn(id, forAdding);
    _sectionDataList.addAll(added);
    notifyListeners();
  }

  void removeSectionData(List<SectionData> forRemoving) {
    List<SectionData> copy = _sectionDataList.toList();
    Set<String> idForRemoving = forRemoving
        .map(
          (e) => e.id,
        )
        .toSet();
    copy.removeWhere(
      (element) => idForRemoving.contains(element.id),
    );
    _sectionDataList.replaceRange(0, _sectionDataList.length, copy);
    notifyListeners();
  }
}

class ImmutableSectionDataNotifier extends ChangeNotifier {
  final List<SectionData> _sectionDataList;

  Set<String> get ids => _sectionDataList.map( (e) => e.id,).toSet();

  List<SectionData> get sectionData => _sectionDataList;

  ImmutableSectionDataNotifier({
    required List<SectionData> sectionDataList,
  }) : _sectionDataList = sectionDataList;

  void removeSectionData(List<SectionData> forRemoving) {
    List<SectionData> copy = _sectionDataList.toList();
    Set<String> idForRemoving = forRemoving
        .map(
          (e) => e.id,
    )
        .toSet();
    copy.removeWhere(
          (element) => idForRemoving.contains(element.id),
    );
    _sectionDataList.replaceRange(0, _sectionDataList.length, copy);
    notifyListeners();
  }
}
