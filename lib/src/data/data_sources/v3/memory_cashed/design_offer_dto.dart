import 'package:presale/src/domain/models/v3/design/custom_factors/custom_factors.dart';
import 'package:presale/src/domain/models/v3/design/division_type/division_type.dart';
import 'package:presale/src/domain/models/v5/common/offer_counter/dto/offer_day_counter_dto.dart';

class DesignPresaleDTO {
  InputDataDesignDTO? inputDataDesignDTO;
  Map<int, DivisionResourceDTO> divisionResources = {};
  Map<int, DivisionsMarginDTO> divisionMargins = {};
  CommercialOfferDTO? commercialOfferDTO;
  bool isAllResources = false;
}

class InputDataDesignDTO {
  final OfferDayCounterDto dayCounter;
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
  final int deadlineValue;

  const ObjectDataDesignDTO({
    required this.name,
    required this.address,
    required this.square,
    required this.deadlineValue,
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
    this.speedFactor = 1.0,
    this.heightFactor = 1.0,
    this.overPriceFactor = 1.0,
    this.remotingFactor = 1.0,
    this.complexityFactor = 1.0,
    this.customerFactor = 1.0,
    this.marginFactor = 1.0,
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
    required this.overPriceValue,
    required this.marginValue,
    required this.clientValue,
    this.summaryCostWithMargin = 0.0,
    this.summaryCostWithTax = 0.0,
    this.taxValue = 0.0,
  });

  DivisionsMarginDTO copyWith({
    int? id,
    String? divisionName,
    String? divisionShortName,
    String? divisionDescription,
    double? divisionSummaryCost,
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
      resourceDivisionSummaryCost: divisionSummaryCost ?? this.resourceDivisionSummaryCost,
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
}

class CommercialOfferDTO {
  final List<DivisionResultDTO> divisionResults;
  final double designOfferSummaryCost;
  final double designOfferSummaryTax;
  final double designOfferTax;
  String noteText;
  String workCompletionTime;
  double prepayment;
  late final PersonSignDTO? personSign;

  CommercialOfferDTO({
    required this.divisionResults,
    required this.designOfferSummaryCost,
    required this.designOfferSummaryTax,
    required this.designOfferTax,
    required this.prepayment,
  }) : noteText = '',
       workCompletionTime = '';
}

class DivisionResultDTO {
  final int id;
  final String divisionShortName;
  final String divisionName;
  final double divisionOverPrice;
  final double divisionMargin;
  final double divisionClient;
  final double divisionSummary;
  final double divisionSummaryWithTax;

  const DivisionResultDTO({
    required this.id,
    required this.divisionShortName,
    required this.divisionName,
    required this.divisionOverPrice,
    required this.divisionMargin,
    required this.divisionClient,
    required this.divisionSummary,
    required this.divisionSummaryWithTax,
  });
}

class PersonSignDTO {
  final int id;
  final String fistName;
  final String secondName;
  final String lastName;
  final String jobTitle;
  final String companyTitle;
  final String phoneNumber;
  final String jobEmail;

  const PersonSignDTO({
    required this.id,
    required this.fistName,
    required this.secondName,
    required this.lastName,
    required this.jobTitle,
    required this.companyTitle,
    required this.phoneNumber,
    required this.jobEmail,
  });
}
