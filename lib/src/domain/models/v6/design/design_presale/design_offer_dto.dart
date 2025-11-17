import 'package:presale/src/data/data_sources/v5/design_offer_memory_source.dart';
import 'package:presale/src/domain/models/v3/design/custom_factors/custom_factors.dart';
import 'package:presale/src/domain/models/v3/design/division_type/division_type.dart';
import 'package:presale/src/domain/models/v5/common/offer_counter/dto/offer_day_counter_dto.dart';
import 'package:presale/src/domain/models/v5/common/person_sign/person_sign_dto.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/pojo_extension.dart';

class DesignPresaleDTO {
  InputDataDesignDTO? inputDataDesignDTO;
  Map<int, DivisionResourceDTO> divisionResources;
  Map<int, DivisionsMarginDTO> divisionMargins;
  CommercialOfferDTO? commercialOfferDTO;
  bool isAllResources;

  DesignPresaleDTO({
    this.inputDataDesignDTO,
    required this.divisionResources,
    required this.divisionMargins,
    this.commercialOfferDTO,
    this.isAllResources = false,
  });
}

class InputDataDesignDTO {
  final OfferDayCounterDTO dayCounter;
  final ObjectDataDesignDTO objectData;
  final InputFactorsDTO inputFactors;
  final DivisionType divisionType;

  const InputDataDesignDTO({
    required this.dayCounter,
    required this.objectData,
    required this.inputFactors,
    required this.divisionType,
  });
}

class ObjectDataDesignDTO {
  //Имя объекта
  final String name;

  // Адрес объекта
  final String address;

  // Площадь объекта
  final int square;

  // Сроки работ
  final int deadline;

  const ObjectDataDesignDTO({
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

class DivisionsMarginDTO {
  final int id;
  final String divisionName;
  final String divisionShortName;
  final String divisionDescription;
  final double resourceDivisionSummaryCost;
  final double overPriceFactor;
  final double marginFactor;
  final double clientFactor;
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
    required this.overPriceFactor,
    required this.marginFactor,
    required this.clientFactor,
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
      overPriceFactor: overPriceFactor ?? this.overPriceFactor,
      marginFactor: marginFactor ?? this.marginFactor,
      clientFactor: clientFactor ?? this.clientFactor,
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
    return 'DivisionsMarginDTO{id: $id, divisionName: $divisionName, divisionShortName: $divisionShortName, divisionDescription: $divisionDescription, resourceDivisionSummaryCost: $resourceDivisionSummaryCost, overPriceFactor: $overPriceFactor, marginFactor: $marginFactor, clientFactor: $clientFactor, overPriceValue: $overPriceValue, marginValue: $marginValue, clientValue: $clientValue, summaryCostWithMargin: $summaryCostWithMargin, summaryCostWithTax: $summaryCostWithTax, taxValue: $taxValue}';
  }
}

class CommercialOfferDTO {
  final String id;
  final String created;
  final String objectName;
  final String objectAddress;
  final String divisionType;
  final int deadline;
  final int objectSquare;
  final List<DivisionResultDTO> divisionResults;
  final double summaryClearCost;
  final double summaryOverPriceCost;
  final double summaryMarginCost;
  final double summaryClientCost;
  final double divisionSummary;
  final double summaryWithTax;
  final double tax;
  PersonSignDTO? personSign;
  double presaleCostValue;
  double presaleCostFactor;
  String noteText;

  CommercialOfferDTO({
    required this.id,
    required this.created,
    required this.objectName,
    required this.objectAddress,
    required this.divisionType,
    required this.deadline,
    required this.objectSquare,
    required this.divisionResults,
    required this.summaryClearCost,
    required this.summaryOverPriceCost,
    required this.summaryMarginCost,
    required this.summaryClientCost,
    required this.divisionSummary,
    required this.summaryWithTax,
    required this.tax,
    this.personSign,
    this.presaleCostValue = 0.0,
    this.presaleCostFactor = Default_Presale_Factor,
    required this.noteText,
  });

  static CommercialOfferDTO from(
      DesignOfferMemorySource memory,
  ) {
    final divisionResults = memory.divisionMargins
        .map((e) => e.toDto())
        .toList();
    final inputData = memory.inputDataDesignDTO!;
    double presaleCostFactor = memory.commercialOffer?.presaleCostFactor ?? Default_Presale_Factor;
    return CommercialOfferDTO(
      id: inputData.dayCounter.getOfferUniqueNumber(),
      created: inputData.dayCounter.localDate,
      objectName: inputData.objectData.name,
      objectAddress: inputData.objectData.address,
      divisionType: inputData.divisionType.text,
      deadline: inputData.objectData.deadline,
      objectSquare: inputData.objectData.square,
      noteText: memory.commercialOffer?.noteText ?? '',
      divisionResults: divisionResults,
      summaryClearCost: divisionResults
          .map((e) => e.divisionClearCost)
          .reduce((value, element) => value + element),
      summaryOverPriceCost: divisionResults
          .map((e) => e.divisionOverPriceCost)
          .reduce((value, element) => value + element),
      summaryMarginCost: divisionResults
          .map((e) => e.divisionMarginCost)
          .reduce((value, element) => value + element),
      summaryClientCost: divisionResults
          .map((e) => e.divisionClientCost)
          .reduce((value, element) => value + element),
      divisionSummary: divisionResults
          .map((e) => e.divisionSummary)
          .reduce((value, element) => value + element),
      summaryWithTax:
          divisionResults
              .map((e) => e.divisionSummaryWithTax)
              .reduce((value, element) => value + element) *
          Russian_Tax_Factor,
      presaleCostValue:
          divisionResults
              .map((e) => e.divisionSummaryWithTax)
              .reduce((value, element) => value + element) *
              presaleCostFactor,
      presaleCostFactor: presaleCostFactor,
      tax:
          divisionResults
              .map((e) => e.divisionSummary)
              .reduce((value, element) => value + element) *
          Russian_Tax_Factor *
          Russian_Tax_Factor_Reverce,
    );
  }

  void updatePresaleCost(double value) {
    presaleCostFactor = value;
    presaleCostValue = summaryWithTax * presaleCostFactor;

  }
}

class DivisionResultDTO {
  final int id;
  final String divisionShortName;
  final String divisionName;
  final double divisionClearCost;
  final double divisionOverPriceCost;
  final double divisionMarginCost;
  final double divisionClientCost;
  final double divisionSummary;
  final double divisionSummaryWithTax;

  const DivisionResultDTO({
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
