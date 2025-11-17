import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/pojo_extension.dart';
import 'package:presale/src/domain/repository/v5/design/design_offer_repository.dart';
import 'package:presale/src/domain/service/v5/design/excel_service.dart';
import 'package:presale/src/presentation/bloc/core/core/cubit_state_enum.dart';
import 'package:presale/src/presentation/bloc/v5/person_sign/person_sing_repository.dart';

part 'design_offer_state.dart';

part 'design_offer_cubit.freezed.dart';

class DesignOfferCubit extends Cubit<DesignOfferState> {
  late final DesignOfferResultViewController _designOfferResultVC;
  DesignOfferResultViewController get designOfferResultVC => _designOfferResultVC;
  final PersonSingRepository _personSingRepository;
  final DesignOfferRepository _designOfferRepository;
  final ExcelService _excelService;

  final ValueNotifier<bool> _isCorrect = ValueNotifier(false);

  ValueNotifier<bool> get isCorrect => _isCorrect;

  DesignOfferCubit({
    required DependencyInjector di,
    required PersonSingRepository personRepository,
  }) : _designOfferRepository = DesignOfferRepository(di.inMemoryImpl),
       _excelService = ExcelService(),
       _personSingRepository = personRepository,
       super(const DesignOfferState()) {
    _init();
  }

  void _init() async {
    if (_designOfferRepository.commercialOffer != null) {
      CommercialOfferDTO co = _designOfferRepository.commercialOffer!;
      _designOfferResultVC = co.toViewModel();
    }

    _personSingRepository.personStream.listen((event) {
      _isCorrect.value = event != null && event.id != 0;
      if (event != null) {
        _designOfferRepository.updatePersonSign(event);
      }
    });

    emit(DesignOfferState(stateEnum: StateEnum.showing));
  }

  void onNotesChange(String value) {
    _designOfferRepository.updateNotes(value);
  }

  void onFactorChange(String value) {
    double? percent;
    if (value.isNotEmpty && value != '%') {
      String edited = value.substring(0, value.indexOf('%')).trim();
      percent = double.tryParse(edited);
      if (percent != null) {
        double factor = percent / 100;
        _designOfferRepository.updatePresaleCostFactor(factor);
        _designOfferResultVC.presaleCostVN.value = factor * _designOfferRepository.commercialOffer!.summaryWithTax;
      }
    }
  }

  void saveRawToExcelFile() async {
    final offer = _designOfferRepository.commercialOffer;
    if (offer != null) {
      _excelService.saveToExcel(offer, ExcelSaveType.manager);
    }
  }

  void saveToClearExcelFile() async {
    final offer = _designOfferRepository.commercialOffer;
    if (offer != null) {
      _excelService.saveToExcel(offer, ExcelSaveType.client);
    }
  }
}
