import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presale/src/data/core/db_client.dart';
import 'package:presale/src/data/data_sources/v3/input_result_design_source.dart';
import 'package:presale/src/domain/models/v2/constructing/model/input/input_repository.dart';
import 'package:presale/src/domain/models/v3/design/division_type/division_type.dart';
import 'package:presale/src/domain/models/v3/design/input_data/input_data_design.dart';
import 'package:presale/src/domain/models/v3/design/input_data/object_data_design.dart';
import 'package:presale/src/domain/models/v3/design/input_factors/input_factors_pojo.dart';
import 'package:presale/src/domain/models/v4/design/design_presale_pojo.dart';
import 'package:presale/src/presentation/bloc/v5/design/input/object_input_data/object_data_viewmodel.dart';

part 'object_input_data_state.dart';

part 'object_input_data_cubit.freezed.dart';

class ObjectDataCubit extends Cubit<ObjectInputDataState> {
  final InputFactorsRepository _inputFactorRepository;
  late final InputFactorsViewModel? _inputFactors;

  final InputDataBuilder _objectDataBuilder;

  InputDataBuilder get objectDataBuilder => _objectDataBuilder;

  final DesignPresaleDataSourceLocal _dataSourceLocal;

  bool isPercents = false;

  double _percentConvertor(double inputValue) {
    if (isPercents) {
      return double.parse((inputValue / 100).toStringAsFixed(2));
    }
    return inputValue;
  }

  void init() async {
    emit(ObjectInputDataState.enterInputData());    // _inputFactorRepository.readFactors().then((value) {
    //   _inputFactors = value;
    //   if (_inputFactors != null) {
    //
    //   }
    // }, onError: (error) => ObjectInputDataState.errorMessage(""));
  }

  ObjectDataCubit(DBClient dbClient)
    : _dataSourceLocal = DesignPresaleDataSourceLocal(dbClient),
      _objectDataBuilder = InputDataBuilder(),
      _inputFactorRepository = InputFactorsRepository(),
      super(ObjectInputDataState.initial());

  //Данные объекте
  void setObjectName(String name) {
    if (name.isEmpty) return;
    _objectDataBuilder.setObjectName(name);
  }

  void setObjectLocation(String address) {
    if (address.isEmpty) return;
    _objectDataBuilder.setObjectAddress(address);
  }

  void setResultDesignDocumentations(String result) {
    _objectDataBuilder.setDivisionType(result);
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

  //Закончили вводить данные об объекте

  void setHeightFactor(String value) {
    double? result = _inputFactors!.factorSelectedItem(
      InputFactorType.b.value,
      value,
    );
    if (result != null) {
      result = _percentConvertor(result);
      _objectDataBuilder.setHeightFactor(result);
    }
  }

  void setLocationFactor(String value) {
    double? result = _inputFactors!.factorSelectedItem(
      InputFactorType.c.value,
      value,
    );
    if (result != null) {
      result = _percentConvertor(result);
      _objectDataBuilder.setRemotingFactor(result);
    }
  }

  void setSquareFactor(String value) {
    double? result = _inputFactors!.factorSelectedItem(
      InputFactorType.d.value,
      value,
    );
    if (result != null) {
      result = _percentConvertor(result);
      _objectDataBuilder.setSquareFactor(result);
    }
  }

  void setSpeedFactor(String value) {
    double? result = double.tryParse(value);
    if (result != null) {
      result = _percentConvertor(result);
      _objectDataBuilder.setSpeedFactor(result);
    }
  }

  void setComplexityFactor(Set<String> selected) {
    double? result = 1.0;
    if (selected.isNotEmpty) {
      result = _inputFactors!.complexity
          .where((element) => selected.contains(element.value))
          .map((e) => e.factor)
          .reduce((value, element) => value * element);
    }
    result = double.parse(_percentConvertor(result).toStringAsFixed(2));
    _objectDataBuilder.setComplexityFactor(result);
  }

  Future<void> nextPage() async {
    try {
      InputDataMV inputDataMv = _objectDataBuilder.build();
      ObjectDataDesign objectDataData = inputDataMv.toObject();
      InputFactorsPojo inputFactorsPojo = inputDataMv.toFactors();
      InputDataDesign inputDataDesign = InputDataDesign(
        created: DateTime.now(),
        objectData: objectDataData,
        inputFactors: inputFactorsPojo,
        divisionType: DivisionType.fromText(inputDataMv.divisionType),
      );
      DesignPresalePojo designPresalePojo = DesignPresalePojo(
        inputDataDesign: inputDataDesign,
      );

      bool isSaves = await _dataSourceLocal.add(designPresalePojo);
      if (isSaves) {
        emit(ObjectInputDataState.nextPage());
      }
    } catch (_) {}
  }
}
