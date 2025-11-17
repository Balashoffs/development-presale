import 'package:presale/src/data/clients/v1/input_result_client.dart';
import 'package:presale/src/data/core/db_client.dart';
import 'package:presale/src/data/data_sources/v1/input_result_data_source.dart';
import 'package:presale/src/domain/models/v2/constructing/model/start_paths.dart';
import 'package:presale/src/presentation/modules/construction/stages_selector/model/stage_info/stage_info.dart';

class StageInfoRepository {
  final Map<String, StageData> infos = {};
  final String _objectId;
  final InputResultClient _inputResultClient;

  StageInfoRepository({required String objectId, required DBClient dbClient})
      : _objectId = objectId,
        _inputResultClient =
            InputResultClientImpl(InputResultDataSourceLocal(dbClient));

  Future<void> loadInputResult() async {
   return _inputResultClient.getInputResult(_objectId).then(
      (value) {
        value.fold(
          (l) {
            return null;
          },
          (r) {
            StageData rootStageInfo = StageData(
              parentId: buildingPath,
              type: 'Cтадии',
              factor: 1.0,
              value: r.totalPlannedCost,
              name:
                  'Объект: "${r.objectName}", площадь: ${r.plannedSquare} м кв.',
              id: buildingPath,
            );
            infos.putIfAbsent(
              rootStageInfo.id,
              () => rootStageInfo,
            );
            return;
          },
        );
      },
    );
  }

  StageData? getInfo(String path) {
    return infos[path];
  }

  void putInfo(List<StageData> inputs) {
    for (var value in inputs) {
      infos.putIfAbsent(
        value.id,
        () => value,
      );
    }
  }
}
