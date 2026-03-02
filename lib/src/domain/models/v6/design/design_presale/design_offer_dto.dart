import 'package:presale/src/data/data_sources/v5/design_offer_memory_source.dart';
import 'package:presale/src/domain/models/v3/design/custom_factors/custom_factors.dart';
import 'package:presale/src/domain/models/v3/design/division_type/division_type.dart';
import 'package:presale/src/domain/models/v3/design/division_type/object_type.dart';
import 'package:presale/src/domain/models/v5/common/offer_counter/dto/offer_day_counter_dto.dart';
import 'package:presale/src/domain/models/v5/common/person_sign/person_sign_dto.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/pojo_extension.dart';
import 'package:presale/src/domain/models/v6/selected_company/selected_company_dto.dart';
import 'package:presale/src/presentation/bloc/v5/design/offer/design_offer_cubit.dart';

class DesignPresaleDTO {
  InputDataDesignDTO? inputDataDesignDTO;
  Map<int, DivisionResourceDTO> divisionResources;
  Map<int, DivisionsMarginDTO> divisionResourceMargins;
  Map<int, DivisionsWithAnalyticDTO> divisionWithAnalytic;
  Map<int, DivisionsMarginDTO> divisionAnalyticMargins;
  CommercialOfferDTO? commercialOfferDTO;
  bool isAllResources;

  DesignPresaleDTO({
    this.inputDataDesignDTO,
    required this.divisionResources,
    required this.divisionResourceMargins,
    required this.divisionWithAnalytic,
    required this.divisionAnalyticMargins,
    this.commercialOfferDTO,
    this.isAllResources = false,
  });
}

class InputDataDesignDTO {
  final OfferDayCounterDTO dayCounter;
  final ObjectDataDesignDTO objectData;
  final InputFactorsDTO inputFactors;
  final DivisionType divisionType;
  final ObjectType objectType;

  const InputDataDesignDTO({
    required this.dayCounter,
    required this.objectData,
    required this.inputFactors,
    required this.divisionType,
    required this.objectType,
  });
}

class ObjectDataDesignDTO {
  //Заказчик
  final String customer;

  //Имя объекта
  final String name;

  // Адрес объекта
  final String address;

  // Площадь объекта
  final int square;

  // Сроки работ
  final int deadline;

  const ObjectDataDesignDTO({
    required this.customer,
    required this.name,
    required this.address,
    required this.square,
    required this.deadline,
  });
}

class InputFactorsDTO {
  // Коэфициент за срочность
  final double speedFactor;

  // Коэфициент за высотность
  final double heightFactor;

  // Коэфициент за издержки
  final double overPriceFactor;

  // Коэфициент за удаленность
  final double remotingFactor;

  // Коэфициент за сложность
  final double complexityFactor;

  // Коэфициент для заказчика
  final double customerFactor;

  // Коэфициент нормы прибыли
  final double marginFactor;

  // Коэфициент площади
  final double squareFactor;

  const InputFactorsDTO({
    this.overPriceFactor = 1.2,
    this.marginFactor = 1.3,
    this.speedFactor = 1.0,
    this.heightFactor = 1.0,
    this.customerFactor = 1.0,
    this.remotingFactor = 1.0,
    this.complexityFactor = 1.0,
    this.squareFactor = 1.0,
  });
}

class DivisionResourceDTO {
  final int id;
  final int resourceId;
  final int resourcesQnt;

  //Имя раздела
  final String divisionName;

  // Аббвеатура
  final String divisionShortName;

  // Полное имя
  final String divisionDescription;

  // Должность
  final String resourceName;

  // Кол-во задействованных должностей
  int resourceQnt;

  // Кол-во задействованных дней
  int workDays;

  // Коэфициент сложности
  double complexFactor;

  // Коэфициент по площади
  double squareFactor;

  // Коэфициент участия
  double resourceUsingFactor;

  // Стоимость задествия должности по конкретному разделу
  double resourceCostPerDay;

  double totalResourceRowCost;

  DivisionResourceDTO({
    required this.id,
    required this.resourceId,
    required this.resourcesQnt,
    required this.divisionName,
    required this.divisionShortName,
    required this.divisionDescription,
    required this.resourceName,
    required this.resourceQnt,
    required this.workDays,
    required this.complexFactor,
    required this.squareFactor,
    required this.resourceUsingFactor,
    required this.resourceCostPerDay,
    required this.totalResourceRowCost,
  });

  DivisionResourceDTO copyWith({
    int? id,
    int? resourceId,
    int? resourcesQnt,
    String? divisionName,
    String? divisionShortName,
    String? divisionDescription,
    String? resourceName,
    int? resourceQnt,
    int? workDays,
    double? complexFactor,
    double? squareFactor,
    double? resourceUsingFactor,
    double? resourceCostPerDay,
    double? totalResourceRowCost,
  }) {
    return DivisionResourceDTO(
      id: id ?? this.id,
      resourceId: resourceId ?? this.resourceId,
      resourcesQnt: resourcesQnt ?? this.resourcesQnt,
      divisionName: divisionName ?? this.divisionName,
      divisionShortName: divisionShortName ?? this.divisionShortName,
      divisionDescription: divisionDescription ?? this.divisionDescription,
      resourceName: resourceName ?? this.resourceName,
      resourceQnt: resourceQnt ?? this.resourceQnt,
      workDays: workDays ?? this.workDays,
      complexFactor: complexFactor ?? this.complexFactor,
      squareFactor: squareFactor ?? this.squareFactor,
      resourceUsingFactor: resourceUsingFactor ?? this.resourceUsingFactor,
      resourceCostPerDay: resourceCostPerDay ?? this.resourceCostPerDay,
      totalResourceRowCost: totalResourceRowCost ?? this.totalResourceRowCost,
    );
  }

  //</editor-fold>
}

class DivisionsWithAnalyticDTO {
  final int id;
  final String shifr;
  final String section;
  final double humanHours;
  final double localAnalytic;
  final double outsideAnalytic;
  final double manualAnalytic;
  final double result;

  DivisionsWithAnalyticDTO({
    required this.id,
    required this.shifr,
    required this.section,
    required this.humanHours,
    required this.localAnalytic,
    required this.outsideAnalytic,
    required this.manualAnalytic,
    required this.result,
  });

  DivisionsWithAnalyticDTO copyWith({
    int? id,
    String? shifr,
    String? section,
    double? humanHours,
    double? localAnalytic,
    double? outsideAnalytic,
    double? manualAnalytic,
    double? result,
  }) {
    return DivisionsWithAnalyticDTO(
      id: id ?? this.id,
      shifr: shifr ?? this.shifr,
      section: section ?? this.section,
      humanHours: humanHours ?? this.humanHours,
      localAnalytic: localAnalytic ?? this.localAnalytic,
      outsideAnalytic: outsideAnalytic ?? this.outsideAnalytic,
      manualAnalytic: manualAnalytic ?? this.manualAnalytic,
      result: result ?? this.result,
    );
  }
}

class DivisionsWithAnalyticDTOBuilder {
  // Required fields (set on initialization)
  final int id;
  final String shifr;
  final String section;

  // Fields filled later
  double? _humanHours;
  double? _localAnalytic;
  double? _outsideAnalytic;
  double? _manualAnalytic;
  double? _result;

  DivisionsWithAnalyticDTOBuilder({
    required this.id,
    required this.shifr,
    required this.section,
  });

  DivisionsWithAnalyticDTOBuilder setHumanHours(double value) {
    _humanHours = value;
    return this;
  }

  DivisionsWithAnalyticDTOBuilder setLocalAnalytic(double value) {
    _localAnalytic = value;
    return this;
  }

  DivisionsWithAnalyticDTOBuilder setOutsideAnalytic(double value) {
    _outsideAnalytic = value;
    return this;
  }

  DivisionsWithAnalyticDTOBuilder setManualAnalytic(double value) {
    _manualAnalytic = value;
    return this;
  }

  DivisionsWithAnalyticDTOBuilder setResult(double value) {
    _result = value;
    return this;
  }

  DivisionsWithAnalyticDTO build() {
    assert(_humanHours != null, 'humanHours must be set before building');
    assert(_localAnalytic != null, 'localAnalytic must be set before building');
    assert(
      _outsideAnalytic != null,
      'outsideAnalytic must be set before building',
    );
    assert(
      _manualAnalytic != null,
      'manualAnalytic must be set before building',
    );
    assert(_result != null, 'result must be set before building');

    return DivisionsWithAnalyticDTO(
      id: id,
      shifr: shifr,
      section: section,
      humanHours: _humanHours!,
      localAnalytic: _localAnalytic!,
      outsideAnalytic: _outsideAnalytic!,
      manualAnalytic: _manualAnalytic!,
      result: _result!,
    );
  }
}

class DivisionsMarginDTO {
  final int id;
  final String divisionName;
  final String divisionShortName;
  final String divisionDescription;
  final double resourceDivisionSummaryCost;
  final double overPriceValue;
  final double marginValue;
  final double clientValue;
  final double summaryCostWithMargin;
  final double summaryCostWithTax;
  final double taxValue;

  const DivisionsMarginDTO({
    required this.id,
    required this.divisionName,
    required this.divisionShortName,
    required this.divisionDescription,
    required this.resourceDivisionSummaryCost,
    this.overPriceValue = 0.0,
    this.marginValue = 0.0,
    this.clientValue = 0.0,
    this.summaryCostWithMargin = 0.0,
    this.summaryCostWithTax = 0.0,
    this.taxValue = 0.0,
  });

  DivisionsMarginDTO copyWith({
    int? id,
    String? divisionName,
    String? divisionShortName,
    String? divisionDescription,
    double? resourceDivisionSummaryCost,
    double? overPriceFactor,
    double? marginFactor,
    double? clientFactor,
    double? overPriceValue,
    double? marginValue,
    double? clientValue,
    double? summaryCostWithMargin,
    double? summaryCostWithTax,
    double? taxValue,
  }) {
    return DivisionsMarginDTO(
      id: id ?? this.id,
      divisionName: divisionName ?? this.divisionName,
      divisionShortName: divisionShortName ?? this.divisionShortName,
      divisionDescription: divisionDescription ?? this.divisionDescription,
      resourceDivisionSummaryCost:
          resourceDivisionSummaryCost ?? this.resourceDivisionSummaryCost,
      overPriceValue: overPriceValue ?? this.overPriceValue,
      marginValue: marginValue ?? this.marginValue,
      clientValue: clientValue ?? this.clientValue,
      summaryCostWithMargin:
          summaryCostWithMargin ?? this.summaryCostWithMargin,
      summaryCostWithTax: summaryCostWithTax ?? this.summaryCostWithTax,
      taxValue: taxValue ?? this.taxValue,
    );
  }

  @override
  String toString() {
    return 'DivisionsMarginDTO{id: $id, divisionName: $divisionName, divisionShortName: $divisionShortName, divisionDescription: $divisionDescription, resourceDivisionSummaryCost: $resourceDivisionSummaryCost,  overPriceValue: $overPriceValue, marginValue: $marginValue, clientValue: $clientValue, summaryCostWithMargin: $summaryCostWithMargin, summaryCostWithTax: $summaryCostWithTax, taxValue: $taxValue}';
  }
}

class ResultsTableDTO {
  final String headerTitle;
  final List<RowDivisionResultDTO> divisionRows;
  final double clearSummary;
  final double overPriceSummary;
  final double marginSummary;
  final double clientSummary;
  final double fullSummary;
  final double tax;
  final double fullSummaryWithTax;

  const ResultsTableDTO({
    required this.headerTitle,
    required this.divisionRows,
    required this.clearSummary,
    required this.overPriceSummary,
    required this.marginSummary,
    required this.clientSummary,
    required this.fullSummary,
    required this.tax,
    required this.fullSummaryWithTax,
  });

  static ResultsTableDTO fromMargin(
    List<DivisionsMarginDTO> divisionMargins,
    String divisionType,
  ) {
    return ResultsTableDTO(
      headerTitle: buildHeaderTitle(divisionType),
      divisionRows: divisionMargins.map((e) => e.toDto()).toList(),
      clearSummary: divisionMargins
          .map((e) => e.clientValue)
          .reduce((value, element) => value + element),
      overPriceSummary: divisionMargins
          .map((e) => e.overPriceValue)
          .reduce((value, element) => value + element),
      marginSummary: divisionMargins
          .map((e) => e.marginValue)
          .reduce((value, element) => value + element),
      clientSummary: divisionMargins
          .map((e) => e.clientValue)
          .reduce((value, element) => value + element),
      fullSummary: divisionMargins
          .map((e) => e.summaryCostWithMargin)
          .reduce((value, element) => value + element),
      tax:
          divisionMargins
              .map((e) => e.summaryCostWithMargin)
              .reduce((value, element) => value + element) *
          Russian_Tax_Factor *
          Russian_Tax_Factor_Reverce,
      fullSummaryWithTax: divisionMargins
          .map((e) => e.summaryCostWithTax)
          .reduce((value, element) => value + element),
    );
  }

  static String buildHeaderTitle(String divisionType) {
    switch (divisionType) {
      case "Проектная документация":
        return "Коммерческое предложение на разработку проектной документации";
      case "Рабочая документация":
        return "Коммерческое предложение на разработку рабочей документации";
      default:
        return "";
    }
  }
}

class PayValuesDTO {
  double presaleFactor;
  double afterPayFactor;
  String afterPayDate;
  double afterActsSignFactor;

  PayValuesDTO({
    this.presaleFactor = 0.0,
    this.afterPayFactor = 0.0,
    this.afterPayDate = '',
    this.afterActsSignFactor = 0.0,
  });

  bool get isValid =>
      presaleFactor.compareTo(0.0) > 0 ||
      afterPayFactor.compareTo(0.0) > 0 ||
      afterActsSignFactor.compareTo(0.0) > 0;

  @override
  String toString() {
    return 'PayValuesDTO{presaleFactor: $presaleFactor, afterPayFactor: $afterPayFactor, afterPayDate: $afterPayDate, afterActsSignFactor: $afterActsSignFactor}';
  }
}

class CommercialOfferDTO {
  final String id;
  final String created;
  final String objectCustomer;
  final String objectName;
  final String objectAddress;
  final String divisionType;
  final int deadline;
  final int objectSquare;
  final ResultsTableDTO resultsTable;
  final PayValuesDTO payValues;
  String notes;
  late PersonSignDTO? personSign;
  late SelectedCompanyDTO companyInfo;

  CommercialOfferDTO({
    required this.id,
    required this.created,
    required this.objectCustomer,
    required this.objectName,
    required this.objectAddress,
    required this.divisionType,
    required this.deadline,
    required this.objectSquare,
    required this.payValues,
    required this.resultsTable,
    this.notes = '',
    this.personSign,
    required this.companyInfo,
  });

  static CommercialOfferDTO from(DesignOfferMemorySource memory) {
    final inputData = memory.inputDataDesignDTO!;
    ResultsTableDTO resultsTable = ResultsTableDTO.fromMargin(
      memory.divisionWithAnalyticsMargin,
      inputData.divisionType.text,
    );
    return CommercialOfferDTO(
      id: inputData.dayCounter.getOfferUniqueNumber(),
      created: inputData.dayCounter.localDate,
      objectCustomer: inputData.objectData.customer,
      objectName: inputData.objectData.name,
      objectAddress: inputData.objectData.address,
      divisionType: inputData.divisionType.text,
      deadline: inputData.objectData.deadline,
      objectSquare: inputData.objectData.square,
      resultsTable: resultsTable,
      notes: memory.commercialOffer?.notes ?? NotesService.defaultNote,
      payValues: memory.commercialOffer?.payValues ?? PayValuesDTO(),
      companyInfo: memory.commercialOffer?.companyInfo ?? SelectedCompanyDTO(),
    );
  }
}

class RowDivisionResultDTO {
  final int id;
  final String divisionShortName;
  final String divisionName;
  final double divisionClearCost;
  final double divisionOverPriceCost;
  final double divisionMarginCost;
  final double divisionClientCost;
  final double divisionSummary;
  final double divisionSummaryWithTax;

  const RowDivisionResultDTO({
    required this.id,
    required this.divisionShortName,
    required this.divisionName,
    required this.divisionClearCost,
    required this.divisionOverPriceCost,
    required this.divisionMarginCost,
    required this.divisionClientCost,
    required this.divisionSummary,
    required this.divisionSummaryWithTax,
  });
}
