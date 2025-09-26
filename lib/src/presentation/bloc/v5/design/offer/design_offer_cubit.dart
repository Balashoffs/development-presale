import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presale/src/data/data_sources/v3/memory_cashed/design_offer_dto.dart';
import 'package:presale/src/data/data_sources/v3/person_sign_source.dart';
import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';
import 'package:presale/src/domain/repository/v5/design/design_offer_repository.dart';
import 'package:presale/src/domain/service/v5/design/excel_service.dart';
import 'package:presale/src/presentation/bloc/core/core/cubit_state_enum.dart';
import 'package:presale/src/presentation/bloc/v5/design/offer/design_offer_result_controller.dart';
import 'package:presale/src/presentation/bloc/v5/person_sign/person_sing_repository.dart';

part 'design_offer_state.dart';

part 'design_offer_cubit.freezed.dart';

class DesignOfferCubit extends Cubit<DesignOfferState> {
  final DesignOfferResultController _designOfferController;
  final PersonSingRepository _personSingRepository;
  final DesignOfferRepository _designOfferRepository;
  final ExcelService _excelService;


  DesignOfferResultVM? get designOfferVM => _designOfferController.designOfferResultVM;

  final ValueNotifier<bool> _isCorrect = ValueNotifier(false);

  ValueNotifier<bool> get isCorrect => _isCorrect;

  DesignOfferCubit(DependencyInjector di)
    : _designOfferController = DesignOfferResultController(),
      _personSingRepository = PersonSingRepository(
        PersonSignDataSourceLocal(di.dbClientImpl),
      ),
      _excelService = ExcelService(),
      _designOfferRepository = DesignOfferRepository(di.inMemoryImpl),
      super(const DesignOfferState()) {
    _init();
  }

  void _init() async {
    _personSingRepository.personStream.listen((event) {
      if (event == null || event.id == 0) {
        _isCorrect.value = false;
      } else {
        _isCorrect.value = true;
      }
    });

    final divisions = _designOfferRepository.divisions;
    final inputData = _designOfferRepository.inputData;
    if (inputData != null) {
      _designOfferController.initController(inputData, divisions);
      emit(DesignOfferState(stateEnum: StateEnum.showing));
    }
  }

  void onComments(String value) {
    DesignOfferResultVM? result = _designOfferController.onComments(value);
    if (result != null) {
      _designOfferRepository.updateOffer(result);
    }
  }

  void onAvance(String value) {
    DesignOfferResultVM? result = _designOfferController.onAvance(value);
    if (result != null) {
      _designOfferRepository.updateOffer(result);
    }
  }

  void saveRawToExcelFile() async {
    final offer = _designOfferRepository.commercialOffer;
    if (offer != null) {
      _excelService.saveToExcel(offer, ExcelSaveType.number);
    }
  }

  void saveToClearExcelFile() async {
    final offer = _designOfferRepository.commercialOffer;
    if (offer != null) {
      _excelService.saveToExcel(offer, ExcelSaveType.client);
    }
  }
}
