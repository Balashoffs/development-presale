import 'package:presale/src/domain/models/v2/constructing/model/input/construction_state/factors.dart';
import 'package:presale/src/domain/models/v2/constructing/model/input/input_result.dart';

class PresaleCalculator {
  void init() async {
  }
}

class Calculator {
  final InputResult _inputResult;
  final Map<String, double> costByStageSection = {};

  Calculator({
    required InputResult inputResult,
  }) : _inputResult = inputResult;

  Map<String, double> getCost(List<BaseFactor> inputFactors) {
    Map<String, double> calculated = {};
    if (costByStageSection.isEmpty) {
      for (var value in inputFactors) {
        double result = costByStageSection.putIfAbsent(
          value.chapterName,
          () => value.proportion * _inputResult.totalPlannedCost,
        );
        calculated.putIfAbsent(
          value.chapterName,
          () => result,
        );
      }
    } else {
      for (var value in inputFactors) {
        String key = '${value.parentId}/${value.chapterName}';
        if (costByStageSection.containsKey(key)) {
          calculated[key] = costByStageSection[key]!;
        } else {
          double result =
              costByStageSection[value.parentId] ?? 0.0 * value.proportion;

          costByStageSection.putIfAbsent(
            key,
            () => result,
          );
          if (result.compareTo(0.0) != 0) {
            calculated.putIfAbsent(
              value.chapterName,
              () => result,
            );
          }
        }
      }
    }
    return calculated;
  }
}
