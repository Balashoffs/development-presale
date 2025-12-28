import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presale/src/data/core/string_converter.dart';

import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/models/v5/common/person_sign/person_sign_dto.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';
import 'package:presale/src/domain/models/v6/company_info/company_info_dto.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/pojo_extension.dart';
import 'package:presale/src/domain/repository/v5/design/design_offer_repository.dart';
import 'package:presale/src/domain/service/v5/design/excel_service.dart';
import 'package:presale/src/domain/service/v5/design/excel_service_v2.dart';
import 'package:presale/src/presentation/bloc/core/core/cubit_state_enum.dart';

part 'design_offer_state.dart';

part 'design_offer_cubit.freezed.dart';

class DesignOfferCubit extends Cubit<DesignOfferState> {
  late final DesignOfferResultViewModel _designOfferViewModel;

  DesignOfferResultViewModel get designOfferViewModel => _designOfferViewModel;
  final Stream<PersonSignDTO> _contactPersonStream;
  final Stream<CompanyInfoDTO> _companyInfoStream;
  final DesignOfferRepository _designOfferRepository;
  final ExcelService _excelService;
  late final NotesService _notesService;
  final ValueNotifier<bool> _isCorrect = ValueNotifier(false);

  ValueNotifier<bool> get isCorrect => _isCorrect;
  bool isPersonSignValid = false;
  bool isCompanyValid = false;

  DesignOfferCubit({
    required DependencyInjector di,
    required Stream<PersonSignDTO> contactPersonStream,
    required Stream<CompanyInfoDTO> companyInfoStream,
  }) : _designOfferRepository = DesignOfferRepository(di.inMemoryImpl),
       _contactPersonStream = contactPersonStream,
       _companyInfoStream = companyInfoStream,
       _excelService = ExcelService(),
       super(const DesignOfferState()) {
    _init();
  }

  void _init() async {
    print('Init DesignOfferCubit');
    if (_designOfferRepository.commercialOffer != null) {
      print('init DesignOfferResultViewModel');
      CommercialOfferDTO co = _designOfferRepository.commercialOffer!;

      _designOfferViewModel = co.toViewModel();
      _notesService = NotesService(notes: co.notes);
    }
    _contactPersonStream.listen((event) {
      isPersonSignValid = event.id != 0;
      if (isPersonSignValid) {
        _designOfferRepository.updatePersonSign(event);
      }
      _check();
    });

    _companyInfoStream.listen((event) {
      isCompanyValid = event.companyName.isNotEmpty;
      if (isCompanyValid) {
        _designOfferRepository.updateCompanyInfo(event);
      }
      _check();
    });

    emit(DesignOfferState(stateEnum: StateEnum.showing));
  }

  void _check() {
    bool isValid = isCompanyValid && isPersonSignValid;
    if (_isCorrect.value != isValid) {
      _isCorrect.value = isValid;
    }
  }

  void onPresaleFactor(String value) {
    double resD = _onParseInput(value);
    _designOfferRepository.updatePresaleFactor(resD);
    resD =
        resD *
        _designOfferRepository.commercialOffer!.resultsTable.fullSummaryWithTax;
    String resS = convertToRubleString(resD, 2);
    _designOfferViewModel.updatePresaleResult(resS);
  }

  void onAfterDayPayFactor(String value) {
    double resD = _onParseInput(value);
    _designOfferRepository.updateAfterDayPayFactor(resD);
    resD =
        resD *
        _designOfferRepository.commercialOffer!.resultsTable.fullSummaryWithTax;
    String resS = convertToRubleString(resD, 2);
    _designOfferViewModel.updateAfterPayResult(resS);
  }

  void onAfterPayDate(String value) {
    _designOfferRepository.updateAfterPayDate(value);
  }

  void onAfterActsSignFactor(String value) {
    double resD = _onParseInput(value);
    _designOfferRepository.updateAfterActsSignFactor(resD);
    resD =
        resD *
        _designOfferRepository.commercialOffer!.resultsTable.fullSummaryWithTax;
    String resS = convertToRubleString(resD, 2);
    _designOfferViewModel.updatePayAfterActsSignResult(resS);
  }

  void onNotesChange(String value) {
    _notesService.addNote(value);
  }

  double _onParseInput(String value) {
    double? percent;
    if (value.isNotEmpty && value != '%') {
      String edited = value.substring(0, value.indexOf('%')).trim();
      percent = double.tryParse(edited);
      if (percent != null) {
        return percent / 100;
      }
    }
    return 0.0;
  }

  void saveExcelFileWithNumbers() async {
    final offer = _designOfferRepository.commercialOffer;
    if (offer != null) {
      _excelService.saveToExcel(offer, ExcelSaveType.number);
    }
  }

  void saveExcelFileWthString() async {
    final offer = _designOfferRepository.commercialOffer;
    if (offer != null) {
      _excelService.saveToExcel(offer, ExcelSaveType.char);
    }
  }

  void save() {
    print(_notesService.allNotes);
    _designOfferRepository.commercialOffer?.notes = _notesService.allNotes;
    print(_designOfferRepository.commercialOffer?.notes);
    _notesService.clear();
  }
}

class NotesService {
  static const String defaultNote =
      '''Расчет стоимости носит предварительный характер.
Более точная оценка производится после получения Технического задания и выпуска Рабочей документации.
Финальные цены на оборудование и материалы зависят от актуальных сведений Поставщиков и курса валют ЦБ РФ на день оплаты.
Срок действия настоящего предложения: 30 календарных дней.
''';
  final StringBuffer _stringBuffer;

  NotesService({String notes = ''}) : _stringBuffer = StringBuffer() {
    if (notes.isEmpty) {
      _stringBuffer.writeln(defaultNote);
    } else {
      _stringBuffer.writeln(notes);
    }
  }

  void clear() {
    _stringBuffer.clear();
  }

  void addNote(String note) {
    _stringBuffer.clear();
    _stringBuffer.write(note);
  }

  String get allNotes => _stringBuffer.toString();
}
