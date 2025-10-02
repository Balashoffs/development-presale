import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/extension.dart';
import 'package:presale/src/data/data_sources/v3/person_sign_source.dart';
import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/models/v3/design/custom_factors/custom_factors.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';
import 'package:presale/src/domain/repository/v5/design/design_offer_repository.dart';
import 'package:presale/src/domain/service/v5/design/excel_service.dart';
import 'package:presale/src/presentation/bloc/core/core/cubit_state_enum.dart';
import 'package:presale/src/presentation/bloc/v5/design/offer/design_offer_result_controller.dart';
import 'package:presale/src/presentation/bloc/v5/person_sign/person_sing_repository.dart';

part 'design_offer_state.dart';

part 'design_offer_cubit.freezed.dart';

class DesignOfferCubit extends Cubit<DesignOfferState> {
  final DesignOfferResultController _resultController;

  DesignOfferResultController get designOfferController => _resultController;
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
       _resultController = DesignOfferResultController(),
       _personSingRepository = personRepository,
       super(const DesignOfferState()) {
    _init();
  }

  void _init() async {
    if (_designOfferRepository.commercialOffer != null) {
      CommercialOfferDTO co = _designOfferRepository.commercialOffer!;
      _resultController.setViewModel(co.toViewModel());
      _resultController.setAvanveValue(co.summaryWithTax);

    }

    _personSingRepository.personStream.listen((event) {
      _isCorrect.value = event != null && event.id != 0;
      if (event != null) {
        _designOfferRepository.updatePersonSign(event);
      }
    });

    emit(DesignOfferState(stateEnum: StateEnum.showing));
  }

  void onComments(String value) {
    _designOfferRepository.updateNotes(value);
  }

  void onAvance(String value) {
    double factor = 0.0;
    if (value.isNotEmpty && value != '%') {
      String edited = value.substring(0, value.indexOf('%')).trim();
      double? result = double.tryParse(edited);
      if (result != null) {
        factor = result / 100;
      }
    }
    _designOfferRepository.updateAvance(factor);
    _resultController.setAvanveValue(
      _designOfferRepository.commercialOffer!.summaryWithTax,
      factor,
    );
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
