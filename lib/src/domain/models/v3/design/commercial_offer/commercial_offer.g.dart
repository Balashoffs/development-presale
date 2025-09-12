// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commercial_offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommercialOfferResult _$CommercialOfferResultFromJson(
  Map<String, dynamic> json,
) => _CommercialOfferResult(
  inputDataDesign: InputDataDesign.fromJson(
    json['inputDataDesign'] as Map<String, dynamic>,
  ),
  divisionResults: (json['divisionResults'] as List<dynamic>)
      .map((e) => DivisionResult.fromJson(e as Map<String, dynamic>))
      .toList(),
  designOfferSummaryCost: (json['designOfferSummaryCost'] as num).toDouble(),
  designOfferSummaryTax: (json['designOfferSummaryTax'] as num).toDouble(),
  designOfferTax: (json['designOfferTax'] as num).toDouble(),
  footerData: FooterData.fromJson(json['footerData'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CommercialOfferResultToJson(
  _CommercialOfferResult instance,
) => <String, dynamic>{
  'inputDataDesign': instance.inputDataDesign,
  'divisionResults': instance.divisionResults,
  'designOfferSummaryCost': instance.designOfferSummaryCost,
  'designOfferSummaryTax': instance.designOfferSummaryTax,
  'designOfferTax': instance.designOfferTax,
  'footerData': instance.footerData,
};
