import 'dart:async';
import 'package:presale/src/data/clients/v5/offer_counter_client.dart';
import 'package:presale/src/data/data_sources/v3/memory_cashed/design_offer_dto.dart';
import 'package:presale/src/data/data_sources/v3/memory_cashed/design_offer_memory_source.dart';
import 'package:presale/src/data/data_sources/v5/dient_offer_counter_source.dart';
import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/models/v3/design/division_type/division_type.dart';
import 'package:presale/src/domain/models/v5/common/offer_counter/dto/offer_day_counter_dto.dart';
import 'package:presale/src/presentation/bloc/v5/design/input/object_input_data/object_data_viewmodel.dart';

class ObjectRepository {
  final DesignOfferMemorySource _designOfferMemorySource;
  final InputDataBuilder _objectDataBuilder;
  final OfferCountClientImpl _countClientImpl;
  final StreamController<bool> _validStreamController = StreamController();

  Future<OfferDayCounterDto?> get dayCounterFuture => _countClientImpl
      .initialize()
      .then((value) => value.fold((l) => null, (r) => r));

  late final OfferDayCounterDto counterDto;

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
    _designOfferMemorySource.clearResource();
    _checkNecessaryInputs();
  }

  void setSquare(String value) {
    int? result = int.tryParse(value);
    if (result != null) {
      _objectDataBuilder.setObjectSquare(result);
      _checkNecessaryInputs();
    }
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

  void setCounter(OfferDayCounterDto value) {
    counterDto = value;
  }

  void _checkNecessaryInputs() {
    try {
      _objectDataBuilder.build();
      _validStreamController.sink.add(true);
    } catch (_) {
      _validStreamController.sink.add(false);
    }
  }

  void save() {
    InputDataMV inputDataMv = _objectDataBuilder.build();
    InputDataDesignDTO inputDataDesignDTO = InputDataDesignDTO(
      dayCounter: counterDto,
      objectData: inputDataMv.toDto(),
      inputFactors: inputDataMv.toFactorsDto(),
      divisionType: DivisionType.fromText(inputDataMv.divisionType),
    );
    _designOfferMemorySource.setInputData(inputDataDesignDTO);
  }
}
