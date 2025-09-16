import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presale/src/data/clients/v5/offer_counter_client.dart';
import 'package:presale/src/data/core/db_client.dart';
import 'package:presale/src/data/data_sources/v3/input_result_design_source.dart';
import 'package:presale/src/data/data_sources/v5/dient_offer_counter_source.dart';
import 'package:presale/src/domain/models/v2/constructing/model/input/input_repository.dart';
import 'package:presale/src/domain/models/v3/design/division_type/division_type.dart';
import 'package:presale/src/domain/models/v3/design/input_data/input_data_design.dart';
import 'package:presale/src/domain/models/v3/design/input_data/object_data_design.dart';
import 'package:presale/src/domain/models/v3/design/input_factors/input_factors_pojo.dart';
import 'package:presale/src/domain/models/v4/design/design_presale_pojo.dart';
import 'package:presale/src/domain/models/v5/common/offer_counter/dto/offer_day_counter_dto.dart';
import 'package:presale/src/domain/models/v5/common/offer_counter/extension.dart';
import 'package:presale/src/presentation/bloc/core/core/cubit_state_enum.dart';
import 'package:presale/src/presentation/bloc/v5/design/input/object_input_data/object_data_viewmodel.dart';

part 'object_input_data_state.dart';

part 'object_input_data_cubit.freezed.dart';

class ObjectDataCubit extends Cubit<ObjectInputDataState> {
  late final InputFactorsViewModel? _inputFactors;

  final InputDataBuilder _objectDataBuilder;

  InputDataBuilder get objectDataBuilder => _objectDataBuilder;

  final DesignPresaleDataSourceLocal _dataSourceLocal;
  final OfferCountClientImpl _countClientImpl;

  final ValueNotifier<bool> isValid = ValueNotifier(false);
  final ValueNotifier<OfferDayCounterDto?> counterDtoVN = ValueNotifier(null);

  bool isPercents = false;

  double _percentConvertor(double inputValue) {
    if (isPercents) {
      return double.parse((inputValue / 100).toStringAsFixed(2));
    }
    return inputValue;
  }

  ObjectDataCubit(DBClient dbClient)
    : _dataSourceLocal = DesignPresaleDataSourceLocal(dbClient),
      _countClientImpl = OfferCountClientImpl(
        OfferCounterSourceLocal(dbClient),
      ),
      _objectDataBuilder = InputDataBuilder(),
      super(ObjectInputDataState()) {
    _init();
  }

  void _init() async {
    print('ObjectDataCubit::_init');
    OfferDayCounterDto? counterDto = await _countClientImpl.initialize().then(
          (value) => value.fold((l) => null, (r) => r),
    );
    if (counterDto != null) {
      print(counterDto);
      counterDtoVN.value = counterDto;
      emit(ObjectInputDataState(stateEnum: StateEnum.showing));
    }
  }

  //Данные объекте
  void setObjectName(String name) {
    _objectDataBuilder.setObjectName(name);
    _checkNecessaryInputs();
  }

  void setObjectLocation(String address) {
    _objectDataBuilder.setObjectAddress(address);
    _checkNecessaryInputs();
  }

  void setResultDesignDocumentations(String result) {
    _objectDataBuilder.setDivisionType(result);
    _checkNecessaryInputs();
  }

  void setSquare(String value) {
    value = value.contains(',') ? value.replaceFirst(',', '.') : value;
    int? result = int.tryParse(value);
    if (result != null) {
      _objectDataBuilder.setObjectSquare(result);
    }
  }

  void setDeadline(String value) {
    value = value.contains(',') ? value.replaceFirst(',', '.') : value;
    int? result = int.tryParse(value);
    if (result != null) {
      _objectDataBuilder.setDeadlineValue(result);
    }
  }

  void setCustomerFactor(String value) {
    value = value.contains(',') ? value.replaceFirst(',', '.') : value;
    double? result = double.tryParse(value);
    if (result != null) {
      _objectDataBuilder.setCustomerFactor(result);
    }
  }

  void setMarginFactor(String value) {
    value = value.contains(',') ? value.replaceFirst(',', '.') : value;
    double? result = double.tryParse(value);
    if (result != null) {
      _objectDataBuilder.setMarginFactor(result);
    }
  }

  void setOverPriceFactor(String value) {
    value = value.contains(',') ? value.replaceFirst(',', '.') : value;
    double? result = double.tryParse(value);
    if (result != null) {
      result = _percentConvertor(result);
      _objectDataBuilder.setOverPriceFactor(result);
    }
  }

  void _checkNecessaryInputs() {
    try {
      _objectDataBuilder.build();
      isValid.value = true;
    } catch (_) {
      isValid.value = false;
    }
  }

  // //Закончили вводить данные об объекте
  //
  // void setHeightFactor(String value) {
  //   double? result = _inputFactors!.factorSelectedItem(
  //     InputFactorType.b.value,
  //     value,
  //   );
  //   if (result != null) {
  //     result = _percentConvertor(result);
  //     _objectDataBuilder.setHeightFactor(result);
  //   }
  // }
  //
  // void setLocationFactor(String value) {
  //   double? result = _inputFactors!.factorSelectedItem(
  //     InputFactorType.c.value,
  //     value,
  //   );
  //   if (result != null) {
  //     result = _percentConvertor(result);
  //     _objectDataBuilder.setRemotingFactor(result);
  //   }
  // }
  //
  // void setSquareFactor(String value) {
  //   double? result = _inputFactors!.factorSelectedItem(
  //     InputFactorType.d.value,
  //     value,
  //   );
  //   if (result != null) {
  //     result = _percentConvertor(result);
  //     _objectDataBuilder.setSquareFactor(result);
  //   }
  // }
  //
  // void setSpeedFactor(String value) {
  //   double? result = double.tryParse(value);
  //   if (result != null) {
  //     result = _percentConvertor(result);
  //     _objectDataBuilder.setSpeedFactor(result);
  //   }
  // }
  //
  // void setComplexityFactor(Set<String> selected) {
  //   double? result = 1.0;
  //   if (selected.isNotEmpty) {
  //     result = _inputFactors!.complexity
  //         .where((element) => selected.contains(element.value))
  //         .map((e) => e.factor)
  //         .reduce((value, element) => value * element);
  //   }
  //   result = double.parse(_percentConvertor(result).toStringAsFixed(2));
  //   _objectDataBuilder.setComplexityFactor(result);
  // }
  //

  Future<void> nextPage() async {
    try {
      if (state.stateEnum == StateEnum.nextPage) {
        emit(ObjectInputDataState(stateEnum: StateEnum.showing));
      }
      InputDataMV inputDataMv = _objectDataBuilder.build();
      ObjectDataDesign objectDataData = inputDataMv.toObject();
      InputFactorsPojo inputFactorsPojo = inputDataMv.toFactors();
      InputDataDesign inputDataDesign = InputDataDesign(
        offerCounter: counterDtoVN.value!.toPojo(),
        objectData: objectDataData,
        inputFactors: inputFactorsPojo,
        divisionType: DivisionType.fromText(inputDataMv.divisionType),
      );
      DesignPresalePojo designPresalePojo = DesignPresalePojo(
        inputDataDesign: inputDataDesign,
      );

      bool isSaves = await _dataSourceLocal.add(designPresalePojo);
      if (isSaves) {
        print(state.runtimeType);
        emit(ObjectInputDataState(stateEnum: StateEnum.nextPage));
      }
    } catch (_) {}
  }

  @override
  void onChange(Change<ObjectInputDataState> change) {
    super.onChange(change);
  }
}
