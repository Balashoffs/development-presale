import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presale/src/domain/models/v2/constructing/model/calculator/section_info_repository.dart';
import 'package:presale/src/domain/models/v2/constructing/model/calculator/stage_info_repository.dart';
import 'package:presale/src/domain/models/v2/constructing/model/calculator/stage_section_repository.dart';
import 'package:presale/src/domain/models/v2/constructing/model/input/construction_state/factors.dart';
import 'package:presale/src/domain/models/v2/constructing/model/input/construction_state/section_data.dart';
import 'package:presale/src/domain/models/v2/constructing/model/start_paths.dart';
import 'package:presale/src/presentation/modules/construction/stages_selector/model/stage_info/stage_info.dart';
import 'package:presale/src/presentation/modules/construction/stages_selector/model/stage_view_model/stage_view_model.dart';

part 'stages_selector_cubit.freezed.dart';
part 'stages_selector_state.dart';

class StagesSelectorCubit extends Cubit<StagesSelectorState> {
  final StageSectionRepository _sectionRepository;
  final StageInfoRepository _infoRepository;
  final SectionInfoRepository _sectionInfoRepository;
  int index = 0;
  final String _path;

  StagesSelectorCubit({
    required StageSectionRepository sectionStageRepository,
    required StageInfoRepository infoRepository,
    required SectionInfoRepository sectionInfoRepository,
    String path = buildingPath,
  })  : _sectionRepository = sectionStageRepository,
        _infoRepository = infoRepository,
        _sectionInfoRepository = sectionInfoRepository,
        _path = path,
        super(
        const StagesSelectorState.initial(),
        ){
   _loadFromPath();
  }

  void _loadFromPath() async {
    StageData? stageInfo = _infoRepository.getInfo(_path);
    if (stageInfo != null) {
      List<BaseFactor> subFactors = _sectionRepository.getFactors(_path);
      if (subFactors.isNotEmpty) {
        emit(
          StagesSelectorState.stage(
            StageDataViewModel(
                stageInfo: stageInfo,
                subStages: subFactors
                    .map((e) =>
                _infoRepository.getInfo(
                  e.id,
                )!)
                    .toList()),
          ),
        );
      } else {
        if (!stageInfo.isSection) {
          if (!_sectionRepository.check(_path)) {
            List<BaseFactor> factors = await _sectionRepository.loadStage(
                _path);
            if (factors.isNotEmpty) {
              if (factors.first is StageFactor) {
                _sectionRepository.addFactors(_path, factors);

                List<StageData> subFactors = factors
                    .map(
                        (e) {
                          double parentValue = _infoRepository.getInfo(e.parentId)?.value ?? 0.0;
                      return StageData(
                    parentId: e.parentId,
                    id: e.id,
                    type: 'Стадии',
                    factor: e.proportion,
                    value: (parentValue * e.proportion).roundToDouble(),
                    name: e.chapterName,
                  );
                }
                )
                    .toList();
                _infoRepository.putInfo(subFactors);
                Map<String, String> subInfos = {};
                for (var value in subFactors) {
                  subInfos.putIfAbsent(
                    value.name,
                        () => value.id,
                  );
                }
                emit(
                  StagesSelectorState.stage(
                    StageDataViewModel(
                        stageInfo: stageInfo, subStages: subFactors),
                  ),
                );
              } else if (factors.first is SectionFactor) {
                _sectionRepository.addFactors(_path, factors);
                List<StageData> subFactors = factors
                    .map(
                      (e) {
                        double parentValue = _infoRepository.getInfo(e.parentId)?.value ?? 0.0;
                   return   StageData(
                      parentId: e.parentId,
                      id: e.id,
                      type: 'Секции',
                      factor: e.proportion,
                      value: (parentValue * e.proportion).roundToDouble(),
                      name: e.chapterName,
                      isSection: true,
                    );
                  },
                )
                    .toList();
                _infoRepository.putInfo(subFactors);
                emit(
                  StagesSelectorState.stage(
                    StageDataViewModel(
                        stageInfo: stageInfo, subStages: subFactors),
                  ),
                );
              }
            }
          }
        } else {
          List<SectionData> dats = await _sectionRepository.loadSection(_path);
          _sectionInfoRepository.addData(dats);
          StageData? stageInfo = _infoRepository.getInfo(_path);
          if (stageInfo != null) {
            emit(StagesSelectorState.section(
                SectionDataVewModel(stageInfo: stageInfo, subStages: dats)));
          }
        }
      }
    }

  }
}
