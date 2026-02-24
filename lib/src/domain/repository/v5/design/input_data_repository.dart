import 'dart:async';
import 'package:presale/src/data/clients/v5/offer_counter_client.dart';
import 'package:presale/src/domain/models/v3/design/division_type/object_type.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:presale/src/data/data_sources/v5/design_offer_memory_source.dart';
import 'package:presale/src/data/data_sources/v5/dient_offer_counter_source.dart';
import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/models/v3/design/division_type/division_type.dart';
import 'package:presale/src/domain/models/v5/common/offer_counter/dto/offer_day_counter_dto.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_pojo.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/pojo_extension.dart';
import 'package:presale/src/presentation/bloc/v5/design/input/object_input_data/object_data_viewmodel.dart';

class ObjectRepository {
  final DesignOfferMemorySource _designOfferMemorySource;
  final InputDataBuilder _objectDataBuilder;
  final OfferCountClientImpl _countClientImpl;
  final StreamController<bool> _validStreamController = StreamController();

  InputDataDesignDTO? get inputDataDesign => _designOfferMemorySource.inputDataDesignDTO;

  Future<OfferDayCounterDTO?> get dayCounterFuture => _countClientImpl
      .initialize()
      .then((value) => value.fold((l) => null, (r) => r));

  OfferDayCounterDTO? counterDto;

  Stream<bool> get validStream => _validStreamController.stream;

  ObjectRepository(DependencyInjector di)
    : _objectDataBuilder = InputDataBuilder(),
      _designOfferMemorySource = di.inMemoryImpl,
      _countClientImpl = OfferCountClientImpl(
        OfferCounterSourceLocal(di.dbClientImpl),
      ) {
    _init();
  }

  void _init() {
    _designOfferMemorySource.init();
    if (_designOfferMemorySource.isFilled()) {
      _fill(_designOfferMemorySource.designPresaleDTO!);
      _checkNecessaryInputs();
    }
  }

  //Данные объекте
  void setObjectCustomer(String name) {
    _objectDataBuilder.setObjectCustomer(name);
    _checkNecessaryInputs();
  }

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
    _designOfferMemorySource.clearResource();
    _checkNecessaryInputs();
  }

  void setResultTypeObject(String result) {
    _objectDataBuilder.setObjectType(result);
    _designOfferMemorySource.clearResource();
    _checkNecessaryInputs();
  }

  void setSquare(String value) {
    if(value.isEmpty){
      _objectDataBuilder.setObjectSquare(0);
    }else{
      print(value);
      int? result = int.tryParse(value);
      if (result != null) {
        _objectDataBuilder.setObjectSquare(result);
      }
      else{
        _objectDataBuilder.setObjectSquare(0);
      }
    }

    _checkNecessaryInputs();
  }

  void setDeadline(String value) {
    int? result = int.tryParse(value);
    if (result != null) {
      _objectDataBuilder.setDeadlineValue(result);
      _checkNecessaryInputs();
    }
  }

  void setCustomerFactor(String value) {
    double? result = double.tryParse(value);
    if (result != null) {
      _objectDataBuilder.setCustomerFactor(result);
      _checkNecessaryInputs();
    }
  }

  void setMarginFactor(String value) {
    double? result = double.tryParse(value);
    if (result != null) {
      _objectDataBuilder.setMarginFactor(result);
      _checkNecessaryInputs();
    }
  }

  void setOverPriceFactor(String value) {
    double? result = double.tryParse(value);
    if (result != null) {
      _objectDataBuilder.setOverPriceFactor(result);
      _checkNecessaryInputs();
    }
  }

  void setCounter(OfferDayCounterDTO value) {
    counterDto = value;
  }

  void _checkNecessaryInputs() {
    bool isValid = counterDto != null;
    if (isValid) {
      try {
        _objectDataBuilder.build();
      } catch (_) {
        isValid = false;
      }
      _validStreamController.sink.add(isValid);
    }
  }

  void save() {
    InputDataMV inputDataMv = _objectDataBuilder.build();
    InputDataDesignDTO inputDataDesignDTO = InputDataDesignDTO(
      dayCounter: counterDto!,
      objectData: inputDataMv.toDto(),
      inputFactors: inputDataMv.toFactorsDto(),
      divisionType: DivisionType.fromText(inputDataMv.divisionType),
      objectType: ObjectType.fromText(inputDataMv.objectType),
    );
    _designOfferMemorySource.setInputData(inputDataDesignDTO);
  }

  void clearCashed() {
    _designOfferMemorySource.clearCashed();
  }

  void update(DesignPresalePojo designPresale) {
    _designOfferMemorySource.designPresaleDTO = designPresale.toDto();
  }

  void _fill(DesignPresaleDTO designPresaleDTO) {
    final inputData = designPresaleDTO.inputDataDesignDTO!;
    setObjectName(inputData.objectData.name);
    setObjectLocation(inputData.objectData.address);
    _objectDataBuilder.setDivisionType(inputData.divisionType.text);
    _objectDataBuilder.setObjectSquare(inputData.objectData.square);
    _objectDataBuilder.setDeadlineValue(inputData.objectData.deadline);

    final inputFactors = inputData.inputFactors;
    _objectDataBuilder.setCustomerFactor(inputFactors.customerFactor);
    _objectDataBuilder.setOverPriceFactor(inputFactors.overPriceFactor);
    _objectDataBuilder.setMarginFactor(inputFactors.marginFactor);

    setCounter(designPresaleDTO.inputDataDesignDTO!.dayCounter);
  }
}
