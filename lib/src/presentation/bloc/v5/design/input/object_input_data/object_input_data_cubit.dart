import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/models/v5/common/offer_counter/dto/offer_day_counter_dto.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/pojo_extension.dart';
import 'package:presale/src/presentation/bloc/core/core/cubit_state_enum.dart';
import 'package:presale/src/domain/repository/v5/design/input_data_repository.dart';

part 'object_input_data_state.dart';

part 'object_input_data_cubit.freezed.dart';

class ObjectDataCubit extends Cubit<ObjectInputDataState> {
  final ValueNotifier<bool> isValid = ValueNotifier(false);
  final ValueNotifier<OfferDayCounterDTO?> counterDtoVN = ValueNotifier(null);
  final ObjectRepository _objectRepository;
  InputDataViewModel? inputDataDesign;

  Future<OfferDayCounterDTO?> get counterFuture =>
      _objectRepository.dayCounterFuture;

  ObjectDataCubit(DependencyInjector di)
    : _objectRepository = ObjectRepository(di),
      super(ObjectInputDataState()) {
    _init();
  }

  void _init() async {
    _objectRepository.validStream.listen((event) {
      isValid.value = event;
    });
    if (_objectRepository.inputDataDesign != null) {
      inputDataDesign = _objectRepository.inputDataDesign!.toVM();
    }
    emit(ObjectInputDataState(stateEnum: StateEnum.showing));
  }

  void setCounter(OfferDayCounterDTO counter) async {
    _objectRepository.counterDto = counter;
  }

  void setObjectCustomer(String name) {
    _objectRepository.setObjectCustomer(name);
  }

  void setObjectName(String name) {
    _objectRepository.setObjectName(name);
  }

  void setObjectLocation(String address) {
    _objectRepository.setObjectLocation(address);
  }

  void setResultDesignDocumentations(String result) {
    _objectRepository.setResultDesignDocumentations(result);
  }

  void setResultTypeObject(String result) {
    _objectRepository.setResultTypeObject(result);
  }

  void setSquare(String value) {
    _objectRepository.setSquare(value);
  }

  void setDeadline(String value) {
    _objectRepository.setDeadline(value);
  }

  void setCustomerFactor(String value) {
    _objectRepository.setCustomerFactor(value);
  }

  void setMarginFactor(String value) {
    _objectRepository.setMarginFactor(value);
  }

  void setOverPriceFactor(String value) {
    _objectRepository.setOverPriceFactor(value);
  }

  void updateCashed() {
    _objectRepository.save();
  }

  void clearCached() {
    _objectRepository.clearCashed();
  }
}

class InputDataViewModel {
  final String name;
  final String customer;
  final String address;
  final String docType;
  final String objectType;
  final int square;
  final int deadline;
  final double overPriceFactor;
  final double marginFactor;
  final double clientFactor;

  const InputDataViewModel({
    required this.name,
    required this.customer,
    required this.address,
    required this.docType,
    required this.objectType,
    this.square = 0,
    this.deadline = 0,
    this.overPriceFactor = 1.2,
    this.marginFactor = 1.3,
    this.clientFactor = 1.0,
  });
}
