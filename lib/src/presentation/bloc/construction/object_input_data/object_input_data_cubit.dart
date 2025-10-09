import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presale/src/data/clients/v1/input_result_client.dart';
import 'package:presale/src/data/core/db_client.dart';
import 'package:presale/src/data/data_sources/v1/input_result_data_source.dart';
import 'package:presale/src/domain/models/v2/constructing/model/input/input_repository.dart';
import 'package:presale/src/domain/models/v2/constructing/model/input/input_result.dart';
import 'package:presale/src/presentation/bloc/construction/provider/input_factors_value_notifier.dart';

part 'object_input_data_state.dart';

class ObjectDataCubit extends Cubit<ObjectDataState> {
  final InputFactorsRepository _inputDataRepository;
  InputResult _inputResult;
  late final InputFactorsViewModel? _inputFactorsViewModel;
  final InputDataCalculator _inputDataCalculator;

  final InputFactorsValueNotifier _inputFactorsValueNotifier;
  final InputResultClient _inputResultClient;

  ObjectDataCubit({
    required String resultId,
    required InputFactorsValueNotifier notifier,
    required DBClient dbClient,
  })  : _inputDataRepository = InputFactorsRepository(),
        _inputResult = InputResult(id: resultId),
        _inputDataCalculator = InputDataCalculator(),
        _inputFactorsValueNotifier = notifier,
        _inputResultClient =
            InputResultClientImpl(InputResultDataSourceLocal(dbClient)),
        super(InitialState()) {
    _init();
  }

  void _init() async {
    _inputDataRepository.readFactors().then(
      (value) {
        _inputFactorsViewModel = value;
        emit(LoadedState(model: value));
      },
      onError: (error) => ErrorState(errorText: ""),
    );
  }

  void setObjectName(String name) {
    _inputResult = _inputResult.copyWith(objectName: name);
  }

  void updateTotalSquare(String value) {
    if (value.isEmpty) {
      _inputFactorsValueNotifier.updateTotalSquare();
      return;
    }
    double? result = double.tryParse(value);
    if (result != null) {
      double doubleRes = _inputFactorsViewModel!.estateByType
          .calcSquareCostPerMeterByIndex();
      _inputFactorsValueNotifier.updateCostPerMeter(doubleRes);
      _inputResult = _inputResult.copyWith(
          averageMeterPerSquare: doubleRes);

      _inputFactorsValueNotifier.updateTotalSquare(result);
      _inputResult = _inputResult.copyWith(plannedSquare: result);
    }
  }

  void updateHeight(String value) {
    double result = _factor(InputFactorType.b, value);
    _inputFactorsValueNotifier.updateHeight(result);
    _inputDataCalculator.addFactor(InputFactorType.b.value, result);
  }

  void updateRegion(String value) {
    double result = _factor(InputFactorType.c, value);
    _inputFactorsValueNotifier.updateRegion(result);
    _inputDataCalculator.addFactor(InputFactorType.c.value, result);
  }

  void updateSquare(String value) {
    double result = _factor(InputFactorType.d, value);
    _inputFactorsValueNotifier.updateSquare(result);
    _inputDataCalculator.addFactor(InputFactorType.d.value, result);
  }

  void updateHardFactor(Set<String> selected) {
    if (_inputFactorsViewModel == null) {
      return;
    }
    double result = 1.0;
    if (selected.isNotEmpty) {
      result = _inputFactorsViewModel.complexity
          .where(
            (element) => selected.contains(element.value),
          )
          .map(
            (e) => e.factor,
          )
          .reduce(
            (value, element) => value * element,
          );
    }
    _inputFactorsValueNotifier.updateHardFactor(result);
    _inputDataCalculator.addFactor(InputFactorType.e.value, result);
  }

  void setAverageMeterCostPerSquare(double cost) {
    _inputResult = _inputResult.copyWith(averageMeterPerSquare: cost);
  }

  void updateByType(String result) {
    if (_inputFactorsViewModel == null) {
      return;
    } else {
      int x = _inputFactorsViewModel.estateByType.byTypes.indexWhere(
        (element) => element == result,
      );
      _inputDataCalculator.x = x;
      double doubleRes = _inputFactorsViewModel.estateByType
          .calcSquareCostPerMeterByIndex(x, _inputDataCalculator.y);
      _inputFactorsValueNotifier.updateCostPerMeter(doubleRes);
    }
  }

  void updateByCost(String result) {
    if (_inputFactorsViewModel == null) {
      return;
    } else {
      int y = _inputFactorsViewModel.estateByType.byCosts.indexWhere(
        (element) => element == result,
      );
      _inputDataCalculator.y = y;
      double doubleRes = _inputFactorsViewModel.estateByType
          .calcSquareCostPerMeterByIndex(_inputDataCalculator.x, y);
      _inputFactorsValueNotifier.updateCostPerMeter(doubleRes);
    }
  }

  void calculatePlannedCost() async {
    if (_inputFactorsViewModel == null) {
      emit(ErrorState(errorText: 'Couldn\'t load input data'));
      return;
    }
    double totalFactor = _inputDataCalculator.totalFactor;
    double costPerMeter = _inputFactorsViewModel.estateByType
        .calcSquareCostPerMeterByIndex(
            _inputDataCalculator.x, _inputDataCalculator.y);
    double totalPlannedCost =
        totalFactor * costPerMeter * _inputResult.plannedSquare;
    totalPlannedCost = totalPlannedCost.roundToDouble();

    _inputResult = _inputResult.copyWith(
      totalPlannedCost: totalPlannedCost,
      totalFactor: totalFactor,
    );

    _inputResultClient.addInputResult(_inputResult).then(
      (value) {
        value.fold((l) => emit(ErrorState(errorText: 'could save')),
            (r) => emit(SavedState(id: _inputResult.id)));
      },
    );
  }

  double _factor(InputFactorType type, String value) =>
      _inputFactorsViewModel!.baseFactors[type.value]!
          .firstWhere(
            (element) => element.value == value,
          )
          .factor;
}
