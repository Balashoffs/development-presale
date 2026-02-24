// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'design_offer_pojo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DesignPresalePojo _$DesignPresalePojoFromJson(
  Map<String, dynamic> json,
) => _DesignPresalePojo(
  dayCounter: OfferDayCounterPojo.fromJson(
    json['dayCounter'] as Map<String, dynamic>,
  ),
  objectData: ObjectDataDesignPojo.fromJson(
    json['objectData'] as Map<String, dynamic>,
  ),
  inputFactors: InputFactorsPojo.fromJson(
    json['inputFactors'] as Map<String, dynamic>,
  ),
  divisionType: json['divisionType'] as String,
  objectType: json['objectType'] as String,
  divisionResources:
      (json['divisionResources'] as List<dynamic>?)
          ?.map((e) => DivisionResourcePojo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  divisionMargins:
      (json['divisionMargins'] as List<dynamic>?)
          ?.map((e) => DivisionsMarginPojo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  isAllResources: json['isAllResources'] as bool? ?? false,
);

Map<String, dynamic> _$DesignPresalePojoToJson(_DesignPresalePojo instance) =>
    <String, dynamic>{
      'dayCounter': instance.dayCounter,
      'objectData': instance.objectData,
      'inputFactors': instance.inputFactors,
      'divisionType': instance.divisionType,
      'objectType': instance.objectType,
      'divisionResources': instance.divisionResources,
      'divisionMargins': instance.divisionMargins,
      'isAllResources': instance.isAllResources,
    };

_OfferDayCounterPojo _$OfferDayCounterPojoFromJson(Map<String, dynamic> json) =>
    _OfferDayCounterPojo(
      timeStamp: (json['timeStamp'] as num).toInt(),
      offerId: (json['offerId'] as num).toInt(),
    );

Map<String, dynamic> _$OfferDayCounterPojoToJson(
  _OfferDayCounterPojo instance,
) => <String, dynamic>{
  'timeStamp': instance.timeStamp,
  'offerId': instance.offerId,
};

_ObjectDataDesignPojo _$ObjectDataDesignPojoFromJson(
  Map<String, dynamic> json,
) => _ObjectDataDesignPojo(
  customer: json['customer'] as String,
  name: json['name'] as String,
  address: json['address'] as String,
  square: (json['square'] as num).toInt(),
  deadline: (json['deadline'] as num).toInt(),
);

Map<String, dynamic> _$ObjectDataDesignPojoToJson(
  _ObjectDataDesignPojo instance,
) => <String, dynamic>{
  'customer': instance.customer,
  'name': instance.name,
  'address': instance.address,
  'square': instance.square,
  'deadline': instance.deadline,
};

_InputFactorsPojo _$InputFactorsPojoFromJson(Map<String, dynamic> json) =>
    _InputFactorsPojo(
      speedFactor: (json['speedFactor'] as num?)?.toDouble() ?? 1.0,
      heightFactor: (json['heightFactor'] as num?)?.toDouble() ?? 1.0,
      overPriceFactor: (json['overPriceFactor'] as num?)?.toDouble() ?? 1.0,
      remotingFactor: (json['remotingFactor'] as num?)?.toDouble() ?? 1.0,
      complexityFactor: (json['complexityFactor'] as num?)?.toDouble() ?? 1.0,
      customerFactor: (json['customerFactor'] as num?)?.toDouble() ?? 1.0,
      marginFactor: (json['marginFactor'] as num?)?.toDouble() ?? 1.0,
      squareFactor: (json['squareFactor'] as num?)?.toDouble() ?? 1.0,
    );

Map<String, dynamic> _$InputFactorsPojoToJson(_InputFactorsPojo instance) =>
    <String, dynamic>{
      'speedFactor': instance.speedFactor,
      'heightFactor': instance.heightFactor,
      'overPriceFactor': instance.overPriceFactor,
      'remotingFactor': instance.remotingFactor,
      'complexityFactor': instance.complexityFactor,
      'customerFactor': instance.customerFactor,
      'marginFactor': instance.marginFactor,
      'squareFactor': instance.squareFactor,
    };

_DivisionResourcePojo _$DivisionResourcePojoFromJson(
  Map<String, dynamic> json,
) => _DivisionResourcePojo(
  id: (json['id'] as num).toInt(),
  resourceId: (json['resourceId'] as num).toInt(),
  resourcesQnt: (json['resourcesQnt'] as num).toInt(),
  divisionName: json['divisionName'] as String,
  divisionShortName: json['divisionShortName'] as String,
  divisionDescription: json['divisionDescription'] as String,
  resourceName: json['resourceName'] as String,
  resourceQnt: (json['resourceQnt'] as num).toInt(),
  workDays: (json['workDays'] as num).toInt(),
  complexFactor: (json['complexFactor'] as num).toDouble(),
  squareFactor: (json['squareFactor'] as num).toDouble(),
  resourceUsingFactor: (json['resourceUsingFactor'] as num).toDouble(),
  resourceCostPerDay: (json['resourceCostPerDay'] as num).toDouble(),
  totalResourceRowCost: (json['totalResourceRowCost'] as num).toDouble(),
);

Map<String, dynamic> _$DivisionResourcePojoToJson(
  _DivisionResourcePojo instance,
) => <String, dynamic>{
  'id': instance.id,
  'resourceId': instance.resourceId,
  'resourcesQnt': instance.resourcesQnt,
  'divisionName': instance.divisionName,
  'divisionShortName': instance.divisionShortName,
  'divisionDescription': instance.divisionDescription,
  'resourceName': instance.resourceName,
  'resourceQnt': instance.resourceQnt,
  'workDays': instance.workDays,
  'complexFactor': instance.complexFactor,
  'squareFactor': instance.squareFactor,
  'resourceUsingFactor': instance.resourceUsingFactor,
  'resourceCostPerDay': instance.resourceCostPerDay,
  'totalResourceRowCost': instance.totalResourceRowCost,
};

_DivisionsMarginPojo _$DivisionsMarginPojoFromJson(Map<String, dynamic> json) =>
    _DivisionsMarginPojo(
      id: (json['id'] as num).toInt(),
      divisionName: json['divisionName'] as String,
      divisionShortName: json['divisionShortName'] as String,
      divisionDescription: json['divisionDescription'] as String,
      resourceDivisionSummaryCost: (json['resourceDivisionSummaryCost'] as num)
          .toDouble(),
      overPriceFactor: (json['overPriceFactor'] as num).toDouble(),
      marginFactor: (json['marginFactor'] as num).toDouble(),
      clientFactor: (json['clientFactor'] as num).toDouble(),
      overPriceValue: (json['overPriceValue'] as num?)?.toDouble() ?? 0.0,
      marginValue: (json['marginValue'] as num?)?.toDouble() ?? 0.0,
      clientValue: (json['clientValue'] as num?)?.toDouble() ?? 0.0,
      summaryCostWithMargin:
          (json['summaryCostWithMargin'] as num?)?.toDouble() ?? 0.0,
      summaryCostWithTax:
          (json['summaryCostWithTax'] as num?)?.toDouble() ?? 0.0,
      taxValue: (json['taxValue'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$DivisionsMarginPojoToJson(
  _DivisionsMarginPojo instance,
) => <String, dynamic>{
  'id': instance.id,
  'divisionName': instance.divisionName,
  'divisionShortName': instance.divisionShortName,
  'divisionDescription': instance.divisionDescription,
  'resourceDivisionSummaryCost': instance.resourceDivisionSummaryCost,
  'overPriceFactor': instance.overPriceFactor,
  'marginFactor': instance.marginFactor,
  'clientFactor': instance.clientFactor,
  'overPriceValue': instance.overPriceValue,
  'marginValue': instance.marginValue,
  'clientValue': instance.clientValue,
  'summaryCostWithMargin': instance.summaryCostWithMargin,
  'summaryCostWithTax': instance.summaryCostWithTax,
  'taxValue': instance.taxValue,
};
