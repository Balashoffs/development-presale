// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'divisions_result_pojo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DivisionsResultPojo _$DivisionsResultPojoFromJson(Map<String, dynamic> json) =>
    _DivisionsResultPojo(
      id: (json['id'] as num).toInt(),
      divisionName: json['divisionName'] as String,
      divisionShortName: json['divisionShortName'] as String,
      divisionDescription: json['divisionDescription'] as String,
      resultValue: (json['resultValue'] as num).toDouble(),
      summaryCostWithTax: (json['summaryCostWithTax'] as num).toDouble(),
      taxValue: (json['taxValue'] as num).toDouble(),
    );

Map<String, dynamic> _$DivisionsResultPojoToJson(
  _DivisionsResultPojo instance,
) => <String, dynamic>{
  'id': instance.id,
  'divisionName': instance.divisionName,
  'divisionShortName': instance.divisionShortName,
  'divisionDescription': instance.divisionDescription,
  'resultValue': instance.resultValue,
  'summaryCostWithTax': instance.summaryCostWithTax,
  'taxValue': instance.taxValue,
};
